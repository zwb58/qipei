package com.haitang.erp.domain.finance;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;
import java.util.Date;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_finance_payment")
public class ErpFinancePayment extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String no;

    private Integer status;

    private Date paymentTime;

    private Long financeUserId;

    private Long supplierId;

    private Long accountId;

    private BigDecimal totalPrice;

    private BigDecimal discountPrice;

    private BigDecimal paymentPrice;

    private String remark;
}
