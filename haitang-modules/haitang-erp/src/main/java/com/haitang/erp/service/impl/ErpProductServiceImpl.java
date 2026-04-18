package com.haitang.erp.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.core.utils.collection.MapUtils;
import com.haitang.common.core.utils.object.BeanUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.vo.ErpProductCategoryVo;
import com.haitang.erp.domain.vo.ErpProductUnitVo;
import com.haitang.erp.service.IErpProductCategoryService;
import com.haitang.erp.service.IErpProductUnitService;
import jakarta.annotation.Resource;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.haitang.erp.domain.bo.ErpProductBo;
import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.domain.ErpProduct;
import com.haitang.erp.mapper.ErpProductMapper;
import com.haitang.erp.service.IErpProductService;

import java.util.*;

import static com.haitang.common.core.utils.collection.CollectionUtils.convertMap;
import static com.haitang.common.core.utils.collection.CollectionUtils.convertSet;

/**
 * 产品信息Service业务层处理
 *
 * @author hhh
 * @date 2024-05-02
 */
@RequiredArgsConstructor
@Service
public class ErpProductServiceImpl implements IErpProductService {

    @Resource
    private final ErpProductMapper baseMapper;
    @Resource
    private IErpProductCategoryService erpproductCategoryService;
    @Resource
    private IErpProductUnitService erpProductUnitService;
    /**
     * 查询产品信息
     */
    @Override
    public ErpProductVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询产品信息列表
     */
    @Override
    public TableDataInfo<ErpProductVo> queryPageList(ErpProductBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpProduct> lqw = buildQueryWrapper(bo);
        Page<ErpProductVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<ErpProductVo> records = buildProductVOList(result.getRecords());
        result.setRecords(records);
        return TableDataInfo.build(result);
    }

    /**
     * 查询产品信息列表
     */
    @Override
    public List<ErpProductVo> queryList(ErpProductBo bo) {
        LambdaQueryWrapper<ErpProduct> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpProduct> buildQueryWrapper(ErpProductBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpProduct> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpProduct::getName, bo.getName());
        lqw.eq(StringUtils.isNotBlank(bo.getBarCode()), ErpProduct::getBarCode, bo.getBarCode());
        lqw.eq(bo.getCategoryId() != null, ErpProduct::getCategoryId, bo.getCategoryId());
        lqw.eq(bo.getUnitId() != null, ErpProduct::getUnitId, bo.getUnitId());
        lqw.eq(bo.getStatus() != null, ErpProduct::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增产品信息
     */
    @Override
    public Boolean insertByBo(ErpProductBo bo) {
        ErpProduct add = MapstructUtils.convert(bo, ErpProduct.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setId(add.getId());
        }
        return flag;
    }

    /**
     * 修改产品信息
     */
    @Override
    public Boolean updateByBo(ErpProductBo bo) {
        ErpProduct update = MapstructUtils.convert(bo, ErpProduct.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpProduct entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除产品信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
    /**
     * 查询产品精简列表
     */
    @Override
    public List<ErpProductVo> getProductListByStatus() {
        List<ErpProductVo> list =  baseMapper.selectVoList(new LambdaQueryWrapper<ErpProduct>()
            .eq(ErpProduct::getStatus, CommonStatusEnum.ENABLE.getStatus()));
        return buildProductVOList(list);
    }

    @Override
    public List<ErpProductVo> validProductList(Collection<Long> ids) {
        if (CollUtil.isEmpty(ids)) {
            return Collections.emptyList();
        }
        List<ErpProductVo> list = baseMapper.selectVoBatchIds(ids);
        Map<Long, ErpProductVo> productMap = convertMap(list, ErpProductVo::getId);
        for (Long id : ids) {
            ErpProductVo product = productMap.get(id);
            if (productMap.get(id) == null) {
                //todo 异常信息封装处理
                throw new ServiceException("产品信息不存在");
            }
            if (CommonStatusEnum.isDisable(product.getStatus())) {
                //todo 异常信息封装处理
                throw new ServiceException("供应商({"+product.getName()+"})未启用");
            }
        }
        return list;
    }

    private List<ErpProductVo> buildProductVOList(List<ErpProductVo> list) {
        if (CollUtil.isEmpty(list)) {
            return Collections.emptyList();
        }
        // 批量获取所有需要的 categoryId 和 unitId
        Set<Long> categoryIds = new HashSet<>();
        Set<Long> unitIds = new HashSet<>();

        // 一次遍历获取所有的 categoryId 和 unitId
        for (ErpProductVo product : list) {
            categoryIds.add(product.getCategoryId());
            unitIds.add(product.getUnitId());
        }

        // 批量获取 categoryMap 和 unitMap
        Map<Long, ErpProductCategoryVo> categoryMap = erpproductCategoryService.getProductCategoryMap(categoryIds);
        Map<Long, ErpProductUnitVo> unitMap = erpProductUnitService.getProductUnitMap(unitIds);

        // 使用 BeanUtils.toBean 进行批量属性设置，避免重复查找
        return BeanUtils.toBean(list, ErpProductVo.class, product -> {
            // 设置分类名称
            ErpProductCategoryVo category = categoryMap.get(product.getCategoryId());
            if (category != null) {
                product.setCategoryName(category.getName());
            }

            // 设置单位名称
            ErpProductUnitVo unit = unitMap.get(product.getUnitId());
            if (unit != null) {
                product.setUnitName(unit.getName());
            }
        });
    }
}
