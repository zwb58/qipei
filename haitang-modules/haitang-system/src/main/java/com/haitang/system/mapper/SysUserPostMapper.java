package com.haitang.system.mapper;

import com.haitang.system.domain.SysUserPost;
import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import org.apache.ibatis.annotations.Mapper;

/**
 * 用户与岗位关联表 数据层
 *
 * @author Lion Li
 */
@Mapper
public interface SysUserPostMapper extends BaseMapperPlus<SysUserPost, SysUserPost> {

}
