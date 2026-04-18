package com.haitang.erp.mapper.purchase;

import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import com.haitang.erp.domain.purchase.ErpPurchaseInItem;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInItemsVo;
import org.apache.ibatis.annotations.Mapper;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static com.haitang.common.core.utils.collection.CollectionUtils.convertMap;

/**
 * ERP 销售入库项Mapper接口
 *
 * @author hhhbx
 * @date 2024-12-21
 */
@Mapper
public interface ErpPurchaseInItemsMapper extends BaseMapperPlus<ErpPurchaseInItem, ErpPurchaseInItemsVo> {


    /**
     * 基于采购订单编号，查询每个采购订单项的入库数量之和
     *
     * @param inIds 入库订单项编号数组
     * @return key：采购订单项编号；value：入库数量之和
     */
    default Map<Long, BigDecimal> selectOrderItemCountSumMapByInIds(Collection<Long> inIds) {
        if (CollUtil.isEmpty(inIds)) {
            return Collections.emptyMap();
        }
        // SQL sum 查询
        List<Map<String, Object>> result = selectMaps(new QueryWrapper<ErpPurchaseInItem>()
            .select("order_item_id, SUM(count) AS sumCount")
            .groupBy("order_item_id")
            .in("in_no", inIds));
        // 获得数量
        return convertMap(result, obj -> (Long) obj.get("order_item_id"), obj -> (BigDecimal) obj.get("sumCount"));
    }
}
