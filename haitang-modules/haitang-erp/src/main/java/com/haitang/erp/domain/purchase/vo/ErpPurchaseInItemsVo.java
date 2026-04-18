package com.haitang.erp.domain.purchase.vo;

import java.math.BigDecimal;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.haitang.erp.domain.purchase.ErpPurchaseInItem;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;


/**
 * ERP 销售入库项视图对象 erp_purchase_in_items
 *
 * @author Lion Li
 * @date 2024-12-21
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpPurchaseInItem.class)
public class ErpPurchaseInItemsVo implements Serializable {

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
    private Long inId;

    /**
     * 采购订单项编号
     */
    @ExcelProperty(value = "采购订单项编号")
    private Long orderItemId;

    /**
     * 仓库编号
     */
    @ExcelProperty(value = "仓库编号")
    private Long warehouseId;

    /**
     * 产品编号
     */
    @ExcelProperty(value = "产品编号")
    private Long productId;

    /**
     * 产品单位单位
     */
    @ExcelProperty(value = "产品单位单位")
    private Long productUnitId;

    /**
     * 产品单价
     */
    @ExcelProperty(value = "产品单价")
    private BigDecimal productPrice;

    /**
     * 数量
     */
    @ExcelProperty(value = "数量")
    private BigDecimal count;

    /**
     * 总价
     */
    @ExcelProperty(value = "总价")
    private BigDecimal totalPrice;

    /**
     * 税率，百分比
     */
    @ExcelProperty(value = "税率，百分比")
    private BigDecimal taxPercent;

    /**
     * 税额，单位：元
     */
    @ExcelProperty(value = "税额，单位：元")
    private BigDecimal taxPrice;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
