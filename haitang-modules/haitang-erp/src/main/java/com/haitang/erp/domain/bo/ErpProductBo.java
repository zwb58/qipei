package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpProduct;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

/**
 * 产品信息业务对象 erp_product
 *
 * @author hhh
 * @date 2024-05-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpProduct.class, reverseConvertGenerate = false)
public class ErpProductBo extends BaseEntity {

    /**
     * 产品编号
     */
    @NotNull(message = "产品编号不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 产品名称
     */
    @NotBlank(message = "产品名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 产品条码
     */
    @NotBlank(message = "产品条码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String barCode;

    /**
     * 产品分类编号
     */
    @NotNull(message = "产品分类编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long categoryId;

    /**
     * 单位编号
     */
    @NotNull(message = "单位编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long unitId;

    /**
     * 产品状态
     */
    @NotNull(message = "产品状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long status;

    /**
     * 产品规格
     */
    private String standard;

    /**
     * 产品备注
     */
    private String remark;

    /**
     * 保质期天数
     */
    @NotNull(message = "保质期天数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long expiryDay;

    /**
     * 基础重量（kg）
     */
    @NotNull(message = "基础重量（kg）不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal weight;

    /**
     * 采购价格，单位：元
     */
    @NotNull(message = "采购价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal purchasePrice;

    /**
     * 销售价格，单位：元
     */
    @NotNull(message = "销售价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal salePrice;

    /**
     * 最低价格，单位：元
     */
    @NotNull(message = "最低价格，单位：元不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal minPrice;


}
