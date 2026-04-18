package com.haitang.erp.service.purchase.impl;

import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.purchase.ErpPurchaseInItem;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseInItemsBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInItemsVo;
import com.haitang.erp.mapper.purchase.ErpPurchaseInItemsMapper;
import com.haitang.erp.service.purchase.IErpPurchaseInItemsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * ERP 销售入库项Service业务层处理
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@RequiredArgsConstructor
@Service
public class ErpPurchaseInItemsServiceImpl implements IErpPurchaseInItemsService {

    private final ErpPurchaseInItemsMapper baseMapper;

    /**
     * 查询ERP 销售入库项
     */
    @Override
    public ErpPurchaseInItemsVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询ERP 销售入库项列表
     */
    @Override
    public TableDataInfo<ErpPurchaseInItemsVo> queryPageList(ErpPurchaseInItemsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpPurchaseInItem> lqw = buildQueryWrapper(bo);
        Page<ErpPurchaseInItemsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询ERP 销售入库项列表
     */
    @Override
    public List<ErpPurchaseInItemsVo> queryList(ErpPurchaseInItemsBo bo) {
        LambdaQueryWrapper<ErpPurchaseInItem> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpPurchaseInItem> buildQueryWrapper(ErpPurchaseInItemsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpPurchaseInItem> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getInNo() != null, ErpPurchaseInItem::getInNo, bo.getInNo());
        lqw.eq(bo.getOrderItemId() != null, ErpPurchaseInItem::getOrderItemId, bo.getOrderItemId());
        lqw.eq(bo.getWarehouseId() != null, ErpPurchaseInItem::getWarehouseId, bo.getWarehouseId());
        lqw.eq(bo.getProductId() != null, ErpPurchaseInItem::getProductId, bo.getProductId());
        lqw.eq(bo.getProductUnitId() != null, ErpPurchaseInItem::getProductUnitId, bo.getProductUnitId());
        lqw.eq(bo.getProductPrice() != null, ErpPurchaseInItem::getProductPrice, bo.getProductPrice());
        lqw.eq(bo.getCount() != null, ErpPurchaseInItem::getCount, bo.getCount());
        lqw.eq(bo.getTotalPrice() != null, ErpPurchaseInItem::getTotalPrice, bo.getTotalPrice());
        lqw.eq(bo.getTaxPercent() != null, ErpPurchaseInItem::getTaxPercent, bo.getTaxPercent());
        lqw.eq(bo.getTaxPrice() != null, ErpPurchaseInItem::getTaxPrice, bo.getTaxPrice());
        return lqw;
    }

    /**
     * 新增ERP 销售入库项
     */
    @Override
    public Boolean insertByBo(ErpPurchaseInItemsBo bo) {
        ErpPurchaseInItem add = MapstructUtils.convert(bo, ErpPurchaseInItem.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改ERP 销售入库项
     */
    @Override
    public Boolean updateByBo(ErpPurchaseInItemsBo bo) {
        ErpPurchaseInItem update = MapstructUtils.convert(bo, ErpPurchaseInItem.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpPurchaseInItem entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除ERP 销售入库项
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
