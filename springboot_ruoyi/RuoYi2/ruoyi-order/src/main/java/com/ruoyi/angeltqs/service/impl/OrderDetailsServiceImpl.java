package com.ruoyi.angeltqs.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.angeltqs.mapper.OrderDetailsMapper;
import com.ruoyi.angeltqs.domain.OrderDetails;
import com.ruoyi.angeltqs.service.IOrderDetailsService;
import com.ruoyi.common.core.text.Convert;

/**
 * 订单明细Service业务层处理
 * 
 * @author tqs
 * @date 2020-09-17
 */
@Service
public class OrderDetailsServiceImpl implements IOrderDetailsService 
{
    @Autowired
    private OrderDetailsMapper orderDetailsMapper;

    /**
     * 查询订单明细
     * 
     * @param goodsId 订单明细ID
     * @return 订单明细
     */
    @Override
    public OrderDetails selectOrderDetailsById(Long goodsId)
    {
        return orderDetailsMapper.selectOrderDetailsById(goodsId);
    }

    /**
     * 查询订单明细列表
     * 
     * @param orderDetails 订单明细
     * @return 订单明细
     */
    @Override
    public List<OrderDetails> selectOrderDetailsList(OrderDetails orderDetails)
    {
        return orderDetailsMapper.selectOrderDetailsList(orderDetails);
    }

    /**
     * 新增订单明细
     * 
     * @param orderDetails 订单明细
     * @return 结果
     */
    @Override
    public int insertOrderDetails(OrderDetails orderDetails)
    {
        return orderDetailsMapper.insertOrderDetails(orderDetails);
    }

    /**
     * 修改订单明细
     * 
     * @param orderDetails 订单明细
     * @return 结果
     */
    @Override
    public int updateOrderDetails(OrderDetails orderDetails)
    {
        return orderDetailsMapper.updateOrderDetails(orderDetails);
    }

    /**
     * 删除订单明细对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteOrderDetailsByIds(String ids)
    {
        return orderDetailsMapper.deleteOrderDetailsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除订单明细信息
     * 
     * @param goodsId 订单明细ID
     * @return 结果
     */
    @Override
    public int deleteOrderDetailsById(Long goodsId)
    {
        return orderDetailsMapper.deleteOrderDetailsById(goodsId);
    }
}
