package com.haitang.erp.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 产品单位对象 erp_product_unit
 *
 * @author hhh
 * @date 2024-04-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_product_unit")
public class ErpProductUnit extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 单位编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 单位名字
     */
    private String name;

    /**
     * 单位状态
     */
    private Long status;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;


}
