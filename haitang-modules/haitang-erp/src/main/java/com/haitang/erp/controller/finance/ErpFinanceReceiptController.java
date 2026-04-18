package com.haitang.erp.controller.finance;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.finance.bo.ErpFinanceReceiptBo;
import com.haitang.erp.domain.finance.vo.ErpFinanceReceiptVo;
import com.haitang.erp.service.finance.IErpFinanceReceiptService;
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
@RequestMapping("/erp/financeReceipt")
public class ErpFinanceReceiptController extends BaseController {

    private final IErpFinanceReceiptService erpFinanceReceiptService;

    @SaCheckPermission("erp:financeReceipt:list")
    @GetMapping("/list")
    public TableDataInfo<ErpFinanceReceiptVo> list(ErpFinanceReceiptBo bo, PageQuery pageQuery) {
        return erpFinanceReceiptService.queryPageList(bo, pageQuery);
    }

    @SaCheckPermission("erp:financeReceipt:export")
    @Log(title = "财务收款", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpFinanceReceiptBo bo, HttpServletResponse response) {
        List<ErpFinanceReceiptVo> list = erpFinanceReceiptService.queryList(bo);
        ExcelUtil.exportExcel(list, "财务收款", ErpFinanceReceiptVo.class, response);
    }

    @SaCheckPermission("erp:financeReceipt:query")
    @GetMapping("/{id}")
    public R<ErpFinanceReceiptVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        return R.ok(erpFinanceReceiptService.queryById(id));
    }

    @SaCheckPermission("erp:financeReceipt:add")
    @Log(title = "财务收款", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpFinanceReceiptBo bo) {
        return toAjax(erpFinanceReceiptService.insertByBo(bo));
    }

    @SaCheckPermission("erp:financeReceipt:edit")
    @Log(title = "财务收款", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpFinanceReceiptBo bo) {
        return toAjax(erpFinanceReceiptService.updateByBo(bo));
    }

    @SaCheckPermission("erp:financeReceipt:remove")
    @Log(title = "财务收款", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(erpFinanceReceiptService.deleteWithValidByIds(List.of(ids), true));
    }
}
