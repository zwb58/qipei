package com.haitang.erp.domain.purchase.bo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.purchase.ErpPurchaseOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 采购订单业务对象 erp_purchase_order
 *
 * @author hhhbx
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpPurchaseOrder.class, reverseConvertGenerate = false)
public class ErpPurchaseOrderBo extends BaseEntity {

    /**
     * 入库状态 - 无
     */
    public static final Integer IN_STATUS_NONE = 0;
    /**
     * 入库状态 - 部分
     */
    public static final Integer IN_STATUS_PART = 1;
    /**
     * 入库状态 - 全部
     */
    public static final Integer IN_STATUS_ALL = 2;

    /**
     * 退货状态 - 无
     */
    public static final Integer RETURN_STATUS_NONE = 0;
    /**
     * 退货状态 - 部分
     */
    public static final Integer RETURN_STATUS_PART = 1;
    /**
     * 退货状态 - 全部
     */
    public static final Integer RETURN_STATUS_ALL = 2;

    /**
     * 编号
     */
    private Long id;

    /**
     * 采购单编号
     */
    private String no;

    /**
     * 采购状态
     */
//    @NotNull(message = "采购状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;

    /**
     * 供应商
     */
    @NotNull(message = "供应商不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long supplierId;

    @TableField(exist = false)
    private Long productId;
    /**
     * 结算账户
     */
    @NotNull(message = "结算账户不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long accountId;

    /**
     * 订单时间
     */
    @NotNull(message = "订单时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date orderTime;

    /**
     * 合计数量
     */
//    @NotNull(message = "合计数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalCount;

    /**
     * 合计价格，单位：元
     */
//    @NotNull(message = "合计价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalPrice;

    /**
     * 合计产品价格，单位：元
     */
//    @NotNull(message = "合计产品价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalProductPrice;

    /**
     * 合计税额，单位：元
     */
//    @NotNull(message = "合计税额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalTaxPrice;

    /**
     * 优惠率，百分比
     */
//    @NotNull(message = "优惠率，百分比不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal discountPercent;

    /**
     * 优惠金额，单位：元
     */
//    @NotNull(message = "优惠金额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal discountPrice;

    /**
     * 定金金额，单位：元
     */
//    @NotNull(message = "定金金额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal depositPrice;

    /**
     * 附件地址
     */
//    @NotBlank(message = "附件地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String fileUrl;

    /**
     * 备注
     */
    private String remark;

    /**
     * 采购入库数量
     */
//    @NotNull(message = "采购入库数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal inCount;

    /**
     * 采购退货数量
     */
//    @NotNull(message = "采购退货数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal returnCount;


    @TableField(exist = false)
    private Integer inStatus;
    @TableField(exist = false)
    private Integer returnStatus;
    @TableField(exist = false)
    private Boolean inEnable;
    @TableField(exist = false)
    private Boolean returnEnable;

    /**
     * 订单清单列表
     */
    @TableField(exist = false)
    private List<ErpPurchaseOrderItemBo> items;

}
