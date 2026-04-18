package com.haitang.erp.domain.finance.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.finance.ErpFinanceReceipt;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpFinanceReceipt.class, reverseConvertGenerate = false)
public class ErpFinanceReceiptBo extends BaseEntity {

    @NotNull(message = "主键不能为空", groups = {EditGroup.class})
    private Long id;

    @NotBlank(message = "收款单号不能为空")
    private String no;

    @NotNull(message = "状态不能为空")
    private Integer status;

    @NotNull(message = "收款时间不能为空")
    private Date receiptTime;

    private Long financeUserId;

    @NotNull(message = "客户不能为空")
    private Long customerId;

    @NotNull(message = "结算账户不能为空")
    private Long accountId;

    private BigDecimal totalPrice;

    private BigDecimal discountPrice;

    private BigDecimal receiptPrice;

    private String remark;
}
