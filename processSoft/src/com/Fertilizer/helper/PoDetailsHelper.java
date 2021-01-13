package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transaction;

import org.hibernate.Session;

import com.Fertilizer.bean.SupplierGridBean;
import com.Fertilizer.bean.SupplierGridBean1;
import com.Fertilizer.bean.PoGridBean;
import com.Fertilizer.bean.PurchaseDetailsFromGoodsReceive;
import com.Fertilizer.dao.PoDetailsDao;
import com.Fertilizer.dao.StockDao;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.utility.HibernateUtility;
import com.Fertilizer.bean.SupplierGridBean2;

public class PoDetailsHelper {
	
	public void addpo(HttpServletRequest request,HttpServletResponse response) throws ParseException {

		System.out.println("In helper");
		PoDetailsDao dao=new PoDetailsDao();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		
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
		
		
		
		PoDetailsBean bean=new PoDetailsBean();
		
		for(int i =0 ; i< count;i++)
		{
			String productName = request.getParameter("productName"+i);
			String Operation = request.getParameter("Operation"+i);
			String quantity = request.getParameter("quantity"+i);
			String Rate = request.getParameter("Rate"+i);
			String unit = request.getParameter("unit"+i);
			String Total = request.getParameter("Total"+i);
			System.out.println("Hi THis Is Kishor+++++++++++-----------------///////+++++"+Total);
			//String ShopName = request.getParameter("ShopName");
			String IdNo = request.getParameter("IdNo");
			String suppliername = request.getParameter("suppliername");
			String purchaseDate = request.getParameter("purchaseDate");
			String contactNo = request.getParameter("contactNo");
			String city = request.getParameter("city");
			String tinNo = request.getParameter("tinNo");
			String address = request.getParameter("address");
			//String productName1 = request.getParameter("productName");
			String total = request.getParameter("total");
			System.out.println(" hi this is kishor ========="+total);
			String grossTotal = request.getParameter("grossTotal");

			System.out.println(" hi this is kishor GrossTotal========="+grossTotal);
			
			
			bean.setProductname(productName);
			bean.setOperation(Operation);
			bean.setQuantity(Double.parseDouble(quantity));
			bean.setRate(Double.parseDouble(Rate));
			bean.setUnit(unit);
			bean.setGridTotal(Double.parseDouble(Total));
			bean.setShop(shopName);
			bean.setIdno(IdNo);
			bean.setSuppliername(suppliername);
			
			Date  date1=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df.parse(purchaseDate);
			
			
			bean.setDate(date1);
			bean.setContactno(Long.parseLong(contactNo));
			bean.setCity(city);
			bean.setGstno(tinNo);
			bean.setAddress(address);
			bean.setTotal(Double.parseDouble(total));
			bean.setGrosstotal(Double.parseDouble(grossTotal));
			
			HttpSession session = request.getSession(true);
			String username = (String)session.getAttribute("user");
			String userid = (String)session.getAttribute("userid");
			String shopid = (String)session.getAttribute("shopid");
			String shopname=(String)session.getAttribute("shopname");
			
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			dao.valPoDetails(bean);
			
			
		}
		
	}
	
	//PO NO im imward
	public Map getPoByProduct(HttpServletRequest request,HttpServletResponse response) {
		
		String productName = request.getParameter("productName");
		
		HttpSession usersession = request.getSession(true);
		String userid = (String)usersession.getAttribute("userid");
		String shopid = (String)usersession.getAttribute("shopid");
		
		PoDetailsDao dao = new PoDetailsDao();
		List list= dao.getPoByProduct(productName,userid,shopid);
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			PoDetailsBean bean = new PoDetailsBean();
			bean.setIdno((o[0].toString()));
			bean.setDate((Date)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getIdno(),bean);
			
		}
		return map;
	
	}
	
	
	//this method use for set prpduct name to grid columan
	/*public SupplierGridBean1 getProductInGridOnSupplierPurchase1(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String itemName = request.getParameter("itemName");
		
		SupplierGridBean1 bean = new SupplierGridBean1();
		bean.setProductName(itemName);
		
		return bean;
	}*/
	
	// this method set rate and hsn for grid to poDetails
	public List getProductInGridOnSupplierPurchase1(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String itemName = request.getParameter("itemName");
		
		HttpSession usersession = request.getSession(true);
		String userid = (String)usersession.getAttribute("userid");
		String shopid = (String)usersession.getAttribute("shopid");
		
		PoDetailsDao dao = new PoDetailsDao();
		 Map<Long,PoDetailsBean> map = new HashMap<Long,PoDetailsBean>();
		 List<SupplierGridBean1> expL= dao.getPoDetailsByproductName(itemName,userid,shopid);
		 return expL;
		
	}

     //get product detail in good receive jsp for grid this is  harshad

	public List getProductInGridForGoodReceive(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String itemName = request.getParameter("itemName");
		
		PoDetailsDao dao = new PoDetailsDao();
		 Map<Long,PoDetailsBean> map = new HashMap<Long,PoDetailsBean>();
		 List<SupplierGridBean1> expL= dao.getGRDetailsByproductName(itemName);
		 return expL;
		
	}
	
	// this helper is for Adding data in to table and passinf to dao for GR by harshad
 
	public void addGR(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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

		System.out.println("In helper");
		PoDetailsDao dao=new PoDetailsDao();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		GrDetailsBean bean=new GrDetailsBean();
		
		for(int i =0 ; i< count;i++)
		{
			String productName = request.getParameter("productName"+i);
			String Operation = request.getParameter("Operation"+i);
			String quantity = request.getParameter("quantity"+i);
			String Rate = request.getParameter("Rate"+i);
			//this two field added 
			String Discount = request.getParameter("discount"+i);
			String GST = request.getParameter("gst"+i);
			String IGST = request.getParameter("igst"+i);
			System.out.println("hi this iGsts is "+IGST);
			String TaxAmount = request.getParameter("TaxAmount"+i);
			String unit = request.getParameter("unit"+i);
			String Total = request.getParameter("Total"+i);
			
			String IdNo = request.getParameter("IdNo");
			String BillNo = request.getParameter("BillNo");
			String suppliername = request.getParameter("suppliername");
			String purchaseDate = request.getParameter("purchaseDate");
			String contactNo = request.getParameter("contactNo");
			String city = request.getParameter("city");
			String tinNo = request.getParameter("tinNo");
			String address = request.getParameter("address");
			/*String ShopName = request.getParameter("ShopName");*/
			//String productName1 = request.getParameter("productName");
			String total = request.getParameter("total");
			String grossTotal = request.getParameter("grossTotal");
			
			
			bean.setProductname(productName);
			bean.setOperation(Operation);
			bean.setQuantity(Double.parseDouble(quantity));
			bean.setRate(Double.parseDouble(Rate));
			//add this to field
			bean.setDiscount(Double.parseDouble(Discount));
			bean.setGst(Double.parseDouble(GST));
			bean.setIgst(Double.parseDouble(IGST));
			bean.setTaxAmount(TaxAmount);
			bean.setUnit(unit);
			bean.setGridTotal(Double.parseDouble(Total));
			
			bean.setIdno(IdNo);
			bean.setSuppliername(suppliername);
			
			Date  date1=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df.parse(purchaseDate);
			
			
			bean.setDate(date1);
			bean.setContactno(Long.parseLong(contactNo));
			bean.setCity(city);
			bean.setGstno(tinNo);
			bean.setBillno(Double.parseDouble(BillNo));
			bean.setAddress(address);
			bean.setShopName(shopName);
			bean.setTotal(Double.parseDouble(total));
			bean.setGrosstotal(Double.parseDouble(grossTotal));
			
			
			HttpSession session = request.getSession(true);
			String username = (String)session.getAttribute("user");
			String userid = (String)session.getAttribute("userid");
			String shopid = (String)session.getAttribute("shopid");
			String shopname=(String)session.getAttribute("shopname");
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			dao.valGrDetails(bean);
			
			StockDao dao1 = new StockDao();
	        List stkList2  = dao1.getAllStockEntry();
	        
	        //If Stock Is Empty  
	        if(stkList2.size() == 0){
	        	System.out.println("In if block of stock empty");
	        	Stock newEntry = new Stock();
				
				
				newEntry.setProductName(productName);
				newEntry.setCompanyName("N/A");
				newEntry.setWeight(0d);
				newEntry.setQuantityinkg((Double.parseDouble(quantity)));
				//newEntry.setQuantityinbundle(Double.parseDouble(quantityinbundle));
				//System.out.println("for pscking qnty"+quantityinkg);
				newEntry.setUnpackedQuantity(0d);
				/*if(batchNo != null){
				newEntry.setBatchNum(batchNo);
				}else{*/
					newEntry.setBatchNum("N/A");
				//}
				StockDao dao2 = new StockDao();
				dao2.registerStock(newEntry);	
	        	
	        }
	        else //To Update Stock Table If It is Not Empty 
	        {
			    	   for(int j=0;j<stkList2.size();j++){
			             	
			             	Stock st = (Stock)stkList2.get(j);
			             	String itemName = st.getProductName();
			             	String company = st.getCompanyName();
			             	Double wight = st.getWeight();
			             	Long PkStockId = st.getPkStockId();
			             	//String batchNumber = st.getBatchNum();
			             	//If ItemName Is Already Exists In Stock Table  
			             	
			             	 //System.out.println("batchNumber from stock table"+batchNumber);
			         		// System.out.println("batchNo from goods receive"+batchNo);
			    	   System.out.println("In else Part");	
			    	  
			    	   if(productName.equals(itemName)){
			            		 System.out.println("inside If");
			    		   
			    		   			Double qunty = st.getQuantityinkg();
			    		   			//Double packQunty = st.getUnpackedQuantity();
			            		
			            		 Double updatequnty = (double) (qunty + Double.parseDouble(quantity));
			            		 //Double updatePackQunty = (double) (packQunty + Double.parseDouble(quantity));		 
			            		
			            		 HibernateUtility hbu = HibernateUtility.getInstance();
			            		 Session session2 = hbu.getHibernateSession();
			            		 org.hibernate.Transaction transaction = session2.beginTransaction();
			            		 
			            		 DateFormat df1 = new SimpleDateFormat("dd/MM/yyyy");
			            		 Date date2 = new Date();
			            	
			            	     Stock updateStock = (Stock) session2.get(Stock.class, new Long(PkStockId));
			            		 updateStock.setUpdateDate(date2);
			            		 updateStock.setQuantityinkg(updatequnty);
			            		// updateStock.setUnpackedQuantity(updatePackQunty);
			            		 
			            		session2.saveOrUpdate(updateStock);
			            		transaction.commit();
			            		break;
			            	}
			            	else
			            	{
			            		//ItemName is Not Exists 
			            		if(j+1 == stkList2.size()){
			            			
			            			Stock newEntry = new Stock();
			            			
			            			
			            			newEntry.setProductName(productName);
			            			//newEntry.setCompanyName(companyName);
			            			newEntry.setWeight(0d);
			            			newEntry.setQuantityinkg(Double.parseDouble(quantity));
			            			//newEntry.setUnpackedQuantity(Double.parseDouble(quantity));
			            			//newEntry.setBatchNum("N/A");
			            			StockDao dao2 = new StockDao();
			            			dao2.registerStock(newEntry);
			            			
			            		}
			            	}
			            	
			        		
			        	
	          }	
			
	        }
		}
		
	}

	public List getPoDetailsAsPerVendorWise(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String VendorName = request.getParameter("VendorName");
		String ShopName1 = request.getParameter("ShopName1");
		//String GridTotal =request.getParameter("GridTotal");
		System.out.println("{{}}{{"+VendorName);
	    PoDetailsDao dao = new PoDetailsDao();
		List<PoDetailsBean> expList = dao.getPoDetailsAsPerVendorWise(ShopName1,VendorName);
		System.out.println("?????????????????????????}}}}}}}}}}"+expList);
		return expList;
	}

	public List getPoDetailsAsPerRangeWise(HttpServletRequest request, HttpServletResponse response) {

		String ShopName2 = request.getParameter("ShopName2");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		PoDetailsDao dao = new PoDetailsDao();
		List<PoDetailsBean> expList = dao.getPoDetailsAsPerRangeWise(ShopName2,fisDate,endDate);
		System.out.println("?????????????????????????}}}}}}}}}}"+expList);
		return expList;
	}

	public List getPoDetailsAsPerShopWise(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String ShopName = request.getParameter("ShopName");
		System.out.println("{{}}{{"+ShopName);
	   // Map<Long,PoDetailsBean> map = new HashMap<Long,PoDetailsBean>();
		
	    PoDetailsDao dao = new PoDetailsDao();
		List<PoDetailsBean> expList = dao.getPoDetailsAsPerShopWise(ShopName);
		System.out.println("?????????????????????????}}}}}}}}}}"+expList);
		return expList;
	}
	
}
