package com.haitang.erp.domain.finance.vo;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.finance.ErpFinanceReceipt;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpFinanceReceipt.class)
public class ErpFinanceReceiptVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private String no;

    private Integer status;

    private Date receiptTime;

    private Long financeUserId;

    private String financeUserName;

    private Long customerId;

    private String customerName;

    private Long accountId;

    private String accountName;

    private BigDecimal totalPrice;

    private BigDecimal discountPrice;

    private BigDecimal receiptPrice;

    private String remark;

    private Date createTime;

    private Long createBy;

    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "createBy")
    private String createByName;
}
