package com.haitang.erp.domain;

import com.baomidou.mybatisplus.annotation.*;
import com.haitang.common.tenant.core.TenantEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.math.BigDecimal;

import java.io.Serial;

/**
 * 产品信息对象 erp_product
 *
 * @author hhh
 * @date 2024-05-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("erp_product")
public class ErpProduct extends TenantEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 产品编号
     */
    @TableId(value = "id")
    private Long id;

    /**
     * 产品名称
     */
    private String name;

    /**
     * 产品条码
     */
    private String barCode;

    /**
     * 产品分类编号
     */
    private Long categoryId;

    /**
     * 单位编号
     */
    private Long unitId;

    /**
     * 产品状态
     */
    private Long status;

    /**
     * 产品规格
     */
    private String standard;

    /**
     * 产品备注
     */
    private String remark;

    /**
     * 保质期天数
     */
    private Long expiryDay;

    /**
     * 基础重量（kg）
     */
    private BigDecimal weight;

    /**
     * 采购价格，单位：元
     */
    private BigDecimal purchasePrice;

    /**
     * 销售价格，单位：元
     */
    private BigDecimal salePrice;

    /**
     * 最低价格，单位：元
     */
    private BigDecimal minPrice;

    /**
     * 删除标志
     */
    @TableLogic
    private Long delFlag;


}
