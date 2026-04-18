package com.haitang.erp.domain.finance.bo;

import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.erp.domain.finance.ErpAccount;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;

/**
 * ERP 结算账户业务对象 erp_account
 *
 * @author hou
 * @date 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpAccount.class, reverseConvertGenerate = false)
public class ErpAccountBo extends BaseEntity {

    /**
     * 编号
     */
    private Long id;
    /**
     * 账户名称
     */
    @NotBlank(message = "账户名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 账户编码
     */
    @NotBlank(message = "账户编码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String no;

    /**
     * 备注
     */
//    @NotBlank(message = "备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String remark;

    /**
     * 开启状态
     */
    @NotNull(message = "开启状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long status;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long sort;

    /**
     * 是否默认
     */
//    @NotNull(message = "是否默认不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer defaultStatus;
}
