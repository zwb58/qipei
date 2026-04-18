package com.haitang.erp.service.impl;

import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpProductUnitBo;
import com.haitang.erp.domain.vo.ErpProductUnitVo;
import com.haitang.erp.domain.ErpProductUnit;
import com.haitang.erp.mapper.ErpProductUnitMapper;
import com.haitang.erp.service.IErpProductUnitService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 产品单位Service业务层处理
 *
 * @author hhh
 * @date 2024-04-30
 */
@RequiredArgsConstructor
@Service
public class ErpProductUnitServiceImpl implements IErpProductUnitService {

    @Resource
    private final ErpProductUnitMapper baseMapper;

    /**
     * 查询产品单位
     */
    @Override
    public ErpProductUnitVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询产品单位列表
     */
    @Override
    public TableDataInfo<ErpProductUnitVo> queryPageList(ErpProductUnitBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpProductUnit> lqw = buildQueryWrapper(bo);
        Page<ErpProductUnitVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询产品单位列表
     */
    @Override
    public List<ErpProductUnitVo> queryList(ErpProductUnitBo bo) {
        LambdaQueryWrapper<ErpProductUnit> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpProductUnit> buildQueryWrapper(ErpProductUnitBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpProductUnit> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpProductUnit::getName, bo.getName());
        lqw.eq(bo.getStatus() != null, ErpProductUnit::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增产品单位
     */
    @Override
    public Boolean insertByBo(ErpProductUnitBo bo) {
        ErpProductUnit add = MapstructUtils.convert(bo, ErpProductUnit.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改产品单位
     */
    @Override
    public Boolean updateByBo(ErpProductUnitBo bo) {
        ErpProductUnit update = MapstructUtils.convert(bo, ErpProductUnit.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpProductUnit entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除产品单位
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public List<ErpProductUnitVo> getProductUnitListByStatus() {
        return baseMapper.selectVoList(new LambdaQueryWrapper<ErpProductUnit>()
            .eq(ErpProductUnit::getStatus, CommonStatusEnum.ENABLE.getStatus()));
    }

    @Override
    public List<ErpProductUnitVo> getProductUnitList(Collection<Long> ids) {
        return baseMapper.selectVoBatchIds(ids);
    }
}
