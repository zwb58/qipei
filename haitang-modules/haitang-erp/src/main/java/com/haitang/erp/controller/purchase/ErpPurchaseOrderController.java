package com.haitang.erp.controller.purchase;

import java.util.List;

import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import com.haitang.common.mybatis.core.page.TableDataInfo;
import com.haitang.erp.domain.purchase.bo.ErpPurchaseOrderBo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderItemVo;
import com.haitang.erp.domain.purchase.vo.ErpPurchaseOrderVo;
import com.haitang.erp.service.purchase.IErpPurchaseOrderService;
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

/**
 * 采购订单
 *
 * @author hhhbx
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/purchaseOrder")
public class ErpPurchaseOrderController extends BaseController {

    private final IErpPurchaseOrderService erpPurchaseOrderService;

    /**
     * 查询采购订单列表
     */
    @SaCheckPermission("erp:purchaseOrder:list")
    @GetMapping("/list")
    public TableDataInfo<ErpPurchaseOrderVo> list(ErpPurchaseOrderBo bo, PageQuery pageQuery) {
        return erpPurchaseOrderService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出采购订单列表
     */
    @SaCheckPermission("erp:purchaseOrder:export")
    @Log(title = "采购订单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpPurchaseOrderBo bo, HttpServletResponse response) {
        List<ErpPurchaseOrderVo> list = erpPurchaseOrderService.queryList(bo);
        //TODO 导出字段补全，待补充
        ExcelUtil.exportExcel(list, "采购订单", ErpPurchaseOrderVo.class, response);
    }

    /**
     * 导入数据
     * TODO 导入功能未作用，请自行实现
     * @param file 导入文件
     */
//    @Log(title = "测试单表", businessType = BusinessType.IMPORT)
//    @SaCheckPermission("demo:demo:import")
//    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public R<Void> importData(@RequestPart("file") MultipartFile file) throws Exception {
//        ExcelResult<TestDemoImportVo> excelResult = ExcelUtil.importExcel(file.getInputStream(), TestDemoImportVo.class, true);
//        List<TestDemo> list = MapstructUtils.convert(excelResult.getList(), TestDemo.class);
//        testDemoService.saveBatch(list);
//        return R.ok(excelResult.getAnalysis());
//    }
    /**
     * 获取采购订单详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:purchaseOrder:query")
    @GetMapping("/{id}")
    public R<ErpPurchaseOrderVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        ErpPurchaseOrderVo erpPurchaseOrder = erpPurchaseOrderService.queryById(id);

        if (erpPurchaseOrder== null){
            return R.fail();
        }
        List<ErpPurchaseOrderItemVo> erpPurchaseOrderItems = erpPurchaseOrderService.queryItemsByOrderNo(erpPurchaseOrder.getNo());
        erpPurchaseOrder.setItems(erpPurchaseOrderItems);
        //TODO 未加载库存字段
        return R.ok(erpPurchaseOrder);
    }

    /**
     * 新增采购订单
     */
    @SaCheckPermission("erp:purchaseOrder:add")
    @Log(title = "采购订单", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpPurchaseOrderBo bo) {
        return toAjax(erpPurchaseOrderService.insertByBo(bo));
    }

    /**
     * 修改采购订单
     */
    @SaCheckPermission("erp:purchaseOrder:edit")
    @Log(title = "采购订单", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpPurchaseOrderBo bo) {
        return toAjax(erpPurchaseOrderService.updateByBo(bo));
    }

    /**
     * 删除采购订单
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:purchaseOrder:remove")
    @Log(title = "采购订单", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpPurchaseOrderService.deleteWithValidByIds(List.of(ids), true));
    }


    /**
     * 更新采购订单的状态
     *
     * @param id 主键串
     */
    @SaCheckPermission("erp:purchaseOrder:check")
    @Log(title = "采购订单", businessType = BusinessType.OTHER)
    @PutMapping("/update-status")
    public R<Void> updatePurchaseOrderStatus(@RequestParam("id") Long id,
                                             @RequestParam("status") Integer status) {
        return toAjax(erpPurchaseOrderService.updatePurchaseOrderStatus(id, status));
    }
}
