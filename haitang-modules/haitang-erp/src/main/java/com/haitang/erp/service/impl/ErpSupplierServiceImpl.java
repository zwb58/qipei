package com.haitang.erp.service.impl;

import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.ErpProduct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpSupplierBo;
import com.haitang.erp.domain.vo.ErpSupplierVo;
import com.haitang.erp.domain.ErpSupplier;
import com.haitang.erp.mapper.ErpSupplierMapper;
import com.haitang.erp.service.IErpSupplierService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 供应商信息Service业务层处理
 *
 * @author hhh
 * @date 2024-04-30
 */
@RequiredArgsConstructor
@Service
public class ErpSupplierServiceImpl implements IErpSupplierService {

    private final ErpSupplierMapper baseMapper;

    /**
     * 查询供应商信息
     */
    @Override
    public ErpSupplierVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询供应商信息列表
     */
    @Override
    public TableDataInfo<ErpSupplierVo> queryPageList(ErpSupplierBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSupplier> lqw = buildQueryWrapper(bo);
        Page<ErpSupplierVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询供应商信息列表
     */
    @Override
    public List<ErpSupplierVo> queryList(ErpSupplierBo bo) {
        LambdaQueryWrapper<ErpSupplier> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpSupplier> buildQueryWrapper(ErpSupplierBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpSupplier> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpSupplier::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getContact()), ErpSupplier::getContact, bo.getContact());
        lqw.eq(StringUtils.isNotBlank(bo.getMobile()), ErpSupplier::getMobile, bo.getMobile());
        lqw.eq(bo.getStatus() != null, ErpSupplier::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增供应商信息
     */
    @Override
    public Boolean insertByBo(ErpSupplierBo bo) {
        ErpSupplier add = MapstructUtils.convert(bo, ErpSupplier.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改供应商信息
     */
    @Override
    public Boolean updateByBo(ErpSupplierBo bo) {
        ErpSupplier update = MapstructUtils.convert(bo, ErpSupplier.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpSupplier entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除供应商信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
    /**
     * 查询应商信息
     */
    @Override
    public List<ErpSupplierVo> getSupplierListByStatus() {
        return baseMapper.selectVoList(new LambdaQueryWrapper<ErpSupplier>()
            .eq(ErpSupplier::getStatus, CommonStatusEnum.ENABLE.getStatus()));
    }

    /**
     * 校验供应商信息
     */
    @Override
    public ErpSupplierVo validateSupplier(Long id) {
        ErpSupplierVo supplier = baseMapper.selectVoById(id);
        if (supplier == null) {
            //todo 异常信息封装处理
            throw new ServiceException("供应商不存在");        }
        if (CommonStatusEnum.isDisable(supplier.getStatus())) {
            //todo 异常信息封装处理
            throw new ServiceException("供应商({"+supplier.getName()+"})未启用");        }
        return supplier;
    }
}
