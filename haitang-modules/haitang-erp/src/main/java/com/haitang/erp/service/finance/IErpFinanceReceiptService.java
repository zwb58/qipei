package com.haitang.erp.service.finance;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.finance.bo.ErpFinanceReceiptBo;
import com.haitang.erp.domain.finance.vo.ErpFinanceReceiptVo;

import java.util.List;

public interface IErpFinanceReceiptService {

    TableDataInfo<ErpFinanceReceiptVo> queryPageList(ErpFinanceReceiptBo bo, PageQuery pageQuery);

    List<ErpFinanceReceiptVo> queryList(ErpFinanceReceiptBo bo);

    ErpFinanceReceiptVo queryById(Long id);

    Boolean insertByBo(ErpFinanceReceiptBo bo);

    Boolean updateByBo(ErpFinanceReceiptBo bo);

    Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid);
}
