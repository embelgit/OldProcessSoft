package com.Fertilizer.dao;

import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.GetEmployeeDetails;
import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.bean.PoGridBean;
import com.Fertilizer.bean.SupplierGridBean1;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class SupplierDetailsDao {
	
	
	
	private String inwordchallanNo;

	public List getInwordChallenWiseDetailsForDeopdown()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from InwardBean");
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
	

	public void valSupplierDetails(SupplierDetailsBean sdb) {
		
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

	
	
	public List getAllSupplier()
	{
		
		  
		 
		
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from SupplierDetailsBean ");
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
	
	// get all bill no 
	public List getAllSupplier1(HttpServletRequest request)
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
			 query = session.createQuery("from SupplierDetailsBean where shopId='"+shopid+"' ");
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
	
	/* this method is for outword challen wise dropdown*/

	public List getChallenWiseDetailsForDeopdown()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createQuery("from OutwardBean");
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
	
	
	public List getSupName(String fk_sup_id)
	{
		System.out.println("IN DAO");
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		System.out.println("IN DAO"+fk_sup_id);
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 System.out.println("IN DAO"+fk_sup_id);
			 query = session.createSQLQuery("SELECT pk_supplier_id,supplier_name from supplier_details where pk_supplier_id="+fk_sup_id);
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

	public void deleteSupplier(String supplier) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete from supplier_details where pk_supplier_id="+supplier);
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

	public List getAllSupplierSetailsForEdit(String supplierID) {


		System.out.println("into dao supplier : "+supplierID);
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 query = session.createSQLQuery("select supplier_name, city, contact_no, alternate_no, contact_person_name, address, email_id, Id_No,tin_no from supplier_details WHERE pk_supplier_id ='"+supplierID+"'");
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
	
	public List getSupplierList(HttpServletRequest request){
		
		HttpSession usersession = request.getSession(true);
		String userid =(String)usersession.getAttribute("userid"); 
		String shopid =(String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu=null;
		Session session=null;
		List<GetSupplierDetails> supList=null;
	try{	

		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT supplier_name, city, contact_no, alternate_no, email_id, contact_person_name, address from supplier_details where Shop_id='"+shopid+"' ");
		//Query query = session.createQuery("from PurchaseBill2");
		List<Object[]> list = query.list();


		supList= new ArrayList<GetSupplierDetails>(0);


	for (Object[] object : list) {	
		GetSupplierDetails reports = new GetSupplierDetails();
		reports.setDealerName(object[0].toString());
		reports.setCity(object[1].toString());
		reports.setContactNo((BigInteger)object[2]);
		//reports.setLandline((BigInteger)object[3]);
		reports.setEmail(object[4].toString());
		reports.setPersonName(object[5].toString());
		//reports.setTin(object[6].toString());
		reports.setAddress(object[6].toString());
		
		
		supList.add(reports);

	}}catch(RuntimeException e){	

	}
	finally{

	hbu.closeSession(session);	
	}
	return supList;
	}
	//Get Data in OutWord Product Grid By Challan No By Vikas
	public List getProductDetail(String itemName, String ChallanNo) {

		
		System.out.println(" hi this is kishor Item Name is-======="+itemName);
		System.out.println(" hi this is Kishor Challan No is 000-======"+ChallanNo);
		
		HibernateUtility hbu = null ;
		Session session = null;
		List<PoGridBean> list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			System.out.println("Challan No Is By Vikas"+ChallanNo);
			System.out.println("ProDct Nam Is By Vikas"+itemName);
			//Query query = session.createSQLQuery("select p.product_name,p.buy_price,p.hsn from product_details p where p.product_name='"+itemName+"'");
			Query query = session.createSQLQuery("SELECT  p.productname, p.rate, ifnull(hsn,0) As hsn, p.operation,p.dup_quantity,p.challan_No FROM inwand_details p WHERE p.challan_No='"+ChallanNo+"' AND p.productname='"+itemName+"' " );

			
			
			//list = query.list();
			List<Object[]> list1 = query.list();
			list = new ArrayList<PoGridBean>(0);
			for (Object[] o : list1) {
				PoGridBean poJqgrid = new PoGridBean();

				poJqgrid.setProductName(o[0].toString());
				poJqgrid.setBuyPrice(Double.parseDouble(o[1].toString()));
				poJqgrid.setHsn(o[2].toString());
				poJqgrid.setOperationName(o[3].toString());
				poJqgrid.setDupQuantity((o[4].toString()));
				poJqgrid.setChallanno((o[5].toString()));
				poJqgrid.setOkquantity(0d);
				poJqgrid.setRejectedquantity(0d);
				poJqgrid.setUnprocessquantity(0d);
				
				//bean.setTotalAmount((Double)o[1]);
				System.out.println("***************"+o[0]);
				//map.put(bean.getBuyPrice(),bean);

				list.add(poJqgrid);
			
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
		return list;
	}
	
	public List getProductDetailByChalanaNo(String outwardchallanno) {

		HibernateUtility hbu = null ;
		Session session = null;
		List<OutwardBean> list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			//Query query = session.createSQLQuery("SELECT p.pk_outward_id, p.productName, p.okquantity, p.rate,p.hsn ,p.Operation  FROM outward_details p WHERE p.outwardchallan_no="+outwardchallanno);
			Query query = session.createSQLQuery("SELECT p.pk_outward_id, p.productName, p.okquantity, p.rate,p.hsn ,p.Operation  FROM outward_details p WHERE p.outwardchallan_no='"+outwardchallanno+"'");
		//	list = query.list();
			
			List<Object[]> list1 = query.list();
			list = new ArrayList<OutwardBean>(0);
			for (Object[] o : list1) {
				OutwardBean poJqgrid = new OutwardBean();

				poJqgrid.setChallanNo(o[0].toString());
				poJqgrid.setProductName(o[1].toString());
				poJqgrid.setOkquantity(Double.parseDouble(o[2].toString()));
				poJqgrid.setBuyPrice(Double.parseDouble(o[3].toString()));
				poJqgrid.setHsn(o[4].toString());
				poJqgrid.setOperation(o[5].toString());
				poJqgrid.setOkquantity1(Double.parseDouble(o[2].toString()));
			

				list.add(poJqgrid);
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
		return list;
	}
	
	//for billing using inward Challan No getProductDetailByInwardChalanaNo
	
	public List getProductDetailByInwardChalanaNo(String inwordchallanNo) {

		HibernateUtility hbu = null ;
		Session session = null;
		List<OutwardBean> list  = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT p.pk_inward_id, p.productname, p.quantity, p.rate,ifnull(hsn,0) As hsn ,p.operation FROM inwand_details p WHERE p.challan_No='"+inwordchallanNo+"'");
			//list = query.list();
			
			
			List<Object[]> list1 = query.list();
			list = new ArrayList<OutwardBean>(0);
			for (Object[] o : list1) {
				OutwardBean poJqgrid = new OutwardBean();

				//System.out.println(Arrays.toString(o));
				poJqgrid.setChallanNo(o[0].toString());
				poJqgrid.setProductName(o[1].toString());
				poJqgrid.setOkquantity(Double.parseDouble(o[2].toString()));
				poJqgrid.setBuyPrice(Double.parseDouble(o[3].toString()));
				poJqgrid.setHsn(o[4].toString());
				poJqgrid.setOperation(o[5].toString());
				poJqgrid.setGst(0d);
				poJqgrid.setIGst(0d);
				poJqgrid.setOkquantity1(Double.parseDouble(o[2].toString()));
				System.out.println("hi this is vikas in packing helper"+o[4].toString());
				//bean.setTotalAmount((Double)o[1]);
				System.out.println("***************"+o[0]);
				//map.put(bean.getBuyPrice(),bean);
			

				list.add(poJqgrid);
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
		return list;
	}
	
}
