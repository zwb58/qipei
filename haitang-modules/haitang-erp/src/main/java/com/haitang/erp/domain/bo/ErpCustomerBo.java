package com.haitang.erp.domain.bo;

import com.haitang.erp.domain.ErpCustomer;
import com.haitang.common.mybatis.core.domain.BaseEntity;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.math.BigDecimal;

/**
 * 客户信息业务对象 erp_customer
 *
 * @author hou
 * @date 2024-04-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = ErpCustomer.class, reverseConvertGenerate = false)
public class ErpCustomerBo extends BaseEntity {

    /**
     * 客户编号
     */
//    @NotNull(message = "客户编号不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long id;

    /**
     * 客户名称
     */
    @NotBlank(message = "客户名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 联系人
     */
    @NotBlank(message = "联系人不能为空", groups = { AddGroup.class, EditGroup.class })
    private String contact;

    /**
     * 手机号码
     */
    @NotBlank(message = "手机号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String mobile;

    /**
     * 联系电话
     */
    private String telephone;

    /**
     * 电子邮箱
     */
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
    private String status;

    /**
     * 排序
     */
    @NotNull(message = "排序不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer sort;

    /**
     * 纳税人识别号
     */
    @NotBlank(message = "纳税人识别号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String taxNo;

    /**
     * 税率
     */
    @NotNull(message = "税率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal taxPercent;

    /**
     * 开户行
     */
    @NotBlank(message = "开户行不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bankName;

    /**
     * 开户账号
     */
    @NotBlank(message = "开户账号不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bankAccount;

    /**
     * 开户地址
     */
    @NotBlank(message = "开户地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String bankAddress;

}
