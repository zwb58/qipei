package com.haitang.erp.service.finance;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.finance.bo.ErpFinancePaymentBo;
import com.haitang.erp.domain.finance.vo.ErpFinancePaymentVo;

import java.util.List;

public interface IErpFinancePaymentService {

    TableDataInfo<ErpFinancePaymentVo> queryPageList(ErpFinancePaymentBo bo, PageQuery pageQuery);

    List<ErpFinancePaymentVo> queryList(ErpFinancePaymentBo bo);

    ErpFinancePaymentVo queryById(Long id);

    Boolean insertByBo(ErpFinancePaymentBo bo);

    Boolean updateByBo(ErpFinancePaymentBo bo);

    Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid);
}
