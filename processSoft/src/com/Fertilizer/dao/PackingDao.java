package com.Fertilizer.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.GoodsReceiveBean;
import com.Fertilizer.bean.OutwardReportBean;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.PackingBean;
import com.Fertilizer.utility.HibernateUtility;

public class PackingDao {
	
	// get Last Bill No 
	public List getLastBillNo() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<BillBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT outwardchallan_no, pk_outward_id FROM outward_details ORDER BY pk_outward_id DESC LIMIT 1");
			
			List<Object[]> list = query.list();
			 saleList= new ArrayList<BillBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				BillBean reports = new BillBean();
				reports.setBillNo(Long.parseLong(object[0].toString()));
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
	
	public void addpacking(PackingBean pb) {
		
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
		session.save(pb);
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
	
	public List getAllProductBypacking() {
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
	/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
				Query query = session.createSQLQuery("SELECT ProductName, unpacked_Quantity, FkCatId,FkSubCatId,fk_shop_id FROM oil.stock_detail where unpacked_Quantity>0");
				
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
	
	/*To Fetch ItemName From packing Table */
	public List getAllPackingEntry()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from Stock");
		 list = query.list();
		}
			catch(Exception e){	
				e.printStackTrace();
		}
			finally
			{
					if(session!=null){
					hbu.closeSession(session);
				}
			}
		
	return list;
	}
//get on challan no
public List<OutwardBean> getOutwardDetailTable(String ShopName1,String challanno) {
		
		System.out.println("challanno no================"+challanno);
		HibernateUtility hbu=null;
		Session session=null;
		List<OutwardBean> outwardlist=null; 
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT suppliername,challan_No,outwardchallan_no,inwardDate,outward_date,productName,okquantity,unprocessquantity,rejectedquantity,rate,GridTotal FROM outward_details WHERE ShopName=:ShopName1 And outwardchallan_no=:challanno");
			//query.setParameter("fDate", fDate);
			query.setParameter("ShopName1", ShopName1);
			query.setParameter("challanno", challanno);

			List<Object[]> list = query.list();
			outwardlist= new ArrayList<OutwardBean>(0);
			
			
			for (Object[] object : list)
			{
				
				
				OutwardBean  reports=new OutwardBean();
				
				reports.setSuppliername(object[0].toString());
				System.out.println("supname++++++++++"+object[0].toString());
				reports.setChallanNo(object[1].toString());
				System.out.println("supname++++++++++"+object[1].toString());
				reports.setOutwardchallanno(object[2].toString());
				System.out.println("supname++++++++++"+object[2].toString());
				reports.setInwardDate((Date)object[3]);
				reports.setOutwardDate((Date)object[4]);
				reports.setProductName(object[5].toString());
				reports.setOkquantity(Double.parseDouble(object[6].toString()));
				reports.setUnprocessquantity(Double.parseDouble(object[7].toString()));
				reports.setRejectedquantity(Double.parseDouble(object[8].toString()));
				reports.setBuyPrice(Double.parseDouble(object[9].toString()));
				reports.setGridTotal(Double.parseDouble(object[10].toString()));
				
				outwardlist.add(reports);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		
		return outwardlist;

	}

// on product name

public List<OutwardBean> getOutwardDetailTableproduct(String ShopName3,String proName) {
	
	System.out.println("Produc name no================"+proName);
	HibernateUtility hbu=null;
	Session session=null;
	List<OutwardBean> outwardlist=null; 
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT suppliername,challan_No,outwardchallan_no,inwardDate,outward_date,productName,okquantity,unprocessquantity,rejectedquantity,rate,GridTotal FROM outward_details WHERE ShopName=:ShopName3 And productName=:proName");
		query.setParameter("ShopName3", ShopName3);
		query.setParameter("proName", proName);
		

		List<Object[]> list = query.list();
		outwardlist= new ArrayList<OutwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			
			OutwardBean  reports=new OutwardBean();
			
			reports.setSuppliername(object[0].toString());
			System.out.println("supname++++++++++"+object[0].toString());
			reports.setChallanNo(object[1].toString());
			System.out.println("supname++++++++++"+object[1].toString());
			reports.setOutwardchallanno(object[2].toString());
			System.out.println("supname++++++++++"+object[2].toString());
			reports.setInwardDate((Date)object[3]);
			reports.setOutwardDate((Date)object[4]);
			reports.setProductName(object[5].toString());
			reports.setOkquantity(Double.parseDouble(object[6].toString()));
			reports.setUnprocessquantity(Double.parseDouble(object[7].toString()));
			reports.setRejectedquantity(Double.parseDouble(object[8].toString()));
			reports.setBuyPrice(Double.parseDouble(object[9].toString()));
			reports.setGridTotal(Double.parseDouble(object[10].toString()));
			
			outwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return outwardlist;

}


//for vendor Name

public List<OutwardBean> getOutwardDetailTableVendor(String ShopName4,String venName) {
	
	System.out.println("Produc name no================"+venName);
	HibernateUtility hbu=null;
	Session session=null;
	List<OutwardBean> outwardlist=null; 
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT suppliername,challan_No,outwardchallan_no,inwardDate,outward_date,productName,okquantity,unprocessquantity,rejectedquantity,rate,GridTotal FROM outward_details WHERE ShopName=:ShopName4 And suppliername=:venName");
		query.setParameter("ShopName4", ShopName4);
		query.setParameter("venName", venName);
		

		List<Object[]> list = query.list();
		outwardlist= new ArrayList<OutwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			
			OutwardBean  reports=new OutwardBean();
			
			reports.setSuppliername(object[0].toString());
			System.out.println("supname++++++++++"+object[0].toString());
			reports.setChallanNo(object[1].toString());
			System.out.println("supname++++++++++"+object[1].toString());
			reports.setOutwardchallanno(object[2].toString());
			System.out.println("supname++++++++++"+object[2].toString());
			reports.setInwardDate((Date)object[3]);
			reports.setOutwardDate((Date)object[4]);
			reports.setProductName(object[5].toString());
			reports.setOkquantity(Double.parseDouble(object[6].toString()));
			reports.setUnprocessquantity(Double.parseDouble(object[7].toString()));
			reports.setRejectedquantity(Double.parseDouble(object[8].toString()));
			reports.setBuyPrice(Double.parseDouble(object[9].toString()));
			reports.setGridTotal(Double.parseDouble(object[10].toString()));
			
			outwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return outwardlist;

}



//this get all outword challan no
public List getOutwardDetails()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from OutwardBean group by outwardchallanno  ");	
		 System.out.println("this is outword data "+query);
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAllChallanNo", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
	}

// this get all product anem
public List getOutwardDetailsForProduct()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from OutwardBean group by productName");	
		 System.out.println("this is outword data "+query);
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAll Product Name", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
	}

//get all vendor name
public List getOutwardDetailsForvendor()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from OutwardBean group by suppliername");	
		 System.out.println("this is outword data "+query);
		 list = query.list(); 
	} catch (RuntimeException e) {
		Log.error("Error in getAll Product Name", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return list;
	
	}


	
/*Start outward Report Datewise*/
public List<OutwardBean> getOutwardDetailTableDatewise(String ShopName2,String fisDate,String endDate) {
	
	System.out.println("First Date================"+fisDate);
	System.out.println("End Date================"+endDate);
	HibernateUtility hbu=null;
	Session session=null;
	List<OutwardBean> outwardlist=null; 
	try
	{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("select suppliername,challan_No,outwardchallan_no,inwardDate,outward_date,productName,okquantity,unprocessquantity,rejectedquantity,rate,GridTotal  FROM outward_details where ShopName='"+ShopName2+"' And outward_date BETWEEN'"+ fisDate+"'And '"+endDate+"'");
		
		
		List<Object[]> list = query.list();
		outwardlist= new ArrayList<OutwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			
			OutwardBean  reports=new OutwardBean();
			
			reports.setSuppliername(object[0].toString());
			reports.setChallanNo(object[1].toString());
			reports.setOutwardchallanno(object[2].toString());
			reports.setInwardDate((Date)object[3]);
			reports.setOutwardDate((Date)object[4]);
			reports.setProductName(object[5].toString());
			reports.setOkquantity(Double.parseDouble(object[6].toString()));
			reports.setUnprocessquantity(Double.parseDouble(object[7].toString()));
			reports.setRejectedquantity(Double.parseDouble(object[8].toString()));
			reports.setBuyPrice(Double.parseDouble(object[9].toString()));
			reports.setGridTotal(Double.parseDouble(object[10].toString()));
			
			outwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return outwardlist;

}
/*End of inward Report Datewise*/

public List<OutwardBean> getoutwardDetailsTableShopWise(String shopName) {
	System.out.println("challanno no================"+shopName);
	HibernateUtility hbu=null;
	Session session=null;
	List<OutwardBean> outwardlist=null; 
	try
	{
			hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT suppliername,challan_No,outwardchallan_no,inwardDate,outward_date,productName,okquantity,unprocessquantity,rejectedquantity,rate,GridTotal FROM outward_details WHERE ShopName =:shopName");
		//query.setParameter("fDate", fDate);
		query.setParameter("shopName", shopName);
		

		List<Object[]> list = query.list();
		outwardlist= new ArrayList<OutwardBean>(0);
		
		
		for (Object[] object : list)
		{
			
			
			OutwardBean  reports=new OutwardBean();
			
			reports.setSuppliername(object[0].toString());
			System.out.println("supname++++++++++"+object[0].toString());
			reports.setChallanNo(object[1].toString());
			System.out.println("supname++++++++++"+object[1].toString());
			reports.setOutwardchallanno(object[2].toString());
			System.out.println("supname++++++++++"+object[2].toString());
			reports.setInwardDate((Date)object[3]);
			reports.setOutwardDate((Date)object[4]);
			reports.setProductName(object[5].toString());
			reports.setOkquantity(Double.parseDouble(object[6].toString()));
			reports.setUnprocessquantity(Double.parseDouble(object[7].toString()));
			reports.setRejectedquantity(Double.parseDouble(object[8].toString()));
			reports.setBuyPrice(Double.parseDouble(object[9].toString()));
			reports.setGridTotal(Double.parseDouble(object[10].toString()));
			
			outwardlist.add(reports);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();	
	}
	
	return outwardlist;
}



	
}

