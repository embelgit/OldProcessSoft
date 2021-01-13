package com.Fertilizer.dao;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.PoDetailsBean1;
import com.Fertilizer.bean.SupplierGridBean1;
import com.Fertilizer.bean.grBeanForReport;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class PoDetailsDao {

	private static final String GridTotal = null;
	public void valPoDetails(PoDetailsBean bean) {

		System.out.println("In DAO");

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");
			session.save(bean);
			transaction.commit();
			System.out.println("Successful");
		}

		catch (RuntimeException e) {
			e.printStackTrace();
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}

	}

	// PONo for inward
	public List getPoByProduct(String productName,String userid,String shopid) {

		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery(
					"select f.idno, f.date from po_details f where f.productname='" + productName + "' AND f.shop_id='"+shopid+"' ");
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

	public List getAllPoDetails() {
		HibernateUtility hbu = null;
		Session session = null;
		Query query = null;
		List list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			query = session.createQuery("from PoDetailsBean group by suppliername");
			list = query.list();
		} catch (RuntimeException e) {
			Log.error("Error in getAllMainCat", e);
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;

	}

	public List<PoDetailsBean> getAllProductDetailsForFrtiBillAsPerProductName1(String itemName, String pono) {

		HibernateUtility hbu = null;
		Session session = null;
		List<PoDetailsBean> itemlist = null;
		try {

			System.out.println("shreemant");
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			String sqlQuery = "SELECT productname,quantity,operation,rate,unit,date,pd.hsn FROM po_details po join product_details pd on po.productname = pd.product_name where productname='" + itemName + "' AND idno ='" + pono + "'";

			
		/*	String sqlQuery = "select product_name,buy_price,hsn from product_details where product_name='" + itemName + "' ";*/

			Query query = session.createSQLQuery(sqlQuery);
			/*
			 * query.setParameter("itemName", itemName);
			 * query.setParameter("pono", pono);
			 */
			List<Object[]> list = query.list();

			itemlist = new ArrayList<PoDetailsBean>(0);
			for (Object[] objects : list) {
				System.out.println(Arrays.toString(objects));
				/*PoDetailsBean1 bean = new PoDetailsBean1();*/
				PoDetailsBean bean = new PoDetailsBean();
				System.out.println("itemlist");

			/*	bean.setProductname(objects[0].toString());
				System.out.println(" hi this pr name ="+(objects[0].toString()));
				bean.setRate(Double.parseDouble(objects[1].toString()));
				System.out.println(" hi this prisse name ="+(objects[1].toString()));

				bean.setHsn(objects[2].toString());
				System.out.println(" hi thishsn name ="+(objects[2].toString()));*/
				
				bean.setProductname(objects[0].toString());
				/*bean.setIdno(objects[1].toString());*/
				bean.setIdno((objects[1].toString()));
				System.out.println(" hi this is q is ======-------"+(objects[1].toString()));
				bean.setOperation(objects[2].toString());
				bean.setRate(Double.parseDouble(objects[3].toString()));
				System.out.println(" hi this is kishor Quant is ========"+(objects[3].toString()));
				bean.setUnit(objects[4].toString());

				System.out.println("itemlist");

				
				SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");

				String fisDate = objects[5].toString();

				System.out.println("In Helper fisDate " + fisDate);

				String start_dt = fisDate;
				Date date = null;
				DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				try {
					date = (Date) formatter.parse(start_dt);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				System.out.println("In Helper adate " + fisDate);

				bean.setPODate(fisDate);
				bean.setHsn(objects[6].toString());
                System.out.println("pppppppppppppppppppppphhhhhhhhhhhhhhhhhhhhhhhhh"+objects[6].toString());
				itemlist.add(bean);

			}
		} catch (RuntimeException e) {
			Log.error("Error in getAllItemDetails(String key)", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return itemlist;

	}
	
	//Without POEntry Deatils BY Kishor 
	public List<PoDetailsBean1> getAllProductDetailsForFrtiBillAsPerProductName1WithoutPOD(String itemName) {

		HibernateUtility hbu = null;
		Session session = null;
		List<PoDetailsBean1> itemlist = null;
		try {

			System.out.println("shreemant");
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			/*String sqlQuery = "SELECT productname,quantity,operation,rate,unit,date,pd.hsn FROM po_details po join product_details pd on po.productname = pd.product_name where productname='" + itemName + "' AND idno ='" + pono + "'";*/

			
			String sqlQuery = "select product_name,buy_price,hsn from product_details where product_name='" + itemName + "' ";

			Query query = session.createSQLQuery(sqlQuery);
			/*
			 * query.setParameter("itemName", itemName);
			 * query.setParameter("pono", pono);
			 */
			List<Object[]> list = query.list();

			itemlist = new ArrayList<PoDetailsBean1>(0);
			for (Object[] objects : list) {
				System.out.println(Arrays.toString(objects));
				/*PoDetailsBean1 bean = new PoDetailsBean1();*/
				PoDetailsBean1 bean = new PoDetailsBean1();
				System.out.println("itemlist");

				bean.setProductname(objects[0].toString());
				System.out.println(" hi this pr name ="+(objects[0].toString()));
				bean.setRate(Double.parseDouble(objects[1].toString()));
				System.out.println(" hi this prisse name ="+(objects[1].toString()));

				bean.setHsn(objects[2].toString());
				System.out.println(" hi thishsn name ="+(objects[2].toString()));
				
				/*bean.setProductname(objects[0].toString());
				bean.setIdno(objects[1].toString());
				bean.setIdno((objects[1].toString()));
				System.out.println(" hi this is q is ======-------"+(objects[1].toString()));
				bean.setOperation(objects[2].toString());
				bean.setRate(Double.parseDouble(objects[3].toString()));
				System.out.println(" hi this is kishor Quant is ========"+(objects[3].toString()));
				bean.setUnit(objects[4].toString());
*/
				System.out.println("itemlist");

				
/*				SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");

				String fisDate = objects[5].toString();

				System.out.println("In Helper fisDate " + fisDate);

			String start_dt = fisDate;
				Date date = null;
				DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
				try {
					date = (Date) formatter.parse(start_dt);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				System.out.println("In Helper adate " + fisDate);

				bean.setPODate(fisDate);
				bean.setHsn(objects[6].toString());
                System.out.println("pppppppppppppppppppppphhhhhhhhhhhhhhhhhhhhhhhhh"+objects[6].toString());*/
				itemlist.add(bean);

			}
		} catch (RuntimeException e) {
			Log.error("Error in getAllItemDetails(String key)", e);
		} finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}

		return itemlist;

	}

	// get product details for set hsn and rate in Jqgrid for poDetails and set
	// into PODetails grid
	public List<SupplierGridBean1> getPoDetailsByproductName(String itemName,String userid,String shopid) {

		HibernateUtility hbu = null;
		Session session = null;
		List<SupplierGridBean1> list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select f.product_name,f.buy_price,f.hsn from product_details f where f.product_name='" + itemName+ "' AND f.shop_id='"+shopid+"' ");
			List<Object[]> list1 = query.list();
			list = new ArrayList<SupplierGridBean1>(0);
			for (Object[] object : list1) {
				System.out.println("?///////////" + object[2].toString());
				SupplierGridBean1 poJqgrid = new SupplierGridBean1();

				poJqgrid.setProductName(object[0].toString());
				poJqgrid.setBuyPrice(Double.parseDouble(object[1].toString()));
				poJqgrid.setHsn(object[2].toString());

				list.add(poJqgrid);
			}

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

	// this is harshad

	public List<SupplierGridBean1> getGRDetailsByproductName(String itemName) {

		HibernateUtility hbu = null;
		Session session = null;
		List<SupplierGridBean1> list = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			
			Query query = session.createSQLQuery("select f.product_name,f.buy_price,f.hsn from product_details f where f.product_name='" + itemName+ "'");
			//Query query = session.createSQLQuery("select f.product_name,f.buy_price,f.hsn,p.operation from product_details f JOIN po_details p on f.product_name=p.productname where f.product_name='" + itemName+ "' AND idno= '" + pono + "'");
			
			List<Object[]> list1 = query.list();
			list = new ArrayList<SupplierGridBean1>(0);
			for (Object[] object : list1) {
				SupplierGridBean1 poJqgrid = new SupplierGridBean1();

				poJqgrid.setProductName(object[0].toString());
				poJqgrid.setBuyPrice(Double.parseDouble(object[1].toString()));
				poJqgrid.setHsn(object[2].toString());
				poJqgrid.setGst(0d);
				poJqgrid.setIgst(0d);
				poJqgrid.setDiscount(0d);
			/*	poJqgrid.setOperationName(object[3].toString());
				System.out.println("hi this is  kishor +++++++++++++++++" + object[3].toString());*/

				list.add(poJqgrid);
			}

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

	public void valGrDetails(GrDetailsBean bean) {

		System.out.println("In DAO");

		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();

			System.out.println("Tx started");
			session.save(bean);
			transaction.commit();
			System.out.println("Successful by harshad");
		}

		catch (RuntimeException e) {
			e.printStackTrace();
			try {
				transaction.rollback();
			} catch (RuntimeException rbe) {
				Log.error("Couldn't roll back tranaction", rbe);
			}
		} finally {
			hbu.closeSession(session);
		}

	}

	public List getGoodReciveDetails() {

		HibernateUtility hbu = null;
		Session session = null;
		List<grBeanForReport> productList = null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT productname,quantity,rate,date,GridTotal,Shop,discount,gst,igst,billno FROM gr_details");
			// Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();

			System.out.println("List in  dao" + list.size());

			productList = new ArrayList<grBeanForReport>(0);
			
			for (Object[] object : list) {
				
				grBeanForReport p = new grBeanForReport();
				
				p.setProductname(object[0].toString());
				System.out.println("," + object[0].toString());
				// p.setCat(object[1].toString());
				p.setQuantity(Double.parseDouble(object[1].toString()));
				System.out.println("product Quantity ===="+object[1].toString());
				p.setRate(Double.parseDouble(object[2].toString()));
				System.out.println("product Rate -----"+object[2].toString());
				p.setGRDate(object[3].toString());
				System.out.println("product Date ******"+object[3].toString());
				p.setGridTotal(Double.parseDouble(object[4].toString()));
				System.out.println("total //////"+object[4].toString());
				p.setShop(object[5].toString());
				System.out.println("shop //////"+object[5].toString());
				p.setDiscount(Double.parseDouble(object[6].toString()));
				p.setGst(Double.parseDouble(object[7].toString()));
				p.setIgst(Double.parseDouble(object[8].toString()));
				p.setBillno(Double.parseDouble(object[9].toString()));
				System.out.println(" hi this is Bill No== "+(object[9].toString()));
				productList.add(p);
				System.out.println("okk");
			}
		
			
		} catch (Exception e) {
				e.printStackTrace();
		} finally {

			hbu.closeSession(session);
		}
		
		return productList;
	}

	public List<PoDetailsBean> getPoDetailsAsPerVendorWise(String ShopName1 ,String vendorName) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+vendorName);
		List<PoDetailsBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+ShopName1+"'And pd.suppliername='"+vendorName+"'");
			List<Object[]> list = query.list();
			 saleList= new ArrayList<PoDetailsBean>(0);
			
			for (Object[] object : list) {
				
				PoDetailsBean reports = new PoDetailsBean();
				reports.setProductname((object[0].toString()));
				reports.setDate((Date) (object[1]));
				reports.setQuantity(Double.parseDouble(object[2].toString()));
				reports.setRate(Double.parseDouble(object[3].toString()));
				reports.setGridTotal(Double.parseDouble(object[4].toString()));
				
				System.out.println("hi this is kishor++++----"+GridTotal);
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;
	}

	public List<PoDetailsBean> getPoDetailsAsPerRangeWise(String ShopName2,String fisDate, String endDate) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+fisDate+"{{{{}}}}"+endDate);
		List<PoDetailsBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where Shop='"+ShopName2+"' And Date BETWEEN '"+fisDate+"' and '"+endDate+"'");
			List<Object[]> list = query.list();
			 saleList= new ArrayList<PoDetailsBean>(0);
			
			for (Object[] object : list) {
				
				PoDetailsBean reports = new PoDetailsBean();
				reports.setProductname((object[0].toString()));
				reports.setDate((Date) (object[1]));
				reports.setQuantity(Double.parseDouble(object[2].toString()));
				reports.setRate(Double.parseDouble(object[3].toString()));
				reports.setGridTotal(Double.parseDouble(object[4].toString()));
				System.out.println("hi this is kishor********++++---- "+(object[4].toString()));
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;
	}
/*report Shope wise*/
	public List<PoDetailsBean> getPoDetailsAsPerShopWise(String shopName) {
		Double trans;
		Double hamali;
		HibernateUtility hbu=null;
		Session session=null;
		System.out.println("{{{{}}}}"+shopName);
		List<PoDetailsBean> saleList=null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("SELECT pd.productname,pd.date,pd.quantity,pd.rate,pd.grid_total FROM po_details pd where pd.Shop='"+shopName+"'");
			List<Object[]> list = query.list();
			 saleList= new ArrayList<PoDetailsBean>(0);
			
			for (Object[] object : list) {
				
				PoDetailsBean reports = new PoDetailsBean();
				reports.setProductname((object[0].toString()));
				reports.setDate((Date) (object[1]));
				reports.setQuantity(Double.parseDouble(object[2].toString()));
				reports.setRate(Double.parseDouble(object[3].toString()));
				reports.setGridTotal(Double.parseDouble(object[4].toString()));
				saleList.add(reports);
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return saleList;
	}
	
	//po deatil 
	public List getAllPODetails()
	{
			HibernateUtility hbu = null;
			Session session =  null;
			Query query = null;
			 List<PoDetailsBean> list = null;
			 try {
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				query = session.createQuery("from PoDetailsBean");
				 /*query = session.createQuery("from CustomerDetailsBean");*/
				 list = query.list(); 
			} catch (Exception e) {
				Log.error("Error in getAllPriduct", e);
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
