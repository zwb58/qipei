package com.haitang.erp.domain.vo;

import java.math.BigDecimal;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.ErpCustomer;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 客户信息视图对象 erp_customer
 *
 * @author hou
 * @date 2024-04-16
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpCustomer.class)
public class ErpCustomerVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 产品编号
     */
    @ExcelProperty(value = "产品编号")
    private Long id;

    /**
     * 客户名称
     */
    @ExcelProperty(value = "客户名称")
    private String name;

    /**
     * 联系人
     */
    @ExcelProperty(value = "联系人")
    private String contact;

    /**
     * 手机号码
     */
    @ExcelProperty(value = "手机号码")
    private String mobile;

    /**
     * 联系电话
     */
    @ExcelProperty(value = "联系电话")
    private String telephone;

    /**
     * 电子邮箱
     */
    @ExcelProperty(value = "电子邮箱")
    private String email;
    /**
     * 传真
     */
    @ExcelProperty(value = "传真")
    private String fax;
    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;

    /**
     * 开启状态
     */
    @ExcelProperty(value = "开启状态")
    private String status;

    /**
     * 排序
     */
    @ExcelProperty(value = "排序")
    private Integer sort;

    /**
     * 纳税人识别号
     */
    @ExcelProperty(value = "纳税人识别号")
    private String taxNo;

    /**
     * 税率
     */
    @ExcelProperty(value = "税率")
    private BigDecimal taxPercent;

    /**
     * 开户行
     */
    @ExcelProperty(value = "开户行")
    private String bankName;

    /**
     * 开户账号
     */
    @ExcelProperty(value = "开户账号")
    private String bankAccount;

    /**
     * 开户地址
     */
    @ExcelProperty(value = "开户地址")
    private String bankAddress;
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
