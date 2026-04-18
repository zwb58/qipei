package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpProductUnit;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 产品单位业务对象 erp_product_unit
 *
 * @author hhh
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpProductUnit.class, reverseConvertGenerate = false)
public class ErpProductUnitBo extends BaseEntity {

    /**
     * 单位编号
     */
    private Long id;

    /**
     * 单位名字
     */
    @NotBlank(message = "单位名字不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 单位状态
     */
    @NotNull(message = "单位状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long status;


}
