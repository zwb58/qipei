package com.haitang.erp.service.purchase;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseInItemsBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInItemsVo;

import java.util.Collection;
import java.util.List;

/**
 * ERP 销售入库项Service接口
 *
 * @author Lion Li
 * @date 2024-12-21
 */
public interface IErpPurchaseInItemsService {

    /**
     * 查询ERP 销售入库项
     */
    ErpPurchaseInItemsVo queryById(Long id);

    /**
     * 查询ERP 销售入库项列表
     */
    TableDataInfo<ErpPurchaseInItemsVo> queryPageList(ErpPurchaseInItemsBo bo, PageQuery pageQuery);

    /**
     * 查询ERP 销售入库项列表
     */
    List<ErpPurchaseInItemsVo> queryList(ErpPurchaseInItemsBo bo);

    /**
     * 新增ERP 销售入库项
     */
    Boolean insertByBo(ErpPurchaseInItemsBo bo);

    /**
     * 修改ERP 销售入库项
     */
    Boolean updateByBo(ErpPurchaseInItemsBo bo);

    /**
     * 校验并批量删除ERP 销售入库项信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
