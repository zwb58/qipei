package com.haitang.erp.service.stock.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.stock.ErpStock;
import com.haitang.erp.domain.stock.bo.ErpStockBo;
import com.haitang.erp.domain.stock.vo.ErpStockVo;
import com.haitang.erp.mapper.stock.ErpStockMapper;
import com.haitang.erp.service.stock.IErpStockService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ErpStockServiceImpl implements IErpStockService {

    private final ErpStockMapper baseMapper;

    @Override
    public TableDataInfo<ErpStockVo> queryPageList(ErpStockBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpStock> lqw = buildQueryWrapper(bo);
        Page<ErpStockVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public List<ErpStockVo> queryList(ErpStockBo bo) {
        LambdaQueryWrapper<ErpStock> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpStock> buildQueryWrapper(ErpStockBo bo) {
        LambdaQueryWrapper<ErpStock> lqw = new LambdaQueryWrapper<>();
        lqw.eq(ObjectUtil.isNotNull(bo.getProductId()), ErpStock::getProductId, bo.getProductId());
        lqw.eq(ObjectUtil.isNotNull(bo.getWarehouseId()), ErpStock::getWarehouseId, bo.getWarehouseId());
        lqw.orderByDesc(ErpStock::getId);
        return lqw;
    }

    @Override
    public ErpStockVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    @Override
    public Boolean insertByBo(ErpStockBo bo) {
        ErpStock add = MapstructUtils.convert(bo, ErpStock.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        return flag;
    }

    @Override
    public Boolean updateByBo(ErpStockBo bo) {
        ErpStock update = MapstructUtils.convert(bo, ErpStock.class);
        validEntityBeforeSave(update);
        boolean flag = baseMapper.updateById(update) > 0;
        return flag;
    }

    private void validEntityBeforeSave(ErpStock entity) {
    }

    @Override
    public Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid) {
        if (isValid) {
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
