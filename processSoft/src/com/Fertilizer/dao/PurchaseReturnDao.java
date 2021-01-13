package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.InwardProcessingInformation;
import com.Fertilizer.hibernate.OutwardReturn;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.PurchaseReturn;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class PurchaseReturnDao {
	
	
	/*public GrDetailsBean getQuantity2(String billno, String productname) {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		Query query = null;
		GrDetailsBean saleList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT inward_processing_info_pk, challan_no FROM inward_processing_info WHERE fk_operation_details_id = 2 AND purchase_order_no = 0  ORDER BY inward_processing_info_pk");
			query = session.createSQLQuery("select billno, productname, quantity from inward_processing_info WHERE billno ='"+billno+"'AND productname ='"+productname+"'");
			 
			List<Object[]> list = query.list();
			 saleList= new GrDetailsBean();
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				GrDetailsBean reports = new GrDetailsBean();
					
					reports.setBillno(Double.parseDouble(object[0].toString()));
					reports.setProductname(object[1].toString());
					reports.setQuantity(Double.parseDouble(object[2].toString()));
					//System.out.println("in DAO inwardBean.getInwardProcessingInfoPk():- "+reports.getInwardProcessingInfoPk());
		    		//System.out.println("in DAO inwardBean.getChallanNo():- "+reports.getChallanNo());
					
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
	}*/
	
	
	
	
	
	public List getQuantity(String billno, String productname) {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		Query query = null;
		List<GrDetailsBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT inward_processing_info_pk, challan_no FROM inward_processing_info WHERE fk_operation_details_id = 2 AND purchase_order_no = 0  ORDER BY inward_processing_info_pk");
			query = session.createSQLQuery("select pk_gr_id, billno, productname, quantity from gr_details WHERE billno ='"+billno+"'AND productname ='"+productname+"'");
			 
			List<Object[]> list = query.list();
			 saleList= new ArrayList<GrDetailsBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				GrDetailsBean reports = new GrDetailsBean();
				
				reports.setPk_GRDetails_id(Long.parseLong(object[0].toString()));
				reports.setBillno(Double.parseDouble(object[1].toString()));
				reports.setProductname(object[2].toString());
				reports.setQuantity(Double.parseDouble(object[3].toString()));
				System.out.println("in DAO reports.getPk_GRDetails_id() :- "+reports.getPk_GRDetails_id());
				System.out.println("in DAO reports.getBillno() :- "+reports.getBillno());
	    		System.out.println("in DAO reports.getQuantity():- "+reports.getQuantity());
				
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
	
	
	
	public List getQuantity1(String billno, String productname) {

		System.out.println("into dao supplier : "+billno);
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select inward_processing_info_pk, purchase_order_no, challan_no from inward_processing_info WHERE billno ='"+billno+"'AND productname ='"+productname+"'");
			 
			 list = query.list(); 
		} catch (RuntimeException e) {
			e.printStackTrace();
		}//GrDetailsBean bean=new GrDetailsBean();
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
		 System.out.println("out of dao - return credit customer List : "+list);
				return list;
	}

	
	public void valPurchaseReturn(PurchaseReturn sdb) {
		
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
	// GEt Bill No 
	public List getAllBillNo()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from PurchaseReturn");
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
	
	// GEt VEndor Wise Reporets

	public List<PurchaseReturnBean> PurchaseReturnVendorNameWise1(String BillNO ,String vendorName) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+vendorName);
		List<PurchaseReturnBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
		 //Query query = session.createSQLQuery("select pk_GRDetails_id,productname,billno,quantity,discount,gst,igst,Quantity1,TaxAmount,GridTotal,grosstotal from purchase_return where suppliername='"+vendorName+"' and billno='"+BillNO+"'");	
		 
		 Query query = session.createSQLQuery("select pk_purchase_return_id, bill_number, product_name, available_quantity, return_quantity, discount, gst, taxAmount, gross_total from purchase_return where suppliername='"+vendorName+"' and bill_number='"+BillNO+"'");
		 
		 List<Object[]> list = query.list();
			 saleList= new ArrayList<PurchaseReturnBean>(0);
			
			for (Object[] object : list) {
				
				PurchaseReturnBean reports = new PurchaseReturnBean();
				
				reports.setPk_GRDetails_id(Long.parseLong((object[0].toString())));
				reports.setBillno((object[1].toString()));
				reports.setProductname((object[2].toString()));
				System.out.println("hi this si product name "+(object[1].toString()));
				reports.setQuantity((object[3].toString()));
				reports.setQuantity1(((object[4].toString())));
				reports.setDiscount(((object[5].toString())));
				reports.setGst(((object[6].toString())));
//				reports.setIgst(((object[6].toString())));
				reports.setTaxAmount(((object[7].toString())));
//				reports.setGridTotal(((object[8].toString())));
				reports.setGrosstotal(object[8].toString());

				
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;
	}
// Get all Retun Reports Range Wise 
	public List<PurchaseReturnBean> PoReturnReportAsPerRangeWise1(String vendorName, String fisDate, String endDate) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+vendorName);
		List<PurchaseReturnBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
		 Query query = session.createSQLQuery("select pk_GRDetails_id,productname,billno,quantity,discount,gst,igst,Quantity1,TaxAmount,GridTotal,grosstotal from purchase_return where suppliername='"+vendorName+"' and date BETWEEN '"+fisDate+"' and  '"+endDate+"' ");	
		 List<Object[]> list = query.list();
			 saleList= new ArrayList<PurchaseReturnBean>(0);
			
			for (Object[] object : list) {
				
				PurchaseReturnBean reports = new PurchaseReturnBean();
				reports.setPk_GRDetails_id(Long.parseLong((object[0].toString())));
				reports.setProductname((object[1].toString()));
				System.out.println("hi this si product name "+(object[1].toString()));
				reports.setBillno((object[2].toString()));
				reports.setQuantity((object[3].toString()));
				reports.setDiscount(((object[4].toString())));
				reports.setGst(((object[5].toString())));
				reports.setIgst(((object[6].toString())));
				reports.setQuantity1(((object[7].toString())));
				reports.setTaxAmount(((object[8].toString())));
				reports.setGridTotal(((object[9].toString())));
				reports.setGrosstotal(((object[10].toString())));
				
				//System.out.println("hi this is kishor++++----"+GridTotal);
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;
	}
// Get all VendorWise report
	public List<PurchaseReturnBean> PoReturnReportAsPerVendorNameWise2(String vendorName) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+vendorName);
		List<PurchaseReturnBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		// Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+BillNO+"'And pd.suppliername='"+vendorName+"'");
		 Query query = session.createSQLQuery("select pk_GRDetails_id,productname,billno,quantity,discount,gst,igst,Quantity1,TaxAmount,GridTotal,grosstotal from purchase_return where suppliername='"+vendorName+"'  ");	
		 List<Object[]> list = query.list();
			 saleList= new ArrayList<PurchaseReturnBean>(0);
			
			for (Object[] object : list) {
				
				PurchaseReturnBean reports = new PurchaseReturnBean();
				reports.setPk_GRDetails_id(Long.parseLong((object[0].toString())));
				reports.setProductname((object[1].toString()));
				System.out.println("hi this si product name "+(object[1].toString()));
				reports.setBillno((object[2].toString()));
				reports.setQuantity((object[3].toString()));
				reports.setDiscount(((object[4].toString())));
				reports.setGst(((object[5].toString())));
				reports.setIgst(((object[6].toString())));
				reports.setQuantity1(((object[7].toString())));
				reports.setTaxAmount(((object[8].toString())));
				reports.setGridTotal(((object[9].toString())));
				reports.setGrosstotal(((object[10].toString())));
				
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
