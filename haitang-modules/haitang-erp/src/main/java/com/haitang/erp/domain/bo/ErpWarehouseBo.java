package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpWarehouse;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

/**
 * 仓库信息业务对象 erp_warehouse
 *
 * @author hou
 * @date 2024-04-20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpWarehouse.class, reverseConvertGenerate = false)
public class ErpWarehouseBo extends BaseEntity {

    /**
     * 仓库编号
     */
//    @NotNull(message = "仓库编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long id;
    /**
     * 仓库名称
     */
    @NotBlank(message = "仓库名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 仓库地址
     */
    @NotBlank(message = "仓库地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer sort;

    /**
     * 备注
     */
    private String remark;

    /**
     * 负责人
     */
    @NotBlank(message = "负责人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String principal;

    /**
     * 仓储费，单位：元
     */
    private BigDecimal warehousePrice;

    /**
     * 搬运费，单位：元
     */
    private BigDecimal truckagePrice;

    /**
     * 开启状态
     */
    @NotNull(message = "开启状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 是否默认
     */
//    @NotNull(message = "是否默认不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer defaultStatus;


}
