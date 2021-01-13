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

import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.hibernate.ExpenditureDetailsBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class ExpenditureDetailsDao {

	public void addExpenseDetails(ExpenditureDetailsBean bean) {
		
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

	
	public List getAllExpenseName()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from ExpenditureDetailsBean");
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
	
	// get All expense Names it is also use to delete expenditute name
	public List getAllExpenseNames(HttpServletRequest request)
	{
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from ExpenditureDetailsBean where shopId='"+shopid+"' ");
			 list = query.list(); 
		} catch (RuntimeException e) {
			Log.error("Error in getAllExpenseNames", e);
		}	 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
		return list;
	}
	
	//this method is used to delete expenditure
	public void deleteExpenditure(String delExpenditureNameId) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete  from expenditure_details where pk_expense_details_id="+delExpenditureNameId);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of Expenditure deleted == + ="+seletedRecords);
				//list = query.list();
				//session.flush();
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
		
	}
	
	//this method is used to expenditure list
	public List getExpenditureList(HttpServletRequest request){
		
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ExpenditureDetailsBean> expenseList=null;
			try {

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT e.expense_name, insert_date FROM expenditure_details e where e.shop_id='"+shopid+"' ");	
				//Query query = session.createSQLQuery("SELECT p.product_name, p.manufacturing_company, p.tax_percentage, t.tax_name,p.buy_Price  FROM product_details p  LEFT JOIN tax_details t on t.pk_tax_id = p.fk_tax_id LEFT JOIN categories c on c.pk_cat_id = p.fk_cat_id where p.Shop_id='"+shopid+"' ");
				// Query query = session.createQuery("from PurchaseBill2");
				List<Object[]> list = query.list();

				System.out.println("List in  dao" + list.size());

				expenseList = new ArrayList<ExpenditureDetailsBean>(0);

				System.out.println("Expenditure list size   " + expenseList.size());

				for (Object[] object : list) {
					ExpenditureDetailsBean bean = new ExpenditureDetailsBean();
					
					bean.setExpenseName(object[0].toString());
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
	
	public List getExpenditureDetailsToEdit(String pkExpenseDetailsId) {
		
		System.out.println("into dao supplier : "+pkExpenseDetailsId);
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select pk_expense_details_id, expense_name, insert_date from expenditure_details WHERE pk_expense_details_id ='"+pkExpenseDetailsId+"'");
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
		 System.out.println("out of dao - return Expenditure List : "+list);
				return list;
	}
	
}
