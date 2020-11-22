package com.ruoyi.angeltqs.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 订单明细对象 shop_order_details
 * 
 * @author tqs
 * @date 2020-09-17
 */
public class OrderDetails extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 商品的ID */
    private Long goodsId;

    /** 商品的名称 */
    @Excel(name = "商品的名称")
    private String goodsName;

    /** 商品的价格 */
    @Excel(name = "商品的价格")
    private BigDecimal goodsPrice;

    /** 商品的数量 */
    @Excel(name = "商品的数量")
    private Long goodsCount;

    /** 商品的总价钱 */
    @Excel(name = "商品的总价钱")
    private BigDecimal goodsTotalMoney;

    /** 商品的税费 */
    @Excel(name = "商品的税费")
    private BigDecimal goodsTax;

    public void setGoodsId(Long goodsId) 
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId() 
    {
        return goodsId;
    }
    public void setGoodsName(String goodsName) 
    {
        this.goodsName = goodsName;
    }

    public String getGoodsName() 
    {
        return goodsName;
    }
    public void setGoodsPrice(BigDecimal goodsPrice) 
    {
        this.goodsPrice = goodsPrice;
    }

    public BigDecimal getGoodsPrice() 
    {
        return goodsPrice;
    }
    public void setGoodsCount(Long goodsCount) 
    {
        this.goodsCount = goodsCount;
    }

    public Long getGoodsCount() 
    {
        return goodsCount;
    }
    public void setGoodsTotalMoney(BigDecimal goodsTotalMoney) 
    {
        this.goodsTotalMoney = goodsTotalMoney;
    }

    public BigDecimal getGoodsTotalMoney() 
    {
        return goodsTotalMoney;
    }
    public void setGoodsTax(BigDecimal goodsTax) 
    {
        this.goodsTax = goodsTax;
    }

    public BigDecimal getGoodsTax() 
    {
        return goodsTax;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("goodsId", getGoodsId())
            .append("goodsName", getGoodsName())
            .append("goodsPrice", getGoodsPrice())
            .append("goodsCount", getGoodsCount())
            .append("goodsTotalMoney", getGoodsTotalMoney())
            .append("goodsTax", getGoodsTax())
            .toString();
    }
}
