package com.haitang.erp.domain.finance.vo;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.finance.ErpFinancePayment;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpFinancePayment.class)
public class ErpFinancePaymentVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private String no;

    private Integer status;

    private Date paymentTime;

    private Long financeUserId;

    private String financeUserName;

    private Long supplierId;

    private String supplierName;

    private Long accountId;

    private String accountName;

    private BigDecimal totalPrice;

    private BigDecimal discountPrice;

    private BigDecimal paymentPrice;

    private String remark;

    private Date createTime;

    private Long createBy;

    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "createBy")
    private String createByName;
}
