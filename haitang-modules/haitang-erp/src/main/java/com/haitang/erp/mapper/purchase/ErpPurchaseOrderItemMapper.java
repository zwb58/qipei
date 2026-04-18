package com.haitang.erp.mapper.purchase;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import com.haitang.erp.domain.purchase.ErpPurchaseOrderItem;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderItemVo;
import com.baomidou.mybatisplus.core.conditions.Wrapper;

import com.haitang.common.mybatis.annotation.DataColumn;
import com.haitang.common.mybatis.annotation.DataPermission;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Collection;
import java.util.List;

/**
 * 采购订单Mapper接口
 *
 * @author hhhbx
 */
@Mapper
public interface ErpPurchaseOrderItemMapper extends BaseMapperPlus<ErpPurchaseOrderItem, ErpPurchaseOrderItemVo> {
    @DataPermission({
        @DataColumn(key = "deptName", value = "dept_id"),
        @DataColumn(key = "userName", value = "user_id")
    })
    List<ErpPurchaseOrderItemVo> customPurchaseOrderItemPageList(@Param("ew") Wrapper<ErpPurchaseOrderItem> wrapper);


    @DataPermission({
        @DataColumn(key = "deptName", value = "dept_id"),
        @DataColumn(key = "userName", value = "user_id")
    })
    int updateDelFlagByNos(@Param("noList") Collection<String> noList, @Param("delFlag") Integer delFlag);

    default List<ErpPurchaseOrderItem> selectListByOrderId(Long orderId) {
        return selectList(new LambdaUpdateWrapper<ErpPurchaseOrderItem>()
            .eq(ErpPurchaseOrderItem::getId, orderId) );
    }
}
