package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpProductCategory;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * 产品分类业务对象 erp_product_category
 *
 * @author hhh
 * @date 2024-05-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpProductCategory.class, reverseConvertGenerate = false)
public class ErpProductCategoryBo extends BaseEntity {

    /**
     * 分类编号
     */
    private Long id;

    /**
     * 父分类编号
     */
    @NotNull(message = "父分类编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long parentId;

    /**
     * 分类名称
     */
    @NotBlank(message = "分类名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 分类编码
     */
    @NotBlank(message = "分类编码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String code;

    /**
     * 分类排序
     */
    private Long sort;

    /**
     * 开启状态
     */
    @NotNull(message = "开启状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;


}
