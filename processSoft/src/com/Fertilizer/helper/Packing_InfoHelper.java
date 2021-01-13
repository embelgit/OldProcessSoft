package com.Fertilizer.helper;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Fertilizer.bean.GetProductDetailPO;
import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.bean.GoodsReceiveDetail;
import com.Fertilizer.dao.Packing_InfoDao;
import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.hibernate.Packing_InfoBean;


public class Packing_InfoHelper {
	
	public void PackTypeDetails(HttpServletRequest request,
			HttpServletResponse response) {
			
			
		String packing_Type = request.getParameter("packing_Type");
		String containerName = request.getParameter("containerName");
		String unitId = request.getParameter("unitId");
		String extrapacking = request.getParameter("extrapacking");
		System.out.println("In Helper" + packing_Type);
	
		Packing_InfoBean pib = new Packing_InfoBean();
		
		pib.setPacking_Type(packing_Type);
		pib.setContainerName(containerName);
		pib.setUnit_Id(Long.parseLong(unitId));
		pib.setExtraPacking(extrapacking);
		/*cdb.setSubCategoryName(subCategoryName);*/
		
		Packing_InfoDao pid = new Packing_InfoDao();
		pid.addpacking_Type(pib);
	}
	
	public Map getContainerName() {

		int count = 1;
		Packing_InfoDao dao = new Packing_InfoDao();
		List list= dao.getContainerName();
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			Packing_InfoBean bean = new Packing_InfoBean();
			System.out.println(Arrays.toString(o));
			bean.setPacking_Id(Long.parseLong(o[0].toString()));;
			bean.setPacking_Type(o[1].toString());
			bean.setContainerName((o[2].toString()));
			bean.setExtraPacking((o[3].toString()));
			bean.setUnitName(o[4].toString());
			
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;

	}
	
	
public Map getproductDetailInGridForContainer(String containerName, String capacity) {
		
		Packing_InfoDao dao = new Packing_InfoDao();
		List list = dao.getproductDetailInGridForContainer(containerName,capacity);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			Packing_InfoBean bean = new Packing_InfoBean();
			
			
			bean.setPacking_Id(Long.parseLong(o[0].toString()));
			bean.setContainerName((o[2].toString()));
			bean.setPacking_Type((o[1].toString()));
			bean.setExtraPacking((o[3].toString()));
			bean.setUnitName(o[4].toString());
		
			map1.put(bean.getPacking_Id(),bean);
		}
		return map1;
		
	}

public Map getProductDetailsForGrid(String dieNo, Double quantity) {
	
	Packing_InfoDao dao = new Packing_InfoDao();
	List list = dao.getProductDetailsForGridFromDao(dieNo,quantity);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GoodsReceiveDetail bean=new GoodsReceiveDetail();
		
		bean.setProductName(o[0].toString());
		bean.setTypeoffunction(o[1].toString());
		bean.setColor(o[2].toString());
		bean.setMicron((BigInteger)o[3]);
		bean.setQuantity((Double)o[4]);
		bean.setQuantityinbundle((Double)o[5]);
		bean.setLength((Double)o[6]);
		bean.setBuyPrice((BigDecimal)o[7]);
		bean.setPurchaseDate(o[8].toString());
		bean.setItem_id(Long.parseLong(o[9].toString()));
		
		
		map1.put(bean.getProductName(),bean);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		//map1.put(bean.getProductID(),bean);
		
	}
	return map1;
	

}




}
