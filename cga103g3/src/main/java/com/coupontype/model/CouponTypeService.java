package com.coupontype.model;

import java.sql.Date;
import java.util.List;

public class CouponTypeService {
	private CouponTypeDAO2 dao;
	
	public CouponTypeService() {
		dao = new CouponTypeDAO2();
	}
	
//	-- 新增資料
	public CouponTypeVO addCouponType(String coupName, Integer coupDiscount, Integer coupQuantity,
			String coupDesc, Date coupStart, Date coupEnd) {
		CouponTypeVO couponTypeVO = new CouponTypeVO();
		
		couponTypeVO.setCoupName(coupName);
		couponTypeVO.setCoupDiscount(coupDiscount);
		couponTypeVO.setCoupQuantity(coupQuantity);
		couponTypeVO.setCoupDesc(coupDesc);
		couponTypeVO.setCoupStart(coupStart);
		couponTypeVO.setCoupEnd(coupEnd);
		dao.insert(couponTypeVO);
		return couponTypeVO;
		
		
	}
	
//	-- 更改優惠券內容
	public CouponTypeVO updateCouponType(Integer coupTypeNo, String coupName, Integer coupDiscount, Integer coupQuantity,
			String coupDesc, Integer coupUpd) {
		CouponTypeVO couponTypeVO = new CouponTypeVO();
		
		couponTypeVO.setCoupTypeNo(coupTypeNo);
		couponTypeVO.setCoupName(coupName);
		couponTypeVO.setCoupDiscount(coupDiscount);
		couponTypeVO.setCoupQuantity(coupQuantity);
		couponTypeVO.setCoupDesc(coupDesc);
		couponTypeVO.setCoupUpd(coupUpd);
		dao.update(couponTypeVO);
		return couponTypeVO;
		
		
	}
//	-- 更改優惠券庫存
	public void updateQuantity(Integer coupTypeNo) {
		CouponTypeVO couponTypeVO = dao.findCouponTypeByType(coupTypeNo);
		Integer CoupQuantity = couponTypeVO.getCoupQuantity() - 1;//一次發一張
		
		dao.updateQuantity(coupTypeNo, CoupQuantity);
		
	}
//	-- 更改優惠券為下架
	public void updateDown(Integer coupTypeNo) {
		CouponTypeVO couponTypeVO = dao.findCouponTypeByType(coupTypeNo);
		Integer coupUpd = couponTypeVO.getCoupUpd();
		//如果商品仍上架中，才去改為已下架
		if(coupUpd == 0) {
			dao.updateDown(coupTypeNo);
		}
	}
	
//	-- 秀出某種類型的優惠券
	public CouponTypeVO showCouponTypeByType(Integer coupTypeNo) {
		return dao.findCouponTypeByType(coupTypeNo);
	}
	
//	-- 秀出所有優惠券
	public  List<CouponTypeVO> getAll(){
		return dao.getAll();
	}
	
//	-- 刪除某張優惠券
	public void delete(Integer coupTypeNo) {
		dao.delete(coupTypeNo);
	}
	
	
}
