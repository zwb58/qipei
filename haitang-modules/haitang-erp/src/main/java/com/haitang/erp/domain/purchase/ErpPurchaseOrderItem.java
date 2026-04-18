package com.haitang.erp.domain.purchase;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;
import java.math.BigDecimal;

/**
 * 采购订单对象子表 erp_purchase_order_items
 *
 * @author hhhbx
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_purchase_order_items")
public class ErpPurchaseOrderItem extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 采购订单编号
     * 关联 {@link ErpPurchaseOrder#getNo()}
     */
    private String orderNo;

    /**
     * 产品编号
     */
    private Long productId;

    /**
     * 产品单位
     */
    private Long productUnitId;

    /**
     * 产品单位单价，单位：元
     */
    private BigDecimal productPrice;

    /**
     * 数量
     */
    private BigDecimal count;

    /**
     * 总价，单位：元
     * totalPrice = productPrice * count
     */
    private BigDecimal totalPrice;

    /**
     * 税率，百分比
     */
    private BigDecimal taxPercent;

    /**
     * 税额，单位：元
     * taxPrice = totalPrice * taxPercent
     */
    private BigDecimal taxPrice;

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

}
