package com.haitang.erp.controller;

import java.util.List;

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
import com.haitang.erp.domain.vo.ErpProductVo;
import com.haitang.erp.domain.bo.ErpProductBo;
import com.haitang.erp.service.IErpProductService;
import com.haitang.common.mybatis.core.page.TableDataInfo;

/**
 * 产品信息
 *
 * @author hhh
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/product")
public class ErpProductController extends BaseController {

    private final IErpProductService erpProductService;

    /**
     * 查询产品信息列表
     */
    @SaCheckPermission("erp:product:list")
    @GetMapping("/list")
    public TableDataInfo<ErpProductVo> list(ErpProductBo bo, PageQuery pageQuery) {
        return erpProductService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出产品信息列表
     */
    @SaCheckPermission("erp:product:export")
    @Log(title = "产品信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpProductBo bo, HttpServletResponse response) {
        List<ErpProductVo> list = erpProductService.queryList(bo);
        ExcelUtil.exportExcel(list, "产品信息", ErpProductVo.class, response);
    }

    /**
     * 获取产品信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:product:query")
    @GetMapping("/{id}")
    public R<ErpProductVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpProductService.queryById(id));
    }
    /**
     * 查询产品精简列表
     */
    @GetMapping("/simple-list")
    public R<List<ErpProductVo>> getProductUnitSimpleList() {
        List<ErpProductVo> list  = erpProductService.getProductListByStatus();
        return R.ok(list);
    }
    /**
     * 新增产品信息
     */
    @SaCheckPermission("erp:product:add")
    @Log(title = "产品信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpProductBo bo) {
        return toAjax(erpProductService.insertByBo(bo));
    }

    /**
     * 修改产品信息
     */
    @SaCheckPermission("erp:product:edit")
    @Log(title = "产品信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpProductBo bo) {
        return toAjax(erpProductService.updateByBo(bo));
    }

    /**
     * 删除产品信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:product:remove")
    @Log(title = "产品信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpProductService.deleteWithValidByIds(List.of(ids), true));
    }
}
