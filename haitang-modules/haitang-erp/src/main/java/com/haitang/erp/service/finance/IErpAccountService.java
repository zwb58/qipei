package com.haitang.erp.service.finance;

import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.erp.domain.finance.bo.ErpAccountBo;
import com.haitang.erp.domain.finance.vo.ErpAccountVo;

import java.util.Collection;
import java.util.List;

/**
 * ERP 结算账户Service接口
 *
 * @author hou
 */
public interface IErpAccountService {

    /**
     * 查询ERP 结算账户
     */
    ErpAccountVo queryById(Long id);

    /**
     * 查询ERP 结算账户列表
     */
    TableDataInfo<ErpAccountVo> queryPageList(ErpAccountBo bo, PageQuery pageQuery);

    /**
     * 查询ERP 结算账户列表
     */
    List<ErpAccountVo> queryList(ErpAccountBo bo);

    /**
     * 新增ERP 结算账户
     */
    Boolean insertByBo(ErpAccountBo bo);

    /**
     * 修改ERP 结算账户
     */
    Boolean updateByBo(ErpAccountBo bo);

    /**
     * 校验并批量删除ERP 结算账户信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 修改结算账户默认状态
     */
    int updateAccountDefaultStatus(ErpAccountBo bo);

    /**
     * 查询结算账户精简列表
     */
    List<ErpAccountVo> getAccountListByStatus();
    /**
     * 校验结算账户
     *
     * @param id 编号
     * @return 结算账户
     */
    ErpAccountVo validateAccount(Long id);
}
