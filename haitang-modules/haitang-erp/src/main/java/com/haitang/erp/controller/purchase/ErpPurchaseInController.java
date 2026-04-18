package com.haitang.erp.controller.purchase;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseInBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseInVo;
import com.haitang.erp.service.purchase.IErpPurchaseInService;
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
 * ERP 采购入库
 *
 * @author Lion Li
 * @date 2024-12-21
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/purchaseIn")
public class ErpPurchaseInController extends BaseController {

    private final IErpPurchaseInService erpPurchaseInService;

    /**
     * 查询ERP 采购入库列表
     */
    @SaCheckPermission("erp:purchaseIn:list")
    @GetMapping("/list")
    public TableDataInfo<ErpPurchaseInVo> list(ErpPurchaseInBo bo, PageQuery pageQuery) {
        return erpPurchaseInService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出ERP 采购入库列表
     */
    @SaCheckPermission("erp:purchaseIn:export")
    @Log(title = "ERP 采购入库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpPurchaseInBo bo, HttpServletResponse response) {
        List<ErpPurchaseInVo> list = erpPurchaseInService.queryList(bo);
        ExcelUtil.exportExcel(list, "ERP 采购入库", ErpPurchaseInVo.class, response);
    }

    /**
     * 获取ERP 采购入库详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:purchaseIn:query")
    @GetMapping("/{id}")
    public R<ErpPurchaseInVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpPurchaseInService.queryById(id));
    }

    /**
     * 新增ERP 采购入库
     */
    @SaCheckPermission("erp:purchaseIn:add")
    @Log(title = "ERP 采购入库", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpPurchaseInBo bo) {
        return toAjax(erpPurchaseInService.insertByBo(bo));
    }

    /**
     * 修改ERP 采购入库
     */
    @SaCheckPermission("erp:purchaseIn:edit")
    @Log(title = "ERP 采购入库", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpPurchaseInBo bo) {
        return toAjax(erpPurchaseInService.updateByBo(bo));
    }

    /**
     * 删除ERP 采购入库
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:purchaseIn:remove")
    @Log(title = "ERP 采购入库", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpPurchaseInService.deleteWithValidByIds(List.of(ids), true));
    }
}
