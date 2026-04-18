package com.haitang.erp.controller;

import java.util.List;
import java.util.concurrent.TimeUnit;

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
import com.haitang.erp.domain.vo.ErpCustomerVo;
import com.haitang.erp.domain.bo.ErpCustomerBo;
import com.haitang.erp.service.IErpCustomerService;
import com.haitang.common.mybatis.core.page.TableDataInfo;

/**
 * 客户信息
 *
 * @author hou
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/customer")
public class ErpCustomerController extends BaseController {

    private final IErpCustomerService erpCustomerService;

    /**
     * 查询客户信息列表
     */
    @SaCheckPermission("erp:customer:list")
    @GetMapping("/list")
    public TableDataInfo<ErpCustomerVo> list(ErpCustomerBo bo, PageQuery pageQuery) {
        return erpCustomerService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出客户信息列表
     */
    @SaCheckPermission("erp:customer:export")
    @Log(title = "客户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpCustomerBo bo, HttpServletResponse response) {
        List<ErpCustomerVo> list = erpCustomerService.queryList(bo);
        ExcelUtil.exportExcel(list, "客户信息", ErpCustomerVo.class, response);
    }

    /**
     * 获取客户信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:customer:query")
    @GetMapping("/{id}")
    public R<ErpCustomerVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpCustomerService.queryById(id));
    }

    /**
     * 新增客户信息
     */
    @SaCheckPermission("erp:customer:add")
    @Log(title = "客户信息", businessType = BusinessType.INSERT)
    @RepeatSubmit(interval = 2, timeUnit = TimeUnit.SECONDS, message = "{repeat.submit.message}")
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpCustomerBo bo) {
        return toAjax(erpCustomerService.insertByBo(bo));
    }

    /**
     * 修改客户信息
     */
    @SaCheckPermission("erp:customer:edit")
    @Log(title = "客户信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit(interval = 2, timeUnit = TimeUnit.SECONDS, message = "{repeat.submit.message}")
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpCustomerBo bo) {
        return toAjax(erpCustomerService.updateByBo(bo));
    }

    /**
     * 删除客户信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:customer:remove")
    @Log(title = "客户信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpCustomerService.deleteWithValidByIds(List.of(ids), true));
    }

    /**
     * 客户状态修改
     */
    @SaCheckPermission("erp:customer:edit")
    @Log(title = "客户状态修改", businessType = BusinessType.UPDATE)
    @PutMapping("/changeCustomerStatus")
    public R<Void> changeCustomerStatus(@RequestBody ErpCustomerBo bo) {
        return toAjax(erpCustomerService.updateCustomerStatus(bo.getId(), bo.getStatus()));
    }

}
