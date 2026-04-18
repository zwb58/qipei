package com.haitang.erp.domain.purchase.bo;

import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 采购订单业务对象 erp_purchase_order_item
 *
 * @author hhhbx
 */
@Data
public class ErpPurchaseOrderItemBo  {

    /**
     * 编号
     */
    private Long id;

    /**
     * 采购单编号
     */
    private String orderNo;

    /**
     * 产品编号
     */
    @NotNull(message = "产品编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long productId;

    /**
     * 产品单位
     */
    @NotNull(message = "产品单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long productUnitId;

    /**
     * 产品单价
     */
    @NotNull(message = "产品单价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal productPrice;

    /**
     * 采购数量
     */
    @NotNull(message = "采购数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal count;

    /**
     * 税率
     */
    @NotNull(message = "税率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxPercent;

    /**
     * 备注
     */
    private String remark;
}
