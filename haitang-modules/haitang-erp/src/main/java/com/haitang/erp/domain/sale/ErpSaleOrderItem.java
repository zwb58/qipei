package com.haitang.erp.domain.sale;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_sale_order_items")
public class ErpSaleOrderItem extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long orderId;

    private Long productId;

    private Long productUnitId;

    private BigDecimal productPrice;

    private BigDecimal count;

    private BigDecimal totalPrice;

    private BigDecimal taxPercent;

    private BigDecimal taxPrice;

    private String remark;

    private BigDecimal outCount;

    private BigDecimal returnCount;
}
