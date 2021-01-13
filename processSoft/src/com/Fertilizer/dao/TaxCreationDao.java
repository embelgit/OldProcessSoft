package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.GetTaxDetails;
import com.Fertilizer.hibernate.TaxCreationBean;
import com.Fertilizer.utility.HibernateUtility;

public class TaxCreationDao {

	public void valTaxCreation(TaxCreationBean tcb) {

				System.out.println("In DAO");
				
				HibernateUtility hbu=null;
				Session session=null;
				Transaction transaction=null;
				try{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 System.out.println("got session ");
				 transaction = session.beginTransaction();
			
				 System.out.println("Tx started");
				session.save(tcb);
				transaction.commit();
				System.out.println("Successful");
				}
				
				catch(RuntimeException e){
					try{
						transaction.rollback();
					}catch(RuntimeException rbe)
					{
						Log.error("Error in tax creation",rbe);
					}	
				}
				finally
				{
					if (session!=null) {
						hbu.closeSession(session);
					}
				}
			}
	
	// Tax Delete 
public void deleteTaxname(String delTax) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete from tax_details where pk_tax_id="+delTax);
				int seletedRecords = query.executeUpdate();
				System.out.println("Number of credit Cusr deleted == + ="+seletedRecords);
				//list = query.list();
				
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
			
			
			public List getAllMainTax()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from TaxCreationBean");
					 list = query.list(); 
				} catch (RuntimeException e) {
					Log.error("Error in getAllMainTax", e);
				}
				 
				 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
						return list;
				
			}
	
			
			
			public List getAllMainTax1(HttpServletRequest request)
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
					 query = session.createQuery("from TaxCreationBean where shopId='"+shopid+"' ");
					 list = query.list(); 
				} catch (RuntimeException e) {
					Log.error("Error in getAllMainTax", e);
				}
				 
				 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
						return list;
				
			}
			
			//Tax details for Tax list
			public List getTaxDetails(HttpServletRequest request){
				
				HttpSession usersession = request.getSession(true);
				String userid =(String)usersession.getAttribute("userid"); 
				String shopid =(String)usersession.getAttribute("shopid");
				
				HibernateUtility hbu=null;
				Session session=null;
				List<GetTaxDetails> taxList=null;
			try{	

				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();

				Query query=session.createSQLQuery("SELECT tax_name, percentage from tax_details where Shop_id='"+shopid+"'");
				//Query query = session.createQuery("from PurchaseBill2");
				List<Object[]> list = query.list();


				taxList= new ArrayList<GetTaxDetails>(0);


			for (Object[] o : list) {	
				GetTaxDetails p = new GetTaxDetails();
				p.setTaxType(o[0].toString());
				p.setTaxPercentage(Double.parseDouble(o[1].toString()));
				
				taxList.add(p);

			}}catch(RuntimeException e){	

			}
			finally{

			hbu.closeSession(session);	
			}
			return taxList;
			}

			// get All Tax Names
			public List getAllTax()
			{
				HibernateUtility hbu = null;
				Session session =  null;
				Query query = null;
				 List list = null;
				 try {
					 hbu = HibernateUtility.getInstance();
					 session = hbu.getHibernateSession();
					 query = session.createQuery("from TaxCreationBean");
					 list = query.list(); 
				} catch (RuntimeException e) {
					Log.error("Error in getAllTax", e);
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
