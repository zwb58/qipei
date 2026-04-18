package com.haitang.erp.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpWarehouseBo;
import com.haitang.erp.domain.vo.ErpWarehouseVo;
import com.haitang.erp.domain.ErpWarehouse;
import com.haitang.erp.mapper.ErpWarehouseMapper;
import com.haitang.erp.service.IErpWarehouseService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 仓库信息Service业务层处理
 *
 * @author hou
 * @date 2024-04-20
 */
@RequiredArgsConstructor
@Service
public class ErpWarehouseServiceImpl implements IErpWarehouseService {

    private final ErpWarehouseMapper baseMapper;

    /**
     * 查询仓库信息
     */
    @Override
    public ErpWarehouseVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询仓库信息列表
     */
    @Override
    public TableDataInfo<ErpWarehouseVo> queryPageList(ErpWarehouseBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpWarehouse> lqw = buildQueryWrapper(bo);
        Page<ErpWarehouseVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询仓库信息列表
     */
    @Override
    public List<ErpWarehouseVo> queryList(ErpWarehouseBo bo) {
        LambdaQueryWrapper<ErpWarehouse> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpWarehouse> buildQueryWrapper(ErpWarehouseBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpWarehouse> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpWarehouse::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getAddress()), ErpWarehouse::getAddress, bo.getAddress());
        lqw.eq(bo.getSort() != null, ErpWarehouse::getSort, bo.getSort());
        lqw.eq(StringUtils.isNotBlank(bo.getPrincipal()), ErpWarehouse::getPrincipal, bo.getPrincipal());
        lqw.eq(bo.getStatus() != null, ErpWarehouse::getStatus, bo.getStatus());
        lqw.eq(bo.getDefaultStatus() != null, ErpWarehouse::getDefaultStatus, bo.getDefaultStatus());
        return lqw;
    }

    /**
     * 新增仓库信息
     */
    @Override
    public Boolean insertByBo(ErpWarehouseBo bo) {
        ErpWarehouse add = MapstructUtils.convert(bo, ErpWarehouse.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改仓库信息
     */
    @Override
    public Boolean updateByBo(ErpWarehouseBo bo) {
        ErpWarehouse update = MapstructUtils.convert(bo, ErpWarehouse.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpWarehouse entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除仓库信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 仓库默认状态修改
     */
    @Override
    public int changeWarehouseDefaultStatus(ErpWarehouseBo bo) {
        ErpWarehouse update = MapstructUtils.convert(bo, ErpWarehouse.class);
        // 1. 校验存在
        validateAccountExists(update.getId());
        // 2.1 如果开启，则需要关闭所有其它的默认
        if (update.getDefaultStatus() == 0) {
            ErpWarehouseVo result = baseMapper.selectVoOne(new LambdaQueryWrapper<ErpWarehouse>()
                .select(ErpWarehouse::getId).eq(ErpWarehouse::getDefaultStatus, 0));
            if (result != null) {
                ErpWarehouse erpWarehouse = new ErpWarehouse();
                erpWarehouse.setDefaultStatus(1);
                erpWarehouse.setId(result.getId());
                baseMapper.updateById(erpWarehouse);
            }
        }
        // 2.2 更新对应的默认状态
        return baseMapper.update(null,
            new LambdaUpdateWrapper<ErpWarehouse>()
                .set(ErpWarehouse::getDefaultStatus, update.getDefaultStatus())
                .eq(ErpWarehouse::getId, update.getId()));
    }
    /**
     * 查询仓库精简列表
     */
    @Override
    public List<ErpWarehouseVo> getWarehouseListByStatus() {
        List<ErpWarehouseVo> list =  baseMapper.selectVoList(new LambdaQueryWrapper<ErpWarehouse>()
            .eq(ErpWarehouse::getStatus, CommonStatusEnum.ENABLE.getStatus()));
        return list;
    }
    private void validateAccountExists(Long id) {
        if (baseMapper.selectVoById(id) == null) {
            //todo 异常信息封装处理
            throw new ServiceException("仓库不存在");
        }
    }
}
