package com.haitang.erp.mapper.purchase;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import com.haitang.erp.domain.purchase.ErpPurchaseIn;
import com.haitang.erp.domain.purchase.ErpPurchaseOrder;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ERP 采购入库Mapper接口
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@Mapper
public interface ErpPurchaseInMapper extends BaseMapperPlus<ErpPurchaseIn, ErpPurchaseInVo> {
    default ErpPurchaseIn selectByNo(String no) {
        return selectOne(new LambdaUpdateWrapper<ErpPurchaseIn>()
            .eq(ErpPurchaseIn::getNo, no));
    }

    default List<ErpPurchaseIn> selectListByOrderId(Long orderId) {
        return selectList(new LambdaUpdateWrapper<ErpPurchaseIn>()
            .eq(ErpPurchaseIn::getOrderId, orderId));
    }


}
