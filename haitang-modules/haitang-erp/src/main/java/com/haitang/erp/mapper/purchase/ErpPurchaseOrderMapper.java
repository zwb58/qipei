package com.haitang.erp.mapper.purchase;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.mybatis.annotation.DataColumn;
import com.haitang.common.mybatis.annotation.DataPermission;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import com.haitang.erp.domain.purchase.ErpPurchaseOrder;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 采购订单Mapper接口
 *
 * @author hhhbx
 */
@Mapper
public interface ErpPurchaseOrderMapper extends BaseMapperPlus<ErpPurchaseOrder, ErpPurchaseOrderVo> {

    default ErpPurchaseOrder selectByNo(String no) {
        return selectOne(new LambdaUpdateWrapper<ErpPurchaseOrder>()
            .eq(ErpPurchaseOrder::getNo, no));
    }
    /**
     * 根据条件分页查询已配用户角色列表
     *
     * @param queryWrapper 查询条件
     * @return 用户信息集合信息
     */
    @DataPermission({
        @DataColumn(key = "deptName", value = "d.dept_id"),
        @DataColumn(key = "userName", value = "u.user_id")
    })
    Page<ErpPurchaseOrderVo> selectVoPagebyCustom(@Param("page") Page<ErpPurchaseOrder> page, @Param(Constants.WRAPPER) Wrapper<ErpPurchaseOrder> queryWrapper);

    // 更新采购订单状态
    int updateStatusById(@Param("id") Long id, @Param("status") Integer status);
}
