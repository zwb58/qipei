package com.haitang.erp.controller;

import java.util.List;

import cn.hutool.core.lang.tree.Tree;
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
import com.haitang.common.core.domain.R;
import com.haitang.common.core.validate.AddGroup;
import com.haitang.common.core.validate.EditGroup;
import com.haitang.common.log.enums.BusinessType;
import com.haitang.erp.domain.vo.ErpProductCategoryVo;
import com.haitang.erp.domain.bo.ErpProductCategoryBo;
import com.haitang.erp.service.IErpProductCategoryService;

/**
 * 产品分类
 *
 * @author hhh
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/erp/productCategory")
public class ErpProductCategoryController extends BaseController {

    private final IErpProductCategoryService erpProductCategoryService;

    /**
     * 查询产品分类列表
     */
    @SaCheckPermission("erp:category:list")
    @GetMapping("/list")
    public R<List<ErpProductCategoryVo>> list(ErpProductCategoryBo bo) {
        List<ErpProductCategoryVo> list = erpProductCategoryService.queryList(bo);
        return R.ok(list);
    }

    /**
     * 导出产品分类列表
     */
    @SaCheckPermission("erp:category:export")
    @Log(title = "产品分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErpProductCategoryBo bo, HttpServletResponse response) {
        List<ErpProductCategoryVo> list = erpProductCategoryService.queryList(bo);
        ExcelUtil.exportExcel(list, "产品分类", ErpProductCategoryVo.class, response);
    }

    /**
     * 获取产品分类详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("erp:category:query")
    @GetMapping("/{id}")
    public R<ErpProductCategoryVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(erpProductCategoryService.queryById(id));
    }

    /**
     * 获得产品分类精简列表
     */
    @SaCheckPermission("erp:category:query")
    @GetMapping("/categoryTree")
    public R<List<Tree<Long>>> categoryTree(ErpProductCategoryBo category) {
        return R.ok(erpProductCategoryService.selectCategoryTreeList(category));

    }
    /**
     * 新增产品分类
     */
    @SaCheckPermission("erp:category:add")
    @Log(title = "产品分类", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErpProductCategoryBo bo) {
        //新增产品分类名称和编码不能重复
        if (!erpProductCategoryService.isUniqueNameAndCode(bo)) {
            return R.fail("新增产品分类'" + bo.getName() + "'失败，产品分类编码已存在");
        }
        return toAjax(erpProductCategoryService.insertByBo(bo));
    }

    /**
     * 修改产品分类
     */
    @SaCheckPermission("erp:category:edit")
    @Log(title = "产品分类", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErpProductCategoryBo bo) {

        //修改产品分类时进行校验 1.产品分类名称不能重复 2.产品分类编码不能重复 3.产品分类不能修改为自己的子分类 4.产品分类不能修改为自己

        return toAjax(erpProductCategoryService.updateByBo(bo));
    }

    /**
     * 删除产品分类
     *
     * @param ids 主键串
     */
    @SaCheckPermission("erp:category:remove")
    @Log(title = "产品分类", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        // 校验是否存在子分类
        for (Long id : ids) {
            if (erpProductCategoryService.hasChildById(id)) {
                return R.warn("存在子分类，不允许删除");
            }
        }
        return toAjax(erpProductCategoryService.deleteWithValidByIds(List.of(ids), true));
    }
}
