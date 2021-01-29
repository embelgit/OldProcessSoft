package com.Fertilizer.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.StockDetail;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.OutwardStockHibernate;
import com.Fertilizer.utility.HibernateUtility;

public class PackingInfoDao {

	public void valOwDetails(OutwardBean bean) {
		
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
	
	//outwardStockEntry
	public void outwardStockEntry(OutwardStockHibernate hibernate) {
		
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
	
				 System.out.println("Tx started");
				session.save(hibernate);
				transaction.commit();
				System.out.println("Successful outwardStockEntry");
		} catch(RuntimeException e) {
			e.printStackTrace();
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		} finally {
			hbu.closeSession(session);
		}
	}
	
//for bill copy

	public List getAllVendorBillNo1(String supplier)
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		
		try {
			//String paymentdone = "y";
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			String abc = "0.0";
			Query query = session.createSQLQuery("SELECT o.outwardchallan_no, o.grosstotal,o.pk_outward_id FROM outward_details o WHERE o.suppliername ='" + supplier + "'");
			list = query.list();
		
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
		
	}
	
	//for bill  copy Outward Return 
	public List getAllVendorBillNo3(String supplier)
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		
		try {
			//String paymentdone = "y";
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			String abc = "0.0";
			Query query = session.createSQLQuery("SELECT o.outwardChallanno, o.TotalValue,o.pkGRDetailsid FROM outward_return o WHERE o.suppliername ='"+supplier+"' GROUP BY outwardChallanno");
			list = query.list();
		
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
		
	}
	
	//uhij
	public List<OutwardStockHibernate> getOutwardStockDetailsAsPerProductName(String proName) {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<OutwardStockHibernate> stockList = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("select id.productname,od.suppliername,od.challan_No,od.outwardchallan_no,id.quantity,od.okquantity, id.dup_quantity,od.rejectedquantity,od.unprocessquantity,(id.quantity-dup_quantity-rejectedquantity-unprocessquantity-okquantity) as Available_total,(od.dupQuantity - od.okquantity) as new_total from inwand_details id join outward_details od on id.challan_No = od.challan_No where od.productName =:proName and id.productname =od.productName  order BY od.pk_outward_id  ");
			
			Query query = session.createSQLQuery("select product_name, supplier_name, challan_no, outward_challan_no, ok_quantity, unprocess_quantity, rejected_quantity, last_update_date from outward_stock_details  where product_name =:proName  order BY pk_outward_stock_id ");		
			query.setParameter("proName", proName);
			// query.setParameter("company", company);
			/* query.setParameter("weight", weight);*/
			
			List<Object[]> list = query.list();
			stockList = new ArrayList<OutwardStockHibernate>(0);
			for (Object[] object : list) {
				DecimalFormat df2 = new DecimalFormat(".##");
				
				OutwardStockHibernate reports = new OutwardStockHibernate();
				
				reports.setProductName(object[0].toString());
				reports.setSupplierName(object[1].toString());
				reports.setChallanNo(object[2].toString());
				reports.setOutwardChallanNo(object[3].toString());
				reports.setOkQuantity(Double.parseDouble(object[4].toString()));
				reports.setUnprocessQuantity(Double.parseDouble(object[5].toString()));
				reports.setRejectedQuantity(Double.parseDouble(object[6].toString()));
				reports.setLastUpdateDate((Date)object[7]);
//				reports.setRejquantity((Double)object[7]);
//				reports.setUnproquantity((Double)object[8]);
//				
//				reports.setAvaInwQuantity1(df2.format(object[9]));
//				reports.setNewTOtal(object[10].toString());
//				reports.setRejectedQty(0l);
				System.out.println("this is Stock of :- "+(object[0]));
				stockList.add(reports);
			}
		} catch(Exception e) {
			e.printStackTrace();	
		}
		return stockList;
	}
	
	


}
