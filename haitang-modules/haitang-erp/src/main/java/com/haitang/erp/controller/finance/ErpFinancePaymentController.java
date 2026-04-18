package com.haitang.erp.controller.finance;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.finance.bo.ErpFinancePaymentBo;
import com.haitang.erp.domain.finance.vo.ErpFinancePaymentVo;
import com.haitang.erp.service.finance.IErpFinancePaymentService;
import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.haitang.common.log.annotation.Log;
import com.haitang.common.web.core.BaseController;
import com.haitang.common.mybatis.core.page.PageQuery;
import com.haitang.common.core.domain.R;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.common.log.enums.BusinessType;
import com.haitang.common.mybatis.core.page.TableDataInfo;

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/financePayment")
public class ErpFinancePaymentController extends BaseController {

    private final IErpFinancePaymentService erpFinancePaymentService;

    @SaCheckPermission("erp:financePayment:list")
    @GetMapping("/list")
    public TableDataInfo<ErpFinancePaymentVo> list(ErpFinancePaymentBo bo, PageQuery pageQuery) {
        return erpFinancePaymentService.queryPageList(bo, pageQuery);
    }

    @SaCheckPermission("erp:financePayment:export")
    @Log(title = "财务付款", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpFinancePaymentBo bo, HttpServletResponse response) {
        List<ErpFinancePaymentVo> list = erpFinancePaymentService.queryList(bo);
        ExcelUtil.exportExcel(list, "财务付款", ErpFinancePaymentVo.class, response);
    }

    @SaCheckPermission("erp:financePayment:query")
    @GetMapping("/{id}")
    public R<ErpFinancePaymentVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        return R.ok(erpFinancePaymentService.queryById(id));
    }

    @SaCheckPermission("erp:financePayment:add")
    @Log(title = "财务付款", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpFinancePaymentBo bo) {
        return toAjax(erpFinancePaymentService.insertByBo(bo));
    }

    @SaCheckPermission("erp:financePayment:edit")
    @Log(title = "财务付款", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpFinancePaymentBo bo) {
        return toAjax(erpFinancePaymentService.updateByBo(bo));
    }

    @SaCheckPermission("erp:financePayment:remove")
    @Log(title = "财务付款", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(erpFinancePaymentService.deleteWithValidByIds(List.of(ids), true));
    }
}
