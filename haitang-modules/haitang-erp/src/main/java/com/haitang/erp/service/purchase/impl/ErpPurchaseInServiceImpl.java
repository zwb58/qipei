package com.haitang.erp.service.purchase.impl;

import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.core.utils.number.MoneyUtils;
import com.haitang.common.core.utils.object.BeanUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import com.haitang.erp.domain.purchase.ErpPurchaseInItem;
import com.haitang.erp.domain.purchase.ErpPurchaseOrderItem;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseInBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInVo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderVo;
import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.enums.ErpAuditStatus;
import com.haitang.erp.mapper.purchase.ErpPurchaseInItemsMapper;
import com.haitang.erp.mapper.purchase.ErpPurchaseInMapper;
import com.haitang.erp.mapper.purchase.ErpPurchaseOrderItemMapper;
import com.haitang.erp.service.IErpProductService;
import com.haitang.erp.service.finance.IErpAccountService;
import com.haitang.erp.service.purchase.IErpPurchaseInService;
import com.haitang.erp.service.purchase.IErpPurchaseOrderService;
import com.haitang.erp.utils.redis.no.ErpNoRedisDAO;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Collection;

import static com.haitang.common.core.utils.collection.CollectionUtils.*;

/**
 * ERP 采购入库Service业务层处理
 *
 * @author Lion Li
 * @date 2024-12-21
 */
@RequiredArgsConstructor
@Service
public class ErpPurchaseInServiceImpl implements IErpPurchaseInService {

    private final ErpPurchaseInMapper baseMapper;

    @Resource
    @Lazy // 延迟加载，避免循环依赖
    private IErpPurchaseOrderService purchaseOrderService;
    private final IErpProductService erpProductService;
    private final IErpAccountService erpAccountService;
    private final ErpNoRedisDAO noRedisDAO;
    private final ErpPurchaseInItemsMapper baseItemMapper;


    /**
     * 查询ERP 采购入库
     */
    @Override
    public ErpPurchaseInVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询ERP 采购入库列表
     */
    @Override
    public TableDataInfo<ErpPurchaseInVo> queryPageList(ErpPurchaseInBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpPurchaseIn> lqw = buildQueryWrapper(bo);
        Page<ErpPurchaseInVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询ERP 采购入库列表
     */
    @Override
    public List<ErpPurchaseInVo> queryList(ErpPurchaseInBo bo) {
        LambdaQueryWrapper<ErpPurchaseIn> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpPurchaseIn> buildQueryWrapper(ErpPurchaseInBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpPurchaseIn> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getNo()), ErpPurchaseIn::getNo, bo.getNo());
        lqw.eq(bo.getStatus() != null, ErpPurchaseIn::getStatus, bo.getStatus());
        lqw.eq(bo.getSupplierId() != null, ErpPurchaseIn::getSupplierId, bo.getSupplierId());
        lqw.eq(bo.getAccountId() != null, ErpPurchaseIn::getAccountId, bo.getAccountId());
        lqw.eq(bo.getInTime() != null, ErpPurchaseIn::getInTime, bo.getInTime());
        lqw.eq(bo.getOrderId() != null, ErpPurchaseIn::getOrderId, bo.getOrderId());
        lqw.eq(StringUtils.isNotBlank(bo.getOrderNo()), ErpPurchaseIn::getOrderNo, bo.getOrderNo());
        lqw.eq(bo.getTotalCount() != null, ErpPurchaseIn::getTotalCount, bo.getTotalCount());
        lqw.eq(bo.getTotalPrice() != null, ErpPurchaseIn::getTotalPrice, bo.getTotalPrice());
        lqw.eq(bo.getPaymentPrice() != null, ErpPurchaseIn::getPaymentPrice, bo.getPaymentPrice());
        lqw.eq(bo.getTotalProductPrice() != null, ErpPurchaseIn::getTotalProductPrice, bo.getTotalProductPrice());
        lqw.eq(bo.getTotalTaxPrice() != null, ErpPurchaseIn::getTotalTaxPrice, bo.getTotalTaxPrice());
        lqw.eq(bo.getDiscountPercent() != null, ErpPurchaseIn::getDiscountPercent, bo.getDiscountPercent());
        lqw.eq(bo.getDiscountPrice() != null, ErpPurchaseIn::getDiscountPrice, bo.getDiscountPrice());
        lqw.eq(bo.getOtherPrice() != null, ErpPurchaseIn::getOtherPrice, bo.getOtherPrice());
        lqw.eq(StringUtils.isNotBlank(bo.getFileUrl()), ErpPurchaseIn::getFileUrl, bo.getFileUrl());
        return lqw;
    }

    /**
     * 新增ERP 采购入库
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(ErpPurchaseInBo bo) {
        ErpPurchaseIn add = MapstructUtils.convert(bo, ErpPurchaseIn.class);
        // 1.1 校验采购订单已审核
        ErpPurchaseOrderVo purchaseOrderVo = purchaseOrderService.validatePurchaseOrder(bo.getOrderId());
        // 1.2 校验入库项的有效性
        List<ErpPurchaseInItem> purchaseInItems = validatePurchaseInItems(add.getItems());
        // 1.3 校验结算账户
        if (add.getAccountId() != null) {
            erpAccountService.validateAccount(add.getAccountId());
        }
        // 1.4 生成入库单号，并校验唯一性
        String no = noRedisDAO.generate(ErpNoRedisDAO.PURCHASE_ORDER_NO_PREFIX);
        if (baseMapper.selectByNo(no) != null) {
            //todo 异常信息封装处理
            throw new ServiceException("生成采购单号失败，请重新提交");
        }
        // 2.1 插入入库
        add.setNo(no);
        add.setStatus(ErpAuditStatus.PROCESS.getStatus());
        add.setOrderNo(purchaseOrderVo.getNo());
        add.setSupplierId(purchaseOrderVo.getSupplierId());
        calculateTotalPrice(add, purchaseInItems);
        boolean erpPurchaseOrderFlag = baseMapper.insert(add) > 0;
        // 2.2 插入入库项
        purchaseInItems.forEach(o -> o.setInNo(add.getNo()));
        boolean erpPurchaseOrderItemFlag = baseItemMapper.insertBatch(purchaseInItems);
        // 3. 更新采购订单的入库数量
        updatePurchaseOrderInCount(add.getOrderId());
        return erpPurchaseOrderFlag&&erpPurchaseOrderItemFlag;
    }

    /**
     * 修改ERP 采购入库
     */
    @Override
    public Boolean updateByBo(ErpPurchaseInBo bo) {
        ErpPurchaseIn update = MapstructUtils.convert(bo, ErpPurchaseIn.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpPurchaseIn entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除ERP 采购入库
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
    private void updatePurchaseOrderInCount(Long orderId) {
        // 1.1 查询采购订单对应的采购入库单列表
        List<ErpPurchaseIn> purchaseIns = baseMapper.selectListByOrderId(orderId);
        // 1.2 查询对应的采购订单项的入库数量
        Map<Long, BigDecimal> returnCountMap = baseItemMapper.selectOrderItemCountSumMapByInIds(
            convertList(purchaseIns, ErpPurchaseIn::getId));
        // 2. 更新采购订单的入库数量
        purchaseOrderService.updatePurchaseOrderInCount(orderId, returnCountMap);
    }
    private void calculateTotalPrice(ErpPurchaseIn purchaseIn, List<ErpPurchaseInItem> purchaseInItems) {
        purchaseIn.setTotalCount(getSumValue(purchaseInItems, ErpPurchaseInItem::getCount, BigDecimal::add));
        purchaseIn.setTotalProductPrice(getSumValue(purchaseInItems, ErpPurchaseInItem::getTotalPrice, BigDecimal::add, BigDecimal.ZERO));
        purchaseIn.setTotalTaxPrice(getSumValue(purchaseInItems, ErpPurchaseInItem::getTaxPrice, BigDecimal::add, BigDecimal.ZERO));
        purchaseIn.setTotalPrice(purchaseIn.getTotalProductPrice().add(purchaseIn.getTotalTaxPrice()));
        // 计算优惠价格
        if (purchaseIn.getDiscountPercent() == null) {
            purchaseIn.setDiscountPercent(BigDecimal.ZERO);
        }
        purchaseIn.setDiscountPrice(MoneyUtils.priceMultiplyPercent(purchaseIn.getTotalPrice(), purchaseIn.getDiscountPercent()));
        purchaseIn.setTotalPrice(purchaseIn.getTotalPrice().subtract(purchaseIn.getDiscountPrice().add(purchaseIn.getOtherPrice())));
    }
    private List<ErpPurchaseInItem> validatePurchaseInItems(List<ErpPurchaseInItem> list) {
        // 1. 校验产品存在
        List<ErpProductVo> productList = erpProductService.validProductList(
            convertSet(list, ErpPurchaseInItem::getProductId));
        Map<Long, ErpProductVo> productMap = convertMap(productList, ErpProductVo::getId);
        // 2. 转化为 ErpPurchaseOrderItem 列表
        return convertList(list, o -> BeanUtils.toBean(o, ErpPurchaseInItem.class, item -> {
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
}
