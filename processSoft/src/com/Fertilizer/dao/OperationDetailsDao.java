package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.hibernate.ExpenditureDetailsBean;
import com.Fertilizer.hibernate.OperationDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class OperationDetailsDao {
public void addOperationDetails(OperationDetailsBean bean) {
		
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

	
	public List getAllOperationName()
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
			Log.error("Error in getAllUnits", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	
	// get All expense Names
	public List getAllOperationNames()
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
			Log.error("Error in getAllOperationNames", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	//this method is used to expenditure list
	public List getOperationList(HttpServletRequest request){
		
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<OperationDetailsBean> expenseList=null;
			try {

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT operation_name, insert_date FROM operation_details where shop_id='"+shopid+"' ");	
				//Query query = session.createSQLQuery("SELECT p.product_name, p.manufacturing_company, p.tax_percentage, t.tax_name,p.buy_Price  FROM product_details p  LEFT JOIN tax_details t on t.pk_tax_id = p.fk_tax_id LEFT JOIN categories c on c.pk_cat_id = p.fk_cat_id where p.Shop_id='"+shopid+"' ");
				// Query query = session.createQuery("from PurchaseBill2");
				List<Object[]> list = query.list();

				System.out.println("List in  dao" + list.size());

				expenseList = new ArrayList<OperationDetailsBean>(0);

				System.out.println("Expenditure list size   " + expenseList.size());

				for (Object[] object : list) {
					OperationDetailsBean bean = new OperationDetailsBean();
					
					bean.setOperationName(object[0].toString());
					bean.setInsertDate((Date)object[1]);
					
					expenseList.add(bean);
				}
			}catch(RuntimeException e){	
	}
	finally{

	hbu.closeSession(session);	
	}

	return expenseList;
	}
	
}
