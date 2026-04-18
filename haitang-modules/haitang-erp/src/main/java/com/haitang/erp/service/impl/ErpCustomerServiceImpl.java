package com.haitang.erp.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpCustomerBo;
import com.haitang.erp.domain.vo.ErpCustomerVo;
import com.haitang.erp.domain.ErpCustomer;
import com.haitang.erp.mapper.ErpCustomerMapper;
import com.haitang.erp.service.IErpCustomerService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 客户信息Service业务层处理
 *
 * @author hou
 * @date 2024-04-16
 */
@RequiredArgsConstructor
@Service
public class ErpCustomerServiceImpl implements IErpCustomerService {

    private final ErpCustomerMapper baseMapper;

    /**
     * 查询客户信息
     */
    @Override
    public ErpCustomerVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询客户信息列表
     */
    @Override
    public TableDataInfo<ErpCustomerVo> queryPageList(ErpCustomerBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpCustomer> lqw = buildQueryWrapper(bo);
        Page<ErpCustomerVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询客户信息列表
     */
    @Override
    public List<ErpCustomerVo> queryList(ErpCustomerBo bo) {
        LambdaQueryWrapper<ErpCustomer> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpCustomer> buildQueryWrapper(ErpCustomerBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpCustomer> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpCustomer::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getContact()), ErpCustomer::getContact, bo.getContact());
        lqw.eq(StringUtils.isNotBlank(bo.getMobile()), ErpCustomer::getMobile, bo.getMobile());
        lqw.eq(bo.getStatus() != null, ErpCustomer::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增客户信息
     */
    @Override
    public Boolean insertByBo(ErpCustomerBo bo) {
        ErpCustomer add = MapstructUtils.convert(bo, ErpCustomer.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改客户信息
     */
    @Override
    public Boolean updateByBo(ErpCustomerBo bo) {
        ErpCustomer update = MapstructUtils.convert(bo, ErpCustomer.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpCustomer entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除客户信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 修改用户状态
     *
     * @param id 客户ID
     * @param status 帐号状态
     * @return 结果
     */
    @Override
    public int updateCustomerStatus(Long id, String status) {
        return baseMapper.update(null,
            new LambdaUpdateWrapper<ErpCustomer>()
                .set(ErpCustomer::getStatus, status)
                .eq(ErpCustomer::getId, id));
    }
}
