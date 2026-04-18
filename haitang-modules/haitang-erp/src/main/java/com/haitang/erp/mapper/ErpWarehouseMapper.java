package com.haitang.erp.mapper;

import com.haitang.erp.domain.ErpWarehouse;
import com.haitang.erp.domain.vo.ErpWarehouseVo;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Mapper;

/**
 * 仓库信息Mapper接口
 *
 * @author hou
 */
@Mapper
public interface ErpWarehouseMapper extends BaseMapperPlus<ErpWarehouse, ErpWarehouseVo> {

}
