package com.haitang.erp.service.sale;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.sale.bo.ErpSaleOrderBo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderItemVo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderVo;

import java.util.List;

public interface IErpSaleOrderService {

    TableDataInfo<ErpSaleOrderVo> queryPageList(ErpSaleOrderBo bo, PageQuery pageQuery);

    List<ErpSaleOrderVo> queryList(ErpSaleOrderBo bo);

    ErpSaleOrderVo queryById(Long id);

    List<ErpSaleOrderItemVo> queryItemsByOrderNo(String orderNo);

    Boolean insertByBo(ErpSaleOrderBo bo);

    Boolean updateByBo(ErpSaleOrderBo bo);

    Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid);

    Boolean updateSaleOrderStatus(Long id, Integer status);
}
