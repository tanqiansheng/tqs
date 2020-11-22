package com.ruoyi.angeltqs.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单对象 shop_order
 * 
 * @author tqs
 * @date 2020-09-17
 */
public class Order extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 订单的编号 */
    private String orderCode;

    /** 订单数量 */
    @Excel(name = "订单数量")
    private String orderCount;

    /** 订单的总价钱 */
    @Excel(name = "订单的总价钱")
    private BigDecimal orderTotalMoney;

    /** 下单人 */
    @Excel(name = "下单人")
    private String vipName;

    /** 地址 */
    @Excel(name = "地址")
    private String addess;

    /** 税费 */
    @Excel(name = "税费")
    private BigDecimal orderTax;

    public void setOrderCode(String orderCode) 
    {
        this.orderCode = orderCode;
    }

    public String getOrderCode() 
    {
        return orderCode;
    }
    public void setOrderCount(String orderCount) 
    {
        this.orderCount = orderCount;
    }

    public String getOrderCount() 
    {
        return orderCount;
    }
    public void setOrderTotalMoney(BigDecimal orderTotalMoney) 
    {
        this.orderTotalMoney = orderTotalMoney;
    }

    public BigDecimal getOrderTotalMoney() 
    {
        return orderTotalMoney;
    }
    public void setVipName(String vipName) 
    {
        this.vipName = vipName;
    }

    public String getVipName() 
    {
        return vipName;
    }
    public void setAddess(String addess) 
    {
        this.addess = addess;
    }

    public String getAddess() 
    {
        return addess;
    }
    public void setOrderTax(BigDecimal orderTax) 
    {
        this.orderTax = orderTax;
    }

    public BigDecimal getOrderTax() 
    {
        return orderTax;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("orderCode", getOrderCode())
            .append("orderCount", getOrderCount())
            .append("orderTotalMoney", getOrderTotalMoney())
            .append("vipName", getVipName())
            .append("addess", getAddess())
            .append("orderTax", getOrderTax())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
