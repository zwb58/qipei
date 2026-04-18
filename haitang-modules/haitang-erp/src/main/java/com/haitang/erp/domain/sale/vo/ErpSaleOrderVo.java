package com.haitang.erp.domain.sale.vo;

import com.haitang.common.translation.annotation.Translation;
import com.haitang.common.translation.constant.TransConstant;
import com.haitang.erp.domain.sale.ErpSaleOrder;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = ErpSaleOrder.class)
public class ErpSaleOrderVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private String no;

    private Integer status;

    private Long customerId;

    private String customerName;

    private Long accountId;

    private String accountName;

    private Long saleUserId;

    private String saleUserName;

    private Date orderTime;

    private BigDecimal totalCount;

    private BigDecimal totalPrice;

    private BigDecimal totalProductPrice;

    private BigDecimal totalTaxPrice;

    private BigDecimal discountPercent;

    private BigDecimal discountPrice;

    private BigDecimal depositPrice;

    private String fileUrl;

    private String remark;

    private BigDecimal returnCount;

    private Date createTime;

    private Long createBy;

    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "createBy")
    private String createByName;

    private Date updateTime;

    private Long updateBy;

    @Translation(type = TransConstant.USER_ID_TO_NAME, mapper = "updateBy")
    private String updateByName;

    private List<ErpSaleOrderItemVo> items;
}
