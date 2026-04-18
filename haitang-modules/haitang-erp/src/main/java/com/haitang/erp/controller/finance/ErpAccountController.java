package com.haitang.erp.controller.finance;

import java.util.List;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.haitang.common.core.constant.TenantConstants;
import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.finance.bo.ErpAccountBo;
import com.haitang.erp.domain.finance.vo.ErpAccountVo;
import com.haitang.erp.service.finance.IErpAccountService;
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

/**
 * ERP 结算账户
 *
 * @author hou
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/account")
public class ErpAccountController extends BaseController {

    private final IErpAccountService erpAccountService;

    /**
     * 查询ERP 结算账户列表
     */
    @SaCheckPermission("erp:account:list")
    @GetMapping("/list")
    public TableDataInfo<ErpAccountVo> list(ErpAccountBo bo, PageQuery pageQuery) {
        return erpAccountService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出ERP 结算账户列表
     */
    @SaCheckPermission("erp:account:export")
    @Log(title = "ERP 结算账户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpAccountBo bo, HttpServletResponse response) {
        List<ErpAccountVo> list = erpAccountService.queryList(bo);
        ExcelUtil.exportExcel(list, "ERP 结算账户", ErpAccountVo.class, response);
    }

    /**
     * 获取ERP 结算账户详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:account:query")
    @GetMapping("/{id}")
    public R<ErpAccountVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpAccountService.queryById(id));
    }

    /**
     * 新增ERP 结算账户
     */
    @SaCheckPermission("erp:account:create")
    @Log(title = "ERP 结算账户", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpAccountBo bo) {
        return toAjax(erpAccountService.insertByBo(bo));
    }

    /**
     * 修改ERP 结算账户
     */
    @SaCheckPermission("erp:account:update")
    @Log(title = "ERP 结算账户", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpAccountBo bo) {
        return toAjax(erpAccountService.updateByBo(bo));
    }

    /**
     * 删除ERP 结算账户
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:account:delete")
    @Log(title = "ERP 结算账户", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpAccountService.deleteWithValidByIds(List.of(ids), true));
    }

    /**
     * 修改结算账户默认状态
     */
    @SaCheckRole(TenantConstants.SUPER_ADMIN_ROLE_KEY)
    @SaCheckPermission("erp:account:update")
    @Log(title = "ERP 修改结算账户默认状态", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public R<Void> changeStatus(@RequestBody ErpAccountBo bo) {
        return toAjax(erpAccountService.updateAccountDefaultStatus(bo));
    }

    /**
     * 查询结算账户精简列表
     */
    @GetMapping("/simple-list")
    public R<List<ErpAccountVo>> getSupplierSimpleList() {
        List<ErpAccountVo> list  = erpAccountService.getAccountListByStatus();
        return R.ok(list);
    }
}
