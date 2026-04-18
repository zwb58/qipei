package com.haitang.erp.service;

import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.domain.bo.ErpProductBo;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 产品信息Service接口
 *
 * @author hhh
 */
public interface IErpProductService {

    /**
     * 查询产品信息
     */
    ErpProductVo queryById(Long id);

    /**
     * 查询产品信息列表
     */
    TableDataInfo<ErpProductVo> queryPageList(ErpProductBo bo, PageQuery pageQuery);

    /**
     * 查询产品信息列表
     */
    List<ErpProductVo> queryList(ErpProductBo bo);

    /**
     * 新增产品信息
     */
    Boolean insertByBo(ErpProductBo bo);

    /**
     * 修改产品信息
     */
    Boolean updateByBo(ErpProductBo bo);

    /**
     * 校验并批量删除产品信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 查询产品精简列表
     */
    List<ErpProductVo> getProductListByStatus();

    /**
     * 校验产品们的有效性
     *
     * @param ids 编号数组
     * @return 产品列表
     */
    List<ErpProductVo> validProductList(Collection<Long> ids);
}
