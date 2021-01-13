package com.Fertilizer.helper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.dao.shopDetailsDao;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;
import com.Fertilizer.hibernate.shopDetailsBean;

public class shopDetailHelper{

	public void shopDetails(HttpServletRequest request, HttpServletResponse response) {

		
		System.out.println("In helper");

		Long shopid=0l;
		
		shopDetailsDao dao=new shopDetailsDao();
		List listtxid=dao.getShopId();
		
		if(listtxid.size()<=0)
		{
			shopid=1l;
		}
		else
		{
		for (int i = 0; i < listtxid.size(); i++) {
			
			shopDetailsBean bean=(shopDetailsBean) listtxid.get(i);
			shopid=bean.getShopId();
			shopid++;
		}
	}
		
		
		String shopName = request.getParameter("shopName");
	
		shopDetailsBean sdb = new shopDetailsBean();
		sdb.setShopId(shopid);
		sdb.setShopName(shopName);
		
		
		shopDetailsDao sdd = new shopDetailsDao();
		sdd.addShop(sdb);
	
	}

	public Map getShopDetails() {
	      
		int count=1;
		System.out.println("IN HELPER");
		/*String fk_cat_id = request.getParameter("fk_cat_id");
		
		System.out.println("=== == ==="+fk_cat_id);
		
		
		SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
		
		scdb.setFk_cat_id(Long.parseLong(fk_cat_id));*/
		
		shopDetailsDao sdd = new shopDetailsDao();
		List list=sdd.getShopName();
		
		System.out.println("list ======"+list.size());
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			System.out.println("IN HELPER");
			Object[] o = (Object[])list.get(i);
			shopDetailsBean bean = new shopDetailsBean();
			System.out.println(Arrays.toString(o));
			bean.setShopId(Long.parseLong(o[0].toString()));
			bean.setShopName(o[1].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;
	}
	
}