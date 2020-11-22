package com.ruoyi.angeltqs.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.angeltqs.domain.OrderDetails;
import com.ruoyi.angeltqs.service.IOrderDetailsService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 订单明细Controller
 * 
 * @author tqs
 * @date 2020-09-17
 */
@Controller
@RequestMapping("/angeltqs/details")
public class OrderDetailsController extends BaseController
{
    private String prefix = "angeltqs/details";

    @Autowired
    private IOrderDetailsService orderDetailsService;

    @RequiresPermissions("angeltqs:details:view")
    @GetMapping()
    public String details()
    {
        return prefix + "/details";
    }

    /**
     * 查询订单明细列表
     */
    @RequiresPermissions("angeltqs:details:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(OrderDetails orderDetails)
    {
        startPage();
        List<OrderDetails> list = orderDetailsService.selectOrderDetailsList(orderDetails);
        return getDataTable(list);
    }

    /**
     * 导出订单明细列表
     */
    @RequiresPermissions("angeltqs:details:export")
    @Log(title = "订单明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(OrderDetails orderDetails)
    {
        List<OrderDetails> list = orderDetailsService.selectOrderDetailsList(orderDetails);
        ExcelUtil<OrderDetails> util = new ExcelUtil<OrderDetails>(OrderDetails.class);
        return util.exportExcel(list, "details");
    }

    /**
     * 新增订单明细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单明细
     */
    @RequiresPermissions("angeltqs:details:add")
    @Log(title = "订单明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(OrderDetails orderDetails)
    {
        return toAjax(orderDetailsService.insertOrderDetails(orderDetails));
    }

    /**
     * 修改订单明细
     */
    @GetMapping("/edit/{goodsId}")
    public String edit(@PathVariable("goodsId") Long goodsId, ModelMap mmap)
    {
        OrderDetails orderDetails = orderDetailsService.selectOrderDetailsById(goodsId);
        mmap.put("orderDetails", orderDetails);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单明细
     */
    @RequiresPermissions("angeltqs:details:edit")
    @Log(title = "订单明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(OrderDetails orderDetails)
    {
        return toAjax(orderDetailsService.updateOrderDetails(orderDetails));
    }

    /**
     * 删除订单明细
     */
    @RequiresPermissions("angeltqs:details:remove")
    @Log(title = "订单明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(orderDetailsService.deleteOrderDetailsByIds(ids));
    }
}
