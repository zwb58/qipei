package com.haitang.erp.controller.stock;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.stock.bo.ErpStockBo;
import com.haitang.erp.domain.stock.vo.ErpStockVo;
import com.haitang.erp.service.stock.IErpStockService;
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
@RequestMapping("/erp/stock")
public class ErpStockController extends BaseController {

    private final IErpStockService erpStockService;

    @SaCheckPermission("erp:stock:list")
    @GetMapping("/list")
    public TableDataInfo<ErpStockVo> list(ErpStockBo bo, PageQuery pageQuery) {
        return erpStockService.queryPageList(bo, pageQuery);
    }

    @SaCheckPermission("erp:stock:export")
    @Log(title = "库存管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpStockBo bo, HttpServletResponse response) {
        List<ErpStockVo> list = erpStockService.queryList(bo);
        ExcelUtil.exportExcel(list, "库存管理", ErpStockVo.class, response);
    }

    @SaCheckPermission("erp:stock:query")
    @GetMapping("/{id}")
    public R<ErpStockVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        return R.ok(erpStockService.queryById(id));
    }

    @SaCheckPermission("erp:stock:add")
    @Log(title = "库存管理", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpStockBo bo) {
        return toAjax(erpStockService.insertByBo(bo));
    }

    @SaCheckPermission("erp:stock:edit")
    @Log(title = "库存管理", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpStockBo bo) {
        return toAjax(erpStockService.updateByBo(bo));
    }

    @SaCheckPermission("erp:stock:remove")
    @Log(title = "库存管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(erpStockService.deleteWithValidByIds(List.of(ids), true));
    }
}
