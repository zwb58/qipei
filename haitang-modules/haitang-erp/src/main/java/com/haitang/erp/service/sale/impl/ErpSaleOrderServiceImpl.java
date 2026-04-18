package com.haitang.erp.service.sale.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.sale.ErpSaleOrder;
import com.haitang.erp.domain.sale.ErpSaleOrderItem;
import com.haitang.erp.domain.sale.bo.ErpSaleOrderBo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderItemVo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderVo;
import com.haitang.erp.mapper.sale.ErpSaleOrderItemMapper;
import com.haitang.erp.mapper.sale.ErpSaleOrderMapper;
import com.haitang.erp.service.sale.IErpSaleOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ErpSaleOrderServiceImpl implements IErpSaleOrderService {

    private final ErpSaleOrderMapper baseMapper;
    private final ErpSaleOrderItemMapper itemMapper;

    @Override
    public TableDataInfo<ErpSaleOrderVo> queryPageList(ErpSaleOrderBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSaleOrder> lqw = buildQueryWrapper(bo);
        Page<ErpSaleOrderVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public List<ErpSaleOrderVo> queryList(ErpSaleOrderBo bo) {
        LambdaQueryWrapper<ErpSaleOrder> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpSaleOrder> buildQueryWrapper(ErpSaleOrderBo bo) {
        LambdaQueryWrapper<ErpSaleOrder> lqw = new LambdaQueryWrapper<>();
        lqw.eq(StringUtils.isNotBlank(bo.getNo()), ErpSaleOrder::getNo, bo.getNo());
        lqw.eq(ObjectUtil.isNotNull(bo.getCustomerId()), ErpSaleOrder::getCustomerId, bo.getCustomerId());
        lqw.eq(ObjectUtil.isNotNull(bo.getStatus()), ErpSaleOrder::getStatus, bo.getStatus());
        lqw.orderByDesc(ErpSaleOrder::getId);
        return lqw;
    }

    @Override
    public ErpSaleOrderVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    @Override
    public List<ErpSaleOrderItemVo> queryItemsByOrderNo(String orderNo) {
        ErpSaleOrder order = baseMapper.selectOne(new LambdaQueryWrapper<ErpSaleOrder>().eq(ErpSaleOrder::getNo, orderNo));
        if (order == null) {
            return List.of();
        }
        return itemMapper.selectVoList(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId, order.getId()));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean insertByBo(ErpSaleOrderBo bo) {
        ErpSaleOrder add = MapstructUtils.convert(bo, ErpSaleOrder.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag && bo.getItems() != null) {
            for (var item : bo.getItems()) {
                ErpSaleOrderItem entity = MapstructUtils.convert(item, ErpSaleOrderItem.class);
                entity.setOrderId(add.getId());
                itemMapper.insert(entity);
            }
        }
        return flag;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean updateByBo(ErpSaleOrderBo bo) {
        ErpSaleOrder update = MapstructUtils.convert(bo, ErpSaleOrder.class);
        validEntityBeforeSave(update);
        boolean flag = baseMapper.updateById(update) > 0;
        if (flag && bo.getItems() != null) {
            itemMapper.delete(new LambdaQueryWrapper<ErpSaleOrderItem>().eq(ErpSaleOrderItem::getOrderId, update.getId()));
            for (var item : bo.getItems()) {
                ErpSaleOrderItem entity = MapstructUtils.convert(item, ErpSaleOrderItem.class);
                entity.setOrderId(update.getId());
                itemMapper.insert(entity);
            }
        }
        return flag;
    }

    private void validEntityBeforeSave(ErpSaleOrder entity) {
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid) {
        if (isValid) {
        }
        itemMapper.delete(new LambdaQueryWrapper<ErpSaleOrderItem>().in(ErpSaleOrderItem::getOrderId, ids));
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public Boolean updateSaleOrderStatus(Long id, Integer status) {
        ErpSaleOrder order = new ErpSaleOrder();
        order.setId(id);
        order.setStatus(status);
        return baseMapper.updateById(order) > 0;
    }
}
