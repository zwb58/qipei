package com.haitang.erp.service.purchase.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.core.utils.number.MoneyUtils;
import com.haitang.common.core.utils.object.BeanUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import com.haitang.erp.domain.purchase.ErpPurchaseOrder;
import com.haitang.erp.domain.purchase.ErpPurchaseOrderItem;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseOrderBo;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseOrderItemBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderItemVo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderVo;
import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.enums.ErpAuditStatus;
import com.haitang.erp.mapper.purchase.ErpPurchaseOrderItemMapper;
import com.haitang.erp.mapper.purchase.ErpPurchaseOrderMapper;
import com.haitang.erp.service.IErpProductService;
import com.haitang.erp.service.IErpSupplierService;
import com.haitang.erp.service.finance.IErpAccountService;
import com.haitang.erp.service.purchase.IErpPurchaseOrderService;
import com.haitang.erp.utils.redis.no.ErpNoRedisDAO;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Collection;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.haitang.common.core.utils.collection.CollectionUtils.*;

/**
 * 采购订单Service业务层处理
 *
 * @author hhhbx
 */
@RequiredArgsConstructor
@Service
public class ErpPurchaseOrderServiceImpl implements IErpPurchaseOrderService {

    private final ErpPurchaseOrderMapper baseMapper;
    private final ErpPurchaseOrderItemMapper baseItemMapper;
    private final IErpProductService erpProductService;
    private final IErpSupplierService erpSupplierService;
    private final IErpAccountService erpAccountService;
    private final ErpNoRedisDAO noRedisDAO;
//    @Resource
//    private ErpProductService productService;

    /**
     * 查询采购订单
     */
    @Override
    public ErpPurchaseOrderVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询采购订单子项
     */
    @Override
    public List<ErpPurchaseOrderItemVo> queryItemsByOrderNo(String ordeNo){
        ErpPurchaseOrderItemBo bo = new ErpPurchaseOrderItemBo();
        bo.setOrderNo(ordeNo);
        QueryWrapper<ErpPurchaseOrderItem> lqw = buildItemQueryWrapper(bo);
        return  baseItemMapper.customPurchaseOrderItemPageList(lqw);
    }

    /**
     * 查询采购订单列表
     */
    @Override
    public TableDataInfo<ErpPurchaseOrderVo> queryPageList(ErpPurchaseOrderBo bo, PageQuery pageQuery) {
        QueryWrapper<ErpPurchaseOrder> lqw = buildQueryWrapper(bo);
        Page<ErpPurchaseOrderVo> result = baseMapper.selectVoPagebyCustom(pageQuery.build(), lqw);
        List<ErpPurchaseOrderVo> records = result.getRecords();
        //根据orderNo查询采购单子项
        records.forEach(o -> {
            ErpPurchaseOrderItemBo itemBo = new ErpPurchaseOrderItemBo();
            itemBo.setOrderNo(o.getNo());
            QueryWrapper<ErpPurchaseOrderItem> itemLqw = buildItemQueryWrapper(itemBo);
            List<ErpPurchaseOrderItemVo> itemVos = baseItemMapper.customPurchaseOrderItemPageList(itemLqw);
            o.setItems(itemVos);
        });
        return TableDataInfo.build(result);
    }

    /**
     * 查询采购订单列表
     */
    @Override
    public List<ErpPurchaseOrderVo> queryList(ErpPurchaseOrderBo bo) {
        QueryWrapper<ErpPurchaseOrder> lqw = buildQueryWrapper(bo);
        PageQuery pageQuery = new PageQuery();
        return baseMapper.selectVoPagebyCustom(pageQuery.build(), lqw).getRecords();
    }

    private QueryWrapper<ErpPurchaseOrder> buildQueryWrapper(ErpPurchaseOrderBo bo) {
        Map<String, Object> params = bo.getParams();
        QueryWrapper<ErpPurchaseOrder> lqw = Wrappers.query();
        lqw.eq(StringUtils.isNotBlank(bo.getNo()), "o.no", bo.getNo());
        lqw.eq(bo.getStatus() != null, "o.status", bo.getStatus());
        lqw.eq(bo.getSupplierId() != null, "o.supplier_id", bo.getSupplierId());
        lqw.eq(bo.getCreateBy() != null,"o.create_by", bo.getCreateBy());
        lqw.eq(bo.getProductId() != null, "i.product_id", bo.getProductId());
        lqw.between(params.get("beginOrderTime") != null && params.get("endOrderTime") != null,
            "o.order_time", params.get("beginOrderTime"), params.get("endOrderTime"));

        // 入库状态。为什么需要 o. 的原因，是因为联表查询时，需要指定表名，不然会报 in_count 错误
        if (Objects.equals(bo.getInStatus(), ErpPurchaseOrderBo.IN_STATUS_NONE)) {
            lqw.eq("o.in_count", 0);
        } else if (Objects.equals(bo.getInStatus(), ErpPurchaseOrderBo.IN_STATUS_PART)) {
            lqw.gt("o.in_count", 0).apply("o.in_count < o.total_count");
        } else if (Objects.equals(bo.getInStatus(), ErpPurchaseOrderBo.IN_STATUS_ALL)) {
            lqw.apply("o.in_count = o.total_count");
        }

        // 退货状态
        if (Objects.equals(bo.getReturnStatus(), ErpPurchaseOrderBo.RETURN_STATUS_NONE)) {
            lqw.eq("o.return_count", 0);
        } else if (Objects.equals(bo.getReturnStatus(), ErpPurchaseOrderBo.RETURN_STATUS_PART)) {
            lqw.gt("o.return_count", 0).apply("o.return_count < o.total_count");
        } else if (Objects.equals(bo.getReturnStatus(), ErpPurchaseOrderBo.RETURN_STATUS_ALL)) {
            lqw.apply("o.return_count = o.total_count");
        }
        // 可采购入库
        if (Boolean.TRUE.equals(bo.getInEnable())) {
            lqw.eq("o.status", ErpAuditStatus.APPROVE.getStatus())
                .apply("o.in_count < o.total_count");
        }
        // 可采购退货
        if (Boolean.TRUE.equals(bo.getReturnEnable())) {
            lqw.eq("o.status", ErpAuditStatus.APPROVE.getStatus())
                .apply("o.return_count < o.in_count");
        }
        //未被删除的采购单
        lqw.eq("o.del_flag", 0);
        //未被删除的采购单子项
        lqw.eq("i.del_flag",0);
        return lqw;
    }

    private QueryWrapper<ErpPurchaseOrderItem> buildItemQueryWrapper(ErpPurchaseOrderItemBo bo) {
        QueryWrapper<ErpPurchaseOrderItem> lqw = Wrappers.query();
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), "i.order_no", bo.getOrderNo());
        lqw.eq("i.del_flag", 0);
        return lqw;
    }
    /**
     * 新增采购订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(ErpPurchaseOrderBo bo) {
        ErpPurchaseOrder add = MapstructUtils.convert(bo, ErpPurchaseOrder.class);
        // 1.1 校验订单项的有效性
        assert add != null;
        List<ErpPurchaseOrderItem> purchaseOrderItems = validatePurchaseOrderItems(add.getItems());
        // 1.2 校验供应商
        erpSupplierService.validateSupplier(add.getSupplierId());
        // 1.3 校验结算账户
        if (add.getAccountId() != null) {
            erpAccountService.validateAccount(add.getAccountId());
        }
        // 1.4 生成订单号，并校验唯一性
        String no = noRedisDAO.generate(ErpNoRedisDAO.PURCHASE_IN_NO_PREFIX);
        if (baseMapper.selectByNo(no) != null) {
            //todo 异常信息封装处理
            throw new ServiceException("生成入库单失败，请重新提交");
        }
        // 2.1 插入订单
        add.setNo(no);
        add.setStatus(ErpAuditStatus.PROCESS.getStatus());
        calculateTotalPrice(add, purchaseOrderItems);
        boolean erpPurchaseOrderFlag = baseMapper.insert(add) > 0;
        // 2.2 插入订单项
        purchaseOrderItems.forEach(o -> o.setOrderNo(add.getNo()));
        boolean erpPurchaseOrderItemFlag = baseItemMapper.insertBatch(purchaseOrderItems);
        return erpPurchaseOrderFlag&&erpPurchaseOrderItemFlag;
    }

    /**
     * 修改采购订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean updateByBo(ErpPurchaseOrderBo bo) {
        ErpPurchaseOrder update = MapstructUtils.convert(bo, ErpPurchaseOrder.class);
        //1.1校验订单
        assert update != null;
        validEntityBeforeSave(update);
        // 1.2 校验订单项的有效性
        List<ErpPurchaseOrderItem> purchaseOrderItems = validatePurchaseOrderItems(update.getItems());
        // 2.1 更新订单项
        int i = baseMapper.updateById(update);
        // 2.2 更新订单子项
        updatePurchaseOrderItemList(update.getNo(), purchaseOrderItems);
        return i>0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpPurchaseOrder entity) {
        ErpPurchaseOrder purchaseOrder = baseMapper.selectById(entity.getId());
        // 1.1.1 校验订单是否存在和订单状态
        if (purchaseOrder == null) {
            throw new ServiceException("采购订单不存在");
        }
        if (ErpAuditStatus.APPROVE.getStatus().equals(entity.getStatus())) {
            throw new ServiceException("采购订单({" + entity.getNo() + "})已审核，无法修改");
        }
        // 1.1.2 校验供应商
        erpSupplierService.validateSupplier(entity.getSupplierId());
        // 1.1.3 校验结算账户
        if (entity.getAccountId() != null) {
            erpAccountService.validateAccount(entity.getAccountId());
        }
    }

    /**
     * 批量删除采购订单
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        // 参数校验
        if (CollUtil.isEmpty(ids)) {
            throw new ServiceException("待删除的采购订单 ID 列表不能为空");
        }
        boolean flag = false;
        if (Boolean.TRUE.equals(isValid)) {
            // 1. 查询采购订单列表
            List<ErpPurchaseOrder> purchaseOrders = baseMapper.selectBatchIds(ids);
            if (CollUtil.isEmpty(purchaseOrders)) {
                throw new ServiceException("采购订单不存在");
            }

            // 2. 校验状态
            List<ErpPurchaseOrder> approvedOrders = purchaseOrders.stream()
                .filter(purchaseOrder -> ErpAuditStatus.APPROVE.getStatus().equals(purchaseOrder.getStatus()))
                .collect(Collectors.toList());

            if (CollUtil.isNotEmpty(approvedOrders)) {
                String errorNos = approvedOrders.stream()
                    .map(ErpPurchaseOrder::getNo)
                    .collect(Collectors.joining(", "));
                throw new ServiceException("采购订单(" + errorNos + ")已审核，无法删除");
            }

            // 3. 批量删除
            List<String> orderNos = purchaseOrders.stream()
                .map(ErpPurchaseOrder::getNo)
                .collect(Collectors.toList());

            // 3.1 删除采购订单
            int result1 = baseMapper.deleteBatchIds(ids);

            // 3.2 删除订单项
            int result2 = baseItemMapper.updateDelFlagByNos(orderNos, 2);
            if (result1 > 0 && result2 > 0) {
                flag = true;
            }else {
                throw new ServiceException("删除采购订单失败");
            }
        }
        return flag;
    }
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updatePurchaseOrderStatus(Long id, Integer status) {
        boolean approve = ErpAuditStatus.APPROVE.getStatus().equals(status);
        // 1.1 校验存在
        ErpPurchaseOrder purchaseOrder = baseMapper.selectById(id);
        if (ObjectUtil.isEmpty(purchaseOrder)) {
            throw new ServiceException("采购订单不存在");
        }
        // 1.2 校验状态
        if (purchaseOrder.getStatus().equals(status)) {
           String errMessage = approve ? "审核失败，只有未审核的采购订单才能审核" : "反审核失败，只有已审核的采购订单才能反审核";
            throw new ServiceException(errMessage);
        }
        // 1.3 存在采购入单，无法反审核
        if (!approve && purchaseOrder.getInCount().compareTo(BigDecimal.ZERO) > 0) {
            throw new ServiceException("反审核失败，已存在对应的采购入库单");
        }
        // 1.4 存在采购退货单，无法反审核
        if (!approve && purchaseOrder.getReturnCount().compareTo(BigDecimal.ZERO) > 0) {
            throw new ServiceException("反审核失败，已存在对应的采购退货单");
        }

        // 2. 更新状态

        int updateCount = baseMapper.updateStatusById(id, status);
        if (updateCount == 0) {
            String errMessage = approve ? "审核失败，只有未审核的采购订单才能审核" : "反审核失败，只有已审核的采购订单才能反审核";
            throw new ServiceException(errMessage);
        }
        return true;
    }

    @Override
    public ErpPurchaseOrderVo validatePurchaseOrder(Long id) {
        ErpPurchaseOrderVo purchaseOrder = validatePurchaseOrderExists(id);
        if (ObjectUtil.notEqual(purchaseOrder.getStatus(), ErpAuditStatus.APPROVE.getStatus())) {
            throw new ServiceException("采购订单不存在");
        }
        return purchaseOrder;
    }

    @Override
    public void updatePurchaseOrderInCount(Long id, Map<Long, BigDecimal> inCountMap) {
        List<ErpPurchaseOrderItem> orderItems = baseItemMapper.selectListByOrderId(id);
        // 1. 更新每个采购订单项
        orderItems.forEach(item -> {
            BigDecimal inCount = inCountMap.getOrDefault(item.getId(), BigDecimal.ZERO);
            if (item.getInCount().equals(inCount)) {
                return;
            }
            if (inCount.compareTo(item.getCount()) > 0) {
                throw new ServiceException("采购订单项({})超过最大允许入库数量({})");
                    //TODO
                    //productService.getProduct(item.getProductId()).getName(), item.getCount());
            }
            ErpPurchaseOrderItem erpPurchaseOrderItem = new ErpPurchaseOrderItem();
            erpPurchaseOrderItem.setId(item.getId());
            erpPurchaseOrderItem.setInCount(inCount);
            baseItemMapper.updateById(erpPurchaseOrderItem);
        });
        // 2. 更新采购订单
        BigDecimal totalInCount = getSumValue(inCountMap.values(), value -> value, BigDecimal::add, BigDecimal.ZERO);
        ErpPurchaseOrder order = new ErpPurchaseOrder();
        order.setId(id);
        order.setInCount(totalInCount);
        baseMapper.updateById(order);
    }

    private ErpPurchaseOrderVo validatePurchaseOrderExists(Long id) {
        ErpPurchaseOrderVo purchaseOrder = baseMapper.selectVoById(id);
        if (purchaseOrder == null) {
            throw new ServiceException("采购订单不存在");
        }
        return purchaseOrder;
    }

    private List<ErpPurchaseOrderItem> validatePurchaseOrderItems(List<ErpPurchaseOrderItem> list) {
        // 1. 校验产品存在
        List<ErpProductVo> productList = erpProductService.validProductList(
            convertSet(list, ErpPurchaseOrderItem::getProductId));
        Map<Long, ErpProductVo> productMap = convertMap(productList, ErpProductVo::getId);
        // 2. 转化为 ErpPurchaseOrderItem 列表
        return convertList(list, o -> BeanUtils.toBean(o, ErpPurchaseOrderItem.class, item -> {
            item.setProductUnitId(productMap.get(item.getProductId()).getUnitId());
            item.setTotalPrice(MoneyUtils.priceMultiply(item.getProductPrice(), item.getCount()));
            if (item.getTotalPrice() == null) {
                return;
            }
            if (item.getTaxPercent() != null) {
                item.setTaxPrice(MoneyUtils.priceMultiplyPercent(item.getTotalPrice(), item.getTaxPercent()));
            }
        }));
    }

    private void calculateTotalPrice(ErpPurchaseOrder purchaseOrder, List<ErpPurchaseOrderItem> purchaseOrderItems) {
        purchaseOrder.setTotalCount(getSumValue(purchaseOrderItems, ErpPurchaseOrderItem::getCount, BigDecimal::add));
        purchaseOrder.setTotalProductPrice(getSumValue(purchaseOrderItems, ErpPurchaseOrderItem::getTotalPrice, BigDecimal::add, BigDecimal.ZERO));
        purchaseOrder.setTotalTaxPrice(getSumValue(purchaseOrderItems, ErpPurchaseOrderItem::getTaxPrice, BigDecimal::add, BigDecimal.ZERO));
        purchaseOrder.setTotalPrice(purchaseOrder.getTotalProductPrice().add(purchaseOrder.getTotalTaxPrice()));
        // 计算优惠价格
        if (purchaseOrder.getDiscountPercent() == null) {
            purchaseOrder.setDiscountPercent(BigDecimal.ZERO);
        }
        purchaseOrder.setDiscountPrice(MoneyUtils.priceMultiplyPercent(purchaseOrder.getTotalPrice(), purchaseOrder.getDiscountPercent()));
        purchaseOrder.setTotalPrice(purchaseOrder.getTotalPrice().subtract(purchaseOrder.getDiscountPrice()));
    }
    private void updatePurchaseOrderItemList(String no, List<ErpPurchaseOrderItem> newList) {
        // 第一步，对比新老数据，获得添加、修改、删除的列表
        LambdaQueryWrapper<ErpPurchaseOrderItem> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(no), ErpPurchaseOrderItem::getOrderNo, no);
        List<ErpPurchaseOrderItem> oldList = baseItemMapper.selectList(lqw);
        // id 不同，就认为是不同的记录
        List<List<ErpPurchaseOrderItem>> diffList = diffList(oldList, newList,
            (oldVal, newVal) -> oldVal.getOrderNo().equals(newVal.getOrderNo()));

        // 第二步，批量添加、修改、删除
        if (CollUtil.isNotEmpty(diffList.get(0))) {
            diffList.get(0).forEach(o -> o.setOrderNo(no));
            baseItemMapper.insertBatch(diffList.get(0));
        }
        if (CollUtil.isNotEmpty(diffList.get(1))) {
            baseItemMapper.updateBatchById(diffList.get(1));
        }
        if (CollUtil.isNotEmpty(diffList.get(2))) {
            baseItemMapper.deleteBatchIds(convertList(diffList.get(2), ErpPurchaseOrderItem::getId));
        }
    }
}
