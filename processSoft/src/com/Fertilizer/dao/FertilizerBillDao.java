package com.Fertilizer.dao;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.CreditCustBillNoAndName;
import com.Fertilizer.bean.CustomerBillBean;
import com.Fertilizer.bean.DayWiseSale;
import com.Fertilizer.bean.ExpenditurePaymentDetail;
import com.Fertilizer.bean.GetBillDetails;
import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.bean.SaleReports;
import com.Fertilizer.hibernate.CustomerDetailsBean;
import com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean;
import com.Fertilizer.hibernate.FertilizerBillBean;
import com.Fertilizer.hibernate.ItemStock;
import com.Fertilizer.hibernate.ItemStockForSeedAndPesti;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.SaleReturnBean;
import com.Fertilizer.utility.HibernateUtility;

public class FertilizerBillDao {

/*	public void addFertilizerBill(FertilizerBillBean bean) {


		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		 Long fk_product_id = bean.getFkProductID();
		 Long fkCreditCustomerId = bean.getFkCreditCustomerId();
		 Long quantity = bean.getQuantity();
		 Long fk_expense_id = bean.getFkExpenseId();
		  System.out.println("product id in dao= "+fk_product_id);
		  
		  session.save(bean);
			 
			transaction.commit();
			
			System.out.println("Successful");
		
			ExpenseDetailForBillingAndGoodsReceiveBean fkExpenseId = (ExpenseDetailForBillingAndGoodsReceiveBean) session.load(ExpenseDetailForBillingAndGoodsReceiveBean.class, fk_expense_id);
			bean.setExpenseDetailForBillingAndGoodsReceiveBean(fkExpenseId);
		  
		  
		  	ProductDetailsBean proDetail = (ProductDetailsBean) session.get(ProductDetailsBean.class, fk_product_id);
		 bean.setProductDetailsBean(proDetail);
		
		 if(fkCreditCustomerId != null){
			 CustomerDetailsBean custDetail = (CustomerDetailsBean) session.get(CustomerDetailsBean.class, fkCreditCustomerId);
			 bean.setCustomerDetailsBean(custDetail);
			 }
			 else{
				 bean.setCustomerDetailsBean(null);
			 }
		 
		String batchNo = bean.getBatchNo();
		int newBatch = batchNo.length();
			if (newBatch>0) {
				 Query query2 = session.createQuery("from ItemStockForSeedAndPesti where batchNo="+batchNo);
				 ItemStockForSeedAndPesti uniqueResult = (ItemStockForSeedAndPesti) query2.uniqueResult();
					Long pkItemStockId = uniqueResult.getPkItemStockId();
					ItemStockForSeedAndPesti gReceipt = (ItemStockForSeedAndPesti) session.get(ItemStockForSeedAndPesti.class, pkItemStockId);
					Long quantity2 = gReceipt.getStock();
					Long  qUSN= quantity2-quantity;
					gReceipt.setStock(qUSN);
					session.update(gReceipt);
			}
			else {
				 Query query2 = session.createQuery("from ItemStock where fkProductId="+fk_product_id);
					ItemStock uniqueResult = (ItemStock) query2.uniqueResult();
					Long pkItemStockId = uniqueResult.getPkItemStockId();
					ItemStock gReceipt = (ItemStock) session.get(ItemStock.class, pkItemStockId);
					Long quantity2 = gReceipt.getStock();
					Long  qUSN= quantity2-quantity;
					gReceipt.setStock(qUSN);
					session.update(gReceipt);
			}
		 
		 
		 
		
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
		
		
	}*/

	

	public void addFertilizerBillingInDAO(FertilizerBillBean bean) {

		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 System.out.println("got session ");
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
	

	// get All bill No to sale return
		public List getAllBillNoOnSaleReturn() {
			HibernateUtility hbu = null;
			Session session = null;
			Query query = null;
			List list = null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				query = session.createQuery("from CustomerBillBean1 group by billNo");
				list = query.list();
			} catch (RuntimeException e) {
				Log.error("Error in getAllSupllier", e);
			}

			finally {
				if (session != null) {
					hbu.closeSession(session);
				}
			}
			return list;

		}
		
		// get All village for balance report
				public List getAllVillageForBalanceReport() {
					HibernateUtility hbu = null;
					Session session = null;
					Query query = null;
					List list = null;
					try {
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						query = session.createQuery("from FertilizerBillBean");
						list = query.list();
					} catch (RuntimeException e) {
						Log.error("Error in getAllSupllier", e);
					}

					finally {
						if (session != null) {
							hbu.closeSession(session);
						}
					}
					return list;

				}




		// get all ferti item of sale return
		public List getAllFertiIetmByBillNo(String bill_no) {
			// TODO Auto-generated method stub
			HibernateUtility hbu=null;
			Session session=null;
			List list=null;
				
				try{
				 hbu=HibernateUtility.getInstance();
				 session=hbu.getHibernateSession();
				 
				Query query=session.createSQLQuery("SELECT p.pk_fertilizer_bill_id,p.fk_goods_receive_id ,p.cat_id,p.customer_name,p.product_name,p.company,p.weight,p.sale_price,p.mrp,p.quantity_after_return,p.total_per_product,p.barcode,p.aadhar,p.insert_date,p.credit_customer_name,p.tax_percentage from fertilizer_billing p WHERE p.bill_no=:bill_no");
				 
				
				 query.setParameter("bill_no", bill_no);
				
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

	
		// get all ferti item of sale return
				public List getAllFertiIetmByBillNoSale(String bill_no) {
					// TODO Auto-generated method stub
					HibernateUtility hbu=null;
					Session session=null;
					List list=null;
						
						try{
						 hbu=HibernateUtility.getInstance();
						 session=hbu.getHibernateSession();
						 
						//Query query=session.createSQLQuery("SELECT p.pk_fertilizer_bill_id,p.fk_goods_receive_id ,p.cat_id,p.customer_name,p.product_name,p.company,p.weight,p.sale_price,p.mrp,p.quantity_after_return,p.total_per_product,p.barcode,p.aadhar,p.insert_date,p.credit_customer_name,p.tax_percentage from fertilizer_billing p WHERE p.bill_no=:bill_no");
						Query query=session.createSQLQuery("SELECT p.pk_customer_id,p.custname,p.sale_Date,p.product_Name,p.Operation,p.okquantity,p.buy_Price,p.total,p.gross_Total,p.discount,p.gst,p.Igst,p.bill_no,p.grid_Total,p.creditcustomer,p.tax_amount from bill_details p WHERE p.bill_no=:bill_no");
						
						 query.setParameter("bill_no", bill_no);
						
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
		
	public List getCustomerBill(){	
		HibernateUtility hbu=null;
		Session session=null;
		List<CustomerBillBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT bill_no , customer_name FROM fertilizer_billing ORDER BY bill_no DESC LIMIT 1");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<CustomerBillBean>(0);
			for (Object[] object : list) {
				CustomerBillBean reports = new CustomerBillBean();
				reports.setBillNo(Double.parseDouble(object[0].toString()));
				saleList.add(reports);	 
		}}
		catch(RuntimeException e)
		{
			Log.error("Error in getCustomerBill()", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return saleList;
		}
	
	
	public List getAllClosingReport(){
		   java.util.Date date = new java.util.Date();  
		    DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		    String data = (dateFormat.format(date)); //2014/08/06 15:59:4
		    HibernateUtility hbu=null;
		    Session session=null;
		    List<DayWiseSale> saleList=null;
		    try
		    {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
		 Query query=session.createSQLQuery("select customerBill, product_name , quantity , sale_price ,gross_total, payment_mode from fertilizer_bill where  insert_date="+data);	
			List<Object[]> list = query.list();
			 saleList= new ArrayList<DayWiseSale>(0);	
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				DayWiseSale reports = new DayWiseSale();
				reports.setCustomerBill(Long.parseLong(object[0].toString()));
				reports.setItemName(object[1].toString());
				reports.setQuantity1((BigInteger) object[2]);
				reports.setPrice(Double.parseDouble(object[3].toString()));
			
				reports.setTotAmount(Double.parseDouble(object[4].toString()));
				reports.setPaymentMode(object[5].toString());
				
				saleList.add(reports);		
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}/*finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}*/
		return saleList;
	}
	
	public List getSaleDetailsDateWise(String startDate,String endDate){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<SaleReports> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query2 = session.createSQLQuery("select DATE(c.insert_date) , c.quantity , c.sale_price ,c.gross_total,c.customerBill,c.expenses from fertilizer_bill c  where c.insert_date BETWEEN :stDate AND :edDate");
			query2.setParameter("stDate", startDate);
	        query2.setParameter("edDate", endDate);
	        List<Object[]> list = query2.list();
			 	saleList= new ArrayList<SaleReports>(0);
			
			
			for (Object[] object : list) {
				
				SaleReports reports = new SaleReports();
				reports.setSoldDate(object[0].toString());
				System.out.println(Arrays.toString(object));
				
				
					reports.setSalePriceforsale((BigDecimal)object[2]);
					reports.setQuantity1((BigInteger)object[1]);
				reports.setTotalAmount(Double.parseDouble(object[3].toString()));
			    reports.setCustomerBill(Integer.parseInt(object[4].toString()));
			    reports.setExpenses((BigDecimal)object[5]);
				saleList.add(reports); 
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saleList;
		
	}
	public List getSaleDetailsBySingalDateWise(String isInsertDate){
		
		HibernateUtility hbu=null;
		Session session=null;
		List<SaleReports> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery(" select customerBill,  DATE(insert_date) , quantity  ,sale_price , gross_total ,expenses from fertilizer_bill where DATE(insert_date)=:isInsertDate ");
			query.setParameter("isInsertDate", isInsertDate);
			List<Object[]> list = query.list();
			 saleList= new ArrayList<SaleReports>(0);
			
			
			for (Object[] object : list) {
				
			SaleReports reports = new SaleReports();
				reports.setCustomerBill(Integer.parseInt(object[0].toString()));
				reports.setSoldDate(object[1].toString());
				reports.setQuantity1(((BigInteger) object[2]));
				reports.setSalePrice(Double.parseDouble(object[3].toString()));

				reports.setTotalAmount(Double.parseDouble(object[4].toString()));
				reports.setExpenses((BigDecimal)object[5]);
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;	
	}
	
	
	//this method is used to get the all bill no of fertilizer and sedds and pesticides 
	

public List getNorCustBillAndClientName()
		{
			HibernateUtility hbu=null;
			Session session=null;
			
			List<GetBillDetails> billList=null;
			 List<Object[]> list = null;
			
			try
			{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query=session.createSQLQuery("select bill_no, customer_name from seed_pesticide_billing where customer_name != 'N/A' group by bill_no;");
					list = query.list();
					billList = new ArrayList<GetBillDetails>(0);
					
			 for (Object[] objects : list) {
				 GetBillDetails bean = new GetBillDetails();
				
				bean.setBillNo(Long.parseLong(objects[0].toString()));
				bean.setClientName((String) objects[1]);
				 
				billList.add(bean);
				}
			 }
			catch(RuntimeException  e)
			{
					
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			return billList;
		}



public List getNorCustBillAndClientNameForPestiBillCopy()
		{
			HibernateUtility hbu=null;
			Session session=null;
			
			List<GetBillDetails> billList=null;
			 List<Object[]> list = null;
			
			try
			{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query=session.createSQLQuery("select bill_no, customer_name from pesticide_billing where customer_name != 'N/A' group by bill_no;");
					list = query.list();
					billList = new ArrayList<GetBillDetails>(0);
					
			 for (Object[] objects : list) {
				 GetBillDetails bean = new GetBillDetails();
				
				bean.setBillNo(Long.parseLong(objects[0].toString()));
				bean.setClientName((String) objects[1]);
				 
				billList.add(bean);
				}
			 }
			catch(RuntimeException  e)
			{
					
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			return billList;
		}


		
		
		//this method is used to get the all bill no of fertilizer and sedds and pesticides 
		



public List getCreditCustBIllAndClientName()
			{
				HibernateUtility hbu=null;
				Session session=null;
				
				List<CreditCustBillNoAndName> billList=null;
				 List<Object[]> list = null;
				 
				 String fname;
					String lname;

					String clientName;
				
				try
				{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						Query query=session.createSQLQuery("select seed_pesticide_billing.bill_no, customer_details.first_name, customer_details.last_name from seed_pesticide_billing left join customer_details on seed_pesticide_billing.fk_customer_id = customer_details.pk_customer_id where seed_pesticide_billing.fk_customer_id != 0 OR seed_pesticide_billing.fk_customer_id != null group by bill_no");
						list = query.list();
						billList = new ArrayList<CreditCustBillNoAndName>(0);
						
				 for (Object[] objects : list) {
					 CreditCustBillNoAndName bean = new CreditCustBillNoAndName();
					
					bean.setBillNo(Long.parseLong(objects[0].toString()));
					//bean.setClientName((String) objects[1]);
					
					fname = (String) objects[1];
					lname = (String) objects[2];
					clientName = fname+" "+lname;
					bean.setClientName(clientName);
					
					System.out.println("creit cust Bill No and name++++++"+objects[0].toString()+"++++++++++"+(String) objects[1]);
					 
					billList.add(bean);
					}
				 }
				catch(RuntimeException  e)
				{
						
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return billList;
			}



public List getCreditCustBIllAndClientNameFoerPestiBillCopy()
			{
				HibernateUtility hbu=null;
				Session session=null;
				
				List<CreditCustBillNoAndName> billList=null;
				 List<Object[]> list = null;
				 
				 String fname;
					String lname;

					String clientName;
				
				try
				{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						Query query=session.createSQLQuery("select p.bill_no, customer_details.first_name, customer_details.last_name from pesticide_billing p left join customer_details on p.fk_customer_id = customer_details.pk_customer_id where p.fk_customer_id != 0 OR p.fk_customer_id != null group by p.bill_no");
						list = query.list();
						billList = new ArrayList<CreditCustBillNoAndName>(0);
						
				 for (Object[] objects : list) {
					 CreditCustBillNoAndName bean = new CreditCustBillNoAndName();
					
					bean.setBillNo(Long.parseLong(objects[0].toString()));
					//bean.setClientName((String) objects[1]);
					
					fname = (String) objects[1];
					lname = (String) objects[2];
					clientName = fname+" "+lname;
					bean.setClientName(clientName);
					
					System.out.println("creit cust Bill No and name++++++"+objects[0].toString()+"++++++++++"+(String) objects[1]);
					 
					billList.add(bean);
					}
				 }
				catch(RuntimeException  e)
				{
						
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return billList;
			}

			
			public List getAmountByCreditCustPayment(String startDate, String endDate) {

				HibernateUtility hbu = null;
				Session session = null;
				List<SaleReports> saleList = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					// Query query2 =
					// session.createSQLQuery("select DATE(c.insert_date) , c.quantity , c.sale_price ,c.gross_total,c.customerBill,c.expenses from fertilizer_bill c  where c.insert_date BETWEEN :stDate AND :edDate");
					Query query2 = session.createSQLQuery("select insert_date,bill_no, first_name, credit from credit_customer_payment left join customer_details on credit_customer_payment.fk_customer_id = customer_details.pk_customer_id where insert_date BETWEEN :stDate AND :edDate");
					query2.setParameter("stDate", startDate);
					query2.setParameter("edDate", endDate);
					List<Object[]> list = query2.list();
					saleList = new ArrayList<SaleReports>(0);

					for (Object[] object : list) {

						SaleReports reports = new SaleReports();
						reports.setSoldDate(object[0].toString());
						reports.setCustomerBill(Integer.parseInt(object[1].toString()));
						reports.setCusomerName(object[2].toString());
						reports.setTotalAmount(Double.parseDouble(object[3].toString()));

						saleList.add(reports);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return saleList;

			}
			
			
			// this method is used to get the credit amount by customer billing

			public List getAmountByCustBilling(String startDate, String endDate) {

				HibernateUtility hbu = null;
				Session session = null;
				List<SaleReports> saleList = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					// Query query2 =
					// session.createSQLQuery("select DATE(c.insert_date) , c.quantity , c.sale_price ,c.gross_total,c.customerBill,c.expenses from fertilizer_bill c  where c.insert_date BETWEEN :stDate AND :edDate");
					Query query2 = session.createSQLQuery("select date(insert_date), customerBill, customer_name, payment_mode,gross_total from fertilizer_bill where insert_date BETWEEN :stDate AND :edDate && customer_name != 'N/A'");
					query2.setParameter("stDate", startDate);
					query2.setParameter("edDate", endDate);
					List<Object[]> list = query2.list();
					saleList = new ArrayList<SaleReports>(0);

					for (Object[] object : list) {

						SaleReports reports = new SaleReports();
						reports.setSoldDate(object[0].toString());
						reports.setCustomerBill(Integer.parseInt(object[1].toString()));
						reports.setCusomerName(object[2].toString());
						reports.setPaymentMode(object[3].toString());
						reports.setTotalAmount(Double.parseDouble(object[4].toString()));

						saleList.add(reports);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return saleList;

			}
			
			public List getPaidAmountToSupplier(String startDate, String endDate) {

				HibernateUtility hbu = null;
				Session session = null;
				List<SaleReports> saleList = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					// Query query2 =
					// session.createSQLQuery("select DATE(c.insert_date) , c.quantity , c.sale_price ,c.gross_total,c.customerBill,c.expenses from fertilizer_bill c  where c.insert_date BETWEEN :stDate AND :edDate");
					Query query2 = session.createSQLQuery("select insert_date, bill_no, person_name, credit from supplier_payment where insert_date BETWEEN :stDate AND :edDate");
					query2.setParameter("stDate", startDate);
					query2.setParameter("edDate", endDate);
					List<Object[]> list = query2.list();
					saleList = new ArrayList<SaleReports>(0);

					for (Object[] object : list) {

						SaleReports reports = new SaleReports();
						reports.setSoldDate(object[0].toString());
						reports.setCustomerBill(Integer.parseInt(object[1].toString()));
						reports.setCusomerName(object[2].toString());
						reports.setTotalAmount(Double.parseDouble(object[3].toString()));

						saleList.add(reports);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return saleList;

			}
			
			
			public List getPaidAmountToEmployee(String startDate, String endDate) {

				HibernateUtility hbu = null;
				Session session = null;
				List<SaleReports> saleList = null;
				try {
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					// Query query2 =
					Query query2 = session.createSQLQuery("select insert_date, first_name, reason, credit from employee_payment left join employee_details on employee_payment.fk_employee_id = employee_details.pk_empoyee_id where insert_date BETWEEN :stDate AND :edDate");
					query2.setParameter("stDate", startDate);
					query2.setParameter("edDate", endDate);
					System.out.println(startDate);
					System.out.println(endDate);
					List<Object[]> list = query2.list();
					saleList = new ArrayList<SaleReports>(0);

					for (Object[] object : list) {

						SaleReports reports = new SaleReports();
						reports.setSoldDate(object[0].toString());
						reports.setCusomerName(object[1].toString());
						reports.setReason(object[2].toString());
						reports.setTotalAmount(Double.parseDouble(object[3].toString()));

						saleList.add(reports);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return saleList;

			}
			
			public List getNormalCustFertilizerBillNos()
			{
				HibernateUtility hbu=null;
				Session session=null;
				
				List<GetBillDetails> billList=null;
				 List<Object[]> list = null;
				
				try
				{
						hbu = HibernateUtility.getInstance();
						session = hbu.getHibernateSession();
						Query query=session.createSQLQuery("select bill_no, customer_name from fertilizer_billing where customer_name != 'N/A' group by bill_no;");
						list = query.list();
						billList = new ArrayList<GetBillDetails>(0);
						
				 for (Object[] objects : list) {
					 GetBillDetails bean = new GetBillDetails();
					
					bean.setBillNo(Long.parseLong(objects[0].toString()));
					bean.setClientName((String) objects[1]);
					 
					billList.add(bean);
					}
				 }
				catch(RuntimeException  e)
				{
						
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return billList;
			}
			
			// Get Credit Customer  Fertilizer Bill Nos from Fertilizer_billing table
			
						public List getCreditCustFertilizerBillNos()
						{
							HibernateUtility hbu=null;
							Session session=null;
							
							String fname;
							String lname;

							String clientName;
							
							List<GetBillDetails> billList=null;
							 List<Object[]> list;
							
							try
							{
									hbu = HibernateUtility.getInstance();
									session = hbu.getHibernateSession();
									//Query query=session.createSQLQuery("select bill_no, customer_name from fertilizer_billing where customer_name != 'N/A' group by bill_no;");
									Query query=session.createSQLQuery("select fertilizer_billing.bill_no, customer_details.first_name, customer_details.last_name from fertilizer_billing left join customer_details on fertilizer_billing.fk_customer_id = customer_details.pk_customer_id where fertilizer_billing.fk_customer_id != 0 OR fertilizer_billing.fk_customer_id != null group by bill_no");
									list = query.list();
									billList = new ArrayList<GetBillDetails>(0);
									
							 for (Object[] objects : list) {
								 GetBillDetails bean = new GetBillDetails();
								
								bean.setBillNo(Long.parseLong(objects[0].toString()));
								fname = (String) objects[1];
								lname = (String) objects[2];
								clientName = fname+" "+lname;
								bean.setClientName(clientName);
								 
								billList.add(bean);
								}
							 }
							catch(RuntimeException  e)
							{
									
							}finally
							{if(session!=null){
								hbu.closeSession(session);	
							}
							}
							return billList;
						}
			
						// Tax details as per cat from sale Two Date

						public List<GetProductDetails> getPurchaseDetailsForCategoryBetTwoDate(
								String cat, String fDate, String sDate) {


							HibernateUtility hbu=null;
							Session session=null;
							List<GetProductDetails> saleList=null;
							try
							{
									hbu = HibernateUtility.getInstance();
							 session = hbu.getHibernateSession();
							 Query query = session.createSQLQuery(" SELECT bill_no,product_name, company ,weight,sale_price, mrp,quantity,tax_percentage,total_per_product FROM fertilizer_billing WHERE cat_id =:cat AND tax_percentage>0 AND DATE(insert_date) BETWEEN :fDate AND :sDate UNION SELECT bill_no,product_name, company ,weight,sale_price, mrp,quantity,tax_percentage,total_per_product FROM seed_pesticide_billing WHERE cat_id =:cat AND tax_percentage>0 AND DATE(insert_date) BETWEEN :fDate AND :sDate");
								query.setParameter("cat", cat);
								query.setParameter("fDate", fDate);
								query.setParameter("sDate", sDate);
								List<Object[]> list = query.list();
								 saleList= new ArrayList<GetProductDetails>(0);
								
								
								for (Object[] o : list) {
									
									GetProductDetails reports = new GetProductDetails();
									reports.setBillNo(Long.parseLong(o[0].toString()));
									reports.setProduct(o[1].toString());
									reports.setManufacturer(o[2].toString());
									reports.setWeight(Double.parseDouble(o[3].toString()));
									reports.setSalePrice(Double.parseDouble(o[4].toString()));
									reports.setMrp(Double.parseDouble(o[5].toString()));
									reports.setQuantity(Long.parseLong(o[6].toString()));
									reports.setTaxPercentage(Double.parseDouble(o[7].toString()));
									
									Double salePrice = Double.parseDouble(o[4].toString());
									Double TaxPercentage = Double.parseDouble(o[7].toString());
									Double taxAmountPerunit = (TaxPercentage/100)*salePrice;
									Double newSale = salePrice + taxAmountPerunit;
									Double quantity = Double.parseDouble(o[6].toString());
									Double totalTaxAmount = quantity * taxAmountPerunit;
									
									reports.setTaxAmount(totalTaxAmount);
								
									saleList.add(reports);
							}}
							catch(Exception e)
							{
								e.printStackTrace();	
							}
							return saleList;	
						
						
						
						}
						
						
						
				
						public List<FertilizerBillBean> getBalanceReportPerVillageName(
								 String expenseName) {

							HibernateUtility hbu=null;
							Session session=null;
							List<FertilizerBillBean> expenseList=null;
							try
							{
								hbu = HibernateUtility.getInstance();
							 session = hbu.getHibernateSession();
							 Query query2 = session.createSQLQuery("select credit_customer_name, Sum(gross_total),cp.bill_no,sum(cp.balance) FROM fertilizer_billing fb RIGHT JOIN credit_customer_payment cp ON fb.fk_customer_id = cp.fk_customer_id WHERE fb.village='"+expenseName+"'group by fb.village ");
							 Query query3 = session.createSQLQuery("select credit_customer_name, gross_total,bill_no FROM fertilizer_billing  WHERE village='"+expenseName+"' group by bill_no");
							 /*query2.setParameter("stDate", fDate);
						        query2.setParameter("edDate", tDate);*/
						        List<Object[]> list = query2.list();
						        List<Object[]> list1 = query3.list();
						        expenseList= new ArrayList<FertilizerBillBean>(0);
								
								int lSize=list.size();
						        
								if(lSize == 0){
									
									for (Object[] object : list) {
										
										FertilizerBillBean reports = new FertilizerBillBean();
										
										reports.setCustomerName(object[0].toString());
										/*reports.setServiceProviderName(object[1].toString());*/
										reports.setGrossTotal(Double.parseDouble(object[1].toString()));
										/*reports.setBillNo(Long.parseLong(object[2].toString()));*/
										reports.setCpBalance(Double.parseDouble(object[3].toString()));
										
										expenseList.add(reports); 
								
									 }
							
							
									}
						      else{  
						        
								for (Object[] object : list) {
										
									FertilizerBillBean reports = new FertilizerBillBean();
									
									reports.setCustomerName(object[0].toString());
									/*reports.setServiceProviderName(object[1].toString());*/
									reports.setGrossTotal(Double.parseDouble(object[1].toString()));
									/*reports.setBillNo(Long.parseLong(object[2].toString()));*/
									reports.setCpBalance(Double.parseDouble(object[3].toString()));
									
									expenseList.add(reports); 
							
								}
							}
							}
							catch(Exception e)
							{
								e.printStackTrace();
							}
							return expenseList;
							
			}
						
							
	public List getTotalAmount( String supplier) {

			HibernateUtility hbu = null ;
			Session session = null;
			List list  = null;
			try 
			{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
			   	Query query = session.createSQLQuery("select sum(gross_Total),creditcustomer FROM bill_details where creditcustomer='"+supplier+"'");
				System.out.println("In dao get total");
				list = query.list();
				System.out.println("List size in DAO of total = == ="+list.size());
			} catch (Exception e) 
			{
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
							
	}//
	
	
	public List getAllSaleReturnDetails() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from SaleReturnBean group by customerName");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllMainCat", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

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
			 query = session.createQuery("from SaleReturnBean");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllShops", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
	}
							
	
	public List<SaleReturnBean> saleReturnVendorNameWise(String BillNO ,String vendorName) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+vendorName);
		List<SaleReturnBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();		
		 Query query = session.createSQLQuery("select pk_sale_return_id, bill_number, product_name, company, customer_name, sale_price, tax_percenntage, availabe_quantity, return_quantity, sale_date from sale_return where customer_name='"+vendorName+"' and bill_number='"+BillNO+"'");
		 
		 List<Object[]> list = query.list();
			 saleList= new ArrayList<SaleReturnBean>(0);
			
			for (Object[] object : list) {
				
				SaleReturnBean reports = new SaleReturnBean();
				
				reports.setPkSaleReturnId(Long.parseLong((object[0].toString())));
				reports.setBillNo(Long.parseLong(object[1].toString()));
				reports.setProductName(object[2].toString());
				reports.setCompany(object[3].toString());
				reports.setCustomerName(object[4].toString());
				reports.setSalePrice(Double.parseDouble(object[5].toString()));
				reports.setTaxPercentage(Double.parseDouble(object[6].toString()));
				reports.setAvailableQuantity(Double.parseDouble(object[7].toString()));
				reports.setReturnQuantity(Double.parseDouble(object[8].toString()));
				
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saleList;
	}				

}
