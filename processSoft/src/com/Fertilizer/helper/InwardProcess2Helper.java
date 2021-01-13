package com.Fertilizer.helper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fertilizer.dao.InwardProcess1Dao;
import com.Fertilizer.dao.InwardProcess2Dao;
import com.Fertilizer.dao.InwardProcess3Dao;
import com.Fertilizer.hibernate.InwardProcess1Hibernate;
import com.Fertilizer.hibernate.InwardProcess2Hibernate;
import com.Fertilizer.hibernate.InwardProcessingInformation;

public class InwardProcess2Helper {
	
	public Map getChallanNumberForProcess2(String InwardProcessingInfoPk, String purchaseOrderNo) {
		
	 	System.out.println("into helper class");
	 	InwardProcess2Dao dao1 = new InwardProcess2Dao();
		List catList = dao1.getChallanNumberForProcess2(InwardProcessingInfoPk, purchaseOrderNo);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			InwardProcessingInformation bean = new InwardProcessingInformation();
			
			bean.setInwardProcessingInfoPk(Long.parseLong(o[0].toString()));
			bean.setPurchaseOrderNo(o[1].toString());
			bean.setChallanNo(o[2].toString());
			System.out.println("getChallanNo : "+bean.getChallanNo());
			
			map.put(bean.getChallanNo(),bean);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	}
	
	
	public void saveInwardProcess2Details(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In helper");
				
		String purchaseOrderNo = request.getParameter("purchaseOrderNo");		
		String challanNo = request.getParameter("challanNo");			
		String pkOperationDetailsId = request.getParameter("pkOperationDetailsId");	
		String operationName = request.getParameter("operationName");		
		String sendToOperationDetailsIdFk = request.getParameter("sendToOperationDetailsIdFk");		
		String sendToOperationName = request.getParameter("sendToOperationName");		
		String comment = request.getParameter("comment");		
		
		
		InwardProcess2Hibernate sdb = new InwardProcess2Hibernate();
		
		
		if(!"".equals(purchaseOrderNo)){
			sdb.setPurchaseOrderNo(purchaseOrderNo);
		} else {
			sdb.setPurchaseOrderNo("0");
		}
		if(!"".equals(challanNo)){
			sdb.setChallanNo(challanNo);
		} else {
			sdb.setChallanNo("0");
		}
		if(!"".equals(pkOperationDetailsId)){
			sdb.setFkOperationDetailsId(Long.parseLong(pkOperationDetailsId));
		} else {
			sdb.setSendToOperationDetailsIdFk(0l);
		}
		if(!"".equals(operationName)){
			sdb.setOperationName(operationName);
		} else {
			sdb.setOperationName("N/A");
		}
		if(!"".equals(sendToOperationDetailsIdFk)){
			sdb.setSendToOperationDetailsIdFk(Long.parseLong(sendToOperationDetailsIdFk));
		} else {
			sdb.setSendToOperationDetailsIdFk(0l);
		}
		if(!"".equals(sendToOperationName)){
			sdb.setSendToOperationName(sendToOperationName);
		} else {
			sdb.setSendToOperationName("N/A");
		}
		if(!"".equals(comment)){
			sdb.setComment(comment);
		} else {
			sdb.setComment("N/A");
		}
		
		Date lastUpdateDate = new Date();
//		Date date1=null;
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		date1 = df.parse(Challandate);
		
		sdb.setLastUpdateDate(lastUpdateDate);
		
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("user");
		String userid = (String)session.getAttribute("userid");
		String shopid = (String)session.getAttribute("shopid");
		String shopname=(String)session.getAttribute("shopname");
		
		sdb.setUserId(Long.parseLong(userid));
		sdb.setUserName(username);
		sdb.setShopId(Long.parseLong(shopid));
		sdb.setShopName(shopname);
		
		
		if(Long.parseLong(sendToOperationDetailsIdFk) > 0){
			
			InwardProcessingInformation bean1 = new InwardProcessingInformation();		
			
			if(!"".equals(purchaseOrderNo)){
				bean1.setPurchaseOrderNo(purchaseOrderNo);
			} else {
				bean1.setPurchaseOrderNo("0");
			}
			if(!"".equals(challanNo)){
				bean1.setChallanNo(challanNo);
			} else {
				bean1.setChallanNo("0");
			}
			if(!"".equals(sendToOperationDetailsIdFk)){
				bean1.setFkOperationDetailsId(Long.parseLong(sendToOperationDetailsIdFk));
			} else {
				bean1.setFkOperationDetailsId(0l);
			}
			if(!"".equals(sendToOperationName)){
				bean1.setOperationName(sendToOperationName);
			} else {
				bean1.setOperationName("N/A");
			}
			
			bean1.setUserName(username);
			bean1.setUserId(Long.parseLong(userid));
			bean1.setShopId(Long.parseLong(shopid));
			bean1.setShopName(shopname);
			
			//Date date1=null;
			//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date lastUpdateDate1 = new Date();
			//date1 = df.parse(Challandate);
			
			bean1.setLastUpdateDate(lastUpdateDate1);
			
			InwardProcess2Dao dao = new InwardProcess2Dao();
			dao.addInwardProcessingInfo(bean1);		
		}
		
		InwardProcess2Dao dao = new InwardProcess2Dao();		
		dao.saveInwardProcess2Details(sdb);
				
	}

}
