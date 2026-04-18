package com.haitang.erp.controller;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.vo.ErpProductVo;
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
import com.haitang.erp.domain.vo.ErpSupplierVo;
import com.haitang.erp.domain.bo.ErpSupplierBo;
import com.haitang.erp.service.IErpSupplierService;
import com.haitang.common.mybatis.core.page.TableDataInfo;

/**
 * 供应商信息
 *
 * @author hhh
 * @date 2024-04-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/supplier")
public class ErpSupplierController extends BaseController {

    private final IErpSupplierService erpSupplierService;

    /**
     * 查询供应商信息列表
     */
    @SaCheckPermission("erp:supplier:list")
    @GetMapping("/list")
    public TableDataInfo<ErpSupplierVo> list(ErpSupplierBo bo, PageQuery pageQuery) {
        return erpSupplierService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出供应商信息列表
     */
    @SaCheckPermission("erp:supplier:export")
    @Log(title = "供应商信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpSupplierBo bo, HttpServletResponse response) {
        List<ErpSupplierVo> list = erpSupplierService.queryList(bo);
        ExcelUtil.exportExcel(list, "供应商信息", ErpSupplierVo.class, response);
    }

    /**
     * 获取供应商信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:supplier:query")
    @GetMapping("/{id}")
    public R<ErpSupplierVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpSupplierService.queryById(id));
    }

    /**
     * 新增供应商信息
     */
    @SaCheckPermission("erp:supplier:add")
    @Log(title = "供应商信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpSupplierBo bo) {
        return toAjax(erpSupplierService.insertByBo(bo));
    }

    /**
     * 修改供应商信息
     */
    @SaCheckPermission("erp:supplier:edit")
    @Log(title = "供应商信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpSupplierBo bo) {
        return toAjax(erpSupplierService.updateByBo(bo));
    }

    /**
     * 删除供应商信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:supplier:remove")
    @Log(title = "供应商信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpSupplierService.deleteWithValidByIds(List.of(ids), true));
    }

    /**
     * 查询供应商精简列表
     */
    @GetMapping("/simple-list")
    public R<List<ErpSupplierVo>> getSupplierSimpleList() {
        List<ErpSupplierVo> list  = erpSupplierService.getSupplierListByStatus();
        return R.ok(list);
    }
}
