package com.haitang.erp.service.finance.impl;

import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.core.exception.ServiceException;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.haitang.erp.domain.finance.ErpAccount;
import com.haitang.erp.domain.finance.bo.ErpAccountBo;
import com.haitang.erp.domain.finance.vo.ErpAccountVo;
import com.haitang.erp.mapper.finance.ErpAccountMapper;
import com.haitang.erp.service.finance.IErpAccountService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * ERP 结算账户Service业务层处理
 *
 * @author hou
 */
@RequiredArgsConstructor
@Service
public class ErpAccountServiceImpl implements IErpAccountService {

    private final ErpAccountMapper baseMapper;

    /**
     * 查询ERP 结算账户
     */
    @Override
    public ErpAccountVo queryById(Long id){
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询ERP 结算账户列表
     */
    @Override
    public TableDataInfo<ErpAccountVo> queryPageList(ErpAccountBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpAccount> lqw = buildQueryWrapper(bo);
        Page<ErpAccountVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询ERP 结算账户列表
     */
    @Override
    public List<ErpAccountVo> queryList(ErpAccountBo bo) {
        LambdaQueryWrapper<ErpAccount> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpAccount> buildQueryWrapper(ErpAccountBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<ErpAccount> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getName()), ErpAccount::getName, bo.getName());
        lqw.like(StringUtils.isNotBlank(bo.getNo()), ErpAccount::getNo, bo.getNo());
        lqw.eq(bo.getStatus() != null, ErpAccount::getStatus, bo.getStatus());
        lqw.eq(bo.getSort() != null, ErpAccount::getSort, bo.getSort());
        lqw.eq(bo.getDefaultStatus() != null, ErpAccount::getDefaultStatus, bo.getDefaultStatus());
        return lqw;
    }

    /**
     * 新增ERP 结算账户
     */
    @Override
    public Boolean insertByBo(ErpAccountBo bo) {
        ErpAccount add = MapstructUtils.convert(bo, ErpAccount.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setNo(add.getNo());
        }
        return flag;
    }

    /**
     * 修改ERP 结算账户
     */
    @Override
    public Boolean updateByBo(ErpAccountBo bo) {
        ErpAccount update = MapstructUtils.convert(bo, ErpAccount.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }
    /**
     * 修改结算账户默认状态
     */
    @Override
    public int updateAccountDefaultStatus(ErpAccountBo bo) {
        ErpAccount update = MapstructUtils.convert(bo, ErpAccount.class);
        // 1. 校验存在
        validateAccountExists(update.getId());
        // 2.1 如果开启，则需要关闭所有其它的默认
        if (update.getDefaultStatus() == 0) {
            ErpAccountVo result = baseMapper.selectVoOne(new LambdaQueryWrapper<ErpAccount>()
                .select(ErpAccount::getNo,ErpAccount::getId).eq(ErpAccount::getDefaultStatus, 0));
            if (result != null) {
                ErpAccount erpAccount = new ErpAccount();
                erpAccount.setDefaultStatus(1);
                erpAccount.setNo(result.getNo());
                erpAccount.setId(result.getId());
                baseMapper.updateById(erpAccount);
            }
        }
        // 2.2 更新对应的默认状态
        return baseMapper.update(null,
            new LambdaUpdateWrapper<ErpAccount>()
                .set(ErpAccount::getDefaultStatus, update.getDefaultStatus())
                .eq(ErpAccount::getNo, update.getNo()));
    }
    /**
     * 查询结算账户信息
     */
    @Override
    public List<ErpAccountVo> getAccountListByStatus() {
        return baseMapper.selectVoList(new LambdaQueryWrapper<ErpAccount>()
            .eq(ErpAccount::getStatus, CommonStatusEnum.ENABLE.getStatus()));
    }

    @Override
    public ErpAccountVo validateAccount(Long id) {
        ErpAccountVo account = baseMapper.selectVoById(id);
        if (account == null) {
            //todo 异常信息封装处理
            throw new ServiceException("结算账户不存在");
        }
        if (CommonStatusEnum.isDisable(account.getStatus())) {
            //todo 异常信息封装处理
            throw new ServiceException("结算账户({"+account.getName()+"})未启用");        }
        return account;
    }
    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(ErpAccount entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除ERP 结算账户
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    private void validateAccountExists(Long id) {
        if (baseMapper.selectVoById(id) == null) {
            //todo 异常信息封装处理
            throw new ServiceException("结算账户不存在");
        }
    }
}
