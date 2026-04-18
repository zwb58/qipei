package com.haitang.erp.service;

import com.haitang.erp.domain.ErpWarehouse;
import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.domain.vo.ErpWarehouseVo;
import com.haitang.erp.domain.bo.ErpWarehouseBo;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 仓库信息Service接口
 *
 * @author hou
 * @date 2024-04-20
 */
public interface IErpWarehouseService {

    /**
     * 查询仓库信息
     */
    ErpWarehouseVo queryById(Long id);

    /**
     * 查询仓库信息列表
     */
    TableDataInfo<ErpWarehouseVo> queryPageList(ErpWarehouseBo bo, PageQuery pageQuery);

    /**
     * 查询仓库信息列表
     */
    List<ErpWarehouseVo> queryList(ErpWarehouseBo bo);

    /**
     * 新增仓库信息
     */
    Boolean insertByBo(ErpWarehouseBo bo);

    /**
     * 修改仓库信息
     */
    Boolean updateByBo(ErpWarehouseBo bo);

    /**
     * 校验并批量删除仓库信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 修改仓库默认状态
     *
     */
    int changeWarehouseDefaultStatus(ErpWarehouseBo bo);

    /**
     * 查询产品精简列表
     */
    List<ErpWarehouseVo> getWarehouseListByStatus();
}
