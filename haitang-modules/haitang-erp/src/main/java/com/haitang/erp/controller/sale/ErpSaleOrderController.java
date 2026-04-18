package com.haitang.erp.controller.sale;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.sale.bo.ErpSaleOrderBo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderItemVo;
import com.haitang.erp.domain.sale.vo.ErpSaleOrderVo;
import com.haitang.erp.service.sale.IErpSaleOrderService;
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

@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/saleOrder")
public class ErpSaleOrderController extends BaseController {

    private final IErpSaleOrderService erpSaleOrderService;

    @SaCheckPermission("erp:saleOrder:list")
    @GetMapping("/list")
    public TableDataInfo<ErpSaleOrderVo> list(ErpSaleOrderBo bo, PageQuery pageQuery) {
        return erpSaleOrderService.queryPageList(bo, pageQuery);
    }

    @SaCheckPermission("erp:saleOrder:export")
    @Log(title = "销售订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpSaleOrderBo bo, HttpServletResponse response) {
        List<ErpSaleOrderVo> list = erpSaleOrderService.queryList(bo);
        ExcelUtil.exportExcel(list, "销售订单", ErpSaleOrderVo.class, response);
    }

    @SaCheckPermission("erp:saleOrder:query")
    @GetMapping("/{id}")
    public R<ErpSaleOrderVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Long id) {
        ErpSaleOrderVo erpSaleOrder = erpSaleOrderService.queryById(id);
        if (erpSaleOrder == null) {
            return R.fail();
        }
        List<ErpSaleOrderItemVo> erpSaleOrderItems = erpSaleOrderService.queryItemsByOrderNo(erpSaleOrder.getNo());
        erpSaleOrder.setItems(erpSaleOrderItems);
        return R.ok(erpSaleOrder);
    }

    @SaCheckPermission("erp:saleOrder:add")
    @Log(title = "销售订单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpSaleOrderBo bo) {
        return toAjax(erpSaleOrderService.insertByBo(bo));
    }

    @SaCheckPermission("erp:saleOrder:edit")
    @Log(title = "销售订单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpSaleOrderBo bo) {
        return toAjax(erpSaleOrderService.updateByBo(bo));
    }

    @SaCheckPermission("erp:saleOrder:remove")
    @Log(title = "销售订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(erpSaleOrderService.deleteWithValidByIds(List.of(ids), true));
    }

    @SaCheckPermission("erp:saleOrder:check")
    @Log(title = "销售订单", businessType = BusinessType.OTHER)
    @PutMapping("/update-status")
    public R<Void> updateSaleOrderStatus(@RequestParam("id") Long id, @RequestParam("status") Integer status) {
        return toAjax(erpSaleOrderService.updateSaleOrderStatus(id, status));
    }
}
