package com.Fertilizer.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.GetCreditCustomerDetails;
import com.Fertilizer.hibernate.CustomerDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class CustomerDetailsDao {

	public void valCustomerDetails(CustomerDetailsBean cdb){
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 System.out.println("got session ");
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		session.save(cdb);
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
	
	
	
	public List<CustomerDetailsBean> getAllCustomer()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<CustomerDetailsBean> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			query = session.createQuery("from CustomerDetailsBean");
			 /*query = session.createQuery("from CustomerDetailsBean");*/
			 list = query.list(); 
		} catch (Exception e) {
			Log.error("Error in getAllCustomer", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			
				return list;
		
	}
	
	
	
public List getVillageByCustomerName(String creditCustomerId) {
		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("select c.address , c.supplier_name, c.contact_no, c.tin_no,c.Id_No from supplier_details c where c.pk_supplier_id ="+creditCustomerId);
 			list = query.list();
 			
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
			return list;
    	
	}

public List getCustName(String fk_cust_id)
{
	System.out.println("IN DAO");
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	System.out.println("IN DAO"+fk_cust_id);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 System.out.println("IN DAO"+fk_cust_id);
		 query = session.createSQLQuery("SELECT pk_customer_id,first_name,last_name from customer_details where pk_customer_id="+fk_cust_id);
		 list = query.list(); 
		 System.out.println("=== list ===="+list.size());
		 System.out.println("List size of product detail = ="+list.size());
		 /*for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				SubCategoryDetailsBean reports = new SubCategoryDetailsBean();
				reports.setSubcatId(Long.parseLong(object[0].toString()));
				reports.setSubcategoryName(object[1].toString());
				stockList.add(reports); 
		
			}*/
		 
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

public void deletCustomer(String custName) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("delete from customer_details where pk_customer_id="+custName);
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



public List getAllBillByCreditCustomer(String fkCustomerId, String catId) {

	
	 HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select f.bill_no, f.insert_date from fertilizer_billing f where f.fk_customer_id='"+fkCustomerId+"' AND f.cat_id ='"+catId+"' UNION select s.bill_no, s.insert_date from seed_pesticide_billing s where s.fk_customer_id='"+fkCustomerId+"' AND s.cat_id ='"+catId+"' UNION select p.bill_no, p.insert_date from pesticide_billing p where p.fk_customer_id='"+fkCustomerId+"' AND p.cat_id ="+catId);
		list = query.list();
		
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
		return list;


}



public List getTotalAmountByBill( String creditCustomer) {

	 HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		Query query = session.createSQLQuery("select sum(f.gross_total), f.insert_date from fertilizer_billing f where f.fk_customer_id='"+creditCustomer+"'");
		System.out.println("In dao get total");
		list = query.list();
		System.out.println("List size in DAO of total = == ="+list.size());
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
		return list;
	
}



public List getRemainingBalanceAmountByBill( String creditCustomer, String catId) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT payment,total_amount from credit_customer_payment WHERE fk_customer_id='"+creditCustomer+"'");
		
		list = query.list();
		
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
		return list;
}


public Double getTotalAmt(String creditCustomer) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List<Object[]> list  = null;
	 Double totalAmount = null;
	 List<GetCreditCustomerDetails> itemlist = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select sum(f.bal_After_initial_Payment), f.insert_date from fertilizer_billing f where f.fk_customer_id="+creditCustomer);
			list = query.list();
			 itemlist = new ArrayList<GetCreditCustomerDetails>(0);
			 
			 for (Object[] objects : list) {
				 
				GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
				 
				String newBal = (objects[0].toString());
				totalAmount = Double.valueOf(newBal);
			
				itemlist.add(bean);
				}
			
			
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
		return totalAmount;
	
}



public List getCreditCustomerForEdit(Long customerId) {

	System.out.println("into dao Credit Customer : "+customerId);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT c.first_name, c.middle_name, c.last_name,c.email_id, c.address, c.contact_no, c.pin_code, c.gst_No, c.Id_No FROM customer_details c where c.pk_customer_id="+customerId);
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

public List getCreditCustomerList(){
	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetCreditCustomerDetails> custList=null;
try{	

	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();

	Query query=session.createSQLQuery("SELECT first_name, middle_name, last_name, email_id, address, contact_no, pin_code, gst_No FROM customer_details");
	//Query query = session.createQuery("from PurchaseBill2");
	List<Object[]> list = query.list();


	custList= new ArrayList<GetCreditCustomerDetails>(0);
      
	System.out.println("IN DAO"+list.size());

for (Object[] object : list) {	
	GetCreditCustomerDetails reports = new GetCreditCustomerDetails();
	
	reports.setFirstName(object[0].toString());
	reports.setMiddleName(object[1].toString());
	reports.setLastName(object[2].toString());
	reports.setAddress(object[4].toString());
	reports.setEmail(object[3].toString());
	reports.setContactNo((BigInteger)object[5]);
	reports.setZipCode((BigInteger)object[6]);
	reports.setGstNo(object[7].toString());
	
	custList.add(reports);

}}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}
return custList;
}

	
}
