package com.haitang.erp.domain.vo;


import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.ErpProduct;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


/**
 * 产品信息视图对象 erp_product
 *
 * @author hhh
 * @date 2024-05-02
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpProduct.class)
public class ErpProductVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 产品编号
     */
    @ExcelProperty(value = "产品编号")
    private Long id;

    /**
     * 产品名称
     */
    @ExcelProperty(value = "产品名称")
    private String name;

    /**
     * 产品条码
     */
    @ExcelProperty(value = "产品条码")
    private String barCode;

    /**
     * 产品分类编号
     */
    @ExcelProperty(value = "产品分类编号")
    private Long categoryId;
    /**
     * 产品分类名称
     */
    @ExcelProperty(value = "产品分类名称")
    private String categoryName;

    /**
     * 单位编号
     */
    @ExcelProperty(value = "单位编号")
    private Long unitId;
    /**
     * 单位名称
     */
    @ExcelProperty(value = "单位名称")
    private String unitName;

    /**
     * 产品状态
     */
    @ExcelProperty(value = "产品状态")
    private Integer status;
    /**
     * 产品规格
     */
    @ExcelProperty(value = "产品规格")
    private String standard;

    /**
     * 产品备注
     */
    @ExcelProperty(value = "产品备注")
    private String remark;

    /**
     * 保质期天数
     */
    @ExcelProperty(value = "保质期天数")
    private Long expiryDay;

    /**
     * 基础重量（kg）
     */
    @ExcelProperty(value = "基础重量（kg）")
    private BigDecimal weight;

    /**
     * 采购价格，单位：元
     */
    @ExcelProperty(value = "采购价格，单位：元")
    private BigDecimal purchasePrice;

    /**
     * 销售价格，单位：元
     */
    @ExcelProperty(value = "销售价格，单位：元")
    private BigDecimal salePrice;

    /**
     * 最低价格，单位：元
     */
    @ExcelProperty(value = "最低价格，单位：元")
    private BigDecimal minPrice;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 创建人
     */
    @ExcelProperty(value = "创建人")
    private Long createBy;

    /**
     * 创建人账号
     */
    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "createBy")
    @ExcelProperty(value = "创建人账号")
    private String createByName;

    /**
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private Date updateTime;

    /**
     * 更新人
     */
    @ExcelProperty(value = "更新人")
    private Long updateBy;

    /**
     * 更新人账号
     */
    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "updateBy")
    @ExcelProperty(value = "更新人账号")
    private String updateByName;
}
