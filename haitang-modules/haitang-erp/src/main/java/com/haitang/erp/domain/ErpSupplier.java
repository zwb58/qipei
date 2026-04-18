package com.haitang.erp.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

import java.io.Serial;

/**
 * 供应商信息对象 erp_supplier
 *
 * @author hhh
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_supplier")
public class ErpSupplier extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 供应商编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 供应商名称
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

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;

}
