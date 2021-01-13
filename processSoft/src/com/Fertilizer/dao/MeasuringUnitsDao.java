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
import com.Fertilizer.hibernate.MeasuringUnitsBean;
import com.Fertilizer.utility.HibernateUtility;

public class MeasuringUnitsDao {

	public void addUnit(MeasuringUnitsBean bean) {
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
	
	
	public List getAllUnits()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from MeasuringUnitsBean");
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
	
	public List getMeasuringUnitsList(HttpServletRequest request){
		
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<MeasuringUnitsBean> expenseList=null;
			try {

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT unit_name, unit_description, insert_date FROM sold_units where shop_id='"+shopid+"' ");	
				//Query query = session.createSQLQuery("SELECT p.product_name, p.manufacturing_company, p.tax_percentage, t.tax_name,p.buy_Price  FROM product_details p  LEFT JOIN tax_details t on t.pk_tax_id = p.fk_tax_id LEFT JOIN categories c on c.pk_cat_id = p.fk_cat_id where p.Shop_id='"+shopid+"' ");
				// Query query = session.createQuery("from PurchaseBill2");
				List<Object[]> list = query.list();

				System.out.println("List in  dao" + list.size());

				expenseList = new ArrayList<MeasuringUnitsBean>(0);

				System.out.println("Measuring Units list size   " + expenseList.size());

				for (Object[] object : list) {
					MeasuringUnitsBean bean = new MeasuringUnitsBean();
					
					bean.setUnitName(object[0].toString());
					bean.setUnitDescription(object[1].toString());
					bean.setInsertDate((Date)object[2]);
					
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
