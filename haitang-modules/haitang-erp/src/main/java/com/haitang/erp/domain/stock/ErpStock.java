package com.haitang.erp.domain.stock;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_stock")
public class ErpStock extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;

    private Long productId;

    private Long warehouseId;

    private BigDecimal count;
}
