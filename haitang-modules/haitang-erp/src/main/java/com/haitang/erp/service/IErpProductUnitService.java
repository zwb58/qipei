package com.haitang.erp.service;

import com.haitang.erp.domain.vo.ErpProductUnitVo;
import com.haitang.erp.domain.bo.ErpProductUnitBo;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import static com.haitang.common.core.utils.collection.CollectionUtils.convertMap;

/**
 * 产品单位Service接口
 *
 * @author hhh
 * @date 2024-04-30
 */
public interface IErpProductUnitService {

    /**
     * 查询产品单位
     */
    ErpProductUnitVo queryById(Long id);

    /**
     * 查询产品单位列表
     */
    TableDataInfo<ErpProductUnitVo> queryPageList(ErpProductUnitBo bo, PageQuery pageQuery);

    /**
     * 查询产品单位列表
     */
    List<ErpProductUnitVo> queryList(ErpProductUnitBo bo);

    /**
     * 新增产品单位
     */
    Boolean insertByBo(ErpProductUnitBo bo);

    /**
     * 修改产品单位
     */
    Boolean updateByBo(ErpProductUnitBo bo);

    /**
     * 校验并批量删除产品单位信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 获得指定状态的产品单位列表
     */
    List<ErpProductUnitVo> getProductUnitListByStatus();

    /**
     * 获得产品单位列表
     *
     * @param ids 编号数组
     * @return 产品单位列表
     */
    List<ErpProductUnitVo> getProductUnitList(Collection<Long> ids);

    /**
     * 获得产品单位 Map
     *
     * @param ids 编号数组
     * @return 产品单位 Map
     */
    default Map<Long, ErpProductUnitVo> getProductUnitMap(Collection<Long> ids) {
        return convertMap(getProductUnitList(ids), ErpProductUnitVo::getId);
    }
}
