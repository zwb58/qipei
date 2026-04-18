package com.haitang.erp.controller;

import java.util.List;

import com.haitang.common.core.enums.CommonStatusEnum;
import com.haitang.common.excel.utils.ExcelUtil;
import com.haitang.common.idempotent.annotation.RepeatSubmit;
import io.swagger.v3.oas.annotations.Operation;
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
import com.haitang.erp.domain.vo.ErpProductUnitVo;
import com.haitang.erp.domain.bo.ErpProductUnitBo;
import com.haitang.erp.service.IErpProductUnitService;
import com.haitang.common.mybatis.core.page.TableDataInfo;

/**
 * 产品单位
 *
 * @author hhh
 * @date 2024-04-30
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/productUnit")
public class ErpProductUnitController extends BaseController {

    private final IErpProductUnitService erpProductUnitService;

    /**
     * 查询产品单位列表
     */
    @SaCheckPermission("erp:unit:list")
    @GetMapping("/list")
    public TableDataInfo<ErpProductUnitVo> list(ErpProductUnitBo bo, PageQuery pageQuery) {
        return erpProductUnitService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出产品单位列表
     */
    @SaCheckPermission("erp:unit:export")
    @Log(title = "产品单位", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpProductUnitBo bo, HttpServletResponse response) {
        List<ErpProductUnitVo> list = erpProductUnitService.queryList(bo);
        ExcelUtil.exportExcel(list, "产品单位", ErpProductUnitVo.class, response);
    }

    /**
     * 获取产品单位详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:unit:query")
    @GetMapping("/{id}")
    public R<ErpProductUnitVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpProductUnitService.queryById(id));
    }

    /**
     * 查询产品单位精简列表
     */
    @GetMapping("/simple-list")
    public R<List<ErpProductUnitVo>> getProductUnitSimpleList() {
        return R.ok(erpProductUnitService.getProductUnitListByStatus());
    }

    /**
     * 新增产品单位
     */
    @SaCheckPermission("erp:unit:add")
    @Log(title = "产品单位", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpProductUnitBo bo) {
        return toAjax(erpProductUnitService.insertByBo(bo));
    }

    /**
     * 修改产品单位
     */
    @SaCheckPermission("erp:unit:edit")
    @Log(title = "产品单位", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpProductUnitBo bo) {
        return toAjax(erpProductUnitService.updateByBo(bo));
    }

    /**
     * 删除产品单位
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:unit:remove")
    @Log(title = "产品单位", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(erpProductUnitService.deleteWithValidByIds(List.of(ids), true));
    }


}
