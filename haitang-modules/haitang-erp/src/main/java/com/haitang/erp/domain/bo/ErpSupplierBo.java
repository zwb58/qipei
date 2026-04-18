package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpSupplier;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

/**
 * 供应商信息业务对象 erp_supplier
 *
 * @author hhh
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpSupplier.class, reverseConvertGenerate = false)
public class ErpSupplierBo extends BaseEntity {

    /**
     * 供应商编号
     */
    @NotNull(message = "供应商编号不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 供应商名称
     */
    @NotBlank(message = "供应商名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 联系人
     */
    @NotBlank(message = "联系人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String contact;

    /**
     * 手机号码
     */
    @NotBlank(message = "手机号码不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mobile;

    /**
     * 联系电话
     */
    @NotBlank(message = "联系电话不能为空", groups = { AddGroup.class, EditGroup.class })
    private String telephone;

    /**
     * 电子邮箱
     */
    @NotBlank(message = "电子邮箱不能为空", groups = { AddGroup.class, EditGroup.class })
    private String email;

    /**
     * 传真
     */
    private String fax;

    /**
     * 备注
     */
    private String remark;

    /**
     * 开启状态
     */
    @NotNull(message = "开启状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long status;

    /**
     * 排序
     */
    private Long sort;

    /**
     * 纳税人识别号
     */
    private String taxNo;

    /**
     * 税率
     */
    private BigDecimal taxPercent;

    /**
     * 开户行
     */
    private String bankName;

    /**
     * 开户账号
     */
    private String bankAccount;

    /**
     * 开户地址
     */
    private String bankAddress;


}
