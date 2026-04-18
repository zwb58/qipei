package com.haitang.erp.mapper.finance;

import com.haitang.common.mybatis.core.mapper.BaseMapperPlus;
import com.haitang.erp.domain.finance.ErpAccount;
import com.haitang.erp.domain.finance.vo.ErpAccountVo;
import org.apache.ibatis.annotations.Mapper;

/**
 * ERP 结算账户Mapper接口
 *
 * @author hou
 * @date 2024-12-03
 */
@Mapper
public interface ErpAccountMapper extends BaseMapperPlus<ErpAccount, ErpAccountVo> {

}
