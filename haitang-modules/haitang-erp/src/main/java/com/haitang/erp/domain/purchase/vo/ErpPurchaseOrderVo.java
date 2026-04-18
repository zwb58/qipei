package com.haitang.erp.domain.purchase.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.haitang.erp.domain.purchase.ErpPurchaseOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * 采购订单视图对象 erp_purchase_order
 *
 * @author hhhbx
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpPurchaseOrder.class)
public class ErpPurchaseOrderVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @ExcelProperty(value = "编号")
    private Long id;

    /**
     * 采购单编号
     */
    @ExcelProperty(value = "采购单编号")
    private String no;

    /**
     * 采购状态
     */
    @ExcelProperty(value = "采购状态")
    private Integer status;

    /**
     * 供应商
     */
    @ExcelProperty(value = "供应商")
    private Long supplierId;

    /**
     * 供应商
     */
    @ExcelProperty(value = "供应商名称")
    private String supplierName;

    /**
     * 结算账户
     */
    @ExcelProperty(value = "结算账户")
    private Long accountId;

    /**
     * 订单时间
     */
    @ExcelProperty(value = "订单时间")
    private Date orderTime;

    /**
     * 合计数量
     */
    @ExcelProperty(value = "合计数量")
    private BigDecimal totalCount;

    /**
     * 合计价格，单位：元
     */
    @ExcelProperty(value = "合计价格，单位：元")
    private BigDecimal totalPrice;

    /**
     * 合计产品价格，单位：元
     */
    @ExcelProperty(value = "合计产品价格，单位：元")
    private BigDecimal totalProductPrice;

    /**
     * 合计税额，单位：元
     */
    @ExcelProperty(value = "合计税额，单位：元")
    private BigDecimal totalTaxPrice;

    /**
     * 优惠率，百分比
     */
    @ExcelProperty(value = "优惠率，百分比")
    private BigDecimal discountPercent;

    /**
     * 优惠金额，单位：元
     */
    @ExcelProperty(value = "优惠金额，单位：元")
    private BigDecimal discountPrice;

    /**
     * 定金金额，单位：元
     */
    @ExcelProperty(value = "定金金额，单位：元")
    private BigDecimal depositPrice;

    /**
     * 附件地址
     */
    @ExcelProperty(value = "附件地址")
    private String fileUrl;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 采购入库数量
     */
    @ExcelProperty(value = "采购入库数量")
    private BigDecimal inCount;

    /**
     * 采购退货数量
     */
    @ExcelProperty(value = "采购退货数量")
    private BigDecimal returnCount;

    /**
     * 产品信息
     */
    @ExcelProperty("产品信息")
    private String productNames;


    /**
     * 创建时间
     */
    private String createBy;

    /**
     * 订单清单列表
     */
    private List<ErpPurchaseOrderItemVo> items;
}
