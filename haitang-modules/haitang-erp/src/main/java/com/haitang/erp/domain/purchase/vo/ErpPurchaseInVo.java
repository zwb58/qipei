package com.haitang.erp.domain.purchase.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;



/**
 * ERP 采购入库视图对象 erp_purchase_in
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpPurchaseIn.class)
public class ErpPurchaseInVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 编号
     */
    @ExcelProperty(value = "编号")
    private Long id;

    /**
     * 采购入库编号
     */
    @ExcelProperty(value = "采购入库编号")
    private String no;

    /**
     * 采购状态
     */
    @ExcelProperty(value = "采购状态")
    private Long status;

    /**
     * 供应商编号
     */
    @ExcelProperty(value = "供应商编号")
    private Long supplierId;

    /**
     * 结算账户编号
     */
    @ExcelProperty(value = "结算账户编号")
    private Long accountId;

    /**
     * 入库时间
     */
    @ExcelProperty(value = "入库时间")
    private Date inTime;

    /**
     * 采购订单编号
     */
    @ExcelProperty(value = "采购订单编号")
    private Long orderId;

    /**
     * 采购订单号
     */
    @ExcelProperty(value = "采购订单号")
    private String orderNo;

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
     * 已付款金额，单位：元
     */
    @ExcelProperty(value = "已付款金额，单位：元")
    private BigDecimal paymentPrice;

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
     * 其它金额，单位：元
     */
    @ExcelProperty(value = "其它金额，单位：元")
    private BigDecimal otherPrice;

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


}
