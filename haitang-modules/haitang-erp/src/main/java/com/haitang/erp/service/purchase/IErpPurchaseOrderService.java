package com.haitang.erp.service.purchase;

import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseOrderBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderItemVo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderVo;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 采购订单Service接口
 *
 * @author hhhbx
 */
public interface IErpPurchaseOrderService {

    /**
     * 查询采购订单
     */
    ErpPurchaseOrderVo queryById(Long id);
    /**
     * 查询采购订单子项
     */
    List<ErpPurchaseOrderItemVo> queryItemsByOrderNo(String orderNo);
    /**
     * 查询采购订单列表
     */
    TableDataInfo<ErpPurchaseOrderVo> queryPageList(ErpPurchaseOrderBo bo, PageQuery pageQuery);

    /**
     * 查询采购订单列表
     */
    List<ErpPurchaseOrderVo> queryList(ErpPurchaseOrderBo bo);

    /**
     * 新增采购订单
     */
    Boolean insertByBo(ErpPurchaseOrderBo bo);

    /**
     * 修改采购订单
     */
    boolean updateByBo(ErpPurchaseOrderBo bo);

    /**
     * 校验并批量删除采购订单信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
    /**
     * 更新采购订单的状态
     *
     * @param id 编号
     * @param status 状态
     */
    Boolean updatePurchaseOrderStatus(Long id, Integer status);

    /**
     * 校验采购订单，已经审核通过
     *
     * @param id 编号
     * @return 采购订单
     */
    ErpPurchaseOrderVo validatePurchaseOrder(Long id);

    /**
     * 更新采购订单的入库数量
     *
     * @param id 编号
     * @param inCountMap 入库数量 Map：key 采购订单项编号；value 入库数量
     */
    void updatePurchaseOrderInCount(Long id, Map<Long, BigDecimal> inCountMap);
}
