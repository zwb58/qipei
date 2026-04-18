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
 * ERP 采购入库对象 erp_purchase_in
 *
 * @author hhhbx
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_purchase_in")
public class ErpPurchaseIn extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 采购入库编号
     */
    private String no;

    /**
     * 采购状态
     */
    private Integer status;

    /**
     * 供应商编号
     */
    private Long supplierId;

    /**
     * 结算账户编号
     */
    private Long accountId;

    /**
     * 入库时间
     */
    private Date inTime;

    /**
     * 采购订单编号
     */
    private Long orderId;

    /**
     * 采购订单号
     */
    private String orderNo;

    /**
     * 合计数量
     */
    private BigDecimal totalCount;

    /**
     * 合计价格，单位：元
     */
    private BigDecimal totalPrice;

    /**
     * 已付款金额，单位：元
     */
    private BigDecimal paymentPrice;

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
     */
    private BigDecimal discountPrice;

    /**
     * 其它金额，单位：元
     */
    private BigDecimal otherPrice;

    /**
     * 附件地址
     */
    private String fileUrl;

    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

    /**
     * 订单清单列表
     */
    @TableField(exist = false)
    private List<ErpPurchaseInItem> items;
}
