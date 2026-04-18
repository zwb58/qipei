package com.haitang.erp.domain.stock.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.stock.ErpStock;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpStock.class, reverseConvertGenerate = false)
public class ErpStockBo extends BaseEntity {

    @NotNull(message = "主键不能为空", groups = {EditGroup.class})
    private Long id;

    @NotNull(message = "产品不能为空")
    private Long productId;

    @NotNull(message = "仓库不能为空")
    private Long warehouseId;

    @NotNull(message = "库存数量不能为空")
    private BigDecimal count;
}
