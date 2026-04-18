package com.haitang.erp.service;

import com.haitang.erp.domain.vo.ErpSupplierVo;
import com.haitang.erp.domain.bo.ErpSupplierBo;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 供应商信息Service接口
 *
 * @author hhh
 */
public interface IErpSupplierService {

    /**
     * 查询供应商信息
     */
    ErpSupplierVo queryById(Long id);

    /**
     * 查询供应商信息列表
     */
    TableDataInfo<ErpSupplierVo> queryPageList(ErpSupplierBo bo, PageQuery pageQuery);

    /**
     * 查询供应商信息列表
     */
    List<ErpSupplierVo> queryList(ErpSupplierBo bo);

    /**
     * 新增供应商信息
     */
    Boolean insertByBo(ErpSupplierBo bo);

    /**
     * 修改供应商信息
     */
    Boolean updateByBo(ErpSupplierBo bo);

    /**
     * 校验并批量删除供应商信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
    /**
     * 查询供应商精简列表
     */
    List<ErpSupplierVo> getSupplierListByStatus();
    /**
     * 校验供应商
     *
     * @param id 编号
     * @return 供应商
     */
    ErpSupplierVo validateSupplier(Long id);
}
