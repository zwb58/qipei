package com.haitang.erp.domain.purchase.bo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * ERP 采购入库业务对象 erp_purchase_in
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpPurchaseIn.class, reverseConvertGenerate = false)
public class ErpPurchaseInBo extends BaseEntity {

    /**
     * 编号
     */
    @NotNull(message = "编号不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 采购入库编号
     */
//    @NotBlank(message = "采购入库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String no;

    /**
     * 采购状态
     */
//    @NotNull(message = "采购状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;

    /**
     * 供应商编号
     */
    @NotNull(message = "供应商编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long supplierId;

    /**
     * 结算账户编号
     */
    @NotNull(message = "结算账户编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long accountId;

    /**
     * 入库时间
     */
    @NotNull(message = "入库时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date inTime;

    /**
     * 采购订单编号
     */
    @NotNull(message = "采购订单编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long orderId;

    /**
     * 采购订单号
     */
    @NotBlank(message = "采购订单号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String orderNo;

    /**
     * 合计数量
     */
//    @NotNull(message = "合计数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalCount;

    /**
     * 合计价格，单位：元
     */
    @NotNull(message = "合计价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalPrice;

    /**
     * 已付款金额，单位：元
     */
//    @NotNull(message = "已付款金额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal paymentPrice;

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
    @NotNull(message = "优惠率，百分比不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal discountPercent;

    /**
     * 优惠金额，单位：元
     */
    @NotNull(message = "优惠金额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal discountPrice;

    /**
     * 其它金额，单位：元
     */
    @NotNull(message = "其它金额，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal otherPrice;

    /**
     * 附件地址
     */
//    @NotBlank(message = "附件地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String fileUrl;

    /**
     * 订单清单列表
     */
    @TableField(exist = false)
    private List<ErpPurchaseInItemsBo> items;

    /**
     * 备注
     */
//    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

}
