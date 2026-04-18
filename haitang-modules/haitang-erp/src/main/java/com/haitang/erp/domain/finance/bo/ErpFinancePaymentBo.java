package com.haitang.erp.domain.finance.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.finance.ErpFinancePayment;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpFinancePayment.class, reverseConvertGenerate = false)
public class ErpFinancePaymentBo extends BaseEntity {

    @NotNull(message = "主键不能为空", groups = {EditGroup.class})
    private Long id;

    @NotBlank(message = "付款单号不能为空")
    private String no;

    @NotNull(message = "状态不能为空")
    private Integer status;

    @NotNull(message = "付款时间不能为空")
    private Date paymentTime;

    private Long financeUserId;

    @NotNull(message = "供应商不能为空")
    private Long supplierId;

    @NotNull(message = "结算账户不能为空")
    private Long accountId;

    private BigDecimal totalPrice;

    private BigDecimal discountPrice;

    private BigDecimal paymentPrice;

    private String remark;
}
