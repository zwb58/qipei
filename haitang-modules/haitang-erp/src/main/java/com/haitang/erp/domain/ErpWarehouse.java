package com.haitang.erp.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

import java.io.Serial;

/**
 * 仓库信息对象 erp_warehouse
 *
 * @author hou
 * @date 2024-04-20
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_warehouse")
public class ErpWarehouse extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 仓库编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 仓库名称
     */
    private String name;

    /**
     * 仓库地址
     */
    private String address;

    /**
     * 排序
     */
    private Long sort;

    /**
     * 备注
     */
    private String remark;

    /**
     * 负责人
     */
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
    private String status;

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
