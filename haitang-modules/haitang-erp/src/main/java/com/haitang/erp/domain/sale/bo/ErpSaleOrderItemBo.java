package com.haitang.erp.domain.sale.bo;

import com.haitang.erp.domain.sale.ErpSaleOrderItem;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

@Data
@AutoMapper(target = ErpSaleOrderItem.class, reverseConvertGenerate = false)
public class ErpSaleOrderItemBo {

    private Long id;

    private Long orderId;

    @NotNull(message = "产品不能为空")
    private Long productId;

    @NotNull(message = "单位不能为空")
    private Long productUnitId;

    @NotNull(message = "价格不能为空")
    private BigDecimal productPrice;

    @NotNull(message = "数量不能为空")
    private BigDecimal count;

    private BigDecimal totalPrice;

    private BigDecimal taxPercent;

    private BigDecimal taxPrice;

    private String remark;

    private BigDecimal outCount;

    private BigDecimal returnCount;
}
