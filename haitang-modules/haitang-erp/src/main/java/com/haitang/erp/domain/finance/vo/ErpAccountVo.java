package com.haitang.erp.domain.finance.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.haitang.common.excel.annotation.ExcelDictFormat;
import com.haitang.common.excel.convert.ExcelDictConvert;
import com.haitang.erp.domain.finance.ErpAccount;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * ERP 结算账户视图对象 erp_account
 *
 * @author hou
 * @date 2024-12-03
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpAccount.class)
public class ErpAccountVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;
    /**
     * 编号
     */
    @ExcelProperty(value = "编号")
    private Long id;

    /**
     * 账户名称
     */
    @ExcelProperty(value = "账户名称")
    private String name;

    /**
     * 账户编码
     */
    @ExcelProperty(value = "账户编码")
    private String no;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 开启状态
     */
    @ExcelProperty(value = "开启状态", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_common_status")
    private Integer status;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Long sort;

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
     * 更新时间
     */
    @ExcelProperty(value = "更新时间")
    private Date updateTime;

    /**
     * 更新人
     */
    @ExcelProperty(value = "更新人")
    private Long updateBy;


}
