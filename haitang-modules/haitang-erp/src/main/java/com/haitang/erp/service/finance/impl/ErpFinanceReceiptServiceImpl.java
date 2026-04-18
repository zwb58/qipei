package com.haitang.erp.service.finance.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.haitang.common.core.utils.MapstructUtils;
import com.haitang.common.core.utils.StringUtils;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.finance.ErpFinanceReceipt;
import com.haitang.erp.domain.finance.bo.ErpFinanceReceiptBo;
import com.haitang.erp.domain.finance.vo.ErpFinanceReceiptVo;
import com.haitang.erp.mapper.finance.ErpFinanceReceiptMapper;
import com.haitang.erp.service.finance.IErpFinanceReceiptService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ErpFinanceReceiptServiceImpl implements IErpFinanceReceiptService {

    private final ErpFinanceReceiptMapper baseMapper;

    @Override
    public TableDataInfo<ErpFinanceReceiptVo> queryPageList(ErpFinanceReceiptBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpFinanceReceipt> lqw = buildQueryWrapper(bo);
        Page<ErpFinanceReceiptVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    @Override
    public List<ErpFinanceReceiptVo> queryList(ErpFinanceReceiptBo bo) {
        LambdaQueryWrapper<ErpFinanceReceipt> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<ErpFinanceReceipt> buildQueryWrapper(ErpFinanceReceiptBo bo) {
        LambdaQueryWrapper<ErpFinanceReceipt> lqw = new LambdaQueryWrapper<>();
        lqw.eq(StringUtils.isNotBlank(bo.getNo()), ErpFinanceReceipt::getNo, bo.getNo());
        lqw.eq(ObjectUtil.isNotNull(bo.getCustomerId()), ErpFinanceReceipt::getCustomerId, bo.getCustomerId());
        lqw.eq(ObjectUtil.isNotNull(bo.getStatus()), ErpFinanceReceipt::getStatus, bo.getStatus());
        lqw.orderByDesc(ErpFinanceReceipt::getId);
        return lqw;
    }

    @Override
    public ErpFinanceReceiptVo queryById(Long id) {
        return baseMapper.selectVoById(id);
    }

    @Override
    public Boolean insertByBo(ErpFinanceReceiptBo bo) {
        ErpFinanceReceipt add = MapstructUtils.convert(bo, ErpFinanceReceipt.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        return flag;
    }

    @Override
    public Boolean updateByBo(ErpFinanceReceiptBo bo) {
        ErpFinanceReceipt update = MapstructUtils.convert(bo, ErpFinanceReceipt.class);
        validEntityBeforeSave(update);
        boolean flag = baseMapper.updateById(update) > 0;
        return flag;
    }

    private void validEntityBeforeSave(ErpFinanceReceipt entity) {
    }

    @Override
    public Boolean deleteWithValidByIds(List<Long> ids, Boolean isValid) {
        if (isValid) {
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
