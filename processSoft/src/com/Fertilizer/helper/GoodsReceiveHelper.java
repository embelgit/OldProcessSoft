package com.Fertilizer.helper;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.CustomerBean;
import com.Fertilizer.bean.GetPODetailsForDcUpdate;
import com.Fertilizer.bean.GetPODetailsForGoodsReceive;
import com.Fertilizer.bean.GetPurchaseProduct;
import com.Fertilizer.bean.GoodsReceive;
import com.Fertilizer.bean.OutwardReportBean;
import com.Fertilizer.bean.PurchaseDetailsFromGoodsReceive;
import com.Fertilizer.bean.SaleReports;
import com.Fertilizer.bean.StockDetail;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.dao.StockDao;
import com.Fertilizer.hibernate.CotainerGoodsReceiveBean;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.InwardProcessingInformation;
import com.Fertilizer.hibernate.Packing_InfoBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.hibernate.containerStock;
import com.Fertilizer.utility.HibernateUtility;


public class GoodsReceiveHelper {
	
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
	public void goodsReceived(HttpServletRequest request,HttpServletResponse response) throws ParseException {
		
		
		
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
         
         System.out.println("IN HELPER");
 		GoodsReceiveDao dao = new GoodsReceiveDao();
         
 		/*code for InwardProcessingInformation*/
         String pono1  = request.getParameter("pono");
         String challanno1  = request.getParameter("challanno");
         String fkOperationDetailsId1  = request.getParameter("fkOperationDetailsId");
         String operationName1  = request.getParameter("operationName");
         
         HttpSession session1 = request.getSession(true);
			String username1 = (String)session1.getAttribute("user");
			String userid1 = (String)session1.getAttribute("userid");
			String shopid1 = (String)session1.getAttribute("shopid");
			String shopname1 =(String)session1.getAttribute("shopname");
			
			InwardProcessingInformation bean1 = new InwardProcessingInformation();
		
			bean1.setPurchaseOrderNo(pono1);
			bean1.setChallanNo(challanno1);
			bean1.setFkOperationDetailsId(Long.parseLong(fkOperationDetailsId1));
			bean1.setOperationName(operationName1);
			bean1.setUserName(username1);
			bean1.setUserId(Long.parseLong(userid1));
			bean1.setShopId(Long.parseLong(shopid1));
			bean1.setShopName(shopname1);
			
			//Date date1=null;
			//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date lastUpdateDate = new Date();
			//date1 = df.parse(Challandate);
			
			bean1.setLastUpdateDate(lastUpdateDate);
			
			dao.addInwardProcessingInfo(bean1);
		
		
		
		String count1 =request.getParameter("count");
		Long count=Long.parseLong(count1);
		System.out.println(count);
		
		InwardBean bean=new InwardBean();
		//GoodsReceiveBean bean = new GoodsReceiveBean();
		
	for(int i =0 ; i< count;i++)
		{
		
			String supplier  = request.getParameter("supplier");
			String challanno  = request.getParameter("challanno");
			String pono  = request.getParameter("pono");
			String Challandate  = request.getParameter("Challandate");
			String fkOperationDetailsId  = request.getParameter("fkOperationDetailsId");
			String operationName  = request.getParameter("operationName");
			/*String ShopName  = request.getParameter("ShopName");*/
			//String productName  = request.getParameter("productName");
			String total  = request.getParameter("total");
			String grossTotal  = request.getParameter("grossTotal");
			
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
		
			
			HttpSession session = request.getSession(true);
			String username = (String)session.getAttribute("user");
			String userid = (String)session.getAttribute("userid");
			String shopid = (String)session.getAttribute("shopid");
			String shopname=(String)session.getAttribute("shopname");
			
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			dao.addGoodsReceive(bean);
		}
		

		/*StockDao dao1 = new StockDao();
        List stkList2  = dao1.getAllStockEntry();
        
        If Stock Is Empty  
        if(stkList2.size() == 0){
        	System.out.println("In if block of stock empty");
        	Stock newEntry = new Stock();
			
			
			newEntry.setProductName(productName);
			newEntry.setCompanyName(companyName);
			newEntry.setWeight(0d);
			newEntry.setQuantityinkg((Double.parseDouble(quantityinkg)));
			newEntry.setQuantityinbundle(Double.parseDouble(quantityinbundle));
			System.out.println("for pscking qnty"+quantityinkg);
			newEntry.setUnpackedQuantity(0d);
			if(batchNo != null){
			newEntry.setBatchNum(batchNo);
			}else{
				newEntry.setBatchNum("N/A");
			}
			StockDao dao2 = new StockDao();
			dao2.registerStock(newEntry);	
        	
        }
        elseTo Update Stock Table If It is Not Empty 
        {
		    	   for(int j=0;j<stkList2.size();j++){
		             	
		             	Stock st = (Stock)stkList2.get(j);
		             	String itemName = st.getProductName();
		             	String company = st.getCompanyName();
		             	Double wight = st.getWeight();
		             	Long PkStockId = st.getPkStockId();
		             	//String batchNumber = st.getBatchNum();
		             	If ItemName Is Already Exists In Stock Table  
		             	
		             	 //System.out.println("batchNumber from stock table"+batchNumber);
		         		// System.out.println("batchNo from goods receive"+batchNo);
		    	   System.out.println("In else Part");	
		    	  
		    	   if(productName.equals(itemName)){
		            		 System.out.println("inside If");
		    		   
		    		   			Double qunty = st.getQuantityinkg();
		    		   			//Double packQunty = st.getUnpackedQuantity();
		            		
		            		 Double updatequnty = (double) (qunty + Double.parseDouble(quantityinkg));
		            		 //Double updatePackQunty = (double) (packQunty + Double.parseDouble(quantity));		 
		            		
		            		 HibernateUtility hbu = HibernateUtility.getInstance();
		            		 Session session = hbu.getHibernateSession();
		            		 Transaction transaction = session.beginTransaction();
		            		 
		            		 DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		            		 Date date2 = new Date();
		            	
		            	     Stock updateStock = (Stock) session.get(Stock.class, new Long(PkStockId));
		            		 updateStock.setUpdateDate(date2);
		            		 updateStock.setQuantityinkg(updatequnty);
		            		// updateStock.setUnpackedQuantity(updatePackQunty);
		            		 
		            		session.saveOrUpdate(updateStock);
		            		transaction.commit();
		            		break;
		            	}
		            	else
		            	{
		            		ItemName is Not Exists 
		            		if(j+1 == stkList2.size()){
		            			
		            			Stock newEntry = new Stock();
		            			
		            			
		            			newEntry.setProductName(productName);
		            			newEntry.setCompanyName(companyName);
		            			newEntry.setWeight(0d);
		            			newEntry.setQuantityinkg(Double.parseDouble(quantityinkg));
		            			//newEntry.setUnpackedQuantity(Double.parseDouble(quantity));
		            			//newEntry.setBatchNum("N/A");
		            			StockDao dao2 = new StockDao();
		            			dao2.registerStock(newEntry);
		            			
		            		}
		            	}
		            	
		        		
		        	}
          }	
		
        }*/
		}		

	//adding Container Good recieve
	
	public void addingContainerGoodsReceive(HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		
		System.out.println("IN HELPER");
		GoodsReceiveDao dao = new GoodsReceiveDao();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		CotainerGoodsReceiveBean bean = new CotainerGoodsReceiveBean();
		
	for(int i =0 ; i< count;i++)
		{
		HttpSession session3 = request.getSession();
		GoodsReceiveDao data = new GoodsReceiveDao();
		List stkList  = data.getLastBarcodeNo();
		
		for(int j=0;j<stkList.size();j++){
			
			BillBean st = (BillBean)stkList.get(j);
			barcodeNo = st.getBarcodeNo();
			barcodeNo++;
			
		}
		
		
			String supplier  = request.getParameter("supplier");
			String total = request.getParameter("total1");
			String purchaseDate = request.getParameter("purchaseDate1");
			String containerName = request.getParameter("containerName");
			String capacity = request.getParameter("capacity");
			String unit = request.getParameter("unit");
			String gst = request.getParameter("gst"+i);
			String igst = request.getParameter("igst"+i);
			
		
		String salePrice = request.getParameter("salePrice"+i);
		if(salePrice==null){
			break;
		}
		else{
			bean.setSalePrice(Double.parseDouble(salePrice));
		} 
		
		String quantity = request.getParameter("quantity"+i);
		System.out.println("quantity = = = ="+quantity);
		if(quantity==null){
			break;
		}
		else{
			bean.setQuantity(Double.parseDouble(quantity));
			bean.setDupQuantity(Double.parseDouble(quantity));
		}
		
		Double gstPerc=Double.parseDouble(gst);
		Double igstPerc=Double.parseDouble(igst);
		if(gstPerc != 0.0){
		Double taxAmnt=((gstPerc/100)*Double.parseDouble(total));
		bean.setTaxAmount(taxAmnt);
		}
		else if(igstPerc != 0.0){
			Double taxAmnt=((igstPerc/100)*Double.parseDouble(total));
			bean.setTaxAmount(taxAmnt);
			}

		String billNum = request.getParameter("billNum1");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate = null;
		try {
			newDate =	format.parse(purchaseDate);
			} 
		catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		bean.setPurchaseDate(newDate);
		
		Double tax =Double.parseDouble(gst);
		if(tax == null || tax == 0) {
			bean.setTaxPercentage(0.0);
		}
		else{
			bean.setTaxPercentage(tax);
		}
		
		Double igstx=Double.parseDouble(igst);
		if(igstx == null || igstx == 0){
			bean.setiGstPercentage(0.0);
		}
		else{
			bean.setiGstPercentage(igstx);
		}
		
		
		String gross = request.getParameter("grossTotal1");
		if(gross != null){
			bean.setGrossTotal(Double.parseDouble(gross));
		}
		else{
			bean.setGrossTotal(0.0);
		}
		

		session3.setAttribute("barcodeNo", barcodeNo);
		
		if(barcodeNo == null){
			bean.setBarcodeNo(1000l);
			}
			else
			{
				bean.setBarcodeNo(barcodeNo);	
			}
		
		int quant = Integer.parseInt(quantity);
		
		try{
			for (int x = 0; x < quant; x++ ){
			FileInputStream fstream = new FileInputStream(
					"D:/barcose/input.prn");

			BufferedReader br = new BufferedReader(new InputStreamReader(
					fstream));
			FileWriter fw = new FileWriter("D:/barcose/Output.prn");

			BufferedWriter bw = new BufferedWriter(fw);
			String strLine;
			String str1;
			while ((strLine = br.readLine()) != null) {

				if (strLine.equals("~product")) 
				{
					str1 = br.readLine();
					strLine = str1 +"\"" +productName+ "\"";
				}
				else if(strLine.equals("~company"))
		         {
					str1=br.readLine();
		            strLine = str1 +"\"" +companyName+ "\"";
		               
		         }
				else if(strLine.equals("~quanti"))
		         {
					str1=br.readLine();
		            strLine = str1 +"\"" +quantity+ "\"";
		               
		         }
				else if(strLine.equals("~bar"))
		         {
					str1=br.readLine();
		            strLine = str1 + "\"" +barcodeNo+ "\"";
		         }
				
				System.out.println(strLine);
				bw.write(strLine + "\r\n");

				/*// Print the content on the console
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@"+strLine);*/
			}

			bw.close();
			// Close the input stream
			br.close();
			/*List cmdAndArgs = Arrays.asList("cmd", "D:", "cd barcose",
					"printbatch.bat");*/
			System.out.println("hello Shreeemant::");
			//File dir = new File("D:/barcose");
			
		/*	List cmdAndArgs = Arrays.asList("cmd", "/d", "printbatch.bat");
	        File dir = new File("D:/barcose");*/
	        
	        List cmdAndArgs = Arrays.asList("cmd", "/c", "printbatch.bat");
			File dir = new File("C:/barcose");


			ProcessBuilder pb = new ProcessBuilder(cmdAndArgs);
			pb.directory(dir);
			Process p = pb.start();
			}
		}catch(Exception e){
			
		}
		
	
		if(billNum == null){
			bean.setBillNum("N/A");
		}
		else{
			bean.setBillNum(billNum);
		}
		
		
		bean.setSupplier(Long.parseLong(supplier));
		bean.setTotalAmount(Double.parseDouble(total));
		bean.setContainerName(containerName);
		bean.setCapacity(Double.parseDouble(capacity));
		bean.setUnit(unit);
		
		dao.addGoodsReceive(bean);
		

		StockDao dao1 = new StockDao();
        List stkList2  = dao1.getAllContainerStockEntry();
        
       // If Stock Is Empty  
        if(stkList2.size() == 0){
        	System.out.println("In if block of stock empty");
        	containerStock newEntry = new containerStock();
			
			newEntry.setContainerName(containerName);;
			newEntry.setCapacity(Long.parseLong(capacity));
			newEntry.setUnit(unit);
			newEntry.setQuantity(Double.parseDouble(quantity));
			System.out.println("for pscking qnty"+quantity);

			StockDao dao2 = new StockDao();
			dao2.registerContainerStock(newEntry);	
        	
        }
        else //To Update Stock Table If It is Not Empty 
        {
		    	   for(int j=0;j<stkList2.size();j++){
		             	
		    		   containerStock st = (containerStock)stkList2.get(j);
		            String 	 containerNameInSt = st.getContainerName();
		             Long cap = st.getCapacity();
		             String capacityInSt=cap.toString();
		            String 	 unitInst = st.getUnit();
		            Long PkStockId = st.getPkContainerStockId();
		            
		             	//String batchNumber = st.getBatchNum();
		             ///	If ItemName Is Already Exists In Stock Table  
		             	System.out.println("container from stock = = "+containerNameInSt);
		             	System.out.println("capacity from stock = = "+capacityInSt);
		             	System.out.println("unit from stock = = "+unitInst);
		             	System.out.println("container from ui = = "+containerName);
		             	System.out.println("capacity from ui = = "+capacity);
		             	
		             	System.out.println("unit from ui = = "+unit);
		             	 //System.out.println("batchNumber from stock table"+batchNumber);
		         		// System.out.println("batchNo from goods receive"+batchNo);
		    	   System.out.println("In else Part");	
		    	  
		    	   if(containerName.equals(containerNameInSt) && capacity.equals(capacityInSt) && unit.equals(unitInst)){
		            		 System.out.println("inside If");
		    		   
		    		   			Double qunty = st.getQuantity();
		            		
		            		 Double updatequnty = (double) (qunty + Double.parseDouble(quantity));
		            		
		            		 HibernateUtility hbu = HibernateUtility.getInstance();
		            		 Session session = hbu.getHibernateSession();
		            		 Transaction transaction = session.beginTransaction();
		            		 
		            		 DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		            		 Date date2 = new Date();
		            	
		            		 containerStock updateStock = (containerStock) session.get(containerStock.class, new Long(PkStockId));
		            		 updateStock.setUpdateDate(date2);
		            		 updateStock.setQuantity(updatequnty);
		            		 
		            		session.saveOrUpdate(updateStock);
		            		transaction.commit();
		            		break;
		            	}
		            	else
		            	{
		            		//ItemName is Not Exists 
		            		if(j+1 == stkList2.size()){
		            			
		            			containerStock newEntry = new containerStock();
		            			
		            			newEntry.setContainerName(containerName);;
		            			newEntry.setCapacity(Long.parseLong(capacity));
		            			newEntry.setUnit(unit);
		            			newEntry.setQuantity(Double.parseDouble(quantity));
		            			System.out.println("for pscking qnty"+quantity);

		            			StockDao dao2 = new StockDao();
		            			dao2.registerContainerStock(newEntry);	
		            			
		            		}
		            	}
		            	
		        		
		        	}
          }	
		
        }
		}		
	
	
	

	public Map getAllDcNumbers(String supplierId) {
		GoodsReceiveDao dao = new GoodsReceiveDao();
		List list= dao.getAllDcNumbersBySuppliers(supplierId);
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetPODetailsForGoodsReceive bean = new GetPODetailsForGoodsReceive();
			System.out.println(Arrays.toString(o));
			bean.setDcNum(o[0].toString());
			bean.setInsertDate(o[1].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getDcNum(),bean);
			
		}
		return map;
	}

	public Map getPODetails(String dcNum, String supplier) {
		System.out.println("In Helper");
		GoodsReceiveDao dao = new GoodsReceiveDao();
		List list = dao.getPODetailsForGoodsReceive(dcNum,supplier);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetPODetailsForDcUpdate bean = new GetPODetailsForDcUpdate();
			
			
			bean.setPkPOId((BigInteger)o[0]);
			bean.setProductName((String)o[1]);
			bean.setBuyPrice((BigDecimal)o[2]);
			bean.setSalePrice((BigDecimal)o[3]);
			bean.setQuantity((BigInteger)o[4]);
			bean.setWeight((BigDecimal)o[5]);
			/*bean.setTotalAmount((BigDecimal)o[6]);*/
			map1.put(bean.getPkPOId(),bean);
		}
		return map1;
	
	
	}




/*	public List getPurchaseDetailsForSingleDate(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fDate = request.getParameter("fDate");
		System.out.println(fDate+"Single Date");
		
         Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
 		
         GoodsReceiveDao dao = new GoodsReceiveDao();
 		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsForSingleDateFromGoodsReceive(fDate);
 		
 		
 		return expList;
		
	}*/




	public List getPurchaseDetailByTwoDate(HttpServletRequest request,
			HttpServletResponse response) {


		String fDate = request.getParameter("fisDate");
        String tDate = request.getParameter("endDate");
		
        Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
        GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> exp1List = dao.getPurchaseReportsBetweenTwoDates(fDate,tDate);
		
		return exp1List;
	
	}



	public List StockDetailsOfcontainer(HttpServletRequest request,
			HttpServletResponse response) {


		
		String containerName = request.getParameter("containerName");
		String capacity = request.getParameter("capacity");
		String unitId = request.getParameter("unitId");
		
         Map<Long,Packing_InfoBean> map = new HashMap<Long,Packing_InfoBean>();
 		
         GoodsReceiveDao dao = new GoodsReceiveDao();
 		List<Packing_InfoBean> stockList = dao.StockDetailsOfcontainer(containerName,capacity,unitId);
 		
 		
 		return stockList;
	
	
	
	
	}
	
	public List PackedAndUnpackedStock(HttpServletRequest request,
			HttpServletResponse response) {


		
		String productname = request.getParameter("productname");
		String fk_cat_id = request.getParameter("fk_cat_id");
		String fk_subcat_id = request.getParameter("fk_subcat_id");
		
         Map<Long,ProductDetailsBean> map = new HashMap<Long,ProductDetailsBean>();
 		
         GoodsReceiveDao dao = new GoodsReceiveDao();
 		List<ProductDetailsBean> stockList = dao.PackedAndUnpackedStock(productname,fk_cat_id,fk_subcat_id);
 		
 		
 		return stockList;
	
	
	
	
	}






	
	
	public CustomerBean getDetailsById(HttpServletRequest request,
			HttpServletResponse response) {
		
		String key=request.getParameter("key");
		System.out.println(key+"barcode");
		Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
		
		GoodsReceiveDao dao = new GoodsReceiveDao();
		List<CustomerBean> catList = dao.getAllItemDetails(key);
		
		CustomerBean cs = null;
		if(catList!= null && catList.size() > 0 )
		{	
			cs = (CustomerBean)catList.get(0); 
		}
		return cs;
	}

	
	public CustomerBean getPesticideDetailsByBarcode(HttpServletRequest request,
			HttpServletResponse response) {
		
		String key=request.getParameter("key");
		System.out.println(key+"barcode");
		Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
		
		GoodsReceiveDao dao = new GoodsReceiveDao();
		List<CustomerBean> catList = dao.getPesticideDetailByBarocde(key);
		
		CustomerBean cs = null;
		if(catList!= null && catList.size() > 0 )
		{	
			cs = (CustomerBean)catList.get(0); 
		}
		return cs;
	}
	
	
	// get purchase Item By Bill NoWise
		public Map getAllIetmByBillNo(String bill_no,String supplier) {
			// TODO Auto-generated method stub
				System.out.println("bill_no_Helper"+bill_no);
				System.out.println("supplier_Helper"+supplier);
			    GoodsReceiveDao dao = new GoodsReceiveDao();
				List list = dao.getAllIetmByBillNo(bill_no,supplier);
				System.out.println(list.size());
				Map  map1 =  new HashMap();
				
				for(int i=0;i<list.size();i++)
				{
					Object[] o = (Object[])list.get(i);
					GrDetailsBean bean = new GrDetailsBean();
					
					
					bean.setPk_GRDetails_id((Long.parseLong(o[0].toString())));
					bean.setIdno(o[1].toString());
					bean.setSuppliername(((o[2].toString())));
					bean.setDate1(o[3].toString());
					bean.setProductname((o[4].toString()));
					System.out.println(" Product Name=="+(o[4].toString()));
					bean.setOperation((o[5].toString()));
					bean.setQuantity(Double.parseDouble(o[6].toString()));
					bean.setRate(Double.parseDouble(o[7].toString()));
					bean.setUnit(((o[8].toString())));
					//bean.setFkCategoryId((BigInteger)o[9]);
					/*BigInteger big1 = new BigInteger("1");
					BigInteger big2 = new BigInteger("2");
					BigInteger big3 = new BigInteger("3");
					System.out.println("cat Id  ===  "+o[9]);
					if(o[9].equals(big1)){
						String ferti = "Fertilizer";
						bean.setCatName(ferti);
					}
					if(o[9].equals(big2)){
						String Pesticide = "Pesticide";
						bean.setCatName(Pesticide);
					}
					if(o[9].equals(big3)){
						String Seed = "Seed";
						bean.setCatName(Seed);
					}*/
					bean.setTotal(Double.parseDouble(o[9].toString()));
					bean.setGrosstotal(Double.parseDouble(o[10].toString()));
					bean.setDiscount(Double.parseDouble(o[11].toString()));
					bean.setGst(Double.parseDouble(o[12].toString()));
					bean.setBillno(Double.parseDouble((o[13].toString())));
					bean.setGridTotal(Double.parseDouble((String)o[14].toString()));
					//bean.setDupQuantity((Double)o[15]);
					bean.setTaxAmount((o[15].toString()));
					bean.setIgst(Double.parseDouble(o[16].toString()));
					bean.setQuantity1("0");
					//bean.settValue(0L);
					/*bean.setFk_unit_id((BigInteger)o[5]);*/
					//bean.setQuantity(0l);
					//System.out.println("***************"+o[0]+"\t"+o[5]);
					map1.put(bean.getPk_GRDetails_id(),bean);
				}
				return map1;
		}


		// Get All Outward Challan Number from Outward Details
		public Map getAllIetmByOutwardChallanNumber(String bill_no,String supplier) {
			// TODO Auto-generated method stub
			
			    GoodsReceiveDao dao = new GoodsReceiveDao();
				List list = dao.getAllIetmByOutwardChallanNo(bill_no,supplier);
				System.out.println(list.size());
				Map  map1 =  new HashMap();
				
				for(int i=0;i<list.size();i++)
				{
					Object[] o = (Object[])list.get(i);
					OutwardReportBean bean = new OutwardReportBean();
					
					
					bean.setPkoutwardid((o[0].toString()));
					bean.setIdno(o[1].toString());
					bean.setSuppliername(((o[2].toString())));
					bean.setHsn(o[3].toString());
					bean.setChallanNo((o[4].toString()));
					System.out.println(" Product Name=="+(o[4].toString()));
					bean.setOutwardchallanno((o[5].toString()));
					bean.setInwardDate((o[6].toString()));
					bean.setOutwardDate((o[7].toString()));
					bean.setProductName(o[8].toString());
					bean.setVehicleName(o[15].toString());
					System.out.println("Vehicle  Name=="+(o[15].toString()));
					bean.setShopName(o[16].toString());
					System.out.println(" SHop Name=="+(o[16].toString()));
					bean.setBoxDescription(o[17].toString());
					//bean.setFkCategoryId((BigInteger)o[9]);
					/*BigInteger big1 = new BigInteger("1");
					BigInteger big2 = new BigInteger("2");
					BigInteger big3 = new BigInteger("3");
					System.out.println("cat Id  ===  "+o[9]);
					if(o[9].equals(big1)){
						String ferti = "Fertilizer";
						bean.setCatName(ferti);
					}
					if(o[9].equals(big2)){
						String Pesticide = "Pesticide";
						bean.setCatName(Pesticide);
					}
					if(o[9].equals(big3)){
						String Seed = "Seed";
						bean.setCatName(Seed);
					}*/
					bean.setDescription((o[9].toString()));
					bean.setRate((o[10].toString()));
					bean.setOkQuantity((o[11].toString()));
					bean.setUnprocesQty(((o[12].toString())));
					bean.setRejQty(((String)o[13].toString()));
					bean.setOperaation(o[14].toString());
					//bean.setTaxAmount((o[15].toString()));
					//bean.setIgst(Double.parseDouble(o[16].toString()));
					//bean.setQuantity1(0L);
					/*bean.setFk_unit_id((BigInteger)o[5]);*/
					//bean.setQuantity(0l);
					//System.out.println("***************"+o[0]+"\t"+o[5]);
					map1.put(bean.getPkoutwardid(),bean);
				}
				return map1;
		}

	//to purchase Return
		public void returntPurchase(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			Integer count = Integer.parseInt(request.getParameter("count"));
			for(int i =0 ; i <count;i++)
			{
				String pkGRDetailsid = request.getParameter("pkGRDetailsid"+i);
				String productname = request.getParameter("productname"+i);
				String operation = request.getParameter("operation"+i);
				String quantity = request.getParameter("quantity"+i);
				String rate = request.getParameter("rate"+i);
				String discount = request.getParameter("discount"+i);
				String gst = request.getParameter("gst"+i);
				String igst = request.getParameter("igst"+i);
				String TaxAmount = request.getParameter("TaxAmount"+i);
				String unit = request.getParameter("unit"+i);
				String GridTotal = request.getParameter("GridTotal"+i);
				String Quantity1 = request.getParameter("Quantity1"+i);
				String grosstotal = request.getParameter("grosstotal"+i);
				    
				//System.out.println("currnt qunt : "+ QuantityToReturn);
				//System.out.println("minus qunt : "+ dupQuantity);
				/*HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				try{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					transaction = session.beginTransaction();
					List<Object[]> list2  = null;
					List<GoodsReceiveBean> goodsList = null;
					Double grossTotal = 0.0;
					
					Double quantity = (double)(Double.parseDouble(dupQuantity) -  Double.parseDouble(QuantityToReturn));
					System.out.println("after minus qunt : "+ quantity);
       		        GoodsReceiveBean updateStock = (GoodsReceiveBean) session.get(GoodsReceiveBean.class, new Long(pkGoodsReceiveId));
       		       // updateStock.setQuantity(quantity);
       		        updateStock.setDupQuantity(quantity);
       		        //session.saveOrUpdate(updateStock);
       		        
	       		    Query query2 = session.createSQLQuery("SELECT gross_total,bill_number FROM goods_receive WHERE pk_goods_receive_id="+pkGoodsReceiveId);
	 		        list2 = query2.list();
	 		       goodsList = new ArrayList<GoodsReceiveBean>();
	 		        for (Object[] objects : list2) {
	 					 grossTotal = Double.parseDouble(objects[0].toString());
	 					
	 				 }
	 		        Double buyPrice = Double.parseDouble(buy_price);
			        Double total = quantity * buyPrice;
			        Double newGrossTotal = grossTotal - total;
			        System.out.println("buyPrice = ="+buyPrice);
			        System.out.println("total = ="+total);
			        System.out.println("newGrossTotal = ="+newGrossTotal);
			        
       		        updateStock.setReturnAmount(newGrossTotal);
       		        updateStock.setTotalAfterReturn(total);
       		        session.saveOrUpdate(updateStock);
       		        transaction.commit();
					
					
       		}
			catch(RuntimeException e){
				try{
					transaction.rollback();
				}catch(RuntimeException rbe)
				{
					Log.error("Couldn't roll back tranaction",rbe);
				}	
			}finally{
				hbu.closeSession(session);
			}
	*/
				
				
				
				

				HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
			
				 
				
					
					    
				 
				//long customerId = Long.parseLong(customerId);
				long GridID =Long.parseLong(pkGRDetailsid);
				GrDetailsBean det = (GrDetailsBean) session.get(GrDetailsBean.class, GridID);
				
				det.setPk_GRDetails_id(Long.parseLong(pkGRDetailsid));
				det.setProductname(productname);
				det.setOperation((operation));
				det.setQuantity(Double.parseDouble(quantity));
				det.setRate(Double.parseDouble(rate));
				det.setDiscount(Double.parseDouble((discount)));
				det.setGst(Double.parseDouble(gst));
				det.setIgst(Double.parseDouble(igst));
				det.setTaxAmount((TaxAmount));
				det.setUnit(unit);
				det.setGridTotal(Double.parseDouble(GridTotal));
				det.setGrosstotal(Double.parseDouble(grosstotal));
				det.setQuantity1(Quantity1);
				
				//det.setIdNo(IdNo);
				
				
			    session.saveOrUpdate(det);
				transaction.commit();
				
				
			}
			
		}




		public void returntMinusFromStockPurchase(HttpServletRequest request,
				HttpServletResponse response) {
			// TODO Auto-generated method stub
			Integer count = Integer.parseInt(request.getParameter("count"));
			for(int i =0 ; i <count;i++)
			{
				String pkGoodsReceiveId = request.getParameter("pk_goods_receive_id"+i);
				String QuantityToReturn = request.getParameter("QuantityToReturn"+i);
				String product_name = request.getParameter("product_name"+i);
				String company_Name = request.getParameter("company_Name"+i);
				String weight = request.getParameter("weight"+i);
				//String duplicateQuantity = request.getParameter("duplicateQuantity"+i);
				//System.out.println("currnt qunt : "+ duplicateQuantity);
				System.out.println("minus qunt : "+ QuantityToReturn);
				System.out.println("product_name : "+ product_name);
				System.out.println(" company_Name : "+ company_Name);
				System.out.println(" weight : "+ weight);
				
				HibernateUtility hbu1=null;
				Session session1=null;
				Transaction transaction1 = null;
				
				try
				{
				 Long PkStockId;
				 Double quantity;
				 hbu1 = HibernateUtility.getInstance();
				 session1 = hbu1.getHibernateSession();
				 transaction1 = session1.beginTransaction();
				
        		 Query query = session1.createSQLQuery("select PkStockId , Quantity from stock_detail where ProductName=:product_name AND CompanyName=:company_Name");
        		 query.setParameter("product_name", product_name);
        		 query.setParameter("company_Name", company_Name);
        		 
        		 List<Object[]> list = query.list();
    			 
    			  for (Object[] object : list) {
    			  System.out.println(Arrays.toString(object));  
    			  PkStockId = Long.parseLong(object[0].toString());
    			  quantity = Double.parseDouble(object[1].toString());
    			  System.out.println("PkStockId " +PkStockId);
    			  System.out.println("quantity " +quantity);
    			  
		  Double updatequnty = (double) (quantity - Double.parseDouble(QuantityToReturn));
    			  System.out.println("updatequnty " +updatequnty);
          		
         	     Stock Stock = (Stock) session1.load(Stock.class, new Long(PkStockId));
         	     
         	     Stock.setQuantityinkg(updatequnty);
         		 
         		 session1.saveOrUpdate(Stock);
         	     transaction1.commit();
         	    System.out.println("Success ");	 
    		   }
					
			}
				catch(RuntimeException e){
					try{
						transaction1.rollback();
					}catch(RuntimeException rbe)
					{
						Log.error("Couldn't roll back tranaction",rbe);
					}	
				}finally{
					hbu1.closeSession(session1);
				}
	  }

	}
		
/*		//fetching pro details from goods receive for ferti bill
				public CustomerBean getDetailsByProNameForzFertiBill(
						HttpServletRequest request, HttpServletResponse response) {

					
					String proName =request.getParameter("proName");
					String company =request.getParameter("company");
					String weight =request.getParameter("weight");
					
					System.out.println(proName+"pro name in gr helper");
					
					Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
					
					GoodsReceiveDao dao = new GoodsReceiveDao();
					List<CustomerBean> catList = dao.getAllProductDetailsForFrtiBillAsPerProductName(proName,company,weight);
					
					CustomerBean cs = null;
					if(catList!= null && catList.size() > 0 )
					{	
						cs = (CustomerBean)catList.get(0); 
					}
					return cs;
				
				}*/
		 

			//fetching pro details from goods receive for ferti bill
				public CustomerBean getDetailsByProNameForzFertiBill(
						HttpServletRequest request, HttpServletResponse response) {

					
					String proName =request.getParameter("proName");
					String company =request.getParameter("company");
					String weight =request.getParameter("weight");
					
					System.out.println(proName+"pro name in gr helper");
					
					Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
					
					GoodsReceiveDao dao = new GoodsReceiveDao();
					List<CustomerBean> catList = dao.getAllProductDetailsForFrtiBillAsPerProductName(proName,company,weight);
					
					CustomerBean cs = null;
					if(catList!= null && catList.size() > 0 )
					{	
						cs = (CustomerBean)catList.get(0); 
					}
					return cs;
				
				}
				
				//fetching product detail as per batch for seed bill
				public CustomerBean getDetailsByBatchNadStockForSeedBill(
						HttpServletRequest request, HttpServletResponse response) {


					
					String batchNum =request.getParameter("batchNum");
					String stock =request.getParameter("stock");
					System.out.println(" batchNum=== == =in helper"+batchNum);
					System.out.println(" stock=== == =in helper"+stock);
					Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
					
					GoodsReceiveDao dao = new GoodsReceiveDao();
					List<CustomerBean> catList = dao.getAllProductDetailsForSeedBillAsPerBatchAndStock(batchNum,stock);
					
					CustomerBean cs = null;
					if(catList!= null && catList.size() > 0 )
					{	
						cs = (CustomerBean)catList.get(0); 
					}
					return cs;
				
				
				}




				public CustomerBean getProductDetailsForFertiBill(
						HttpServletRequest request, HttpServletResponse response) {
					
					String proName =request.getParameter("proName");
					String qty =request.getParameter("qty");
					
					
					System.out.println(proName+"pro name in gr helper");
					
					
					Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
					
					GoodsReceiveDao dao = new GoodsReceiveDao();
					List<CustomerBean> catList = dao.getAllProductDetailsForFrtiBillAsPerProductName1(proName,qty);
					
					CustomerBean cs = null;
					if(catList!= null && catList.size() > 0 )
					{	
						cs = (CustomerBean)catList.get(0); 
					}
					System.out.println(cs);
					return cs;
				
				
				}




				public CustomerBean getProductDetailsForSeedBill(
						HttpServletRequest request, HttpServletResponse response) {

					
					String proName =request.getParameter("proName");
					String company =request.getParameter("company");
					String weight =request.getParameter("weight");
					String batchNum = request.getParameter("batchNum");
					
					System.out.println(proName+"pro name in gr helper");
					
					Map<Long,CustomerBean> map = new HashMap<Long,CustomerBean>();
					
					GoodsReceiveDao dao = new GoodsReceiveDao();
					List<CustomerBean> catList = dao.getAllProductDetailsForSeedBillAsPerProductName1(proName,company,weight,batchNum);
					
					CustomerBean cs = null;
					if(catList!= null && catList.size() > 0 )
					{	
						cs = (CustomerBean)catList.get(0); 
					}
					return cs;
				
				
				
				}




				public List getSaleDetailsAsPerCategoryForSingleDate(
						HttpServletRequest request, HttpServletResponse response) {
					
					String custId = request.getParameter("creditCustomer");
					String ShopName1 = request.getParameter("ShopName1");
					
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerCategoryForSingleDate(ShopName1,custId);
			 		
			 		return expList;
				
				}


				public List getSaleDetailsPerPaymentMode(HttpServletRequest request, HttpServletResponse response) {
					
					String paymentMode = request.getParameter("paymentMode");
					String fk_cat_id = request.getParameter("fk_cat_id");
					System.out.println(paymentMode+"paymentMode in Helper");
					System.out.println(fk_cat_id+"fk_cat_id in Helper");
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.getSaleDetailsAsPerPaymentMode(paymentMode,fk_cat_id);
			 		return expList;
				}


				public List getSaleDetailsPerPaymentModeGorSingleDate(HttpServletRequest request, HttpServletResponse response) {
					
					String singleDate = request.getParameter("singleDate");
					String fk_cat_id = request.getParameter("fk_cat_id");
					System.out.println(singleDate+"singleDate in Helper");
					System.out.println(fk_cat_id+"fk_cat_id in Helper");
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.getSaleDetailsAsPerPaymentModeForSingleDate(singleDate,fk_cat_id);
			 		return expList;
				}
				
				
	public List getSaleDetailsPerGSTPercentage(HttpServletRequest request, HttpServletResponse response) {
					
				String cat = request.getParameter("fk_cat_id");
					String fDate = request.getParameter("startDate");
						String sDate = request.getParameter("endDate");
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.getSaleDetailsAsGST(cat,fDate,sDate);
			 		return expList;
				}
				
				public List getSaleDetailsAsPerCategoryBetTwoDates(
						HttpServletRequest request, HttpServletResponse response) {
					String fDate = request.getParameter("fisDate");
					String sDate = request.getParameter("endDate");
					String ShopName3 = request.getParameter("ShopName3");
					
					System.out.println(fDate+"fDate in Helper");
					System.out.println(sDate+"sDate in Helper");
					
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerCategoryBetweeenTwoDates(ShopName3,fDate,sDate);
			 		
			 		
			 		return expList;
				
				
				
				
				}
				
				public List getSaleDetailsAsPerShopBetTwoDates(
						HttpServletRequest request, HttpServletResponse response) {

					
					String shop = request.getParameter("shop");
					String fDate = request.getParameter("fDate");
					String sDate = request.getParameter("sDate");
					System.out.println(shop+"Category in Helper");
					System.out.println(fDate+"fDate in Helper");
					System.out.println(sDate+"sDate in Helper");
					
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.getSaleDetailsAsPerShopBetweeenTwoDates(shop,fDate,sDate);
			 		
			 		
			 		return expList;
				
				
				
				
				}
				
				
				public List saleReportBetweenToId(
						HttpServletRequest request, HttpServletResponse response) {

					
					String cust1 = request.getParameter("fk_cust_id");
					String cust2 = request.getParameter("fk_cust_id1");
					System.out.println(cust1+"Category in Helper");
					System.out.println(cust2+"fDate in Helper");
					
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.saleReportBetweenToId(cust1,cust2);
			 		
			 		
			 		return expList;
				
				
				
				
				}




				public List getSaleDetailsAsPerProNameForSingleDate(
						HttpServletRequest request, HttpServletResponse response) {

					String cat = request.getParameter("cat");
					String productName = request.getParameter("product");
					String fDate = request.getParameter("fDate");
					System.out.println(cat+"Category in Helper");
					
			         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<SaleReports> expList = dao.getSaleDetailsAsPerProductNameForSingleDate(cat,fDate,productName);
			 		
			 		
			 		return expList;
				
				
				
				
				}
				
				public List getStockDetailsAsPerCategory(HttpServletRequest request,
						HttpServletResponse response) {

					
					String cat = request.getParameter("cat");
					System.out.println(cat+"Category in Helper");
					
			         Map<Long,StockDetail> map = new HashMap<Long,StockDetail>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<StockDetail> stockList = dao.getStockDetailsForReportAsPerCategory(cat);
			 		
			 		System.out.println("@@@ stock report Helper :: "+ stockList);
			 		
			 		return stockList;
			
				}
				

				
				public List getStockDetailsAsCompanyName(HttpServletRequest request,HttpServletResponse response) {
					String companyName = request.getParameter("companyName");
					
			         Map<Long,StockDetail> map = new HashMap<Long,StockDetail>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<StockDetail> stockList = dao.getStockDetailsAsPerCompanyName(companyName);
			 		
			 		return stockList;
				
				}
		
				public List getPurchaseDetailsForSingleDate(HttpServletRequest request,
						HttpServletResponse response) {
					
					String fDate = request.getParameter("fDate");
					System.out.println(fDate+"Single Date");
					
			         Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsForSingleDateFromGoodsReceive(fDate);
			 		
			 		
			 		return expList;
					
				}
				

				public List getPurchaseDetailsAsPerProduct(HttpServletRequest request,
						HttpServletResponse response) {

					
					String cat = request.getParameter("cat");
					String productName = request.getParameter("proName");
					String company = request.getParameter("company");
					String weight = request.getParameter("weight");
					
					System.out.println(cat+"Category in Helper");
					//System.out.println(product+"product in Helper");
					
			         Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
			 		
			         GoodsReceiveDao dao = new GoodsReceiveDao();
			 		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsAsPerProduct(cat,productName,company,weight);
			 		
			 		
			 		return expList;
				
				
				
				}

public List getPurchaseDetailsAsPerSupplierName(HttpServletRequest request,
		HttpServletResponse response) {
	
	String supplier = request.getParameter("supplier");
	System.out.println(supplier+"Supplier in Helper");
	
     Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsForSupplier(supplier);
		
		
		return expList;

}

public List getPurchaseDetailsAsPerShopName(HttpServletRequest request,
		HttpServletResponse response) {
	
	String shop = request.getParameter("shop");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	System.out.println(shop+"Supplier in Helper");
	
	
	
     Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsForShop(shop,fisDate,endDate);
		
		
		return expList;

}


public List getPurchaseDetailsAsPerCategory(HttpServletRequest request,
		HttpServletResponse response) {
	
	String cat = request.getParameter("cat");
	System.out.println(cat+"Category in Helper");
	
     Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseDetailsForCategory(cat);
		
		
		return expList;


}


public List getSaleDetailsAsPerProductNameBetTwoDates(
		HttpServletRequest request, HttpServletResponse response) {


	
	String cat = request.getParameter("cat");
	String fDate = request.getParameter("fDate");
	String sDate = request.getParameter("sDate");
	String product = request.getParameter("product");
	
	System.out.println(cat+"Category in Helper");
	System.out.println(fDate+"fDate in Helper");
	System.out.println(sDate+"sDate in Helper");
	
     Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<SaleReports> expList = dao.getSaleDetailsAsPerProductNamesBetweeenTwoDates(cat,fDate,sDate,product);
		
		
		return expList;


}


public List getSaleDetailsAsPerSup(HttpServletRequest request,
		HttpServletResponse response) {

	String fkSupplierId = request.getParameter("fkSupplierId");
	System.out.println(fkSupplierId+"fkSupplierId in Helper");
	
     Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<SaleReports> expList = dao.getSaleDetailsAsPerSupplierName(fkSupplierId);
		
		return expList;

}


public List getTaxDetailsFromPurchaseForSingleDateAsPerCategory(
		HttpServletRequest request, HttpServletResponse response) {

	
	String cat = request.getParameter("cat");
	String fDate = request.getParameter("fDate");
	String sDate = request.getParameter("sDate");
	System.out.println(cat+"Category in Helper");
	System.out.println(fDate+"fDate in Helper");
     Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> expList = dao.geTaxDetailsAsPerCategoryForSingleDate(cat,fDate,sDate);
		return expList;

}



public List getStockDetailsAsProductName1(HttpServletRequest request,HttpServletResponse response) {
	String proName = request.getParameter("proName");
	//String company = request.getParameter("company");
	/*String weight = request.getParameter("weight");*/
     
	Map<Long,StockDetail> map = new HashMap<Long,StockDetail>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<StockDetail> stockList = dao.getStockDetailsAsPerProductName1(proName);
		
		return stockList;
}




public List getSaleDetailsPerPaymentModeForTwoDate(HttpServletRequest request,
		HttpServletResponse response) {

	String singleDate = request.getParameter("singleDate");
	String secondDate = request.getParameter("secondDate");
	String fk_cat_id = request.getParameter("fk_cat_id");
	System.out.println(singleDate+"singleDate in Helper");
	System.out.println(fk_cat_id+"fk_cat_id in Helper");
     Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<SaleReports> expList = dao.getSaleDetailsAsPerPaymentModeForTwoDate(singleDate,fk_cat_id,secondDate);
		return expList;

}

public Map getSubCatDetails(String fk_cat_id) {
    
	int count=0;
	System.out.println("IN HELPER");
	/*String fk_cat_id = request.getParameter("fk_cat_id");
	
	System.out.println("=== == ==="+fk_cat_id);
	
	
	SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
	
	scdb.setFk_cat_id(Long.parseLong(fk_cat_id));*/
	
	ProductDetailsDao cdd = new ProductDetailsDao();
	List list=cdd.getAllSubCategory(fk_cat_id);
	
	System.out.println("list ======"+list.size());
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		System.out.println("IN HELPER");
		Object[] o = (Object[])list.get(i);
		SubCategoryDetailsBean bean = new SubCategoryDetailsBean();
		System.out.println(Arrays.toString(o));
		bean.setSubcatId(Long.parseLong(o[0].toString()));
		bean.setSubcategoryName(o[1].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}

public Map getProNameDetails(String fk_cat_id,String fk_subCat_id) {
    
	int count=0;
	System.out.println("IN HELPER");
	GoodsReceiveDao cdd = new GoodsReceiveDao();
	List list=cdd.getProductName(fk_cat_id,fk_subCat_id);
	
	System.out.println("list ======"+list.size());
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		System.out.println("IN HELPER");
		Object[] o = (Object[])list.get(i);
		ProductDetailsBean bean = new ProductDetailsBean();
		System.out.println(Arrays.toString(o));
		bean.setProdctId(Long.parseLong(o[0].toString()));
		bean.setProductName(o[1].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}

public List getPurchaseDetailByGST(HttpServletRequest request,
		HttpServletResponse response) {
	String fDate = request.getParameter("gstFisDate");
    String tDate = request.getParameter("gstEndDate");
	
    Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<PurchaseDetailsFromGoodsReceive> exp1List = dao.getPurchaseReportsASPerGST(fDate,tDate);
	
	return exp1List;


}

public List getPurchaseReturnDetailsAsPerSupplierName(
		HttpServletRequest request, HttpServletResponse response) {
	String supplier = request.getParameter("supplier");
	
	System.out.println(supplier+"= = = Supplier in Helper");
	
     Map<Long,PurchaseDetailsFromGoodsReceive> map = new HashMap<Long,PurchaseDetailsFromGoodsReceive>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<PurchaseDetailsFromGoodsReceive> expList = dao.getPurchaseReturnDetailsForSupplier(supplier);
		
		
		return expList;


}

//GST Sale Summary 
	public List gstSummaryReportsBetweenTwoDates(
	HttpServletRequest request, HttpServletResponse response) {


	
	String fDate = request.getParameter("gstFisDate1");
	String sDate = request.getParameter("gstEndDate1");
	
	System.out.println(fDate+"fDate in Helper");
	System.out.println(sDate+"sDate in Helper");
	
     Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<SaleReports> expList = dao.gstSummaryReportsBetweenTwoDates(fDate,sDate);
		
		
		return expList;


}

//GST Purchase Summary 
public List gstPurchaseSummaryReportsBetweenTwoDates(
		HttpServletRequest request, HttpServletResponse response) {


	
	String fDate = request.getParameter("gstFisDate1");
	String sDate = request.getParameter("gstEndDate1");
	
	System.out.println(fDate+"fDate in Helper");
	System.out.println(sDate+"sDate in Helper");
	
     Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
		
     GoodsReceiveDao dao = new GoodsReceiveDao();
		List<SaleReports> expList = dao.gstPurchaseSummaryReportsBetweenTwoDates(fDate,sDate);
		
		
		return expList;


}

public List getInwardDetail(HttpServletRequest request, HttpServletResponse response)
{
	String billno = request.getParameter("Billno");
	String ShopName1 = request.getParameter("ShopName1");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("Bill No in Helper"+billno);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTable(billno,ShopName1);
		
		return Inwardlist;

}

// with Po 
public List getInwardDetailwithpo(HttpServletRequest request, HttpServletResponse response)
{
	String billno = request.getParameter("Billno");
	String ShopName1 = request.getParameter("ShopName1");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("Bill No in Helper"+billno);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTableWithPo(billno,ShopName1);
		
		return Inwardlist;

}


//this is for inword Report by Product Name
public List getInwardDetailforProduct(HttpServletRequest request, HttpServletResponse response)
{
	String proName = request.getParameter("proName");
	String ShopName3 = request.getParameter("ShopName3");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("this is product Name for inwor produt Report In Helper"+proName+"]]]]]]]]]]"+ShopName3);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTableProductNameWise(ShopName3,proName);
		
		return Inwardlist;

}

// with Po 

public List getInwardDetailforProductwithpo(HttpServletRequest request, HttpServletResponse response)
{
	String proName = request.getParameter("proName");
	String ShopName3 = request.getParameter("ShopName3");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("this is product Name for inwor produt Report In Helper"+proName+"]]]]]]]]]]"+ShopName3);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTableProductNameWisewithpo(ShopName3,proName);
		
		return Inwardlist;

}
//this is for inword report by vendotr.......
public List getInwardDetailforvendor(HttpServletRequest request, HttpServletResponse response)
{
	String ShopName4 = request.getParameter("ShopName4");
	String venName = request.getParameter("venName");
	System.out.println("this is product Name for inwor produt Report In Helper"+venName);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTablevendorNameWise(ShopName4,venName);
		
		return Inwardlist;

}

//with po 
public List getInwardDetailforvendorwithpo(HttpServletRequest request, HttpServletResponse response)
{
	String ShopName4 = request.getParameter("ShopName4");
	String venName = request.getParameter("venName");
	System.out.println("this is product Name for inwor produt Report In Helper"+venName);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTablevendorNameWisewithpo(ShopName4,venName);
		
		return Inwardlist;

}


public List getInwardDetailDatewise(HttpServletRequest request, HttpServletResponse response)
{
	String ShopName1 = request.getParameter("ShopName1");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	System.out.println("First date in Helper"+fisDate);
	System.out.println("End Date in Helper"+endDate);
	System.out.println("End Date in Helper"+ShopName1);
	
    Map<Long,GoodsReceiveBean> map = new HashMap<Long,GoodsReceiveBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTableDatewise(ShopName1,fisDate,endDate);
		
		return Inwardlist;

}

// With Po Report

public List getInwardDetailDatewiseWithPo(HttpServletRequest request, HttpServletResponse response)
{
	String ShopName1 = request.getParameter("ShopName1");
	String fisDate = request.getParameter("fisDate");
	String endDate = request.getParameter("endDate");
	System.out.println("First date in Helper"+fisDate);
	System.out.println("End Date in Helper"+endDate);
	System.out.println("End Date in Helper"+ShopName1);
	
    Map<Long,GoodsReceiveBean> map = new HashMap<Long,GoodsReceiveBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailTableDatewiseWithPo(ShopName1,fisDate,endDate);
		
		return Inwardlist;

}

public List getSaleDetailsAsPerOutwordChallan(HttpServletRequest request, HttpServletResponse response) {
	
	System.out.println("in helper");
	String ChallanNo = request.getParameter("OutwordChallan");
	String ShopName4 = request.getParameter("ShopName4");
	System.out.println("{{}}{{"+ChallanNo);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerOutwordChallan(ShopName4,ChallanNo);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;

}

public List getSaleDetailsAsPerInwordChallan(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String InwchallNo = request.getParameter("InwordChallan");
	String ShopName5 = request.getParameter("ShopName5");
	System.out.println("{{}}{{"+InwchallNo);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerInwordChallan(ShopName5,InwchallNo);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;
}

public List getSaleDetailsAsPerShopName(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String ShopName = request.getParameter("ShopName");
	System.out.println("{{}}{{"+ShopName);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerShopName(ShopName);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;
}

//Shop With Inward

public List getSaleDetailsAsPerShopNameInward(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String ShopName = request.getParameter("ShopName");
	System.out.println("{{}}{{"+ShopName);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerShopNameInward(ShopName);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;
}

//Shop with Outward
public List getSaleDetailsAsPerShopNameInwardOutward(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String ShopName = request.getParameter("ShopName");
	System.out.println("{{}}{{"+ShopName);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> expList = dao.getSaleDetailsAsPerShopNameInwardOutward(ShopName);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;
}

//bill Wise Report billNoWiseReport

public List billNoWiseReport(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String fisDatebill = request.getParameter("fisDatebill");
	String endDatebill = request.getParameter("endDatebill");
	System.out.println("{{}}{{"+endDatebill);
    Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<SaleReports> expList = dao.billNoWiseReport(fisDatebill,endDatebill);
	System.out.println("?????????????????????????}}}}}}}}}}"+expList);
	return expList;
}



public List getInwardDetailsTableforShopName(HttpServletRequest request, HttpServletResponse response) {
	String ShopName = request.getParameter("ShopName");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("this is product Name for inwor produt Report In Helper"+ShopName);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailsTableforShopName(ShopName);
		
		return Inwardlist;

}

//with Po 
public List getInwardDetailsTableforShopNamewithpo(HttpServletRequest request, HttpServletResponse response) {
	String ShopName = request.getParameter("ShopName");
	//String cat = request.getParameter("cat");
	//String fDate = request.getParameter("fDate");
	System.out.println("this is product Name for inwor produt Report In Helper"+ShopName);
	
    Map<Long,InwardBean> map = new HashMap<Long,InwardBean>();
		
     	GoodsReceiveDao dao = new GoodsReceiveDao();
		List<com.Fertilizer.hibernate.InwardBean> Inwardlist = dao.getInwardDetailsTableforShopNamewithpo(ShopName);
		
		return Inwardlist;

}
public List getgstpurchaseportAsPerRangeWise(HttpServletRequest request,
		HttpServletResponse response) {

	String fDate = request.getParameter("fisDatep");
	System.out.println("hi this is kishor date------------------------"+fDate);
    String tDate = request.getParameter("endDatep");
    System.out.println("hi this is kishor date+++++++++++++++++++++++"+tDate);
    Map<Long,GrDetailsBean> map = new HashMap<Long,GrDetailsBean>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<Object> exp1List1 = dao.getgstpurchaseportRangeWise(fDate,tDate);
	
	
	return exp1List1;


}

public List getgstpurchaseportAsPerRangeWise2(HttpServletRequest request,
		HttpServletResponse response) {

	String fDate = request.getParameter("fisDate");
    String tDate = request.getParameter("endDate");
	
    Map<Long,CustomerBillBean1> map = new HashMap<Long,CustomerBillBean1>();
	
    GoodsReceiveDao dao = new GoodsReceiveDao();
	List<CustomerBillBean1> exp1List1 = dao.getgstpurchaseportRangeWise2(fDate,tDate);
	
	
	return exp1List1;


}




}
