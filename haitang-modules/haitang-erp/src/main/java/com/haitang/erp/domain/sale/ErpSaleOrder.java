package com.haitang.erp.domain.sale;

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
@TableName("erp_sale_order")
public class ErpSaleOrder extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private String no;

    private Integer status;

    private Long customerId;

    private Long accountId;

    private Long saleUserId;

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
}
