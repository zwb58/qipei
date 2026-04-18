package com.haitang.erp.controller;

import java.util.List;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.haitang.common.core.constant.TenantConstants;
import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
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
import com.haitang.erp.domain.vo.ErpWarehouseVo;
import com.haitang.erp.domain.bo.ErpWarehouseBo;
import com.haitang.erp.service.IErpWarehouseService;
import com.haitang.common.mybatis.core.page.TableDataInfo;

/**
 * 仓库信息
 *
 * @author hou
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/warehouse")
public class ErpWarehouseController extends BaseController {

    private final IErpWarehouseService erpWarehouseService;

    /**
     * 查询仓库信息列表
     */
    @SaCheckPermission("erp:warehouse:list")
    @GetMapping("/list")
    public TableDataInfo<ErpWarehouseVo> list(ErpWarehouseBo bo, PageQuery pageQuery) {
        return erpWarehouseService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出仓库信息列表
     */
    @SaCheckPermission("erp:warehouse:export")
    @Log(title = "仓库信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpWarehouseBo bo, HttpServletResponse response) {
        List<ErpWarehouseVo> list = erpWarehouseService.queryList(bo);
        ExcelUtil.exportExcel(list, "仓库信息", ErpWarehouseVo.class, response);
    }

    /**
     * 获取仓库信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:warehouse:query")
    @GetMapping("/{id}")
    public R<ErpWarehouseVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpWarehouseService.queryById(id));
    }

    /**
     * 新增仓库信息
     */
    @SaCheckPermission("erp:warehouse:add")
    @Log(title = "仓库信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpWarehouseBo bo) {
        return toAjax(erpWarehouseService.insertByBo(bo));
    }

    /**
     * 修改仓库信息
     */
    @SaCheckPermission("erp:warehouse:edit")
    @Log(title = "仓库信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpWarehouseBo bo) {
        return toAjax(erpWarehouseService.updateByBo(bo));
    }

    /**
     * 删除仓库信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:warehouse:remove")
    @Log(title = "仓库信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpWarehouseService.deleteWithValidByIds(List.of(ids), true));
    }

    /**
     * 仓库默认状态修改
     */
    @SaCheckRole(TenantConstants.SUPER_ADMIN_ROLE_KEY)
    @SaCheckPermission("erp:warehouse:edit")
    @Log(title = "ERP 修改仓库默认状态", businessType = BusinessType.UPDATE)
    @PutMapping("/changeDefaultStatus")
    public R<Void> changeDefaultStatus(@RequestBody ErpWarehouseBo bo) {
        return toAjax(erpWarehouseService.changeWarehouseDefaultStatus(bo));
    }

    /**
     * 查询产品精简列表
     */
    @SaCheckPermission("erp:warehouse:query")
    @GetMapping("/simple-list")
    public R<List<ErpWarehouseVo>> getWarehouseSimpleList() {
        List<ErpWarehouseVo> list  = erpWarehouseService.getWarehouseListByStatus();
        return R.ok(list);
    }
}
