package com.haitang.erp.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.haitang.common.mybatis.annotation.DataColumn;
import com.haitang.common.mybatis.annotation.DataPermission;
import com.haitang.erp.domain.ErpProductCategory;
import com.haitang.erp.domain.vo.ErpProductCategoryVo;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 产品分类Mapper接口
 *
 * @author hhh
 * @date 2024-05-01
 */
public interface ErpProductCategoryMapper extends BaseMapperPlus<ErpProductCategory, ErpProductCategoryVo> {

    /**
     * 查询部门管理数据
     *
     * @param queryWrapper 查询条件
     * @return 部门信息集合
     */
    @DataPermission({
        @DataColumn(key = "name", value = "id")
    })
    List<ErpProductCategoryVo> selectCategoryList(@Param(Constants.WRAPPER) Wrapper<ErpProductCategory> queryWrapper);
}
