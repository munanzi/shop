package com.mission.shop.order.service.order;

import com.mission.shop.base.common.exception.BusinessException;

public interface OrderStatusService {

	/**
	 * 订单标记为已付款待发货
	 * @param orderId
	 */
	public void changeStatus2Payed(long orderId) throws BusinessException;

	/**
	 * 订单标记为成功
	 * @param orderId
	 */
	public void changeStatus2Success(long orderId)
			throws BusinessException;

	/**
	 * 设置为当面交易
	 * @param orderId
	 * @throws BusinessException
	 */
//	public void changeStatus2Offline(int orderId) throws BusinessException;

	/**
	 * 订单标记为已退款
	 * @param orderId
	 */
	public void changeStatus2Refund(long orderId)
			throws BusinessException;

	/**
	 * 关闭订单
	 * @param userId
	 * @param orderId
	 * @throws BusinessException
	 */
	public void closeOrder(long userId, long orderId) throws BusinessException;

}