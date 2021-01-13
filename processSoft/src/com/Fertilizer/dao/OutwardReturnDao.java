package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.OutwardReturnBean;
import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.hibernate.OutwardReturn;
import com.Fertilizer.utility.HibernateUtility;

public class OutwardReturnDao {

	
	// Get All Outward return

	public void valPurchaseReturnOutward(OutwardReturn sdb) {
		
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
	
				 System.out.println("Tx started");
				session.save(sdb);
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
	// GEt VEndor Wise Reporets

		public List<OutwardReturnBean> OutwardReturnVendorNameWise1(String challanno ,String vendorName) {
			Double trans;
			Double hamali;
			HibernateUtility hbu=null;
			Session session=null;
			System.out.println("{{{{}}}}"+vendorName);
			List<OutwardReturnBean> saleList=null;
			try
			{
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
			 Query query = session.createSQLQuery("select pkGRDetailsid,SupplierName,ProductName,ChallanNo,outwardChallanno,Rate,OkQuantity,UnprocesQty,RejQty,ReturnQty,TotalValue from outward_return where SupplierName='"+vendorName+"' and outwardChallanno='"+challanno+"'");	
			 List<Object[]> list = query.list();
				 saleList= new ArrayList<OutwardReturnBean>(0);
				
				for (Object[] object : list) {
					
					OutwardReturnBean reports = new OutwardReturnBean();
					reports.setPkGRDetailsid(Long.parseLong((object[0].toString())));
					reports.setSupplierName((object[1].toString()));
					System.out.println("hi this si product name "+(object[1].toString()));
					reports.setProductName((object[2].toString()));
					reports.setChallanNo((object[3].toString()));
					reports.setOutwardChallanno(((object[4].toString())));
					reports.setRate(((object[5].toString())));
					reports.setOkQuantity(((object[6].toString())));
					reports.setUnprocesQty(((object[7].toString())));
					reports.setRejQty(((object[8].toString())));
					reports.setReturnQty(((object[9].toString())));
					reports.setTotalValue(((object[10].toString())));
					
					//System.out.println("hi this is kishor++++----"+GridTotal);
					saleList.add(reports);
			}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return saleList;
		}
		// Get all Out wardRetun Reports Range Wise 
		public List<OutwardReturnBean> OutwardReturnReportAsPerRangeWise1(String vendorName, String fisDate, String endDate) {
			Double trans;
			Double hamali;
			HibernateUtility hbu=null;
			Session session=null;
			System.out.println("{{{{}}}}"+vendorName);
			List<OutwardReturnBean> saleList=null;
			try
			{
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
			 Query query = session.createSQLQuery("select pkGRDetailsid,SupplierName,ProductName,ChallanNo,outwardChallanno,Rate,OkQuantity,UnprocesQty,RejQty,ReturnQty,TotalValue from outward_return where SupplierName='"+vendorName+"'  and date BETWEEN '"+fisDate+"' and '"+endDate+"' ");	
			 List<Object[]> list = query.list();
				 saleList= new ArrayList<OutwardReturnBean>(0);
				
				for (Object[] object : list) {
					
					OutwardReturnBean reports = new OutwardReturnBean();
					reports.setPkGRDetailsid(Long.parseLong((object[0].toString())));
					reports.setSupplierName((object[1].toString()));
					System.out.println("hi this si product name "+(object[1].toString()));
					reports.setProductName((object[2].toString()));
					reports.setChallanNo((object[3].toString()));
					reports.setOutwardChallanno(((object[4].toString())));
					reports.setRate(((object[5].toString())));
					reports.setOkQuantity(((object[6].toString())));
					reports.setUnprocesQty(((object[7].toString())));
					reports.setRejQty(((object[8].toString())));
					reports.setReturnQty(((object[9].toString())));
					reports.setTotalValue(((object[10].toString())));
					
					//System.out.println("hi this is kishor++++----"+GridTotal);
					saleList.add(reports);
			}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return saleList;
		}
		// Get all VendorWise report For Outward Return
		public List<OutwardReturnBean> OutwardReturnReportAsPerVendorNameWise1(String vendorName) {
			Double trans;
			Double hamali;
			HibernateUtility hbu=null;
			Session session=null;
			System.out.println("{{{{}}}}"+vendorName);
			List<OutwardReturnBean> saleList=null;
			try
			{
					hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
			 Query query = session.createSQLQuery("select pkGRDetailsid,SupplierName,ProductName,ChallanNo,outwardChallanno,Rate,OkQuantity,UnprocesQty,RejQty,ReturnQty,TotalValue from outward_return where SupplierName='"+vendorName+"'   ");	
			 List<Object[]> list = query.list();
				 saleList= new ArrayList<OutwardReturnBean>(0);
				
				for (Object[] object : list) {
					
					OutwardReturnBean reports = new OutwardReturnBean();
					reports.setPkGRDetailsid(Long.parseLong((object[0].toString())));
					reports.setSupplierName((object[1].toString()));
					System.out.println("hi this si product name "+(object[1].toString()));
					reports.setProductName((object[2].toString()));
					reports.setChallanNo((object[3].toString()));
					reports.setOutwardChallanno(((object[4].toString())));
					reports.setRate(((object[5].toString())));
					reports.setOkQuantity(((object[6].toString())));
					reports.setUnprocesQty(((object[7].toString())));
					reports.setRejQty(((object[8].toString())));
					reports.setReturnQty(((object[9].toString())));
					reports.setTotalValue(((object[10].toString())));
					
					//System.out.println("hi this is kishor++++----"+GridTotal);
					saleList.add(reports);
			}}
			catch(Exception e)
			{
				e.printStackTrace();	
			}
			return saleList;
		}
		
}
