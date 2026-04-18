package com.haitang.erp.service.purchase;

import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseInBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInVo;

import java.util.Collection;
import java.util.List;

/**
 * ERP 采购入库Service接口
 *
 * @author Lion Li
 * @date 2024-12-21
 */
public interface IErpPurchaseInService {

    /**
     * 查询ERP 采购入库
     */
    ErpPurchaseInVo queryById(Long id);

    /**
     * 查询ERP 采购入库列表
     */
    TableDataInfo<ErpPurchaseInVo> queryPageList(ErpPurchaseInBo bo, PageQuery pageQuery);

    /**
     * 查询ERP 采购入库列表
     */
    List<ErpPurchaseInVo> queryList(ErpPurchaseInBo bo);

    /**
     * 新增ERP 采购入库
     */
    Boolean insertByBo(ErpPurchaseInBo bo);

    /**
     * 修改ERP 采购入库
     */
    Boolean updateByBo(ErpPurchaseInBo bo);

    /**
     * 校验并批量删除ERP 采购入库信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
