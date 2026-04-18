package com.haitang.erp.domain.vo;

import java.math.BigDecimal;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.ErpWarehouse;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 仓库信息视图对象 erp_warehouse
 *
 * @author hou
 * @date 2024-04-20
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpWarehouse.class)
public class ErpWarehouseVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 仓库编号
     */
    @ExcelProperty(value = "仓库编号")
    private Long id;

    /**
     * 仓库名称
     */
    @ExcelProperty(value = "仓库名称")
    private String name;

    /**
     * 仓库地址
     */
    @ExcelProperty(value = "仓库地址")
    private String address;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Integer sort;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 负责人
     */
    @ExcelProperty(value = "负责人")
    private String principal;

    /**
     * 仓储费，单位：元
     */
    @ExcelProperty(value = "仓储费，单位：元")
    private BigDecimal warehousePrice;

    /**
     * 搬运费，单位：元
     */
    @ExcelProperty(value = "搬运费，单位：元")
    private BigDecimal truckagePrice;

    /**
     * 开启状态
     */
    @ExcelProperty(value = "开启状态")
    private String status;

    /**
     * 是否默认
     */
    @ExcelProperty(value = "是否默认")
    private Integer defaultStatus;

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
