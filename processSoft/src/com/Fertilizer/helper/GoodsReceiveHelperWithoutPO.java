package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.InwardProcessingInformation;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class GoodsReceiveHelperWithoutPO {
	Long BillNo = 1l;
	Long barcodeNo;
	String catName;
	String productName;
	String companyName;
	Long PkStockId;
	//Double quantityFromStockTable;
	//Double quantityFromStockTable;
	Double interGST;
	Double taxPercentage;
	public void goodsReceivedWithoutPoDetails(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		
		
		/*start Session code For Shop Name*/		
		HttpSession sessionv = request.getSession(true);
		 String type1= "";
         String name1 = "";
         String shopName = "";
         if (sessionv != null) {

         if (sessionv.getAttribute("user") != null) {
	     name1 = (String) sessionv.getAttribute("user");
	     System.out.println("session name+++++"+name1);
          HibernateUtility hbu1=HibernateUtility.getInstance();
          Session session2=hbu1.getHibernateSession();
          org.hibernate.Query query1 = session2.createQuery("from UserDetailsBean where userName =:usr");
          query1.setParameter("usr", name1);
          UserDetailsBean userDetail1 = (UserDetailsBean) query1.uniqueResult();
          type1 = userDetail1.getUserName();
          System.out.println("type in session "+type1);
          shopName = userDetail1.getShopName();
          System.out.println("Shop Name In Session by Vikas  "+shopName);
         }
		
         }
		

  		/*end Session code For Shop Name*/	
         
         
         String pono1  = request.getParameter("pono");
         String challanno1  = request.getParameter("challanno1");
		
		
		
		System.out.println("IN HELPER");
		
		System.out.println("IN HELPER 1");
		GoodsReceiveDao dao = new GoodsReceiveDao();
        
 		/*code for InwardProcessingInformation*/
         String pono2  = "0";//request.getParameter("pono");
         String challanno2  = request.getParameter("challanno1");
         String fkOperationDetailsId1  = request.getParameter("fkOperationDetailsId");
         String operationName1  = request.getParameter("operationName");
         
         HttpSession session1 = request.getSession(true);
			String username1 = (String)session1.getAttribute("user");
			String userid1 = (String)session1.getAttribute("userid");
			String shopid1 = (String)session1.getAttribute("shopid");
			String shopname1 =(String)session1.getAttribute("shopname");
			System.out.println("IN HELPER 2");
			InwardProcessingInformation bean1 = new InwardProcessingInformation();
		
			bean1.setPurchaseOrderNo(pono2);
			bean1.setChallanNo(challanno2);
			bean1.setFkOperationDetailsId(Long.parseLong(fkOperationDetailsId1));
			bean1.setOperationName(operationName1);
			bean1.setUserName(username1);
			bean1.setUserId(Long.parseLong(userid1));
			bean1.setShopId(Long.parseLong(shopid1));
			bean1.setShopName(shopname1);
			System.out.println("IN HELPER 3");
			//Date date1=null;
			//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date lastUpdateDate = new Date();
			//date1 = df.parse(Challandate);
			
			bean1.setLastUpdateDate(lastUpdateDate);
			System.out.println("IN HELPER 4");
			dao.addInwardProcessingInfo(bean1);
			System.out.println("IN HELPER 5");
		
		//GoodsReceiveDao dao = new GoodsReceiveDao();
		
		String count1 =request.getParameter("count");
		Long count=Long.parseLong(count1);
		System.out.println(count);
		
		InwardBean bean=new InwardBean();
		//GoodsReceiveBean bean = new GoodsReceiveBean();
		
	for(int i =0 ; i< count;i++)
		{
		
			String supplier  = request.getParameter("supplier1");
			System.out.println("hi this is supplier=="+supplier);
			
			String challanno  = request.getParameter("challanno1");
			System.out.println("hi this is Challan No --===="+challanno);
			
			String pono  = request.getParameter("pono");
			String Challandate  = request.getParameter("Challandate1");
			System.out.println(" hit this is Challan date"+Challandate);
			String fkOperationDetailsId  = request.getParameter("fkOperationDetailsId");
			String operationName  = request.getParameter("operationName");
			
			/*String ShopName  = request.getParameter("ShopName");*/
			//String productName  = request.getParameter("productName");
			
			String total  = request.getParameter("total1");
			System.out.println(" Hi this i TOtal---====="+total);
			
			String grossTotal  = request.getParameter("grossTotal1");
			System.out.println(" hi this is Kishor ===---"+grossTotal);
			
			
			
			String productName = request.getParameter("productname"+i);
			String hsn = request.getParameter("hsn"+i);
			String operation = request.getParameter("operation"+i);
			String PODate = request.getParameter("PODate"+i);
			String quantity = request.getParameter("quantity"+i);
			String rate = request.getParameter("rate"+i);
			String unit = request.getParameter("unit"+i);
			String Total = request.getParameter("Total"+i);
			
			bean.setSuppliername(supplier);
			bean.setChallanno(challanno);
			bean.setPono(pono);
			
			Date date1=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df.parse(Challandate);
			
			bean.setChalladate(date1);
			bean.setFkOperationDetailsId(Long.parseLong(fkOperationDetailsId));
			bean.setOperationName(operationName);
			bean.setTotal(Double.parseDouble(total));
			bean.setGrosstotal(Double.parseDouble(grossTotal));
			bean.setProductname(productName);
			bean.setShopName(shopName);
			bean.setOperation(operation);
			bean.setQuantity(Double.parseDouble(quantity));
			System.out.println("hi my name is kishor0000000022222222222"+quantity);
			bean.setDupQuantity(Double.parseDouble(quantity));;
			bean.setRate(Double.parseDouble(rate));
			bean.setUnit(unit);
			bean.setPoDate(PODate);
			bean.setHsn(hsn);
			bean.setTotal(Double.parseDouble(total));

			bean.setGridTotal(Double.parseDouble(Total));
		
			dao.addGoodsReceiveWithOUt(bean);
		}
		


		}
}
