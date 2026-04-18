package com.haitang.erp.domain.purchase;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

import java.io.Serial;

/**
 * ERP 销售入库项对象 erp_purchase_in_items
 *
 * @author hhbx
 * @date 2024-12-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_purchase_in_items")
public class ErpPurchaseInItem extends TenantEntity {

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
    private String inNo;

    /**
     * 采购订单项编号
     */
    private Long orderItemId;

    /**
     * 仓库编号
     */
    private Long warehouseId;

    /**
     * 产品编号
     */
    private Long productId;

    /**
     * 产品单位单位
     */
    private Long productUnitId;

    /**
     * 产品单价
     */
    private BigDecimal productPrice;

    /**
     * 数量
     */
    private BigDecimal count;

    /**
     * 总价
     */
    private BigDecimal totalPrice;

    /**
     * 税率，百分比
     */
    private BigDecimal taxPercent;

    /**
     * 税额，单位：元
     */
    private BigDecimal taxPrice;

    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;


}
