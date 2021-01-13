package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.hibernate.Packing_InfoBean;
import com.Fertilizer.utility.HibernateUtility;


public class Packing_InfoDao {
	
	public void addpacking_Type(Packing_InfoBean pib) {
		
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
		session.save(pib);
		System.out.println("Successful1");
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
	
	public List getAllPacking()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from Packing_InfoBean");
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
	

	public List getAllpack_Type()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		List<Packing_InfoBean> pib = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			// query = session.createQuery("from Pack_InfoBean");
			 query = session.createSQLQuery("SELECT pk_type_id,Packing_Type FROM oil.packing_type");
		
				List<Object[]> list = query.list();
				pib = new ArrayList<Packing_InfoBean>(0);

				for (Object[] object : list) {

					Packing_InfoBean reports = new Packing_InfoBean();
					reports.setPacking_Id(Long.parseLong(object[0].toString()));
					reports.setPacking_Type(object[1].toString());

					pib.add(reports);
				}
			 System.out.println("Pack_InfoBean list size =+++===="+list.size());
			 
			
		} catch (RuntimeException e) {
			Log.error("Error in getAllpack_Type", e);
		}
	
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
		 return pib;
		
	}
	
	public List getContainerName() {
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
	/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
				Query query = session.createSQLQuery("select pk_type_id,Packing_Type,Container_Name,Extra_Packing,u.unit_name from packing_type left join sold_units u on u.pk_unit_id=fk_unit_Id");
				
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
	
	public List getproductDetailInGridForContainer(String containerName, String capacity) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("select pk_type_id,Packing_Type,Container_Name,Extra_Packing,u.unit_name from packing_type left join sold_units u on u.pk_unit_id=fk_unit_Id where Container_Name='"+containerName+"' and Packing_Type='"+capacity+"'");
			 list = query.list();
			 
			System.out.println(list.size()+"*************");
			}catch(RuntimeException e){
				
			Log.error("Error in getProductDetails",e);
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;
	}
	
	public List getProductDetailsForGridFromDao(String dieNo, Double  quantity) {

		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("Select p.product_name, p.type_of_function, p.color, p.micron, p.quantity, p.quantity_bundle, p.length, p.buy_price, p.purchaseDate, p.pk_goods_receive_id from goods_receive p where p.product_name=:dieNo AND p.quantity=:quantity");
			 query.setParameter("dieNo", dieNo);
			 query.setParameter("quantity", quantity);
			 System.out.println(dieNo+"dieNo in goods receive dao");
			 System.out.println(quantity+"weight in goods receive dao");
			
			
			
			 //query.setParameter("weight", weight);
			 
			 list = query.list();
			 
			System.out.println(list.size()+"*************");
			}catch(RuntimeException e){
				
			Log.error("Error in getProductDetails",e);
		}finally{
				if(session!=null){
					
					hbu.closeSession(session);
				}
				
			}
		
		return list;

	}
	
}

