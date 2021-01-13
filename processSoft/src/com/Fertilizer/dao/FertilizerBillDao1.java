package com.Fertilizer.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.ExpenditurePaymentDetail;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.VendorPaymentBean;
import com.Fertilizer.utility.HibernateUtility;


public class FertilizerBillDao1 {
	
public void valBillDetails(CustomerBillBean1 bean) {
		
		System.out.println("In DAO");
		
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
			e.printStackTrace();
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

//this method for get last bill of customer from billDetails
public List getCustomerBill(){	
	HibernateUtility hbu=null;
	Session session=null;
	List<CustomerBillBean1> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT bill_no,pk_customer_id FROM bill_details ORDER BY bill_no DESC LIMIT 1");

		List<Object[]> list = query.list();
		saleList= new ArrayList<CustomerBillBean1>(0);
		for (Object[] object : list) {
			System.out.println("List size :::::::::"+list.size());
			CustomerBillBean1 reports = new CustomerBillBean1();
			reports.setBillNo((object[0].toString()));
			System.out.println("Bill no Object ::::::::::*************************"+object[0]);
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
//  this meathod for get last bill no for vendor payment  details 

public List getCustomerBill1(){	
	HibernateUtility hbu=null;
	Session session=null;
	List<VendorPaymentBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("SELECT bill_no,pk_vendor_payment_id FROM vendor_payment ORDER BY bill_no DESC LIMIT 1");

		List<Object[]> list = query.list();
		saleList= new ArrayList<VendorPaymentBean>(0);
		for (Object[] object : list) {
			System.out.println("List size :::::::::"+list.size());
			VendorPaymentBean reports = new VendorPaymentBean();
			reports.setBillNo((object[0].toString()));
			System.out.println("Bill no Object ::::::::::*************************"+object[0]);
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


//get All bill No to sale return
		public List getAllBillNoOnSaleReturn1() {
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
	
		public List<Object> getgstSalewholerangewise(String fDate, String tDate) { 
			// TODO Auto-generated method stub
			HibernateUtility hbu = null;
			Session session = null;
			//List<CustomerBillBean1> catList = null;
			List<CustomerBillBean1> saleList=null;
			List<CustomerBillBean1> saleList1=null;
			List<Object> mixedList=null;
			try {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Double tpersent = 0.0;
				Double tIpersent =0.0;
				Double gst = 0.0;
				Double tamount = 0.0;
				Double tTax = 0.0;
				Double Igst =0.0;
				//String abc ="";
				long abc=0;
				System.out.println("Before SQL Query In Helper");
				//Query query2 = session.createSQLQuery("SELECT  gst, sum(gross_Total - tax_amount) from bill_details WHERE sale_Date BETWEEN :startDate1 AND :enddate1 GROUP BY gst");
				Query query2 = session.createSQLQuery("SELECT  gst, sum(total) , sum(tax_amount) from bill_details WHERE sale_Date BETWEEN :startDate1 AND :enddate1 AND gst>0 GROUP BY gst");
				System.out.println("After SQL");
				query2.setParameter("startDate1", fDate);
				query2.setParameter("enddate1", tDate);
				List<Object[]> list = query2.list();
				saleList = new ArrayList<CustomerBillBean1>(0); 
			   	
			/*	CustomerBillBean1 st = (CustomerBillBean1)list.get(j);
				Long bill=st.getGst();*/
				
				
				for (Object[] object : list) {

					CustomerBillBean1 reports = new CustomerBillBean1();
				
					
					reports.setGst(Long.parseLong(object[0].toString()));
					tpersent = Double.parseDouble(object[0].toString());
					reports.settValue(object[1].toString());
					tamount = Double.parseDouble(object[2].toString());
					//gst = (tamount * (tpersent/2))/100;
					gst=(tamount/2);
					reports.setCgst(Double.toString(gst));
					reports.setSgst(Double.toString(gst));
					
					tTax = gst*2;
				
					reports.setTotalgst(Double.toString(tTax));
					reports.setIgst(Long.parseLong(object[2].toString()));
					reports.setIGst(Double.toString(0.0));
					
					saleList.add(reports);

				}
				
				Query query3 = session.createSQLQuery("SELECT  Igst,sum(total),sum(tax_amount) from bill_details WHERE sale_Date BETWEEN :startDate1 AND :enddate1 and igst>0 GROUP BY igst ");
				System.out.println("After SQL");
				query3.setParameter("startDate1", fDate);
				query3.setParameter("enddate1", tDate);
				//query3.setParameter("abc", gst);
				//query3.setParameter("startDate1", fDate);
				//query3.setParameter("enddate1", tDate);
				//query3.setParameter("gst1", gst1);
				List<Object[]> list3 = query3.list();
				saleList1 = new ArrayList<CustomerBillBean1>(0); 

				for (Object[] object : list3) {

					CustomerBillBean1 reports = new CustomerBillBean1();
				
					/*if( list3.equals(0) || list3.equals(null))*/
				/*	if( list3.size() == 0 || list3.isEmpty()){
						
						reports.setGst(0l);
						
						reports.setCgst(Double.toString(0.0));
						reports.setSgst(Double.toString(0.0));
						reports.setTotalgst(Double.toString(0.0));
						reports.setIGst(Double.toString(0.0));
					}*/
					
					
					reports.setGst(Long.parseLong(object[0].toString()));
					
					tIpersent = Double.parseDouble(object[0].toString());
					reports.settValue(object[1].toString());
					tamount = Double.parseDouble(object[2].toString());
					//gst = (tamount * (tpersent/2))/100;
					Igst=(tamount/2);
					reports.setCgst(Double.toString(0.0));
					reports.setSgst(Double.toString(0.0));
					tTax = Igst*2;
					reports.setTotalgst(Double.toString(tTax));
					reports.setIGst(Double.toString(tTax));
				
					saleList1.add(reports);
					
				}
				
				mixedList = new ArrayList<Object>(saleList1.size() + saleList.size());
				mixedList.addAll(saleList1);
				mixedList.addAll(saleList);				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			//return mixedList;
			return mixedList;
		}
		
		public List<CustomerBillBean1> getgstSalereportrangewise(String fDate, String tDate) {
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
				query2.setParameter("adate", fDate);
				query2.setParameter("bdate", tDate);
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
	
}