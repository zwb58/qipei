package com.haitang.erp.domain.purchase;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.util.Date;

import java.io.Serial;
import java.util.List;

/**
 * 采购订单对象 erp_purchase_order
 *
 * @author hhhbx
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_purchase_order")
public class ErpPurchaseOrder extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 采购单编号
     */
    private String no;

    /**
     * 采购状态
     */
    private Integer status;

    /**
     * 供应商
     */
    private Long supplierId;

    /**
     * 结算账户
     */
    private Long accountId;

    /**
     * 订单时间
     */
    private Date orderTime;

    /**
     * 合计数量
     */
    private BigDecimal totalCount;

    /**
     * 合计价格，单位：元
     * totalPrice = totalProductPrice + totalTaxPrice - discountPrice
     */
    private BigDecimal totalPrice;

    /**
     * 合计产品价格，单位：元
     */
    private BigDecimal totalProductPrice;

    /**
     * 合计税额，单位：元
     */
    private BigDecimal totalTaxPrice;

    /**
     * 优惠率，百分比
     */
    private BigDecimal discountPercent;

    /**
     * 优惠金额，单位：元
     * discountPrice = (totalProductPrice + totalTaxPrice) * discountPercent
     */
    private BigDecimal discountPrice;

    /**
     * 定金金额，单位：元
     */
    private BigDecimal depositPrice;

    /**
     * 附件地址
     */
    private String fileUrl;

    /**
     * 备注
     */
    private String remark;

    /**
     * 采购入库数量
     */
    private BigDecimal inCount;

    /**
     * 采购退货数量
     */
    private BigDecimal returnCount;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

    /**
     * 订单清单列表
     */
    @TableField(exist = false)
    private List<ErpPurchaseOrderItem> items;
}
