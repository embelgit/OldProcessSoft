package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.hibernate.CategoryDetailsBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;
import com.Fertilizer.hibernate.TaxCreationBean;
import com.Fertilizer.hibernate.shopDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class shopDetailsDao {

	public void addShop(shopDetailsBean sdb) {
		
			System.out.println("In DAO");
			//MiddlegenTask
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
	
	
	
	//get latest Shop ID number in Shop Details
			public List getShopId() {
				HibernateUtility hbu=null;
				Session session=null;
				List<shopDetailsBean> Txidlist=null;
				try
				{
					hbu = HibernateUtility.getInstance();
					session = hbu.getHibernateSession();
					Query query = session.createSQLQuery("SELECT Shop_id , shop_name FROM shop_details ORDER BY Shop_id DESC LIMIT 1");

					List<Object[]> list = query.list();
					Txidlist= new ArrayList<shopDetailsBean>(0);
					for (Object[] object : list) {
						
						shopDetailsBean bean=new shopDetailsBean();
						bean.setShopId(Long.parseLong(object[0].toString()));
						bean.setShopName(object[1].toString());
						
						Txidlist.add(bean);	 
					}}
				catch(RuntimeException e)
				{
					Log.error("Error in getCustomerBill()", e);	
				}finally
				{if(session!=null){
					hbu.closeSession(session);	
				}
				}
				return Txidlist;	
			}
	
	
			public List getAllShop()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from shopDetailsBean");
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
			
			
//get all  product name from stock_details table
			
			public List getProductNames()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from Stock");
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
			
//get all  Company Name of products from stock_details table
			
			public List getCompanyNames()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				// List list = null;
				 List<Stock> stockList = null;
				 
				 
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createSQLQuery("select CompanyName, ProductName from stock_detail group by CompanyName");
					 List<Object[]> list = query.list(); 
					 stockList = new ArrayList<Stock>(0);
					 
					 for (Object[] object : list) {
							System.out.println(Arrays.toString(object));
						 	Stock reports = new Stock();
							reports.setCompanyName(object[0].toString());
							reports.setProductName(object[1].toString());
							stockList.add(reports); 
					
						}
					 
				} catch (RuntimeException e) {
					Log.error("Error in getAllMainCat", e);
				}
				 
				 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
						return stockList;
				
			}
			
			
			public List getShopName()
			{
				System.out.println("IN DAO");
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createSQLQuery("SELECT pk_shop_id,shop_name from shop_details");
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
			
			public List getAllShops()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
			 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from shopDetailsBean");
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
			
			
	
}
