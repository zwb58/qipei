package com.haitang.erp.domain.purchase.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.haitang.erp.domain.purchase.ErpPurchaseOrderItem;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 采购订单视图对象 erp_purchase_order
 *
 * @author hhhbx
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpPurchaseOrderItem.class)
public class ErpPurchaseOrderItemVo implements Serializable {

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
    private String orderNo;

    /**
     * 产品编号
     */
    @ExcelProperty(value = "产品编号")
    private Long productId;

    /**
     * 产品名称
     */
    @ExcelProperty(value = "产品名称")
    private String productName;

    /**
     * 产品单位
     */
    @ExcelProperty(value = "产品单位ID")
    private Long productUnitId;
    /**
     * 产品单位
     */
    @ExcelProperty(value = "产品单位")
    private String productUnitName;
    /**
     * 产品单位
     */
    @ExcelProperty(value = "产品条码")
    private String barCode;
    /**
     * 单价，单位：元
     */
    @ExcelProperty(value = "单价")
    private BigDecimal productPrice;

    /**
     * 数量
     */
    @ExcelProperty(value = "数量")
    private BigDecimal count;

    /**
     * 总价，单位：元
     * totalPrice = productPrice * count
     */
    @ExcelProperty(value = "总价")
    private BigDecimal totalPrice;

    /**
     * 税率，百分比
     */
    @ExcelProperty(value = "税率")
    private BigDecimal taxPercent;

    /**
     * 税额，单位：元
     * taxPrice = totalPrice * taxPercent
     */
    @ExcelProperty(value = "税额")
    private BigDecimal taxPrice;

    /**
     * 采购入库数量
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
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

}
