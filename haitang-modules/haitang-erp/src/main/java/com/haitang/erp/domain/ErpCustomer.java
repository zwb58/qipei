package com.haitang.erp.domain;

import com.haitang.common.tenant.core.TenantEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

import java.io.Serial;

/**
 * 客户信息对象 erp_customer
 *
 * @author hou
 * @date 2024-04-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_customer")
public class ErpCustomer extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 产品编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 客户名称
     */
    private String name;

    /**
     * 联系人
     */
    private String contact;

    /**
     * 手机号码
     */
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
    private Integer status;

    /**
     * 排序
     */
    private Integer sort;

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

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    @TableLogic
    private Integer delFlag;


}
