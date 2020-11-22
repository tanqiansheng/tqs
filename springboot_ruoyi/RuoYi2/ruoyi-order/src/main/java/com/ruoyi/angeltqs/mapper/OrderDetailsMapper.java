package com.ruoyi.angeltqs.mapper;

import java.util.List;
import com.ruoyi.angeltqs.domain.OrderDetails;

/**
 * 订单明细Mapper接口
 * 
 * @author tqs
 * @date 2020-09-17
 */
public interface OrderDetailsMapper 
{
    /**
     * 查询订单明细
     * 
     * @param goodsId 订单明细ID
     * @return 订单明细
     */
    public OrderDetails selectOrderDetailsById(Long goodsId);

    /**
     * 查询订单明细列表
     * 
     * @param orderDetails 订单明细
     * @return 订单明细集合
     */
    public List<OrderDetails> selectOrderDetailsList(OrderDetails orderDetails);

    /**
     * 新增订单明细
     * 
     * @param orderDetails 订单明细
     * @return 结果
     */
    public int insertOrderDetails(OrderDetails orderDetails);

    /**
     * 修改订单明细
     * 
     * @param orderDetails 订单明细
     * @return 结果
     */
    public int updateOrderDetails(OrderDetails orderDetails);

    /**
     * 删除订单明细
     * 
     * @param goodsId 订单明细ID
     * @return 结果
     */
    public int deleteOrderDetailsById(Long goodsId);

    /**
     * 批量删除订单明细
     * 
     * @param goodsIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteOrderDetailsByIds(String[] goodsIds);
}
