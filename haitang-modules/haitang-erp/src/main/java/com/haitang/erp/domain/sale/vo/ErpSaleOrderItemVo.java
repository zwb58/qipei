package com.haitang.erp.domain.sale.vo;

import com.haitang.erp.domain.sale.ErpSaleOrderItem;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpSaleOrderItem.class)
public class ErpSaleOrderItemVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long orderId;

    private Long productId;

    private String productName;

    private String productBarCode;

    private Long productUnitId;

    private String productUnitName;

    private BigDecimal productPrice;

    private BigDecimal count;

    private BigDecimal totalPrice;

    private BigDecimal taxPercent;

    private BigDecimal taxPrice;

    private String remark;

    private BigDecimal outCount;

    private BigDecimal returnCount;
}
