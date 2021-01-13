package com.Fertilizer.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.hibernate.OutwardBean;
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

	
	


}
