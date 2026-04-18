package com.haitang.erp.domain.vo;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.ErpProductUnit;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 产品单位视图对象 erp_product_unit
 *
 * @author hhh
 * @date 2024-04-30
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpProductUnit.class)
public class ErpProductUnitVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 单位编号
     */
    @ExcelProperty(value = "单位编号")
    private Long id;

    /**
     * 单位名字
     */
    @ExcelProperty(value = "单位名字")
    private String name;

    /**
     * 开启状态
     */
    @ExcelProperty(value = "开启状态")
    private Integer status;
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
