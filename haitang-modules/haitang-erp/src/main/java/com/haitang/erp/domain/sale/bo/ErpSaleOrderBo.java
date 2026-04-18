package com.haitang.erp.domain.sale.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.sale.ErpSaleOrder;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpSaleOrder.class, reverseConvertGenerate = false)
public class ErpSaleOrderBo extends BaseEntity {

    @NotNull(message = "主键不能为空", groups = {EditGroup.class})
    private Long id;

    @NotBlank(message = "订单编号不能为空")
    private String no;

    @NotNull(message = "状态不能为空")
    private Integer status;

    @NotNull(message = "客户不能为空")
    private Long customerId;

    private Long accountId;

    private Long saleUserId;

    @NotNull(message = "订单时间不能为空")
    private Date orderTime;

    private BigDecimal totalCount;

    private BigDecimal totalPrice;

    private BigDecimal totalProductPrice;

    private BigDecimal totalTaxPrice;

    private BigDecimal discountPercent;

    private BigDecimal discountPrice;

    private BigDecimal depositPrice;

    private String fileUrl;

    private String remark;

    private BigDecimal returnCount;

    private List<ErpSaleOrderItemBo> items;
}
