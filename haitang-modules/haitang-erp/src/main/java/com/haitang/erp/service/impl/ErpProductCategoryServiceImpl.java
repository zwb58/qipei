package com.haitang.erp.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.lang.tree.Tree;
import cn.hutool.core.util.ObjectUtil;
import com.haitang.common.core.constant.UserConstants;
import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.common.core.utils.TreeBuildUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpProductCategoryBo;
import com.haitang.erp.domain.vo.ErpProductCategoryVo;
import com.haitang.erp.domain.ErpProductCategory;
import com.haitang.erp.mapper.ErpProductCategoryMapper;
import com.haitang.erp.service.IErpProductCategoryService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 产品分类Service业务层处理
 *
 * @author hhh
 * @date 2024-05-01
 */
@RequiredArgsConstructor
@Service
public class ErpProductCategoryServiceImpl implements IErpProductCategoryService {

    private final ErpProductCategoryMapper baseMapper;

    /**
     * 查询产品分类
     */
    @Override
    public ErpProductCategoryVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }


    /**
     * 查询产品分类列表
     */
    @Override
    public List<ErpProductCategoryVo> queryList(ErpProductCategoryBo bo) {
        LambdaQueryWrapper<ErpProductCategory> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpProductCategory> buildQueryWrapper(ErpProductCategoryBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpProductCategory> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getParentId() != null, ErpProductCategory::getParentId, bo.getParentId());
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpProductCategory::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getCode()), ErpProductCategory::getCode, bo.getCode());
        lqw.eq(bo.getStatus() != null, ErpProductCategory::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增产品分类
     */
    @Override
    public Boolean insertByBo(ErpProductCategoryBo bo) {
        ErpProductCategory add = MapstructUtils.convert(bo, ErpProductCategory.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改产品分类
     */
    @Override
    public Boolean updateByBo(ErpProductCategoryBo bo) {
        ErpProductCategory update = MapstructUtils.convert(bo, ErpProductCategory.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpProductCategory entity){
        //TODO 做一些数据校验,如唯一约束

    }

    /**
     * 批量删除产品分类
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public boolean hasChildById(Long id) {
        return baseMapper.exists(new LambdaQueryWrapper<ErpProductCategory>()
                .eq(ErpProductCategory::getParentId, id));
    }

    /**
     * 校验产品分类和产品名称是否唯一
     */
    @Override
    public boolean isUniqueNameAndCode(ErpProductCategoryBo bo) {
       boolean exist =  baseMapper.exists(new LambdaQueryWrapper<ErpProductCategory>()
//                .eq(ErpProductCategory::getName, bo.getName())
                .eq(ErpProductCategory::getCode, bo.getCode())
                .ne(ObjectUtil.isNotNull(bo.getId()), ErpProductCategory::getId, bo.getId()));
        return !exist;
    }

    @Override
    public List<Tree<Long>> selectCategoryTreeList(ErpProductCategoryBo bo) {

        // 只查询未禁用的产品分类
        bo.setStatus(CommonStatusEnum.ENABLE.getStatus());
        LambdaQueryWrapper<ErpProductCategory> lqw = buildQueryWrapper(bo);
        List<ErpProductCategoryVo> depts = baseMapper.selectCategoryList(lqw);
        return buildDeptTreeSelect(depts);
    }

    /**
     * 构建前端所需要下拉树结构
     *
     * @param categorys 部门列表
     * @return 下拉树结构列表
     */
    @Override
    public List<Tree<Long>> buildDeptTreeSelect(List<ErpProductCategoryVo> categorys) {
        if (CollUtil.isEmpty(categorys)) {
            return CollUtil.newArrayList();
        }
        return TreeBuildUtils.build(categorys, (category, tree) ->
            tree.setId(category.getId())
                .setParentId(category.getParentId())
                .setName(category.getName())
                .setWeight(category.getSort()));
    }

    @Override
    public List<ErpProductCategoryVo> getProductCategoryList(Collection<Long> ids) {
        return baseMapper.selectVoBatchIds(ids);
    }
}
