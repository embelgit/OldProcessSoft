package com.Fertilizer.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.CustomerBean;
//import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.bean.GoodsReceiveBean;
import com.Fertilizer.bean.GoodsReceiveDetail;
import com.Fertilizer.bean.PurchaseDetailsFromGoodsReceive;
import com.Fertilizer.bean.SaleReports;
import com.Fertilizer.bean.StockDetail;
import com.Fertilizer.hibernate.CotainerGoodsReceiveBean;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.InwardProcessingInformation;
import com.Fertilizer.hibernate.Packing_InfoBean;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.VendorPaymentBean;
import com.Fertilizer.utility.HibernateUtility;

public class GoodsReceiveDao {

	// get Last Bill No 
			public List getLastBillNo() {
				// TODO Auto-generated method stub
				HibernateUtility hbu=null;
				Session session=null;
				List<BillBean> saleList=null;
				try
				{
					hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 Query query = session.createSQLQuery("SELECT BillNo , pk_goods_receive_id FROM goods_receive ORDER BY BillNo DESC LIMIT 1");
					
					List<Object[]> list = query.list();
					 saleList= new ArrayList<BillBean>(0);
					for (Object[] object : list) {
						System.out.println(Arrays.toString(object));
						BillBean reports = new BillBean();
						reports.setBillNo(Long.parseLong(object[0].toString()));
						saleList.add(reports);	 
				}}
				catch(Exception e)
				{
					e.printStackTrace();	
				}finally
				{if(session!=null){
					session.close();	
				}
				}
				return saleList;
			}
			
			// get all bill no 
			public List getAllSupplier1()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
			 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from GrDetailsBean");
					 list = query.list(); 
				} catch (RuntimeException e) {
					Log.error("Error in getAllSupllier", e);
				}
				 
				 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
						return list;
				
			}
			
			// to get all outward challan no 
			public List getAllOutwards()
			{
					HibernateUtility hbu = null;
					Session session =  null;
					Query query = null;
					 List<InwardBean> list = null;
					 try {
						 hbu = HibernateUtility.getInstance();
						 session = hbu.getHibernateSession();
						query = session.createQuery("from InwardBean");
						 /*query = session.createQuery("from CustomerDetailsBean");*/
						 list = query.list(); 
					} catch (Exception e) {
						Log.error("Error in getAllPriduct", e);
					}
					 
					 finally
					 {
						 if (session!=null) {
							hbu.closeSession(session);
						}
					 }
						
							return list;
					
				}
			
			// to get all outward challan no 
						public List getAllOutwardsChallan()
						{
								HibernateUtility hbu = null;
								Session session =  null;
								Query query = null;
								 List<InwardBean> list = null;
								 try {
									 hbu = HibernateUtility.getInstance();
									 session = hbu.getHibernateSession();
									query = session.createQuery("from InwardBean");
									 /*query = session.createQuery("from CustomerDetailsBean");*/
									 list = query.list(); 
								} catch (Exception e) {
									Log.error("Error in getAllPriduct", e);
								}
								 
								 finally
								 {
									 if (session!=null) {
										hbu.closeSession(session);
									}
								 }
									
										return list;
								
							}

	public void addGoodsReceive(InwardBean bean) {
		
        System.out.println("IN DAO");
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;

		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			
		

			System.out.println("Tx started");
			
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");

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

	}
	
	public void addInwardProcessingInfo(InwardProcessingInformation bean) {
		
        System.out.println("IN DAO");
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		System.out.println("IN DAO addInwardProcessingInfo 0");
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");
			
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
			System.out.println("IN DAO addInwardProcessingInfo 1");
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

	}
	
	// Without Po Deatails Adding Data By kishor
	public void addGoodsReceiveWithOUt(InwardBean bean) {
		
        System.out.println("IN DAO");
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;

		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			
		

			System.out.println("Tx started");
			
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");

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





	}
	
	
	
public void addGoodsReceive(CotainerGoodsReceiveBean bean) {
		
        System.out.println("IN DAO");
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;

		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			System.out.println("Tx started");
			
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
			
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

	}
	
	
	public List<CustomerBean> getAllItemDetails(String key){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<CustomerBean> itemlist=null;
		try
		{
			
			    System.out.println("shreemant");
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String sqlQuery = "SELECT pk_goods_receive_id , fk_supplier_id, fkCategoryId, product_name , sale_price, weight, dupQuantity, mrp, company_Name, barcodeNo, tax_percentage,batch_no FROM goods_receive WHERE barcodeNo ="+key;

		 Query query=session.createSQLQuery(sqlQuery);
			List<Object[]> list = query.list();
	
			 itemlist = new ArrayList<CustomerBean>(0);
		     for (Object[] objects : list) {
			 System.out.println(Arrays.toString(objects));
			 CustomerBean bean = new CustomerBean();
			 System.out.println("itemlist");
			 bean.setPkGoodreceiveId(Long.parseLong(objects[0].toString()));
			 bean.setSupplier_id(Long.parseLong(objects[1].toString()));
			 bean.setCat_id(Long.parseLong(objects[2].toString()));
			 bean.setItemName(objects[3].toString());
			 bean.setSalePrice(Double.parseDouble(objects[4].toString()));
			 bean.setWeight(Double.parseDouble(objects[5].toString()));
			 bean.setQuantity(0d);
			 bean.setMrp(Double.parseDouble(objects[7].toString()));
			 bean.setCompanyName(objects[8].toString());
			 bean.setBarcodeNo(Long.parseLong(objects[9].toString()));
			 bean.setVatPercentage(Double.parseDouble(objects[10].toString()));
			 bean.setUnitName("Kg");
			 bean.setBatchNumber(objects[11].toString());
			 System.out.println("itemlist");
			
			itemlist.add(bean);
			
		     }
		}
		catch(RuntimeException e)
		{
			Log.error("Error in getAllItemDetails(String key)", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		return itemlist;
		
		
}
	
	//seed billing by barcode
	public List<CustomerBean> getPesticideDetailByBarocde(String key){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<CustomerBean> itemlist=null;
		try
		{
			
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String sqlQuery = "SELECT pk_goods_receive_id , fk_supplier_id, fkCategoryId, product_name , sale_price, weight, dupQuantity, mrp, company_Name, barcodeNo, tax_percentage,batch_no FROM goods_receive WHERE barcodeNo ="+key;

		 Query query=session.createSQLQuery(sqlQuery);
			List<Object[]> list = query.list();
	
			 itemlist = new ArrayList<CustomerBean>(0);
		     for (Object[] objects : list) {
			 System.out.println(Arrays.toString(objects));
			 CustomerBean bean = new CustomerBean();
			 System.out.println("itemlist");
			 bean.setPkGoodreceiveId(Long.parseLong(objects[0].toString()));
			 bean.setSupplier_id(Long.parseLong(objects[1].toString()));
			 bean.setCat_id(Long.parseLong(objects[2].toString()));
			 bean.setItemName(objects[3].toString());
			 bean.setSalePrice(Double.parseDouble(objects[4].toString()));
			 bean.setWeight(Double.parseDouble(objects[5].toString()));
			 bean.setQuantity(0d);
			 bean.setMrp(Double.parseDouble(objects[7].toString()));
			 bean.setCompanyName(objects[8].toString());
			 bean.setBarcodeNo(Long.parseLong(objects[9].toString()));
			 bean.setVatPercentage(Double.parseDouble(objects[10].toString()));
			 bean.setUnitName("Ml");
			 bean.setBatchNumber(objects[11].toString());
			 System.out.println("itemlist");
			
			itemlist.add(bean);
			
		     }
		}
		catch(RuntimeException e)
		{
			Log.error("Error in getAllItemDetails(String key)", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		return itemlist;
		
		
}
	
	
	//to get barcode no in goodrecive
public List getLastBarcodeNo(){
		
		
		HibernateUtility hbu=null;
		Session session=null;
		List<BillBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT pk_goods_receive_id , barcodeNo FROM goods_receive ORDER BY barcodeNo DESC LIMIT 1");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<BillBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				BillBean reports = new BillBean();
				reports.setBarcodeNo(Long.parseLong(object[1].toString()));
				saleList.add(reports);	 
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}finally
		{if(session!=null){
			session.close();	
		}
		}
		return saleList;	
		
		
	}
public List<Object> getgstpurchaseportRangeWise(String fDate, String tDate) {
	// TODO Auto-generated method stub
	HibernateUtility hbu = null;
	Session session = null;
	//List<GrDetailsBean> catList = null;
	List<GrDetailsBean> saleList=null;
	List<GrDetailsBean> saleList1=null;
	List<Object> mixedList=null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Double tpersent = 0.0;
		Double totalamount =0.0;
		Double gst = 0.0;
		Double tamount = 0.0;
		Double tTax = 0.0;
		Double Igst =0.0;
		String abc=null;
		System.out.println("Before SQL Query In Helper");
		Query query2 = session.createSQLQuery("SELECT  gst, sum(rate * quantity),SUM(TaxAmount) from gr_details WHERE date BETWEEN :fisDatep AND :endDatep and gst>0 GROUP BY gst");
		System.out.println("After SQL");
		query2.setParameter("fisDatep", fDate);
		query2.setParameter("endDatep", tDate);
		List<Object[]> list = query2.list();
		saleList = new ArrayList<GrDetailsBean>(0);

		for (Object[] object : list) {

			GrDetailsBean reports = new GrDetailsBean();
		
			
			reports.setGst(Double.parseDouble(object[0].toString()));
			tpersent = Double.parseDouble(object[1].toString());
			//reports.settValue(object[2].toString());
			tamount = Double.parseDouble(object[2].toString());
			totalamount =tpersent+tamount;
			reports.settValue(Double.toString(totalamount));
			//gst = (tamount * (tpersent/2))/100;
			gst=tamount/2;
			reports.setCgst(Double.toString(gst));
			reports.setSgst(Double.toString(gst));
			tTax = gst*2;
			reports.setTotalgst(Double.toString(tTax));
			reports.setIGst(Double.toString(0.0));
			saleList.add(reports);

		}
		
		Query query3 = session.createSQLQuery("SELECT  igst, sum(rate * quantity),SUM(TaxAmount) from gr_details WHERE date BETWEEN :fisDatep AND :endDatep  and igst>0 GROUP BY igst");
		System.out.println("After SQL");
		query3.setParameter("fisDatep", fDate);
		query3.setParameter("endDatep", tDate);
		//query3.setParameter("abc", abc);
		List<Object[]> list1 = query3.list();
		saleList1 = new ArrayList<GrDetailsBean>(0);

		for (Object[] object : list1) {

			GrDetailsBean reports = new GrDetailsBean();
		
			
			reports.setGst(Double.parseDouble(object[0].toString()));
			tpersent = Double.parseDouble(object[1].toString());
			System.out.println(" hi this is Kishor Total value is==== "+tpersent);
			
			tamount = Double.parseDouble(object[2].toString());
			System.out.println(" hi this is Kishor Tax value is==== "+tamount);
			totalamount= tpersent+tamount;
			System.out.println(" hi this is Kishor Total Final amount  value is==== "+totalamount);
			reports.settValue(Double.toString(totalamount));
			System.out.println(" hi this is Kishor Total Final amount value is==== ++++++"+totalamount);
			reports.setCgst(Double.toString(0.0));
			reports.setSgst(Double.toString(0.0));
			
			reports.setTotalgst(Double.toString(tamount));
			
			reports.setIGst(Double.toString(tamount));
			saleList1.add(reports);

		}
		

		mixedList = new ArrayList<Object>(saleList1.size() + saleList.size());
		mixedList.addAll(saleList);
		mixedList.addAll(saleList1);
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mixedList;
}

// new code for vendor payment 
//add book stock
public void addVendorNew(VendorPaymentBean VendorBean) {

	
	HibernateUtility hbu=null;
	Session session=null;
	Transaction transaction=null;
	
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();
	session.save(VendorBean);
	transaction.commit();
	}
	
	catch(RuntimeException e){
		try{
			transaction.rollback();
		}catch(Exception rbe)
		{
			rbe.printStackTrace();
		}	
	}finally{
	hbu.closeSession(session);
	}
	

	
}

//gst purchase report as range
public List<CustomerBillBean1> getgstpurchaseportRangeWise2(String fDate, String tDate) {
	// TODO Auto-generated method stub
	HibernateUtility hbu = null;
	Session session = null;
	List<CustomerBillBean1> catList = null;
	try {
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Double tpersent = 0.0;
		Double gst = 0.0;
		Double tamount = 0.0;
		Double tTax = 0.0;
		System.out.println("Before SQL Query In Helper");
		Query query2 = session.createSQLQuery("SELECT  gst, sum(gross_Total - tax_amount) from bill_details WHERE sale_Date BETWEEN :startDate1 AND :enddate1 GROUP BY gst");
		System.out.println("After SQL");
		query2.setParameter("fisDate", fDate);
		query2.setParameter("endDate", tDate);
		List<Object[]> list = query2.list();
		catList = new ArrayList<CustomerBillBean1>(0);

		for (Object[] object : list) {

			CustomerBillBean1 reports = new CustomerBillBean1();
		
			
			reports.setGst(Long.parseLong(object[0].toString()));
			
			tpersent = Double.parseDouble(object[0].toString());
			
			reports.settValue(object[1].toString());
			tamount = Double.parseDouble(object[1].toString());
			gst = (tamount * (tpersent/2))/100;
			
			reports.setCgst(Double.toString(gst));
			reports.setSgst(Double.toString(gst));
			
			tTax = gst*2;
			System.out.println("********************************************"+tTax);
			reports.setTotalgst(Double.toString(tTax));
			
			catList.add(reports);

		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return catList;
}



	public void updateProductStatus(Long prodctId ){
		System.out.println(prodctId+"PRODUCT ID");
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		Long status = 2l;
		try{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			String hql = "UPDATE product_details set status ="+status +"  " + 
					"WHERE pk_product_id =:prodctId";
			Query query = session.createSQLQuery(hql);
			query.setParameter("prodctId", prodctId);
			int result = query.executeUpdate();
			System.out.println("Rows affected: " + result);


			transaction.commit();
			System.out.println("Updated Successfully");
		}catch (Exception e) {
			if (transaction!=null) transaction.rollback();
			e.printStackTrace(); 
		}finally {
			session.close(); 
		}
	}


	public List getAllDcNumbersBySuppliers(String supplierId) {

		HibernateUtility hbu = null ;
		Session session = null;
		List list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select p.dc_number,p.insert_date from purchase_order p where p.fk_supplier_id="+supplierId);
			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}

	public List getPODetailsForGoodsReceive(String dcNum, String supplier) {


		HibernateUtility hbu = null ;
		Session session = null;
		List list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("select  p.fk_product_id, p.product_name, p.buy_price, p.sale_price, p.quantity, p.weight from purchase_order p where p.fk_supplier_id= " + supplier+"  "+" and"+ "  "+ "  p.dc_number= "+dcNum);

			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		return list;
	}



public List<PurchaseDetailsFromGoodsReceive> getPurchaseReportsBetweenTwoDates(
			String fDate, String tDate) {
		


		System.out.println(fDate+"first Date In dao");
		System.out.println(tDate+"Second Date In dao");
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseDetailsFromGoodsReceive> purchaseList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query2 = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name,  dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), Per_Product_Total from goods_receive where purchaseDate between '" + fDate +"' and '"+tDate+"'");
			
	        List<Object[]> list = query2.list();
	        purchaseList= new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
			
			
			for (Object[] object : list) {
					
				PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
				
				reports.setBillNo(object[0].toString());
				reports.setPurchaseDate(object[1].toString());
				reports.setProductName(object[2].toString());
				reports.setCompanyName(object[3].toString());
				reports.setDcNo(object[4].toString());
				//reports.setBatchNo(object[5].toString());
				reports.setBarcodeNo(object[6].toString());
				reports.setBuyPrice(Double.parseDouble(object[7].toString()));
				reports.setSalePrice(Double.parseDouble(object[8].toString()));
				reports.setMrp(Double.parseDouble(object[9].toString()));
				reports.setWeight(Double.parseDouble(object[10].toString()));
				reports.setQuantity2(Double.parseDouble(object[11].toString()));
				reports.setTotalAmount(Double.parseDouble(object[12].toString()));
				
				purchaseList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return purchaseList;
		
		
	}

/*Upcoming expiry Date seed products*/
	public List upcomingExpirySeedProducts(){
		HibernateUtility hbu=null;
		Session session=null;
		List<GoodsReceiveDetail> expiryList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 
		 SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
			Date dateobj = new Date();
			String todayDate = dateFormat1.format(dateobj);
		 
		 Query query2 = session.createSQLQuery("SELECT product_name, company_Name, weight, batch_no,expiry_date,dupQuantity FROM goods_receive WHERE fkCategoryId=3 AND DATEDIFF(expiry_date,"+todayDate+")<=10 AND DATEDIFF(expiry_date,"+todayDate+")>0");
			
	        List<Object[]> list = query2.list();
	        System.out.println("Expiry List size = ="+list.size());
	        expiryList= new ArrayList<GoodsReceiveDetail>(0);
			
			
			for (Object[] o : list) {
					
				GoodsReceiveDetail reports = new GoodsReceiveDetail();
				reports.setProductName(o[0].toString());
				reports.setCompany(o[1].toString());
				reports.setWeight(o[2].toString());
				reports.setBatchNumber(o[3].toString());
				reports.setExpiryDate(o[4].toString());
				reports.setStock(o[5].toString());
				expiryList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return expiryList;
		
	}

	
	/*Upcoming expiry Date pesticide products*/
	public List upcomingExpiryPesticideProducts(){
		HibernateUtility hbu=null;
		Session session=null;
		List<GoodsReceiveDetail> expiryList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 
		 SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
			Date dateobj = new Date();
			String todayDate = dateFormat1.format(dateobj);
		 
		 Query query2 = session.createSQLQuery("SELECT product_name, company_Name, weight, batch_no,expiry_date,dupQuantity FROM goods_receive WHERE fkCategoryId=2 AND DATEDIFF(expiry_date,"+todayDate+")<=10 AND DATEDIFF(expiry_date,"+todayDate+")>0");
			
	        List<Object[]> list = query2.list();
	        System.out.println("Expiry List size = ="+list.size());
	        expiryList= new ArrayList<GoodsReceiveDetail>(0);
			
			
			for (Object[] o : list) {
					
				GoodsReceiveDetail reports = new GoodsReceiveDetail();
				reports.setProductName(o[0].toString());
				reports.setCompany(o[1].toString());
				reports.setWeight(o[2].toString());
				reports.setBatchNumber(o[3].toString());
				reports.setExpiryDate(o[4].toString());
				reports.setStock(o[5].toString());
				expiryList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return expiryList;
		
	}
	
	
	public List getAllProductForNotification()
	{
		List<GoodsReceiveDetail> List = new ArrayList<GoodsReceiveDetail> ();
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		String DB_URL = "jdbc:mysql://localhost:3306/fertilizer";
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
		Date dateobj = new Date();
		String todayDate = dateFormat1.format(dateobj);
		//Class.forName("com.mysql.jdbc.Driver");
		
		  Connection conn = null;
		  PreparedStatement  stmt = null;
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,"root","root");

		      //STEP 4: Execute a query
		      System.out.println("Creating statement...");
		      String sql;
		      sql = "SELECT g.product_name, g.batch_no, g.expiry_date,i.stock FROM goods_receive g RIGHT JOIN item_stockforpestiandseed i ON g.batch_no = i.batchNo WHERE g.fkCategoryId in (2,3) AND DATEDIFF(g.expiry_date,"+todayDate+")<=10 AND DATEDIFF(g.expiry_date,"+todayDate+")>0";
		      stmt = conn.prepareStatement(sql);
		    //  stmt.setString(1,todayDate);
		      //stmt.setString(2,todayDate);
		      ResultSet rs = stmt.executeQuery(sql);

		     // List<GoodsReceiveDetail> List = new ArrayList<GoodsReceiveDetail> ();
		      //STEP 5: Extract data from result set
		      while(rs.next()){
		    	  GoodsReceiveDetail reports = new GoodsReceiveDetail();
					reports.setProductName(rs.getString(1));
					reports.setBatchNumber(rs.getString(2));
					reports.setExpiryDate(rs.getString(3).toString());
					reports.setStock(rs.getString(4).toString());
					
					List.add(reports); 

		      }
		      //STEP 6: Clean-up environment
		      rs.close();
		      stmt.close();
		      conn.close();
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("Goodbye!");
		   return List;
		/*HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		List<GoodsReceiveDetail> productList = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 
			 session = hbu.getHibernateSession();
			
			 Date dateobj = new Date();
			 SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
				
				String todayDate = dateFormat1.format(dateobj);
				
			 System.out.println(dateobj+"in dao");
			// query = session.createSQLQuery("SELECT g.product_name, g.batch_no, g.expiry_date,s.supplier_name FROM goods_receive g RIGHT JOIN supplier_details s ON g.fk_supplier_id = s.pk_supplier_id WHERE g.fkCategoryId in (2,3);");
			 query = session.createSQLQuery("SELECT g.product_name, g.batch_no, g.expiry_date,i.stock FROM goods_receive g RIGHT JOIN item_stockforpestiandseed i ON g.batch_no = i.batchNo WHERE g.fkCategoryId in (2,3) AND DATEDIFF(g.expiry_date,"+todayDate+")<=10 AND DATEDIFF(g.expiry_date,"+todayDate+")>0;");
			
				System.out.println(dateFormat1.format(dateobj));
				
			 
			 List<Object[]> List = query.list();
				productList = new ArrayList<GoodsReceiveDetail>(0);
				
				System.out.println(List.size()+"List Size");
				
				for (Object[] object : List) {
					
					GoodsReceiveDetail reports = new GoodsReceiveDetail();
					reports.setProductName(object[0].toString());
					reports.setBatchNumber(object[1].toString());
					reports.setExpiryDate(object[2].toString());
					reports.setStock(object[3].toString());
					
					
					productList.add(reports); 
					System.out.println(reports);
			
				}
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return productList;
		*/
	}
	
/*	Seed stock less than 10 for Notification*/
	public List getAllSeedAndPestiForStockNotification()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		List<GoodsReceiveDetail> productList = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select ProductName, CompanyName, Weight,batch_number,Quantity from stock_detail WHERE Quantity < 10 AND FkCatId= 3");
			
				
			 
			 List<Object[]> List = query.list();
				productList = new ArrayList<GoodsReceiveDetail>(0);
				
				System.out.println(List.size()+"List Size");
				
				for (Object[] object : List) {
					
					GoodsReceiveDetail reports = new GoodsReceiveDetail();
					reports.setProductName(object[0].toString());
					reports.setCompany(object[1].toString());
					reports.setWeight(object[2].toString());
					reports.setBatchNumber(object[3].toString());
					reports.setStock(object[4].toString());
					productList.add(reports); 
					System.out.println(reports);
			
				}
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return productList;
		
	}
	
	
/*	Pesticide stock less than 10 for notification*/
	public List getPestiStockForStockNotification()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		List<GoodsReceiveDetail> productList = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select ProductName, CompanyName, Weight,batch_number,Quantity from stock_detail WHERE Quantity < 10 AND FkCatId= 2");
			
				
			 
			 List<Object[]> List = query.list();
				productList = new ArrayList<GoodsReceiveDetail>(0);
				
				System.out.println(List.size()+"List Size");
				
				for (Object[] object : List) {
					
					GoodsReceiveDetail reports = new GoodsReceiveDetail();
					reports.setProductName(object[0].toString());
					reports.setCompany(object[1].toString());
					reports.setWeight(object[2].toString());
					reports.setBatchNumber(object[3].toString());
					reports.setStock(object[4].toString());
					
					
					
					productList.add(reports); 
					System.out.println(reports);
			
				}
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return productList;
		
	}
	
	
	
	
	
	public List getAllFertilizerForStockNotification()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		List<GoodsReceiveDetail> productList = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select ProductName, CompanyName, Weight,Quantity from stock_detail WHERE Quantity < 10 AND FkCatId= 1");
			
				
			 
			 List<Object[]> List = query.list();
				productList = new ArrayList<GoodsReceiveDetail>(0);
				
				System.out.println(List.size()+"List Size");
				
				for (Object[] object : List) {
					
					GoodsReceiveDetail reports = new GoodsReceiveDetail();
					reports.setProductName(object[0].toString());
					reports.setCompany(object[1].toString());
					reports.setWeight(object[2].toString());
					reports.setStock(object[4].toString());
					productList.add(reports); 
					System.out.println(reports);
			
				}
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return productList;
		
	}



	//container stock
	public List<Packing_InfoBean> StockDetailsOfcontainer(String containerName,String capacity,String unitId) {

		HibernateUtility hbu=null;
		Session session=null;
		List<Packing_InfoBean> stockList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT container_name,capacity,unit,updated_date,quantity from container_stock_detail  WHERE container_name='"+containerName+"' and capacity='"+capacity+"'");
			List<Object[]> list = query.list();
			stockList = new ArrayList<Packing_InfoBean>(0);
			
			
			for (Object[] object : list) {
				
				Packing_InfoBean reports = new Packing_InfoBean();
				
				reports.setContainerName(object[0].toString());
				reports.setPacking_Type((object[1].toString()));
				reports.setUnitName(object[2].toString());
				reports.setUpadatedate(object[3].toString());
				reports.setQuantity(Double.parseDouble((object[4].toString())));
				stockList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return stockList;	
		
	
	
	
	}
	
	//container stock
		public List<ProductDetailsBean> PackedAndUnpackedStock(String productname,String fk_cat_id,String fk_subcat_id) {

			HibernateUtility hbu=null;
			Session session=null;
			List<ProductDetailsBean> stockList = null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT ProductName,CompanyName,Quantity,unpacked_Quantity,UpdateDate from stock_detail  WHERE ProductName='"+productname+"' and FkCatId='"+fk_cat_id+"' and FkSubCatId='"+fk_subcat_id+"'");
				List<Object[]> list = query.list();
				stockList = new ArrayList<ProductDetailsBean>(0);
				
				
				for (Object[] object : list) {
					
					ProductDetailsBean reports = new ProductDetailsBean();
					
					reports.setProductName(object[0].toString());
					reports.setManufacturingCompany((object[1].toString()));
					reports.setQuantity(Double.parseDouble(object[2].toString()));
					reports.setUnpackedQuantity(Double.parseDouble((object[3].toString())));
					
					Double unpcked=Double.parseDouble((object[3].toString()));
					Double total=Double.parseDouble((object[2].toString()));
					Double packed=total-unpcked;
					
					reports.setPackedQuantity(packed);
					reports.setUpdateDate(object[4].toString());
					stockList.add(reports); 
			
				}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return stockList;	
			
		
		
		
		}


	
	
	public List getAllBillNo()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from GoodsReceiveBean group by billNum");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllSupllier", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	public List getAllCompanyName()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from InwardBean group by suppliername");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllSupllier", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}


// get All Purchase Item Name In Purchase Return Form
	public List getAllIetmByBillNo(String bill_no, String supplier) {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();
			 
			//Query query=session.createSQLQuery("SELECT p.pk_goods_receive_id ,s.supplier_name,p.dc_number,p.product_name,p.buy_price,p.sale_price,p.weight,p.quantity,p.batch_no,p.fkCategoryId,p.purchaseDate,p.mrp,p.tax_percentage,p.barcodeNo,p.company_Name,p.dupQuantity,c.cat_name from goods_receive p left JOIN supplier_details s on p.fk_supplier_id = s.pk_supplier_id left JOIN categories c on p.fkCategoryId = c.pk_cat_id WHERE p.bill_number=:bill_no AND p.fk_supplier_id=:supplier");
			Query query=session.createSQLQuery("select pk_gr_id,idno,suppliername,date,productname,operation,quantity,rate,unit,total,grosstotal,discount,gst,billno,GridTotal,TaxAmount,igst  from gr_details WHERE billno =:bill_no and suppliername=:supplier");
			
			 query.setParameter("bill_no", bill_no);
			 query.setParameter("supplier", supplier);
			
			 list = query.list();
			 
			System.out.println(list.size()+"===List size");
			}catch(RuntimeException e){
				
			Log.error("Error in getProductDetails",e);
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;
	}
	
	// Get All OutwardChalan No From Outward Details 
	public List getAllIetmByOutwardChallanNo(String bill_no, String supplier) {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();
			 
			//Query query=session.createSQLQuery("SELECT p.pk_goods_receive_id ,s.supplier_name,p.dc_number,p.product_name,p.buy_price,p.sale_price,p.weight,p.quantity,p.batch_no,p.fkCategoryId,p.purchaseDate,p.mrp,p.tax_percentage,p.barcodeNo,p.company_Name,p.dupQuantity,c.cat_name from goods_receive p left JOIN supplier_details s on p.fk_supplier_id = s.pk_supplier_id left JOIN categories c on p.fkCategoryId = c.pk_cat_id WHERE p.bill_number=:bill_no AND p.fk_supplier_id=:supplier");
			Query query=session.createSQLQuery("select pk_outward_id,IdNo,suppliername,hsn,challan_No,outwardchallan_no,inwardDate,outward_date,productName,description,rate,okquantity,unprocessquantity,rejectedquantity,operation,vechicleNo,ShopName,boxDescripation from outward_details WHERE outwardchallan_no=:bill_no AND  suppliername=:supplier ");
			
			 query.setParameter("bill_no", bill_no);
			 query.setParameter("supplier", supplier);
			
			 list = query.list();
			 
			System.out.println(list.size()+"===List size");
			}catch(RuntimeException e){
				
			Log.error("Error in getProductDetails",e);
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;
	}
	
	public List<CustomerBean> getAllProductDetailsForFrtiBillAsPerProductName(
			String proName, String company, String weight) {

		
		HibernateUtility hbu=null;
		Session session=null;
		List<CustomerBean> itemlist=null;
		try
		{
			
			    System.out.println("shreemant");
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String sqlQuery = "SELECT pk_goods_receive_id , fk_supplier_id, fkCategoryId, product_name , sale_price, weight, dupQuantity, mrp, company_Name, barcodeNo, tax_percentage FROM goods_receive WHERE product_name =:proName AND company_Name =:company AND weight =:weight";
		
		 Query query=session.createSQLQuery(sqlQuery);
		 query.setParameter("proName", proName);
		 query.setParameter("company", company);
		 query.setParameter("weight", weight);
			List<Object[]> list = query.list();
	
			 itemlist = new ArrayList<CustomerBean>(0);
		     for (Object[] objects : list) {
			 System.out.println(Arrays.toString(objects));
			 CustomerBean bean = new CustomerBean();
			 System.out.println("itemlist");
			 bean.setPkGoodreceiveId(Long.parseLong(objects[0].toString()));
			 bean.setSupplier_id(Long.parseLong(objects[1].toString()));
			 bean.setCat_id(Long.parseLong(objects[2].toString()));
			 bean.setItemName(objects[3].toString());
			 bean.setSalePrice(Double.parseDouble(objects[4].toString()));
			 bean.setWeight(Double.parseDouble(objects[5].toString()));
			 bean.setQuantity(Double.parseDouble(objects[6].toString()));
			 bean.setMrp(Double.parseDouble(objects[7].toString()));
			 bean.setCompanyName(objects[8].toString());
			 bean.setBarcodeNo(Long.parseLong(objects[9].toString()));
			 bean.setVatPercentage(Double.parseDouble(objects[10].toString()));
			 
			 System.out.println("itemlist");
			
			itemlist.add(bean);
			
		     }
		}
		catch(RuntimeException e)
		{
			Log.error("Error in getAllItemDetails(String key)", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		return itemlist;
		
		

	}



/*	public List<CustomerBean> getAllProductDetailsForFrtiBillAsPerProductName(
			String proName, String company, String weight) {

		
		HibernateUtility hbu=null;
		Session session=null;
		List<CustomerBean> itemlist=null;
		try
		{
			
			    System.out.println("shreemant");
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String sqlQuery = "SELECT pk_goods_receive_id , fk_supplier_id, fkCategoryId, product_name , sale_price, weight, dupQuantity, mrp, company_Name, barcodeNo, tax_percentage FROM goods_receive WHERE product_name =:proName AND company_Name =:company AND weight =:weight";
		
		 Query query=session.createSQLQuery(sqlQuery);
		 query.setParameter("proName", proName);
		 query.setParameter("company", company);
		 query.setParameter("weight", weight);
			List<Object[]> list = query.list();
	
			 itemlist = new ArrayList<CustomerBean>(0);
		     for (Object[] objects : list) {
			 System.out.println(Arrays.toString(objects));
			 CustomerBean bean = new CustomerBean();
			 System.out.println("itemlist");
			 bean.setPkGoodreceiveId(Long.parseLong(objects[0].toString()));
			 bean.setSupplier_id(Long.parseLong(objects[1].toString()));
			 bean.setCat_id(Long.parseLong(objects[2].toString()));
			 bean.setItemName(objects[3].toString());
			 bean.setSalePrice(Double.parseDouble(objects[4].toString()));
			 bean.setWeight(Double.parseDouble(objects[5].toString()));
			 bean.setQuantity(Double.parseDouble(objects[6].toString()));
			 bean.setMrp(Double.parseDouble(objects[7].toString()));
			 bean.setCompanyName(objects[8].toString());
			 bean.setBarcodeNo(Long.parseLong(objects[9].toString()));
			 bean.setVatPercentage(Double.parseDouble(objects[10].toString()));
			 
			 System.out.println("itemlist");
			
			itemlist.add(bean);
			
		     }
		}
		catch(RuntimeException e)
		{
			Log.error("Error in getAllItemDetails(String key)", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		
		return itemlist;
		
		

	}
	*/
	
	
	
	//fetching product detail as per batch for seed pesti bill
		public List<CustomerBean> getAllProductDetailsForSeedBillAsPerBatchAndStock(
				String batchNum, String stock) {
			
			HibernateUtility hbu=null;
			Session session=null;
			List<CustomerBean> itemlist=null;
			try
			{
				
				    System.out.println("shreemant");
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 String sqlQuery = "SELECT pk_goods_receive_id , fk_supplier_id, fkCategoryId, product_name , sale_price, weight, dupQuantity, mrp, company_Name, barcodeNo, tax_percentage, expiry_date FROM goods_receive WHERE batch_no=:batchNum";
			
			 Query query=session.createSQLQuery(sqlQuery);
			 query.setParameter("batchNum", batchNum);
			 query.setParameter("stock", stock);
			 System.out.println("batchNum in dao = ="+batchNum);
			 System.out.println("stock in dao = ="+stock);

				List<Object[]> list = query.list();
		
				 itemlist = new ArrayList<CustomerBean>(0);
			     for (Object[] objects : list) {
				 System.out.println(Arrays.toString(objects));
				 CustomerBean bean = new CustomerBean();
				 System.out.println("itemlist");
				 bean.setPkGoodreceiveId(Long.parseLong(objects[0].toString()));
				 bean.setSupplier_id(Long.parseLong(objects[1].toString()));
				 bean.setCat_id(Long.parseLong(objects[2].toString()));
				 bean.setItemName(objects[3].toString());
				 bean.setSalePrice(Double.parseDouble(objects[4].toString()));
				 bean.setWeight(Double.parseDouble(objects[5].toString()));
				 bean.setQuantity(Double.parseDouble(objects[6].toString()));
				 bean.setMrp(Double.parseDouble(objects[7].toString()));
				 bean.setCompanyName(objects[8].toString());
				 bean.setBarcodeNo(Long.parseLong(objects[9].toString()));
				 bean.setVatPercentage(Double.parseDouble(objects[10].toString()));
				 bean.setExpiryDate(objects[11].toString());
				 System.out.println("itemlist");
				
				itemlist.add(bean);
				
			     }
			}
			catch(RuntimeException e)
			{
				Log.error("Error in getAllItemDetails(String key)", e);	
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			
			return itemlist;
		
		}



		public List<CustomerBean> getAllProductDetailsForFrtiBillAsPerProductName1(
				String proName, String qty) {


			
			HibernateUtility hbu=null;
			Session session=null;
			List<CustomerBean> itemlist=null;
			try
			{
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 String sqlQuery = "SELECT product_Name, buy_Price, quantity, bundel, quantity_in_bundle, length, color, micron FROM packing WHERE product_name =:proName and Quantity =:qty";
			 Query query=session.createSQLQuery(sqlQuery);
			 query.setParameter("proName", proName);
			 query.setParameter("qty", qty);
			 //query.setParameter("weight", weight);
			/* query.setParameter("catId", catId);
			 query.setParameter("subCatId", subCatId);*/
				List<Object[]> list = query.list();
		
				System.out.println("list size== === ="+list.size());
				 itemlist = new ArrayList<CustomerBean>(0);
			     for (Object[] objects : list) {
				 System.out.println(Arrays.toString(objects));
				 CustomerBean bean = new CustomerBean();
				 System.out.println("itemlist");
				
				 
				 bean.setItemName(objects[0].toString());
				 bean.setSalePrice(0d);
				 bean.setWeight(Double.parseDouble(objects[2].toString()));
				 bean.setBundel(objects[3].toString());
				 bean.setQuantityinbundle(Long.parseLong(objects[4].toString()));
				 bean.setLength(Long.parseLong((objects[5].toString())));
				 bean.setColor(objects[6].toString());
				 bean.setMicron(Double.parseDouble(objects[7].toString()));
				 
				 System.out.println("itemlist");
				itemlist.add(bean);
				
			     }
			}
			catch(RuntimeException e)
			{
				Log.error("Error in getAllItemDetails(String key)", e);	
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			System.out.println(itemlist);
			return itemlist;
			
			

		
		}



		public List<CustomerBean> getAllProductDetailsForSeedBillAsPerProductName1(
				String proName, String company, String weight, String batchNum) {



			
			HibernateUtility hbu=null;
			Session session=null;
			List<CustomerBean> itemlist=null;
			try
			{
				
				    System.out.println("shreemant");
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 String sqlQuery = "SELECT product_name, sale_price, weight, mrp, manufacturing_company, tax_percentage, s.unit_name,fk_cat_id FROM product_details LEFT JOIN sold_units s ON fk_unit_id = s.pk_unit_id  WHERE product_name =:proName AND manufacturing_company =:company AND weight =:weight";
			
			 Query query=session.createSQLQuery(sqlQuery);
			 query.setParameter("proName", proName);
			 query.setParameter("company", company);
			 query.setParameter("weight", weight);
				List<Object[]> list = query.list();
		
				 itemlist = new ArrayList<CustomerBean>(0);
			     for (Object[] objects : list) {
				 System.out.println(Arrays.toString(objects));
				 CustomerBean bean = new CustomerBean();
				 System.out.println("itemlist");
				
				 bean.setItemName(objects[0].toString());
				 bean.setSalePrice(Double.parseDouble(objects[1].toString()));
				 bean.setWeight(Double.parseDouble(objects[2].toString()));
				 bean.setMrp(Double.parseDouble(objects[3].toString()));
				 bean.setCompanyName(objects[4].toString());
				 bean.setVatPercentage(Double.parseDouble(objects[5].toString()));
				 bean.setUnitName(objects[6].toString());
				 bean.setCat_id(Long.parseLong(objects[7].toString()));
				 bean.setBatchNumber(batchNum);
				 System.out.println("itemlist");
				
				itemlist.add(bean);
				
			     }
			}
			catch(RuntimeException e)
			{
				Log.error("Error in getAllItemDetails(String key)", e);	
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			
			return itemlist;
		}
	
		
		public List<StockDetail> getStockDetailsForReportAsPerCategory(String cat) {


			
			HibernateUtility hbu=null;
			Session session=null;
			List<StockDetail> stockList = null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				int catageory = Integer.parseInt(cat);
				Query query = session.createSQLQuery("select ProductName, CompanyName, weight, quantity from stock_detail where quantity>=0 AND FkCatId ="+catageory);
				List<Object[]> list = query.list();
				stockList = new ArrayList<StockDetail>(0);
				
				
				for (Object[] object : list) {
					
					StockDetail reports = new StockDetail();
					
					reports.setProductName(object[0].toString());
					reports.setCompanyName(object[1].toString());
					reports.setWeight((Double)object[2]);
					reports.setQuantity((Double)object[3]);
					
					stockList.add(reports); 
			
				}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			System.out.println("@@@@@@@@@@@ DAO Stock Report List :: "+stockList);
			return stockList;	
		
		}
		
		
		public List<StockDetail> getStockDetailsAsPerProductName(String proName) {

			HibernateUtility hbu=null;
			Session session=null;
			List<StockDetail> stockList = null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("select ProductName, CompanyName, weight, quantity from stock_detail where quantity>=0 AND ProductName ='" + proName +"'");
				List<Object[]> list = query.list();
				stockList = new ArrayList<StockDetail>(0);
				
				
				for (Object[] object : list) {
					
					StockDetail reports = new StockDetail();
					
					reports.setProductName(object[0].toString());
					reports.setCompanyName(object[1].toString());
					reports.setWeight((Double)object[2]);
					reports.setQuantity((Double)object[3]);
					
					stockList.add(reports); 
			
				}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return stockList;	
		
		}
		
		public List<StockDetail> getStockDetailsAsPerCompanyName(String companyName) {

			HibernateUtility hbu=null;
			Session session=null;
			List<StockDetail> stockList = null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				//Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-okquantity) as Available_total from inwand_details id join outward_details od on id.challanno = od.challan_No where  od.suppliername ='" + companyName +"' ORDER BY od.pk_outward_id DESC LIMIT 1");
				Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-okquantity) as Available_total,(od.dupQuantity - od.okquantity) as new_total from inwand_details id join outward_details od on id.challan_No = od.challan_No and id.productname =od.productName where  od.suppliername ='" + companyName +"' ORDER BY od.pk_outward_id ");
				List<Object[]> list = query.list();
				stockList = new ArrayList<StockDetail>(0);
				
				
				for (Object[] object : list) {
					 DecimalFormat df3 = new DecimalFormat(".##");
					 
					StockDetail reports = new StockDetail();
					
					reports.setStrproductName(object[0].toString());
					reports.setStrcompanyName(object[1].toString());
					reports.setdInwardChallanNo(object[2].toString());
					reports.setdOutwardChallanNo(object[3].toString());
					reports.setdInwardQty((Double)object[4]);	
					reports.setdOutwardQty((Double)object[5]);
					reports.setDbalanceQty(object[6].toString());
					reports.setRejquantity((Double)object[7]);
					reports.setUnproquantity((Double)object[8]);
					reports.setAvaInwQuantity1(df3.format(object[9]));
					reports.setRejectedQty(0l);
					reports.setNewTOtal(object[10].toString());
					System.out.println("hi this is quantit---------------------"+(object[9]));
					
					stockList.add(reports); 
			
				}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return stockList;	
		
		}
		


public List<PurchaseDetailsFromGoodsReceive> getPurchaseDetailsForSingleDateFromGoodsReceive(
			String fDate) {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name,  dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), Per_Product_Total from goods_receive where purchaseDate ='" + fDate +"'");
		//	query.setParameter("isInsertDate", fDate);
			List<Object[]> list = query.list();
			purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
			
			
			for (Object[] object : list) {
				
				PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
				
				reports.setBillNo(object[0].toString());
				reports.setPurchaseDate(object[1].toString());
				reports.setProductName(object[2].toString());
				reports.setCompanyName(object[3].toString());
				reports.setDcNo(object[4].toString());
			//	reports.setBatchNo(object[5].toString());
				reports.setBarcodeNo(object[6].toString());
				reports.setBuyPrice(Double.parseDouble(object[7].toString()));
				reports.setSalePrice(Double.parseDouble(object[8].toString()));
				reports.setMrp(Double.parseDouble(object[9].toString()));
				reports.setWeight(Double.parseDouble(object[10].toString()));
				reports.setQuantity2(Double.parseDouble(object[11].toString()));
				reports.setTotalAmount(Double.parseDouble(object[12].toString()));
				
				purchaseList.add(reports); 
		
			}
			}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return purchaseList;	
		
	
		
	}



public List<PurchaseDetailsFromGoodsReceive> getPurchaseDetailsAsPerProduct(
		String cat, String product, String company, String weight) {

	HibernateUtility hbu=null;
	Session session=null;
	List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
	try
	{
		System.out.println("Product name in dao = = = "+product);
		System.out.println("company name in dao = = = "+company);
		System.out.println("weight in dao = = = "+weight);
		
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select product_name, buy_price, sale_price, purchaseDate, quantity, weight, expenses, Per_Product_Total, bill_number FROM goods_receive RIGHT JOIN supplier_details  ON  goods_receive.fk_supplier_id = supplier_details.pk_supplier_id WHERE goods_receive.product_name ='"+product+"' And goods_receive.company_Name ='"+company+"' AND goods_receive.weight ="+weight);
		
		List<Object[]> list = query.list();
		purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
		
		
		for (Object[] object : list) {
			
			PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
			
			reports.setProductName(object[0].toString());
			reports.setBuyPrice(Double.parseDouble(object[1].toString()));
			reports.setSalePrice(Double.parseDouble(object[2].toString()));
			reports.setPurchaseDate(object[3].toString());
			reports.setQuantity2(Double.parseDouble(object[4].toString()));
			reports.setWeight(Double.parseDouble(object[5].toString()));
			reports.setExpense(Double.parseDouble(object[6].toString()));
			reports.setTotalAmount(Double.parseDouble(object[7].toString()));
			reports.setBillNo(object[8].toString());
			purchaseList.add(reports); 
	
		}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return purchaseList;	
	
}





public List<PurchaseDetailsFromGoodsReceive> getPurchaseDetailsForSupplier(
			String supplier) {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name,  dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), Per_Product_Total, supplier_details.supplier_name from goods_receive  left join supplier_details on goods_receive.fk_supplier_id = supplier_details.pk_supplier_id where fk_supplier_id = " + supplier);
			//query.setParameter("fksupplier", supplier);
			List<Object[]> list = query.list();
			purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
			
			
			for (Object[] object : list) {
				
				PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
				
				reports.setBillNo(object[0].toString());
				reports.setPurchaseDate(object[1].toString());
				reports.setProductName(object[2].toString());
				reports.setCompanyName(object[3].toString());
				reports.setDcNo(object[4].toString());
			//	reports.setBatchNo(object[5].toString());
				reports.setBarcodeNo(object[6].toString());
				reports.setBuyPrice(Double.parseDouble(object[7].toString()));
				reports.setSalePrice(Double.parseDouble(object[8].toString()));
				reports.setMrp(Double.parseDouble(object[9].toString()));
				reports.setWeight(Double.parseDouble(object[10].toString()));
				reports.setQuantity2(Double.parseDouble(object[11].toString()));
				reports.setTotalAmount(Double.parseDouble(object[12].toString()));
				reports.setSupplier(object[13].toString());
				
				purchaseList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return purchaseList;	
		
	}

public List<PurchaseDetailsFromGoodsReceive> getPurchaseDetailsForShop(
		String shop,String fisDate ,String endDate ) {
	
	HibernateUtility hbu=null;
	Session session=null;
	List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name, dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), Per_Product_Total, supplier_details.supplier_name from goods_receive  left join supplier_details on goods_receive.fk_supplier_id = supplier_details.pk_supplier_id where fk_shop_id = " + shop+" AND purchaseDate BETWEEN '"+fisDate+"' AND '"+endDate+"'");
		//query.setParameter("fksupplier", supplier);
		List<Object[]> list = query.list();
		purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
		
		
		for (Object[] object : list) {
			
			PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
			
			reports.setBillNo(object[0].toString());
			reports.setPurchaseDate(object[1].toString());
			reports.setProductName(object[2].toString());
			reports.setCompanyName(object[3].toString());
			reports.setDcNo(object[4].toString());
			//reports.setBatchNo(object[5].toString());
			reports.setBarcodeNo(object[6].toString());
			reports.setBuyPrice(Double.parseDouble(object[7].toString()));
			reports.setSalePrice(Double.parseDouble(object[8].toString()));
			reports.setMrp(Double.parseDouble(object[9].toString()));
			reports.setWeight(Double.parseDouble(object[10].toString()));
			reports.setQuantity2(Double.parseDouble(object[11].toString()));
			reports.setTotalAmount(Double.parseDouble(object[12].toString()));
			reports.setSupplier(object[13].toString());
			
			purchaseList.add(reports); 
	
		}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return purchaseList;	
	
}



public List<PurchaseDetailsFromGoodsReceive> getPurchaseDetailsForCategory(
			String cat) {

	
		HibernateUtility hbu=null;
		Session session=null;
		List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name,  dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), Per_Product_Total from goods_receive where goods_receive.fkCategoryId ="+cat);
			List<Object[]> list = query.list();
			purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
		
			for (Object[] object : list) {
				
				PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
				
				reports.setBillNo(object[0].toString());
				reports.setPurchaseDate(object[1].toString());
				reports.setProductName(object[2].toString());
				reports.setCompanyName(object[3].toString());
				reports.setDcNo(object[4].toString());
				reports.setBatchNo(object[5].toString());
				reports.setBarcodeNo(object[6].toString());
				reports.setBuyPrice(Double.parseDouble(object[7].toString()));
				reports.setSalePrice(Double.parseDouble(object[8].toString()));
				reports.setMrp(Double.parseDouble(object[9].toString()));
				reports.setWeight(Double.parseDouble(object[10].toString()));
				reports.setQuantity2(Double.parseDouble(object[11].toString()));
				reports.setTotalAmount(Double.parseDouble(object[12].toString()));
				
				purchaseList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return purchaseList;	
		
	
	}


public List<CustomerBillBean1> getSaleDetailsAsPerCategoryForSingleDate(String ShopName1,String custId) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount, outwardchallan_no, gross_Total,bill_no1,InwardChallanNo,total,discount,discount_Amount FROM bill_details WHERE ShopName='"+ShopName1+"' And creditcustomer ='"+custId+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setOutwardchallanno(object[7].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
	        reports.setBillNo1((object[9].toString()));
	        reports.setInwardChallanNo(object[10].toString());
	        reports.setTotal(Double.parseDouble(object[11].toString()));
	        reports.setDiscount1(Double.parseDouble(object[12].toString()));
	        reports.setDiscountAmount1(Double.parseDouble(object[13].toString()));
			
	        saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	

}



public List<CustomerBillBean1> getSaleDetailsAsPerCategoryBetweeenTwoDates(String ShopName3, String fDate, String sDate) {
	Double trans;
	Double hamali;
	System.out.println(fDate+"fDate in dao");
	System.out.println(sDate+"sDate in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<CustomerBillBean1> saleList=null;
	try
	{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount, outwardchallan_no, gross_Total,bill_no1,InwardChallanNo,total,ShopName,discount,discount_Amount  FROM bill_details WHERE ShopName='"+ShopName3+"'And DATE(sale_Date) BETWEEN '"+fDate+"' AND '"+sDate+"'");
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
		
		System.out.println(fDate+"fDate in dao");
		System.out.println(sDate+"sDate in dao");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setOutwardchallanno(object[7].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
			reports.setBillNo1((object[9].toString()));
			reports.setInwardChallanNo(object[10].toString());
			reports.setTotal(Double.parseDouble(object[11].toString()));
			reports.setDiscount1(Double.parseDouble(object[13].toString()));
			System.out.println("Discount IS ===="+object[13].toString());
			reports.setDiscountAmount1(Double.parseDouble(object[14].toString()));
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}




public List<SaleReports> getSaleDetailsAsPerShopBetweeenTwoDates(
		String shop, String fDate, String sDate) {
	Double trans;
	Double hamali;
	System.out.println(shop+"Category in dao");
	System.out.println(fDate+"fDate in dao");
	System.out.println(sDate+"sDate in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT bill_no,product_name, DATE(insert_date), Without_Tax_Rate, quantity, Discount_amount, Tax_amount, total_per_product,tax_percentage,igstPercentage FROM fertilizer_billing WHERE fk_shop_id ='"+shop+"' AND DATE(insert_date) BETWEEN '"+fDate+"' AND '"+sDate+"'");
	 /*query.setParameter("shop", shop);*/	
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
		
		System.out.println(shop+"Category in dao");
		System.out.println(fDate+"fDate in dao");
		System.out.println(sDate+"sDate in dao");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
			SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			/*reports.setCusomerName(object[1].toString());*/
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQuantity1(((BigInteger) object[4]));
			reports.setDiscountAmount(Double.parseDouble(object[5].toString()));
			reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
			reports.setTax(Double.parseDouble(object[8].toString()));
			reports.setiGSTPerc(Double.parseDouble(object[9].toString()));
			Double trans1 = (Double.parseDouble(object[6].toString()));
			if(trans1 != null){
				trans = (Double.parseDouble(object[6].toString()));
			}else{
				trans = 0.0;
			}
			
			Double hamali1 = (Double.parseDouble(object[7].toString()));
			if(hamali1 != null){
				hamali = (Double.parseDouble(object[7].toString()));
			}else{
				 hamali = 0.0;
			}
			
			Double totalWithoutExpense = (Double.parseDouble(object[7].toString()));
			Double Discount =reports.getDiscountAmount();
			Double TaxAmnt =reports.getTaxAmnt();
			Double total = totalWithoutExpense - Discount + TaxAmnt;
			reports.setTotalAmount(total);
			Double tax=reports.getTax();
			Double igst=reports.getiGSTPerc();
			if(tax == 0.00){
				reports.setTaxPerc(igst);
			}
			else{
				reports.setTaxPerc(tax);
			}
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}


public List<SaleReports> saleReportBetweenToId(
		String cust1,String cust2) {
	Double bal=0d;
	Long fkCustId=0l;
	Long fkCustIdFrmBill=0l;
	Double hamali;
	Double Payment=0d;
	Double Remaining=0d;
	
	int ListSize=0;
	
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
	hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT fb.credit_customer_name,sum(fb.gross_total),sum(fb.initial_Payment),sum(fb.bal_After_initial_Payment),fb.fk_customer_id FROM fertilizer_billing fb  WHERE fb.fk_customer_id BETWEEN '"+cust1+"' AND '"+cust2+"' group by fb.fk_customer_id");
	
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
			
			Query query1 = session.createSQLQuery(" SELECT sum(fb.payment),total_amount,fb.fk_customer_id FROM credit_customer_payment fb  WHERE fb.fk_customer_id BETWEEN '"+cust1+"' AND '"+cust2+"' group by fb.fk_customer_id");
			
			List<Object[]> list1 = query1.list();
			 saleList= new ArrayList<SaleReports>(0);
			 
			
			 
			 for (Object[] object : list) {
				 Long Count=0l; 
				 ListSize=list1.size();
			 SaleReports reports = new SaleReports();
			 for (Object[] o : list1) {
					
				
			reports.setBalanceAmount(Double.parseDouble(o[0].toString().toString()));
			reports.setFkCustId(Long.parseLong(o[2].toString().toString()));
			bal=reports.getBalanceAmount();
			fkCustId=reports.getFkCustId();
			System.out.println("id from cp"+fkCustId);
				
				reports.setFkCustIdFrmBill(Long.parseLong(object[4].toString().toString()));
				fkCustIdFrmBill=reports.getFkCustIdFrmBill();
				System.out.println("id from billing"+fkCustIdFrmBill);
				
				Payment=Double.parseDouble(object[3].toString());

				if(fkCustId.equals(fkCustIdFrmBill)){
				Remaining=Payment-bal;
				}
				else{
					Count++;
				}
				
			 }
			 
			 System.out.println("Count"+Count);
			 System.out.println("ListSize"+ListSize);
			 
			 if(Count == ListSize)
			 {
				 reports.setBalanceAmount(Payment);
				 System.out.println("Inside if");
			}
			 else{reports.setBalanceAmount(Remaining);}
			 reports.setCustName(object[0].toString());
			reports.setTotalAmount(Double.parseDouble(object[1].toString()));
			reports.setInitialPayment(Double.parseDouble(object[2].toString()));
			reports.setBalAftInitialPayment(Double.parseDouble(object[3].toString()));
			 saleList.add(reports);
		}
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}


public List<SaleReports> getSaleDetailsAsPerProductNameForSingleDate(
		String cat, String fDate, String productName) {
	Double trans;
	Double hamali;
	System.out.println(cat+"Category in dao");
	System.out.println(fDate+"fDate in dao");
	System.out.println(productName+"productName in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT bill_no,product_name, DATE(insert_date), Without_Tax_Rate, quantity, Discount_amount, Tax_amount, total_per_product,tax_percentage,igstPercentage FROM fertilizer_billing WHERE cat_id =:cat AND product_name=:productName AND DATE(insert_date) =:fDate");
	 query.setParameter("cat", cat);
	 query.setParameter("productName", productName);
	 query.setParameter("fDate", fDate);
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
		
		System.out.println(cat+"Category in dao");
		System.out.println(fDate+"fDate in dao");
		System.out.println(productName+"productName in dao");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
			SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			/*reports.setCusomerName(object[1].toString());*/
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQuantity1(((BigInteger) object[4]));
			reports.setDiscountAmount(Double.parseDouble(object[5].toString()));
			reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
			reports.setTax(Double.parseDouble(object[8].toString()));
			reports.setiGSTPerc(Double.parseDouble(object[9].toString()));
			Double trans1 = (Double.parseDouble(object[6].toString()));
			if(trans1 != null){
				trans = (Double.parseDouble(object[6].toString()));
			}else{
				trans = 0.0;
			}
			
			Double hamali1 = (Double.parseDouble(object[7].toString()));
			if(hamali1 != null){
				hamali = (Double.parseDouble(object[7].toString()));
			}else{
				 hamali = 0.0;
			}
			
			Double totalWithoutExpense = (Double.parseDouble(object[7].toString()));
			Double Discount =reports.getDiscountAmount();
			Double TaxAmnt =reports.getTaxAmnt();
			Double total = totalWithoutExpense - Discount + TaxAmnt;
			reports.setTotalAmount(total);
			Double tax=reports.getTax();
			Double igst=reports.getiGSTPerc();
			if(tax == 0.00){
				reports.setTaxPerc(igst);
			}
			else{
				reports.setTaxPerc(tax);
			}
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	

}


public List<SaleReports> getSaleDetailsAsPerProductNamesBetweeenTwoDates(
		String cat, String fDate, String sDate, String product) {

	Double trans;
	Double hamali;
	System.out.println(cat+"Category in dao");
	System.out.println(fDate+"fDate in dao");
	System.out.println(product+"productName in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT bill_no,product_name, DATE(insert_date), Without_Tax_Rate, quantity, Discount_amount, Tax_amount, total_per_product,tax_percentage,igstPercentage FROM fertilizer_billing WHERE cat_id =:cat AND product_name=:productName AND DATE(insert_date) BETWEEN '"+fDate+"' AND '"+sDate+"'");
	 query.setParameter("cat", cat);
	 query.setParameter("productName", product);
	 
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
		
		System.out.println(cat+"Category in dao");
		System.out.println(fDate+"fDate in dao");
		System.out.println(product+"productName in dao");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
			SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			/*reports.setCusomerName(object[1].toString());*/
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQuantity1(((BigInteger) object[4]));
			reports.setDiscountAmount(Double.parseDouble(object[5].toString()));
			reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
			reports.setTax(Double.parseDouble(object[8].toString()));
			reports.setiGSTPerc(Double.parseDouble(object[9].toString()));
			Double trans1 = (Double.parseDouble(object[6].toString()));
			if(trans1 != null){
				trans = (Double.parseDouble(object[6].toString()));
			}else{
				trans = 0.0;
			}
			
			Double hamali1 = (Double.parseDouble(object[7].toString()));
			if(hamali1 != null){
				hamali = (Double.parseDouble(object[7].toString()));
			}else{
				 hamali = 0.0;
			}
			
			Double totalWithoutExpense = (Double.parseDouble(object[7].toString()));
			Double Discount =reports.getDiscountAmount();
			Double TaxAmnt =reports.getTaxAmnt();
			Double total = totalWithoutExpense - Discount + TaxAmnt;
			reports.setTotalAmount(total);
			Double tax=reports.getTax();
			Double igst=reports.getiGSTPerc();
			if(tax == 0.00){
				reports.setTaxPerc(igst);
			}
			else{
				reports.setTaxPerc(tax);
			}
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}


public List<SaleReports> getSaleDetailsAsPerSupplierName(String fkSupplierId) {

	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT bill_no,product_name, DATE(insert_date), Without_Tax_Rate, quantity, transportation_expense, hamali_expense, total_per_product FROM fertilizer_billing WHERE supplier_id=:fkSupplierId UNION SELECT bill_no, product_name,DATE(insert_date), sale_price, quantity, transportation_expense, hamali_expense, total_per_product FROM seed_pesticide_billing WHERE supplier_id=:fkSupplierId");
		query.setParameter("fkSupplierId", fkSupplierId);
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
		SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQuantity1(((BigInteger) object[4]));
			reports.setTransExpense(((BigDecimal) object[5]));
			reports.setHamaliexpense(((BigDecimal) object[6]));
			Double trans1 = (Double.parseDouble(object[5].toString()));
			if(trans1 != null){
				trans = (Double.parseDouble(object[5].toString()));
			}else{
				trans = 0.0;
			}
			
			Double hamali1 = (Double.parseDouble(object[6].toString()));
			if(hamali1 != null){
				hamali = (Double.parseDouble(object[6].toString()));
			}else{
				 hamali = 0.0;
			}
			
			Double totalWithoutExpense = (Double.parseDouble(object[7].toString()));
			Double total = totalWithoutExpense + hamali + trans;
			reports.setTotalAmount(total);
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	
	
}


public List<PurchaseDetailsFromGoodsReceive> geTaxDetailsAsPerCategoryForSingleDate(
		String cat, String fDate, String sDate) {


	
	HibernateUtility hbu=null;
	Session session=null;
	List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT supplier_name, tin_no, bill_number, product_name, company_Name, weight,buy_price,mrp, tax_percentage, quantity FROM goods_receive RIGHT JOIN supplier_details on fk_supplier_id=pk_supplier_id WHERE tax_percentage>0 AND fkCategoryId =:cat AND DATE(insertDate) BETWEEN :fDate AND :sDate");
		 query.setParameter("cat", cat);
		 query.setParameter("fDate", fDate);
		 query.setParameter("sDate", sDate);
		 
		
		List<Object[]> list = query.list();
		purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
	
		for (Object[] o : list) {
			
			PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
			
			reports.setSupplier(o[0].toString());
			reports.setTinNo(o[1].toString());
			reports.setBillNo(o[2].toString());
			reports.setProductName(o[3].toString());
			reports.setCompanyName(o[4].toString());
			reports.setWeight(Double.parseDouble(o[5].toString()));
			reports.setBuyPrice(Double.parseDouble(o[6].toString()));
			reports.setMrp(Double.parseDouble(o[7].toString()));
			reports.setTaxPercentage(Double.parseDouble(o[8].toString()));
			reports.setQuantity2(Double.parseDouble(o[9].toString()));
			//tax Amount calculation as per quantity
			Double quantity = Double.parseDouble(o[9].toString());
			Double taxPercentage = Double.parseDouble(o[8].toString());
			Double buyPrice = Double.parseDouble(o[6].toString());
			Double taxAmt = (taxPercentage/100)*buyPrice;
			Double newBuyPrice = buyPrice + taxAmt;
			Double totalTaxAmt = quantity *taxAmt ;
			
			reports.setTaxAmount(totalTaxAmt);
			purchaseList.add(reports); 
	
		}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return purchaseList;	

}

	//old
	public List<StockDetail> getStockDetailsAsPerProductName1(String proName) {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<StockDetail> stockList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-okquantity) as Available_total from inwand_details id join outward_details od on id.challanno = od.challan_No where od.productName =:proName ORDER BY od.pk_outward_id DESC LIMIT 1");
			//Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,ior.ReturnQty,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-od.okquantity) as Available_total,(od.dupQuantity - od.okquantity) as new_total from inwand_details id JOIN outward_details od on id.challan_No = od.challan_No join outward_return ior on od.productName = ior.ProductName WHERE od.productName =:proName GROUP BY pk_outward_id ");
			Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-okquantity) as Available_total,(od.dupQuantity - od.okquantity) as new_total from inwand_details id join outward_details od on id.challan_No = od.challan_No where od.productName =:proName and id.productname =od.productName  order BY od.pk_outward_id  ");
			query.setParameter("proName", proName);
			// query.setParameter("company", company);
			/* query.setParameter("weight", weight);*/
			
			List<Object[]> list = query.list();
			stockList = new ArrayList<StockDetail>(0);
			for (Object[] object : list) {
				DecimalFormat df2 = new DecimalFormat(".##");
				StockDetail reports = new StockDetail();
				/*reports.setProductName(object[0].toString());
				reports.setCompanyName(object[1].toString());
				reports.setWeight((Double)object[2]);
				reports.setQuantity((Double)object[3]);*/
				
				reports.setStrproductName(object[0].toString());
				reports.setStrcompanyName(object[1].toString());
				reports.setdInwardChallanNo(object[2].toString());
				reports.setdOutwardChallanNo(object[3].toString());
				reports.setdInwardQty((Double)object[4]);
				reports.setdOutwardQty((Double)object[5]);
				reports.setDbalanceQty(object[6].toString());
				reports.setRejquantity((Double)object[7]);
				reports.setUnproquantity((Double)object[8]);
				
				reports.setAvaInwQuantity1(df2.format(object[9]));
				reports.setNewTOtal(object[10].toString());
				reports.setRejectedQty(0l);
				System.out.println("hi this is kishor+++++++++++"+(object[9]));
				stockList.add(reports);
			}
		} catch(Exception e) {
			e.printStackTrace();	
		}
		return stockList;
	}


//sale detail as per payment mode
public List<SaleReports> getSaleDetailsAsPerPaymentMode(String paymentMode, String fk_cat_id) {

	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT bill_no,customer_name,gross_total from fertilizer_billing where cat_id='"+fk_cat_id+"' AND payment_mode ='"+paymentMode+"' AND fk_customer_id= 0 GROUP BY bill_no UNION SELECT bill_no,customer_name,gross_total from seed_pesticide_billing where cat_id='"+fk_cat_id+"' AND payment_mode ='"+paymentMode+"' AND fk_customer_id= 0 GROUP BY bill_no  UNION SELECT bill_no,customer_name,gross_total from pesticide_billing where cat_id='"+fk_cat_id+"' AND payment_mode ='"+paymentMode+"' AND fk_customer_id= 0 GROUP BY bill_no;");
		//query.setParameter("paymentMode", paymentMode);
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		for (Object[] object : list) {
			
		SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			reports.setCusomerName(object[1].toString());
			reports.setTotalAmount(Double.parseDouble(object[2].toString()));
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}



public List<SaleReports> getSaleDetailsAsPerPaymentModeForSingleDate(
		String singleDate, String fk_cat_id) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query = session.createSQLQuery("SELECT bill_no, gross_total,payment_mode FROM fertilizer_billing WHERE cat_id='"+fk_cat_id+"' AND insert_date ='"+singleDate+"'");
		//query.setParameter("paymentMode", paymentMode);
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		for (Object[] object : list) {
		SaleReports reports = new SaleReports();
		String mode = object[2].toString();
		
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			if(mode.equals("cash")){
				reports.setCashAmount(Double.parseDouble(object[1].toString()));
				reports.setChequeAmount(0.0);
				reports.setCardAmount(0.0);
				reports.setNeftAmount(0.0);
			}
			else if(mode.equals("cheque")){
				reports.setChequeAmount(Double.parseDouble(object[1].toString()));
				reports.setCardAmount(0.0);
				reports.setNeftAmount(0.0);
				reports.setCashAmount(0.0);
				
			}
			else if(mode.equals("card")){
				reports.setCardAmount(Double.parseDouble(object[1].toString()));
				reports.setNeftAmount(0.0);
				reports.setCashAmount(0.0);
				reports.setChequeAmount(0.0);
			}
			else if(mode.equals("neft")){
				reports.setNeftAmount(Double.parseDouble(object[1].toString()));
				reports.setCashAmount(0.0);
				reports.setChequeAmount(0.0);
				reports.setCardAmount(0.0);
			}
			
			saleList.add(reports);
		}
		
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	

}



public List<SaleReports> getSaleDetailsAsGST(String cat,String fDate,String sDate) {
	Double trans;
	Double hamali;
	System.out.println(cat+"Category in dao");
	System.out.println(fDate+"fDate in dao");
	System.out.println(sDate+"sDate in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
		Long k = 0l;
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT f.insert_date, f.customer_name, f.product_name,f.Without_Tax_Rate,f.quantity,f.tax_percentage,f.gross_total,f.bill_no,f.igstPercentage,f.hsn FROM fertilizer_billing f  WHERE cat_id ='"+cat+"'AND insert_date BETWEEN '"+fDate+"' AND '"+sDate+"'");
	// query.setParameter("cat", cat);	
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
		
		System.out.println(cat+"Category in dao");
		System.out.println(fDate+"fDate in dao");
		System.out.println(sDate+"sDate in dao");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		for (Object[] o : list) {
		SaleReports reports = new SaleReports();
		k++;
			String tax = o[5].toString();
			String igstTax = o[8].toString();
			
			System.out.println("tax = = ="+tax);
			reports.setSerialnumber(k);
			reports.setSaleDate(o[0].toString());
			reports.setCusomerName(o[1].toString());
			reports.setBillNo(o[7].toString());
			reports.setItemName(o[2].toString());
			reports.setSalePrice(Double.parseDouble(o[3].toString()));
			reports.setQuantity1((BigInteger)o[4]);
			reports.setGstNumber("N/A");
			reports.setHsnNumber((o[9].toString()));
			Double sp = Double.parseDouble(o[3].toString());
			Double qunti = Double.parseDouble(o[4].toString());
			Double total = sp * qunti;
			reports.setTotalAmount(total);
			if(tax.equals("5.00")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(taxAmt);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("5 % GST Amount"+taxAmt);
			}
			else if(tax.equals("12.00")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(taxAmt);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("12 % GST Amount"+taxAmt);
				
			}
			else if(tax.equals("18.00")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(taxAmt);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("18 % GST Amount"+taxAmt);
			}
			else if(tax.equals("28.00")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(taxAmt);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("28 % GST Amount"+taxAmt);
			}
			
			else if(igstTax.equals("5.00")){
				Double igstTx = Double.parseDouble(igstTax);
				Double taxAmt = (igstTx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(taxAmt);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("5 % GST Amount"+taxAmt);
			}
			else if(igstTax.equals("12.00")){
				Double igstTx = Double.parseDouble(igstTax);
				Double taxAmt = (igstTx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(taxAmt);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("12 % GST Amount"+taxAmt);
				
			}
			else if(igstTax.equals("18.00")){
				Double igstTx = Double.parseDouble(igstTax);
				Double taxAmt = (igstTx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(taxAmt);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("18 % GST Amount"+taxAmt);
			}
			else if(igstTax.equals("28.00")){
				Double igstTx = Double.parseDouble(igstTax);
				Double taxAmt = (igstTx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(taxAmt);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("28 % GST Amount"+taxAmt);
			}
			
			saleList.add(reports);
		}
		
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	

}


public List getgoodsReceiveForGSTReport(){
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
		Long k = 0l;
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query = session.createSQLQuery("SELECT purchaseDate,s.supplier_name,product_name,buy_price,quantity,tax_percentage,bill_number FROM goods_receive LEFT JOIN supplier_details s on s.pk_supplier_id = fk_supplier_id");
		//query.setParameter("paymentMode", paymentMode);
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		for (Object[] o : list) {
		SaleReports reports = new SaleReports();
		k++;
			String tax = o[5].toString();
			System.out.println("tax = = ="+tax);
			reports.setSerialnumber(k);
			reports.setSaleDate(o[0].toString());
			reports.setSupplierName(o[1].toString());
			reports.setBillNo((o[6].toString()));
			reports.setItemName(o[2].toString());
			reports.setBuyPrice(Double.parseDouble(o[3].toString()));
			reports.setQuanti(Double.parseDouble(o[4].toString()));
			reports.setGstNumber("N/A");
			reports.setHsnNumber("N/A");
			Double sp = Double.parseDouble(o[3].toString());
			Double qunti = Double.parseDouble(o[4].toString());
			Double total = sp * qunti;
			reports.setTotalAmount(total);
			if(tax.equals("5")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(taxAmt);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("5 % GST Amount"+taxAmt);
			}
			else if(tax.equals("12")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(taxAmt);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("12 % GST Amount"+taxAmt);
				
			}
			else if(tax.equals("18")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(taxAmt);
				reports.setTwentyEightPercentageGST(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("18 % GST Amount"+taxAmt);
			}
			else if(tax.equals("28")){
				Double tx = Double.parseDouble(tax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(taxAmt);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("28 % GST Amount"+taxAmt);
			}
			
			
			saleList.add(reports);
		}
		
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	

}



public List<SaleReports> getSaleDetailsAsPerPaymentModeForTwoDate(
		String singleDate, String fk_cat_id, String secondDate) {

	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query = session.createSQLQuery("SELECT bill_no, gross_total,payment_mode FROM fertilizer_billing WHERE cat_id='"+fk_cat_id+"' AND DATE(insert_date) BETWEEN '"+singleDate+"' AND '"+secondDate+"'");
		//query.setParameter("paymentMode", paymentMode);
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		for (Object[] object : list) {
		SaleReports reports = new SaleReports();
		String mode = object[2].toString();
		
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			if(mode.equals("cash")){
				reports.setCashAmount(Double.parseDouble(object[1].toString()));
				reports.setChequeAmount(0.0);
				reports.setCardAmount(0.0);
				reports.setNeftAmount(0.0);
			}
			else if(mode.equals("cheque")){
				reports.setChequeAmount(Double.parseDouble(object[1].toString()));
				reports.setCardAmount(0.0);
				reports.setNeftAmount(0.0);
				reports.setCashAmount(0.0);
				
			}
			else if(mode.equals("card")){
				reports.setCardAmount(Double.parseDouble(object[1].toString()));
				reports.setNeftAmount(0.0);
				reports.setCashAmount(0.0);
				reports.setChequeAmount(0.0);
			}
			else if(mode.equals("neft")){
				reports.setNeftAmount(Double.parseDouble(object[1].toString()));
				reports.setCashAmount(0.0);
				reports.setChequeAmount(0.0);
				reports.setCardAmount(0.0);
			}
			
			saleList.add(reports);
		}
		
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

public List getAllSubCategory(String fk_cat_id)
{
	System.out.println("IN DAO");
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	System.out.println("IN DAO"+fk_cat_id);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 System.out.println("IN DAO"+fk_cat_id);
		 query = session.createSQLQuery("SELECT pk_subcat_id,sub_cat_name from sub_categories where fk_cat_id="+fk_cat_id);
		 list = query.list(); 
		 System.out.println("=== list ===="+list.size());
		 System.out.println("List size of product detail = ="+list.size());
				 
	} catch (RuntimeException e) {
		Log.error("Error in getAllMainCat", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}

public List getProductName(String fk_cat_id,String fk_subCat_id)
{
	System.out.println("IN DAO");
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	System.out.println("IN DAO"+fk_cat_id);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 System.out.println("IN DAO"+fk_cat_id);
		 query = session.createSQLQuery("SELECT pk_product_id,product_name from product_details where fk_cat_id="+fk_cat_id+" and fk_subCat_id="+fk_subCat_id);
		 list = query.list(); 
		 System.out.println("=== list ===="+list.size());
		 System.out.println("List size of product detail = ="+list.size());
		 /*for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				SubCategoryDetailsBean reports = new SubCategoryDetailsBean();
				reports.setSubcatId(Long.parseLong(object[0].toString()));
				reports.setSubcategoryName(object[1].toString());
				stockList.add(reports); 
		
			}*/
		 
	} catch (RuntimeException e) {
		Log.error("Error in getAllMainCat", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}

public List getPurchaseReportsASPerGST(
		String fDate, String tDate) {
	
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> purchaseList=null;
	try
	{
		Long k = 0l;
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		
		Query query = session.createSQLQuery("SELECT g.purchaseDate,s.supplier_name,g.product_name,g.buy_price,g.quantity,g.tax_percentage,g.bill_number,g.iGstPercentage,p.hsn,s.tin_no FROM goods_receive g LEFT JOIN product_details p on p.pk_product_id = fk_product_id LEFT JOIN supplier_details s on s.pk_supplier_id = fk_supplier_id WHERE purchaseDate between '" + fDate +"' and '"+tDate+"'");
		//query.setParameter("paymentMode", paymentMode);
		List<Object[]> list = query.list();
		purchaseList= new ArrayList<SaleReports>(0);
		for (Object[] o : list) {
		SaleReports reports = new SaleReports();
		k++;
			String tax = o[5].toString();
			String igstTax = o[7].toString();
			
			System.out.println("tax = = ="+tax);
			reports.setSerialnumber(k);
			reports.setSaleDate(o[0].toString());
			reports.setSupplierName(o[1].toString());
			reports.setBillNo(o[6].toString());
			reports.setItemName(o[2].toString());
			reports.setBuyPrice(Double.parseDouble(o[3].toString()));
			reports.setQuanti(Double.parseDouble(o[4].toString()));
			reports.setGstNumber(o[9].toString());
			reports.setHsnNumber(o[8].toString());
			Double sp = Double.parseDouble(o[3].toString());
			Double qunti = Double.parseDouble(o[4].toString());
			Double total = sp * qunti;
			reports.setTotalAmount(total);
			System.out.println("igstTax = = ="+igstTax);
			

	
			
			if(igstTax.equals("5.00")){
				Double tx = Double.parseDouble(igstTax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(taxAmt);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("5 % igstTax Amount"+taxAmt);
				
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				
			}
			 if(igstTax.equals("12.00")){
				Double tx = Double.parseDouble(igstTax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(taxAmt);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("12 % iGST Amount"+taxAmt);
				
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				
			}
			 if(igstTax.equals("18.00")){
				Double tx = Double.parseDouble(igstTax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(taxAmt);
				reports.setiGSTTwentyeightPercentage(0.0);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("18 % iGST Amount"+taxAmt);
				
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
			}
			 if(igstTax.equals("28.00")){
				Double tx = Double.parseDouble(igstTax);
				Double taxAmt = (tx/100)*(sp);
				Double totalTaxAmount = qunti * taxAmt;
				Double newSalePrice = sp + taxAmt;
				Double totalAmount = qunti * newSalePrice;
				reports.setiGSTFivePercentage(0.0);
				reports.setiGSTTwelwePercentage(0.0);
				reports.setiGSTEighteenPercentage(0.0);
				reports.setiGSTTwentyeightPercentage(taxAmt);
				reports.setTotalTaxAmount(totalTaxAmount); 
				reports.setNetAmount(totalAmount);
				System.out.println("28 % iGST Amount"+taxAmt);
				System.out.println("28 % iGST totalTaxAmount"+totalTaxAmount);
				
				reports.setFivePercentageGST(0.0);
				reports.setTwelwePercentageGST(0.0);
				reports.setEighteenPercentageGST(0.0);
				reports.setTwentyEightPercentageGST(0.0);
				}
			
			
/*			}
		else if(igstPercent !=5 || igstPercent !=12 || igstPercent !=18 || igstPercent !=28){

			*/
		
			
		if(tax.equals("5")){
			Double tx = Double.parseDouble(tax);
			Double taxAmt = (tx/100)*(sp);
			Double roundedTaxAmt = (double )Math.round(taxAmt);
			Double totalTaxAmount = qunti * taxAmt;
			Double newSalePrice = sp + taxAmt;
			Double totalAmount = qunti * newSalePrice;
			reports.setFivePercentageGST(roundedTaxAmt);
			reports.setTwelwePercentageGST(0.0);
			reports.setEighteenPercentageGST(0.0);
			reports.setTwentyEightPercentageGST(0.0);
			reports.setTotalTaxAmount((double)Math.round(totalTaxAmount)); 
			reports.setNetAmount(totalAmount);
			System.out.println("5 % GST Amount"+roundedTaxAmt);
			
			
			reports.setiGSTFivePercentage(0.0);
			reports.setiGSTTwelwePercentage(0.0);
			reports.setiGSTEighteenPercentage(0.0);
			reports.setiGSTTwentyeightPercentage(0.0);
		}
		 if(tax.equals("12")){
			Double tx = Double.parseDouble(tax);
			Double taxAmt = (tx/100)*(sp);
			Double roundedTaxAmt = (double )Math.round(taxAmt);
			Double totalTaxAmount = qunti * taxAmt;
			Double newSalePrice = sp + taxAmt;
			Double totalAmount = qunti * newSalePrice;
			reports.setFivePercentageGST(0.0);
			reports.setTwelwePercentageGST(roundedTaxAmt);
			reports.setEighteenPercentageGST(0.0);
			reports.setTwentyEightPercentageGST(0.0);
			reports.setTotalTaxAmount((double)Math.round(totalTaxAmount)); 
			reports.setNetAmount(totalAmount);
			System.out.println("12 % GST Amount"+roundedTaxAmt);
			
			reports.setiGSTFivePercentage(0.0);
			reports.setiGSTTwelwePercentage(0.0);
			reports.setiGSTEighteenPercentage(0.0);
			reports.setiGSTTwentyeightPercentage(0.0);
			
		}
		 if(tax.equals("18")){
			Double tx = Double.parseDouble(tax);
			Double taxAmt = (tx/100)*(sp);
			Double roundedTaxAmt = (double )Math.round(taxAmt);
			Double totalTaxAmount = qunti * taxAmt;
			Double newSalePrice = sp + taxAmt;
			Double totalAmount = qunti * newSalePrice;
			reports.setFivePercentageGST(0.0);
			reports.setTwelwePercentageGST(0.0);
			reports.setEighteenPercentageGST(roundedTaxAmt);
			reports.setTwentyEightPercentageGST(0.0);
			reports.setTotalTaxAmount((double)Math.round(totalTaxAmount)); 
			reports.setNetAmount(totalAmount);
			System.out.println("18 % GST Amount"+roundedTaxAmt);
			
			reports.setiGSTFivePercentage(0.0);
			reports.setiGSTTwelwePercentage(0.0);
			reports.setiGSTEighteenPercentage(0.0);
			reports.setiGSTTwentyeightPercentage(0.0);
		}
		 if(tax.equals("28")){
			Double tx = Double.parseDouble(tax);
			Double taxAmt = (tx/100)*(sp);
			Double roundedTaxAmt = (double )Math.round(taxAmt);
			Double totalTaxAmount = qunti * taxAmt;
			Double newSalePrice = sp + taxAmt;
			Double totalAmount = qunti * newSalePrice;
			reports.setFivePercentageGST(0.0);
			reports.setTwelwePercentageGST(0.0);
			reports.setEighteenPercentageGST(0.0);
			reports.setTwentyEightPercentageGST(roundedTaxAmt);
			reports.setTotalTaxAmount((double)Math.round(totalTaxAmount)); 
			reports.setNetAmount(totalAmount);
			System.out.println("28 % GST Amount"+roundedTaxAmt);
			
			reports.setiGSTFivePercentage(0.0);
			reports.setiGSTTwelwePercentage(0.0);
			reports.setiGSTEighteenPercentage(0.0);
			reports.setiGSTTwentyeightPercentage(0.0);
			}
			
			
		purchaseList.add(reports);
		}
		
}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return purchaseList;	


}



public List<PurchaseDetailsFromGoodsReceive> getPurchaseReturnDetailsForSupplier(
		String supplier) {
	HibernateUtility hbu=null;
	Session session=null;
	List<PurchaseDetailsFromGoodsReceive> purchaseList = null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select bill_number, purchaseDate, product_name, company_Name,  dc_number, batch_no, barcodeNo, buy_price, sale_price, mrp, weight, abs(quantity), total_amount, supplier_details.supplier_name, dupQuantity from goods_receive  left join supplier_details on goods_receive.fk_supplier_id = supplier_details.pk_supplier_id where goods_receive.fk_supplier_id = '"+ supplier+"'And goods_receive.return_amount >0");
		//query.setParameter("fksupplier", supplier);
		List<Object[]> list = query.list();
		purchaseList = new ArrayList<PurchaseDetailsFromGoodsReceive>(0);
		
		for (Object[] object : list) {
			
			PurchaseDetailsFromGoodsReceive reports = new PurchaseDetailsFromGoodsReceive();
			Double quantityAfterReturn = Double.parseDouble(object[14].toString());
			Double originalQuantity = Double.parseDouble(object[11].toString());
			Double returnQuantity = originalQuantity - quantityAfterReturn;
			System.out.println("originalQuantity = = = = "+originalQuantity);
			System.out.println("returnQuantity = = = = "+returnQuantity);
			System.out.println("quantityAfterReturn = = = = "+quantityAfterReturn);
			
			reports.setBillNo(object[0].toString());
			reports.setPurchaseDate(object[1].toString());
			reports.setProductName(object[2].toString());
			reports.setCompanyName(object[3].toString());
			reports.setDcNo(object[4].toString());
			/*reports.setBatchNo(object[5].toString());*/
			reports.setBarcodeNo(object[6].toString());
			reports.setBuyPrice(Double.parseDouble(object[7].toString()));
			reports.setSalePrice(Double.parseDouble(object[8].toString()));
			reports.setMrp(Double.parseDouble(object[9].toString()));
			reports.setWeight(Double.parseDouble(object[10].toString()));
			reports.setQuantity2(Double.parseDouble(object[11].toString()));
			reports.setTotalAmount(Double.parseDouble(object[12].toString()));
			reports.setSupplier(object[13].toString());
			reports.setReturnQuantity(returnQuantity);
			reports.setRemainingQuantity(quantityAfterReturn);
			purchaseList.add(reports); 
	
		}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return purchaseList;	

}

public List<SaleReports> gstSummaryReportsBetweenTwoDates(String fDate, String sDate) {

	Double trans;
	Double hamali;
	System.out.println(fDate+"fDate in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT bill_no,product_name, DATE(insert_date), sale_price,sum(quantity), Discount_amount,sum(Tax_amount) , total_per_product,tax_percentage,igstPercentage FROM fertilizer_billing WHERE DATE(insert_date) BETWEEN '"+fDate+"' AND '"+sDate+"' group by tax_percentage,igstPercentage");
	 
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
				
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
			SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			/*reports.setCusomerName(object[1].toString());*/
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQuantity3(((BigDecimal) object[4]));
			reports.setTax(Double.parseDouble(object[8].toString()));
			reports.setiGSTPerc(Double.parseDouble(object[9].toString()));
			
			Double gstPerc=reports.getTax();
			Double igstPerc=reports.getiGSTPerc();
			if(gstPerc != 0.00){
			reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
			Double taxAmnt=reports.getTaxAmnt();
			Double sgstAmnt=taxAmnt/2;
			reports.setSgstAmnt(sgstAmnt);
			reports.setCgstAmnt(sgstAmnt);
			reports.setIgstAmnt(0.0);
			}
			else if(igstPerc != 0.00){
				reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
				Double taxAmnt=reports.getTaxAmnt();
				reports.setIgstAmnt(taxAmnt);
				reports.setSgstAmnt(0.0);
				reports.setCgstAmnt(0.0);
				
			}
			else{
				continue;
			}
			
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

public List<SaleReports> gstPurchaseSummaryReportsBetweenTwoDates(String fDate, String sDate) {

	Double trans;
	Double hamali;
	System.out.println(fDate+"fDate in dao");
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery(" SELECT bill_number,product_name, DATE(purchaseDate), sale_price,sum(quantity), Discount_amount,sum(Tax_amount) , Per_Product_Total,tax_percentage,igstPercentage FROM goods_receive WHERE DATE(purchaseDate) BETWEEN '"+fDate+"' AND '"+sDate+"' group by tax_percentage,igstPercentage");
	 
	/* query.setParameter("fDate", fDate);
		query.setParameter("sDate", sDate);*/
				
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list) {
			
			SaleReports reports = new SaleReports();
			reports.setCustomerBill(Integer.parseInt(object[0].toString()));
			/*reports.setCusomerName(object[1].toString());*/
			reports.setItemName(object[1].toString());
			reports.setSoldDate(object[2].toString());
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			reports.setQnty((object[4]).toString());
			reports.setTax(Double.parseDouble(object[8].toString()));
			reports.setiGSTPerc(Double.parseDouble(object[9].toString()));
			
			Double gstPerc=reports.getTax();
			Double igstPerc=reports.getiGSTPerc();
			if(gstPerc != 0.00){
			reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
			Double taxAmnt=reports.getTaxAmnt();
			Double sgstAmnt=taxAmnt/2;
			reports.setSgstAmnt(sgstAmnt);
			reports.setCgstAmnt(sgstAmnt);
			reports.setIgstAmnt(0.0);
			}
			else if(igstPerc != 0.00){
				reports.setTaxAmnt(Double.parseDouble(object[6].toString()));
				Double taxAmnt=reports.getTaxAmnt();
				reports.setIgstAmnt(taxAmnt);
				reports.setSgstAmnt(0.0);
				reports.setCgstAmnt(0.0);
				
			}
			else{
				continue;
			}
			
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	


}

public List getAllPurschaseEntry()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from CustomerBillBean1 group by bill_no");
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}

// 
public List getAllPurschaseEntryVendor()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from VendorPaymentBean group by bill_no");
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}

// new code for Vendor Wise Update 06-10-2018
//get book stock
		public List getAllPurschaseEntryVendorNew(String supplier, String fk_supplier_id) {
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			
			 Query query = session.createQuery("from VendorPaymentBean where supplier='"+supplier+"' AND fk_supplier_id='"+fk_supplier_id+"'");
			/* query.setParameter("bookName", bookName);
			 query.setParameter("authorName", authorName);
			 query.setParameter("publisherName", publisherName);*/
			 System.out.println("query ======"+query);
			 list = query.list();
			}
				catch(Exception e){	
					e.printStackTrace();
			}
				finally
				{
						if(session!=null){
						hbu.closeSession(session);
					}
				}
			
		return list;
		
		}

//get all bill no forn vender payment table
public List getAllBillNoFvender(String fk_supplier_id)
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String a = "0.00";
	 String sid = fk_supplier_id;
	 Query query = session.createQuery("from VendorPaymentBean where credit!=:a AND supplier1=: ");
	 query.setParameter("a", a);
	 query.setParameter("sid", sid);
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}


public List getAllInwardEntry()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from InwardBean");
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}

// GEt Outwatward Bean For outwatrd Return getAllInwardEntryOutward

public List getAllInwardEntryOutward()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from OutwardBean");
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}

// Get Purachase Return 

public List getAllInwardEntryPurchaseReurn()
{
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from GrDetailsBean");
	 list = query.list();
	 System.out.println("List size in dao"+list.size());
	}
		catch(Exception e){	
			e.printStackTrace();
	}
		finally
		{
				if(session!=null){
				hbu.closeSession(session);
			}
		}
	
return list;
}
public void updateQuantity(String productName,String quantityinkg,Long item_id) {
	// TODO Auto-generated method stub
	
	HibernateUtility hbu=null;
	Session session=null;
	Transaction transaction =null;

	System.out.println("Product Name"+productName);
	System.out.println("quantity in kg"+quantityinkg);
	
	try
	{
		hbu = HibernateUtility.getInstance();
	    session = hbu.getHibernateSession();
	    transaction = session.beginTransaction();
	    
	    org.hibernate.Query query = session.createQuery("from GoodsReceiveBean where productName =:productName and pkGoodsReceiveId=:item_id");
	    query.setParameter("productName", productName);
	    query.setParameter("item_id", item_id);
	    
	    GoodsReceiveBean uniqueResult = (GoodsReceiveBean) query.uniqueResult();
	    Double quant = uniqueResult.getQuantity();
	    
	    Double updatequnty = (Double) (quant - Double.parseDouble(quantityinkg));
	    

	    GoodsReceiveBean updateStock = (GoodsReceiveBean) session.get(GoodsReceiveBean.class, new Long(item_id));	 
		
		    updateStock.setQuantity(updatequnty);
		 
		    session.saveOrUpdate(updateStock);
		    transaction.commit();
	 
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}finally
	{if(session!=null){
		session.close();	
	}
	}
}


//get inword challan no for inword report
public List getInwardDetails()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from InwardBean WHERE pono!='' group by  challanno ");
					 list = query.list(); 
				} catch (RuntimeException e) {
					Log.error("Error in getAllMainCat", e);
				}
				 
				 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
						return list;
				
			}

// Get Inward Wise
public List getInwardDetailsInward()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from InwardBean WHERE pono='' group by  challanno ");
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAllMainCat", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}
//get inword product List for inword report

public List getInwardProductDetails()
{
	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from InwardBean group by productname");
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAllproduct name from inword table", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}

//get vendor name for inword report


public List getInwardvendorDetails()
{
	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from InwardBean group by suppliername");
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAllproduct name from inword table", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
}


public List<InwardBean> getInwardDetailTable(String billno , String ShopName1) {
	
	System.out.println("bill no================"+billno);
	System.out.println("bill no================++++++++++++"+ShopName1);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
	hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate, GridTotal FROM inwand_details WHERE challan_No =:billno and ShopName =:ShopName1 and  pono=:abc");
		query.setParameter("billno", billno);
		query.setParameter("ShopName1", ShopName1);
		query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			 DecimalFormat df3 = new DecimalFormat(".##");
			
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
		
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble(df3.format(object[5])));
			System.out.println("hi this is kishor+++++++++------------"+(object[5]));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;

}
//with Po 
public List<InwardBean> getInwardDetailTableWithPo(String billno , String ShopName1) {
	
	System.out.println("bill no================"+billno);
	System.out.println("bill no================++++++++++++"+ShopName1);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
	hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate, GridTotal,pono  FROM inwand_details WHERE challan_No =:billno and ShopName =:ShopName1 and pono!=:abc");
		query.setParameter("billno", billno);
		query.setParameter("ShopName1", ShopName1);
		query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			 DecimalFormat df3 = new DecimalFormat(".##");
			
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
		
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble(df3.format(object[5])));
			System.out.println("hi this is kishor+++++++++------------"+(object[5]));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			reports.setPono(((object[8].toString())));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;

}

/*Start inward Report Datewise*/
public List<InwardBean> getInwardDetailTableDatewise(String ShopName1,String fisDate,String endDate) {
	
	System.out.println("First Date================"+fisDate);
	System.out.println("End Date================"+endDate);
	System.out.println("End Date================"+ShopName1);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id,suppliername,challan_No,inwardDate,productname,quantity,rate,GridTotal FROM inwand_details  WHERE  ShopName='"+ ShopName1+"' And inwardDate between'"+ fisDate+"'And '"+endDate+"' and pono=:abc");
		//query.setParameter("fDate", fDate);
		//query.setParameter("fisDate", fisDate);
		//query.setParameter("endDate", endDate);
	 query.setParameter("abc", abc);
		List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			System.out.println("hi this kishor +++++++++********"+(object[5]));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;

}

//with Po Details 
public List<InwardBean> getInwardDetailTableDatewiseWithPo(String ShopName1,String fisDate,String endDate) {
	
	System.out.println("First Date================"+fisDate);
	System.out.println("End Date================"+endDate);
	System.out.println("End Date================"+ShopName1);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id,suppliername,challan_No,inwardDate,productname,quantity,rate,GridTotal,pono FROM inwand_details  WHERE  ShopName='"+ ShopName1+"' And inwardDate between'"+ fisDate+"'And '"+endDate+"' and pono!=:abc");
		//query.setParameter("fDate", fDate);
		//query.setParameter("fisDate", fisDate);
		//query.setParameter("endDate", endDate);
	 query.setParameter("abc", abc);
		List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			System.out.println("hi this kishor +++++++++********"+(object[5]));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			reports.setPono((object[8].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;

}

/*End of inward Report Datewise*/

/*Start inword report Product Name Wise*/
public List<InwardBean> getInwardDetailTableProductNameWise(String ShopName3,String proName)
{
	System.out.println("product name In Dao By inword Report Js========"+proName);
	System.out.println("product name In Dao By inword Report Js========"+ShopName3);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal FROM inwand_details WHERE productname =:proName and ShopName=:ShopName3 and pono=:abc");
	 query.setParameter("proName", proName);	
	 query.setParameter("ShopName3", ShopName3);
	 query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}

/*End inword report Product Name Wise*/

///with po 

public List<InwardBean> getInwardDetailTableProductNameWisewithpo(String ShopName3,String proName)
{
	System.out.println("product name In Dao By inword Report Js========"+proName);
	System.out.println("product name In Dao By inword Report Js========"+ShopName3);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal,pono FROM inwand_details WHERE productname =:proName and ShopName=:ShopName3 and pono!=:abc");
	 query.setParameter("proName", proName);	
	 query.setParameter("ShopName3", ShopName3);
	 query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			reports.setPono((object[8].toString()));
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}
/*Start inword report vendor Name Wise*/

public List<InwardBean> getInwardDetailTablevendorNameWise(String ShopName4,String venName)
{
	System.out.println("Vendor name In Dao By inword Report Js========"+venName);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal FROM inwand_details WHERE ShopName=:ShopName4 And suppliername =:venName and pono=:abc");
		query.setParameter("ShopName4", ShopName4);
		query.setParameter("venName", venName);
		query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			 
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}
// with Po 
public List<InwardBean> getInwardDetailTablevendorNameWisewithpo(String ShopName4,String venName)
{
	System.out.println("Vendor name In Dao By inword Report Js========"+venName);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal,pono FROM inwand_details WHERE ShopName=:ShopName4 And suppliername =:venName and pono!=:abc");
		query.setParameter("ShopName4", ShopName4);
		query.setParameter("venName", venName);
		query.setParameter("abc", abc);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			 
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble((df3.format(object[5]))));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			reports.setPono((object[8].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}






public List<CustomerBillBean1> getSaleDetailsAsPerOutwordChallan(String ShopName4,String challanNo) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	System.out.println("{{{{}}}}"+challanNo);
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount, outwardchallan_no, gross_Total,bill_no1,total,discount,discount_Amount  FROM bill_details  WHERE ShopName='"+ShopName4+"' And outwardchallan_no ='"+challanNo+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setOutwardchallanno(object[7].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
			reports.setBillNo1((object[9].toString()));
			reports.setTotal(Double.parseDouble(object[10].toString()));
			reports.setDiscount1(Double.parseDouble(object[11].toString()));
			reports.setDiscountAmount1(Double.parseDouble(object[12].toString()));
			
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;	
}

public List<CustomerBillBean1> getSaleDetailsAsPerInwordChallan(String ShopName5,String inwchallNo) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	System.out.println("{{{{}}}}"+inwchallNo);
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount, outwardchallan_no, gross_Total,bill_no1,total,discount,discount_Amount FROM bill_details WHERE ShopName='"+ShopName5+"'And InwardChallanNo ='"+inwchallNo+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setInwardChallanNo(object[7].toString());
			System.out.println("HI THOS IS CHALLAN NO++++++"+object[7].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
			reports.setBillNo1((object[9].toString()));
			reports.setTotal(Double.parseDouble(object[10].toString()));
			reports.setDiscount1((Double.parseDouble(object[11].toString())));
			reports.setDiscountAmount1(Double.parseDouble(object[12].toString()));
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;		
}

public List<CustomerBillBean1> getSaleDetailsAsPerShopName(String shopName) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	System.out.println("{{{{}}}}"+shopName);
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount, outwardchallan_no, gross_Total,bill_no1,InwardChallanNo,total,discount,discount_Amount  FROM bill_details WHERE ShopName ='"+shopName+"'");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setOutwardchallanno(object[7].toString());
			System.out.println("HI THOS IS CHALLAN NO++++++"+object[6].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
			reports.setBillNo1((object[9].toString()));
			reports.setInwardChallanNo(object[10].toString());
			reports.setTotal(Double.parseDouble(object[11].toString()));
			reports.setDiscount1(Double.parseDouble(object[12].toString()));
			reports.setDiscountAmount1(Double.parseDouble(object[13].toString()));
			
			
			
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;		
}

//for shop Name With InWard
public List<CustomerBillBean1> getSaleDetailsAsPerShopNameInward(String shopName) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	System.out.println("{{{{}}}}**********************************************************"+shopName);
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String nu = " ";
	 System.out.println("hi vikas befor sql************************************************************************************");
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst,Igst, tax_amount,gross_Total,bill_no1,InwardChallanNo, total,discount,discount_Amount FROM bill_details WHERE ShopName ='"+shopName+"' AND InwardChallanNo IS NOT NULL AND InwardChallanNo != '"+nu+"' ");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			//reports.setOutwardchallanno(object[6].toString());
			//System.out.println("HI THOS IS CHALLAN NO++++++"+object[6].toString());
			reports.setGrossTotal1(Double.parseDouble(object[7].toString()));
			reports.setBillNo1((object[8].toString()));
			reports.setInwardChallanNo(object[9].toString());
			reports.setTotal(Double.parseDouble(object[10].toString()));
			reports.setDiscount1(Double.parseDouble(object[11].toString()));
			reports.setDiscountAmount1(Double.parseDouble(object[12].toString()));
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;		
}
//shop Name with Outward
public List<CustomerBillBean1> getSaleDetailsAsPerShopNameInwardOutward(String shopName) {
	Double trans;
	Double hamali;
	HibernateUtility hbu=null;
	Session session=null;
	System.out.println("{{{{}}}}**********************************************************"+shopName);
	List<CustomerBillBean1> saleList=null;
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 String nu = " ";
	 System.out.println("hi vikas befor sql************************************************************************************");
	 Query query = session.createSQLQuery("SELECT product_Name,creditcustomer, okquantity, buy_Price, gst, Igst, tax_amount,outwardchallan_no,gross_Total,bill_no1,total,discount,discount_Amount  FROM bill_details WHERE ShopName ='"+shopName+"' AND outwardchallan_no IS NOT NULL AND outwardchallan_no != '"+nu+"' ");
		List<Object[]> list = query.list();
		 saleList= new ArrayList<CustomerBillBean1>(0);
		
		for (Object[] object : list) {
			
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setProductName((object[0].toString()));
			reports.setCreditcustomer((object[1].toString()));
			reports.setOkquantity(Double.parseDouble(object[2].toString()));
			reports.setBuyPrice(Double.parseDouble(object[3].toString()));
			reports.setGst(Long.parseLong(object[4].toString()));
			reports.setIgst(Long.parseLong(object[5].toString()));
			reports.setTaxamount(Long.parseLong(object[6].toString()));
			reports.setOutwardchallanno(object[7].toString());
			System.out.println("hi this is kishor++++++"+object[7].toString());
			//System.out.println("HI THOS IS CHALLAN NO++++++"+object[6].toString());
			reports.setGrossTotal1(Double.parseDouble(object[8].toString()));
			reports.setBillNo1((object[9].toString()));
			//reports.setInwardChallanNo(object[8].toString());
			reports.setTotal(Double.parseDouble(object[10].toString()));
			reports.setDiscount1(Double.parseDouble(object[11].toString()));
			reports.setDiscountAmount1(Double.parseDouble(object[12].toString()));
			
			
	
			saleList.add(reports);
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	return saleList;		
}

/*create report for inward Shop wise*/
public List<InwardBean> getInwardDetailsTableforShopName(String shopName) {
	System.out.println("Shop name In Dao By inword Report Js========"+shopName);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc ="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal FROM inwand_details WHERE ShopName=:shopName  and pono=:abc");
		query.setParameter("shopName", shopName);
		query.setParameter("abc", abc);
		
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble(df3.format(object[5])));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}
 


/*End inword report Product Name Wise*/
//with PO 
public List<InwardBean> getInwardDetailsTableforShopNamewithpo(String shopName) {
	System.out.println("Shop name In Dao By inword Report Js========"+shopName);
	HibernateUtility hbu=null;
	Session session=null;
	List<InwardBean> inwardlist=null; 
	String abc ="";
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT pk_inward_id, suppliername,challan_No, inwardDate, productname, quantity, rate,GridTotal,pono FROM inwand_details WHERE ShopName=:shopName  and pono!=:abc");
		query.setParameter("shopName", shopName);
		query.setParameter("abc", abc);
		
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<InwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			 DecimalFormat df3 = new DecimalFormat(".##");
			InwardBean  reports=new InwardBean();
			
			
			reports.setPk_inward_id(Long.parseLong(object[0].toString()));
			reports.setSuppliername(object[1].toString());
			reports.setChallanno(object[2].toString());
			
			reports.setChalladate((Date)(object[3]));
			reports.setProductname(object[4].toString());	
			reports.setQuantity(Double.parseDouble(df3.format(object[5])));
			reports.setRate(Double.parseDouble(object[6].toString()));
			reports.setGridTotal(Double.parseDouble(object[7].toString()));
			reports.setPono((object[8].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}
/*bill Report*/
public List<SaleReports> billNoWiseReport(String fisDatebill, String endDatebill) {
	System.out.println("Last Date========"+endDatebill);
	HibernateUtility hbu=null;
	Session session=null;
	List<SaleReports> inwardlist=null; 
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT  b.bill_no1,b.creditcustomer,b.contact_No,b.gross_Total FROM bill_details b WHERE b.sale_Date BETWEEN :fisDatebill AND :endDatebill group by bill_no1 ");
		query.setParameter("fisDatebill", fisDatebill);
		query.setParameter("endDatebill", endDatebill);
	 List<Object[]> list = query.list();
		inwardlist= new ArrayList<SaleReports>(0);
		
		
		for (Object[] object : list)
		{
			
			
			SaleReports  reports=new SaleReports();
			
			
			reports.setBillno1(object[0].toString());
			System.out.println("BillNo"+object[0].toString());
			reports.setCusomerName(object[1].toString());
			System.out.println("cName"+object[1].toString());
			reports.setContactNo(Long.parseLong(object[2].toString()));
			System.out.println("cName"+Long.parseLong(object[2].toString()));
			reports.setTotalAmount(Double.parseDouble(object[3].toString()));
			System.out.println("cName"+Double.parseDouble(object[3].toString()));
			
			inwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return inwardlist;
}






}


