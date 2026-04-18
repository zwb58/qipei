package com.haitang.erp.service.stock;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.stock.bo.ErpStockBo;
import com.haitang.erp.domain.stock.vo.ErpStockVo;

import java.util.List;

public interface IErpStockService {

    TableDataInfo<ErpStockVo> queryPageList(ErpStockBo bo, PageQuery pageQuery);

    List<ErpStockVo> queryList(ErpStockBo bo);

    ErpStockVo queryById(Long id);

    Boolean insertByBo(ErpStockBo bo);

    Boolean updateByBo(ErpStockBo bo);

    Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid);
}
