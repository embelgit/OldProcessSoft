package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.InwardProcess1Bean;
import com.Fertilizer.bean.InwardProcess2Bean;
import com.Fertilizer.hibernate.InwardProcess1Hibernate;
import com.Fertilizer.hibernate.InwardProcess2Hibernate;
import com.Fertilizer.hibernate.InwardProcessingInformation;
import com.Fertilizer.hibernate.OperationDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class InwardProcess2Dao {
	
	public List getInwardProcess2Operaion() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<OperationDetailsBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT pk_operation_details_id, operation_name FROM operation_details WHERE pk_operation_details_id=2");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<OperationDetailsBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				OperationDetailsBean reports = new OperationDetailsBean();
					
					reports.setPkOperationDetailsId(Long.parseLong(object[0].toString()));
					reports.setOperationName(object[1].toString());
					
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
	
	public List getAllPurchaseOrderNo() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<InwardProcessingInformation> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT inward_processing_info_pk, purchase_order_no FROM inward_processing_info WHERE fk_operation_details_id = 2 AND purchase_order_no > 0 ORDER BY inward_processing_info_pk");
			//Query query = session.createSQLQuery("SELECT distinct pono FROM inwand_details");//AND purchase_order_no > 0
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<InwardProcessingInformation>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				InwardProcessingInformation reports = new InwardProcessingInformation();
					
					reports.setInwardProcessingInfoPk(Long.parseLong(object[0].toString()));
					reports.setPurchaseOrderNo(object[1].toString());
					
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
	
	
	public List getChallanNumberForProcess2(String InwardProcessingInfoPk, String purchaseOrderNo) {

		System.out.println("into dao supplier : "+InwardProcessingInfoPk);
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select inward_processing_info_pk, purchase_order_no, challan_no from inward_processing_info WHERE inward_processing_info_pk ='"+InwardProcessingInfoPk+"'AND purchase_order_no ='"+purchaseOrderNo+"'");
			 
			 list = query.list(); 
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
		 System.out.println("out of dao - return credit customer List : "+list);
				return list;
	}
	
	public List getAllChallanNumber() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<InwardProcessingInformation> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT inward_processing_info_pk, challan_no FROM inward_processing_info WHERE fk_operation_details_id = 2 AND purchase_order_no = 0  ORDER BY inward_processing_info_pk");
			//Query query = session.createSQLQuery("SELECT distinct pono FROM inwand_details");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<InwardProcessingInformation>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				
				InwardProcessingInformation reports = new InwardProcessingInformation();
					
					reports.setInwardProcessingInfoPk(Long.parseLong(object[0].toString()));
					reports.setChallanNo(object[1].toString());
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
	}
	
	public List getAllOperaion()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from OperationDetailsBean");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllOperaion", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	
	public void addInwardProcessingInfo(InwardProcessingInformation bean) {
		
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
	
	
	public void saveInwardProcess2Details(InwardProcess2Hibernate sdb) {
		
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
	
	
	public List getInwardProcess2List(HttpServletRequest request){
		
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<InwardProcess2Bean> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT operation_name, purchase_order_no, challan_no, send_to_operation_name, comment from inward_process2 where shop_id='"+shopid+"' ");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();

		supList= new ArrayList<InwardProcess2Bean>(0);

	for (Object[] object : list) {
		
		InwardProcess2Bean reports = new InwardProcess2Bean();
		
		reports.setOperationName(object[0].toString());
		reports.setPurchaseOrderNo(object[1].toString());
		reports.setChallanNo(object[2].toString());
		reports.setSendToOperationName(object[3].toString());
		reports.setComment(object[4].toString());
		
		
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}
	

}
