package com.haitang.erp.domain.purchase.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.purchase.ErpPurchaseInItem;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

/**
 * ERP 销售入库项业务对象 erp_purchase_in_items
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpPurchaseInItem.class, reverseConvertGenerate = false)
public class ErpPurchaseInItemsBo extends BaseEntity {

    /**
     * 编号
     */
    @NotNull(message = "编号不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 采购入库编号
     */
    @NotNull(message = "采购入库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String inNo;

    /**
     * 采购订单项编号
     */
    @NotNull(message = "采购订单项编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderItemId;

    /**
     * 仓库编号
     */
    @NotNull(message = "仓库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long warehouseId;

    /**
     * 产品编号
     */
    @NotNull(message = "产品编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long productId;

    /**
     * 产品单位单位
     */
    @NotNull(message = "产品单位单位不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long productUnitId;

    /**
     * 产品单价
     */
    @NotNull(message = "产品单价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal productPrice;

    /**
     * 数量
     */
    @NotNull(message = "数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal count;

    /**
     * 总价
     */
    @NotNull(message = "总价不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalPrice;

    /**
     * 税率，百分比
     */
    @NotNull(message = "税率，百分比不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxPercent;

    /**
     * 税额，单位：元
     */
    @NotNull(message = "税额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxPrice;

    /**
     * 备注
     */
    private String remark;

}
