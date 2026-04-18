package com.haitang.erp.domain.vo;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.ErpProductCategory;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;


/**
 * 产品分类视图对象 erp_product_category
 *
 * @author hhh
 * @date 2024-05-01
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpProductCategory.class)
public class ErpProductCategoryVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 分类编号
     */
    @ExcelProperty(value = "分类编号")
    private Long id;

    /**
     * 父分类编号
     */
    @ExcelProperty(value = "父分类编号")
    private Long parentId;

    /**
     * 分类名称
     */
    @ExcelProperty(value = "分类名称")
    private String name;

    /**
     * 分类编码
     */
    @ExcelProperty(value = "分类编码")
    private String code;

    /**
     * 分类排序
     */
    @ExcelProperty(value = "分类排序")
    private Long sort;

    /**
     * 开启状态
     */
    @ExcelProperty(value = "开启状态")
    private String status;
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
