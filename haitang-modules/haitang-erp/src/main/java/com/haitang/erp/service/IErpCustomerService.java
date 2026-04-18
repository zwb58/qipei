package com.haitang.erp.service;

import com.haitang.erp.domain.ErpCustomer;
import com.haitang.erp.domain.vo.ErpCustomerVo;
import com.haitang.erp.domain.bo.ErpCustomerBo;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 客户信息Service接口
 *
 * @author hou
 * @date 2024-04-16
 */
public interface IErpCustomerService {

    /**
     * 查询客户信息
     */
    ErpCustomerVo queryById(Long id);

    /**
     * 查询客户信息列表
     */
    TableDataInfo<ErpCustomerVo> queryPageList(ErpCustomerBo bo, PageQuery pageQuery);

    /**
     * 查询客户信息列表
     */
    List<ErpCustomerVo> queryList(ErpCustomerBo bo);

    /**
     * 新增客户信息
     */
    Boolean insertByBo(ErpCustomerBo bo);

    /**
     * 修改客户信息
     */
    Boolean updateByBo(ErpCustomerBo bo);

    /**
     * 校验并批量删除客户信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 修改客户状态
     *
     * @param id 客户ID
     * @param status 帐号状态
     * @return 结果
     */
    int updateCustomerStatus(Long id, String status);
}
