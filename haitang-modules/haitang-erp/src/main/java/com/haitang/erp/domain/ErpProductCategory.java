package com.haitang.erp.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serial;

/**
 * 产品分类对象 erp_product_category
 *
 * @author hhh
 * @date 2024-05-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_product_category")
public class ErpProductCategory extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 分类编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 父分类编号
     */
    private Long parentId;

    /**
     * 分类名称
     */
    private String name;

    /**
     * 分类编码
     */
    private String code;

    /**
     * 分类排序
     */
    private Long sort;

    /**
     * 开启状态
     */
    private Long status;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;


}
