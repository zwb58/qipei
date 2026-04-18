package com.haitang.erp.domain.finance;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.*;

import java.io.Serial;

/**
 * ERP 结算账户对象 erp_account
 *
 * @author hou
 * @date 2024-12-03
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_account")
@ToString(callSuper = true)
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ErpAccount extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 产品编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 账户名称
     */
    private String name;

    /**
     * 账户编码
     */
    private String no;

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
     * 是否默认
     */
    private Integer defaultStatus;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;


}
