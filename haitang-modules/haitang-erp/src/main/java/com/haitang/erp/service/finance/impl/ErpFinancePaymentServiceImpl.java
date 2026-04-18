package com.haitang.erp.service.finance.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.finance.ErpFinancePayment;
import com.haitang.erp.domain.finance.bo.ErpFinancePaymentBo;
import com.haitang.erp.domain.finance.vo.ErpFinancePaymentVo;
import com.haitang.erp.mapper.finance.ErpFinancePaymentMapper;
import com.haitang.erp.service.finance.IErpFinancePaymentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ErpFinancePaymentServiceImpl implements IErpFinancePaymentService {

    private final ErpFinancePaymentMapper baseMapper;

    @Override
    public TableDataInfo<ErpFinancePaymentVo> queryPageList(ErpFinancePaymentBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpFinancePayment> lqw = buildQueryWrapper(bo);
        Page<ErpFinancePaymentVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public List<ErpFinancePaymentVo> queryList(ErpFinancePaymentBo bo) {
        LambdaQueryWrapper<ErpFinancePayment> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpFinancePayment> buildQueryWrapper(ErpFinancePaymentBo bo) {
        LambdaQueryWrapper<ErpFinancePayment> lqw = new LambdaQueryWrapper<>();
        lqw.eq(StringUtils.isNotBlank(bo.getNo()), ErpFinancePayment::getNo, bo.getNo());
        lqw.eq(ObjectUtil.isNotNull(bo.getSupplierId()), ErpFinancePayment::getSupplierId, bo.getSupplierId());
        lqw.eq(ObjectUtil.isNotNull(bo.getStatus()), ErpFinancePayment::getStatus, bo.getStatus());
        lqw.orderByDesc(ErpFinancePayment::getId);
        return lqw;
    }

    @Override
    public ErpFinancePaymentVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    @Override
    public Boolean insertByBo(ErpFinancePaymentBo bo) {
        ErpFinancePayment add = MapstructUtils.convert(bo, ErpFinancePayment.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        return flag;
    }

    @Override
    public Boolean updateByBo(ErpFinancePaymentBo bo) {
        ErpFinancePayment update = MapstructUtils.convert(bo, ErpFinancePayment.class);
        validEntityBeforeSave(update);
        boolean flag = baseMapper.updateById(update) > 0;
        return flag;
    }

    private void validEntityBeforeSave(ErpFinancePayment entity) {
    }

    @Override
    public Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid) {
        if (isValid) {
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
