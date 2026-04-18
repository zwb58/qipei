package com.haitang.erp.service;

import cn.hutool.core.lang.tree.Tree;
import com.haitang.erp.domain.vo.ErpProductCategoryVo;
import com.haitang.erp.domain.bo.ErpProductCategoryBo;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import static com.haitang.common.core.utils.MapstructUtils.convert;
import static com.haitang.common.core.utils.collection.CollectionUtils.convertMap;

/**
 * 产品分类Service接口
 *
 * @author hhh
 * @date 2024-05-01
 */
public interface IErpProductCategoryService {

    /**
     * 查询产品分类
     */
    ErpProductCategoryVo queryById(Long id);


    /**
     * 查询产品分类列表
     */
    List<ErpProductCategoryVo> queryList(ErpProductCategoryBo bo);

    /**
     * 新增产品分类
     */
    Boolean insertByBo(ErpProductCategoryBo bo);

    /**
     * 修改产品分类
     */
    Boolean updateByBo(ErpProductCategoryBo bo);

    /**
     * 校验并批量删除产品分类信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 是否存在分类子节点
     *
     * @param id 产品分类id
     * @return 结果
     */
    boolean hasChildById(Long id);

    /**
     * 校验产品分类和产品名称是否唯一
     *
     * @param bo 产品分类信息
     * @return 结果
     */
    boolean isUniqueNameAndCode(ErpProductCategoryBo bo);


    /**
     * 查询产品分类树结构信息
     *
     * @param bo 产品信息
     * @return 产品树信息集合
     */
    List<Tree<Long>> selectCategoryTreeList(ErpProductCategoryBo bo);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param categorys c产品列表
     * @return 下拉树结构列表
     */
    List<Tree<Long>> buildDeptTreeSelect(List<ErpProductCategoryVo> categorys);

    /**
     * 获得产品分类列表
     *
     * @param ids 编号数组
     * @return 产品分类列表
     */
    List<ErpProductCategoryVo> getProductCategoryList(Collection<Long> ids);
    /**
     * 获得产品分类 Map
     *
     * @param ids 编号数组
     * @return 产品分类 Map
     */
    default Map<Long, ErpProductCategoryVo> getProductCategoryMap(Collection<Long> ids) {
        return convertMap(getProductCategoryList(ids), ErpProductCategoryVo::getId);
    }
}
