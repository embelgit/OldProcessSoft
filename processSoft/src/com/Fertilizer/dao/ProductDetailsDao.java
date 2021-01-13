package com.Fertilizer.dao;

import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.ExpenditurePaymentDetail;
import com.Fertilizer.bean.GetEmployeeDetails;
import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.bean.ProductDetailsForReports;
import com.Fertilizer.hibernate.CategoryDetailsBean;
import com.Fertilizer.hibernate.CustomerDetailsBean;
import com.Fertilizer.hibernate.MeasuringUnitsBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.hibernate.TaxCreationBean;
import com.Fertilizer.utility.HibernateUtility;

public class ProductDetailsDao {

	public void productDetail(ProductDetailsBean pdb) {

			System.out.println("In DAO");
			
			HibernateUtility hbu=null;
			Session session = null;
			Transaction transaction = null;
			
			try{
			 hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
		
			 System.out.println("Tx started");
			 
/*			
			 Long fk_tax_id = pdb.getFkTaxId();

			 TaxCreationBean taxDetails = (TaxCreationBean) session.load(TaxCreationBean.class, fk_tax_id);
			 pdb.setTaxCreationBean(taxDetails);*/
			 
		
			 
			 pdb.setStatus(1l);
			session.save(pdb);
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

	
	public List getAllProductBySuppliers(String supplierId) {
		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId);
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


	public List getProductDetails(String productId) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight, p.mrp from product_details p where p.product_name=:productId");
			 
			 System.out.println(productId+"product id in goods receive dao");
			 query.setParameter("productId", productId);
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

	public List getProductDetailsforbill(String productId) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			//Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight from product_details p where p.product_name=:productId");
			 
			 Query query=session.createSQLQuery("SELECT p.pk_product_id , p.product_name ,p.buy_price ,p.sale_price ,p.weight ,g.batch_no ,DATE(g.expiry_date),p.tax_percentage FROM goods_receive g LEFT JOIN product_details p ON g.fk_product_id = p.pk_product_id WHERE p.pk_product_id =:productId");
			 
			 query.setParameter("productId", productId);
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
	
	
public void deleteProduct(String delProName) {
		
		HibernateUtility hbu = null ;
		 Session session = null;
		 List list  = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("delete from product_details where pk_product_id="+delProName);
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
	public List getProductDetailsByBatchNo(String batchNo) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			//Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight from product_details p where p.product_name=:productId");
			 
			// Query query=session.createSQLQuery("SELECT p.pk_product_id , p.product_name ,p.buy_price ,p.sale_price ,p.weight ,g.batch_no ,DATE(g.expiry_date) FROM goods_receive g LEFT JOIN product_details p ON g.fk_product_id = p.pk_product_id WHERE p.pk_product_id =:productId");
			 Query query = session.createSQLQuery("select p.pk_product_id , p.product_name ,p.buy_price , p.sale_price , p.weight ,g.batch_no ,g.expiry_date, g.tax_percentage from goods_receive g LEFT JOIN product_details p ON g.fk_product_id = p.pk_product_id WHERE g.batch_no =:batchNo group by g.batch_no");
			 query.setParameter("batchNo", batchNo);
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
	
	
	
	
	public List getProductDetailsforseedANdPestisidebill(String productId) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
			
			try{
			 hbu=HibernateUtility.getInstance();
			 session=hbu.getHibernateSession();

			 
			 Query query=session.createSQLQuery("SELECT i.batchNo ,p.pk_product_id , i.stock from product_details p LEFT JOIN item_stockforpestiandseed i ON p.pk_product_id = i.fk_product_id WHERE p.pk_product_id =:productId AND i.stock>0");
			 
			 query.setParameter("productId", productId);
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
	
	public List getAllProductBySCategoryAndBySuppliers(String category) {
		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
 			System.out.println("category === == ="+category);
 			/*Query query = session.createSQLQuery("select p.product_name,p.insert_date,p.manufacturing_company,p.weight, s.unit_name from product_details p RIGHT JOIN sold_units s ON p.fk_unit_id=s.pk_unit_id where  p.fk_cat_id="+category);*/
 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p  where  p.fk_cat_id="+category);
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
	
	
	
	
	public List getAllProductForBilling()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 Long categoryId = 1l;
			 query = session.createQuery("from ProductDetailsBean where fk_cat_id =:categoryId and status="+2);
			 query.setParameter("categoryId", categoryId);
			 list = query.list(); 
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	public List getAllProductForEdit(HttpServletRequest request)
	{
		HttpSession usersession = request.getSession(true);
		String userid = (String)usersession.getAttribute("userid");
		String shopid = (String)usersession.getAttribute("shopid");
		
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 Long categoryId = 1l;
			 query = session.createQuery("from ProductDetailsBean where shopId='"+shopid+"'");
			// query.setParameter("categoryId", categoryId);
			 list = query.list(); 
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list; 	
		
	}
	
	public List getAllProductForBillingforPestiSideAndSeed()
	{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List list = null;
	 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 Long categoryId = 2l;
			 Long categoryId2 = 3l;
			 query = session.createQuery("from ProductDetailsBean where fk_cat_id =:categoryId OR fk_cat_id =:categoryId2 and status="+2);
			 query.setParameter("categoryId", categoryId);
			 query.setParameter("categoryId2", categoryId2);
			 list = query.list(); 
		} catch (Exception e) {
			Log.error("Error in getAllProductForBilling", e);
		}
		 
		 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
				return list;
		
	}
	
	
	public List getProductDetailsForReport(){


	    HibernateUtility hbu=null;
	    Session session=null;
	    List<ProductDetailsForReports> productList=null;
	    try
	    {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query=session.createSQLQuery("select p.product_name, p.manufacturing_company, g.buy_price, g.sale_price FROM product_details p RIGHT JOIN goods_receive g ON p.pk_product_id = g.fk_product_id;");
			List<Object[]> list = query.list();
			productList= new ArrayList<ProductDetailsForReports>(0);	
		for (Object[] object : list) {
			System.out.println(Arrays.toString(object));
			
			ProductDetailsForReports reports = new ProductDetailsForReports();
			
			reports.setProductName(object[0].toString());
			reports.setManufacturingCompany(object[1].toString());
			reports.setBuyPrice(Double.parseDouble(object[2].toString()));
			reports.setSalePrice(Double.parseDouble(object[3].toString()));
			
			
			productList.add(reports);		
	}}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	 finally
	{
	
	if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return productList;
}


	public List<ProductDetailsForReports> getProductDetailForReportAsPerCat(String cat) 
	{
		
		HibernateUtility hbu=null;
		Session session=null;
		List<ProductDetailsForReports> product1List = null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("select p.product_name, p.manufacturing_company, g.buy_price, g.sale_price FROM product_details p RIGHT JOIN goods_receive g ON p.pk_product_id = g.fk_product_id WHERE g.fkCategoryId ="+cat);
			/*query.setParameter("category", cat);*/
			List<Object[]> list = query.list();
			product1List = new ArrayList<ProductDetailsForReports>(0);
			
			
			for (Object[] object : list) {
				
				ProductDetailsForReports reports1 = new ProductDetailsForReports();
					
				reports1.setProductName(object[0].toString());
				reports1.setManufacturingCompany(object[1].toString());
				reports1.setBuyPrice(Double.parseDouble(object[2].toString()));
				reports1.setSalePrice(Double.parseDouble(object[3].toString()));
				
				
				product1List.add(reports1); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return product1List;	
		
	
		
	}
	
	
	
public List getAllProductByGodown(String godownId) {
		
		HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
 			
 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p left join goods_receive g ON p.pk_product_id = g.fk_product_id   where  g.fkgodownid= "+godownId);
 			
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
	
public List getProductDetailsGodowm(String productId) {
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight ,g.batch_no ,g.expiry_date from product_details p left join goods_receive g ON g.fk_product_id=p.pk_product_id where p.product_name=:productId");
		 
		 
		 query.setParameter("productId", productId);
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


public List getProductDetailsforbillAsPerBarcode(String barcodeNum) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		//Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight from product_details p where p.product_name=:productId");
		 
		 Query query=session.createSQLQuery("SELECT p.pk_product_id , p.product_name ,p.buy_price ,p.sale_price ,p.weight ,g.batch_no ,DATE(g.expiry_date) FROM product_details p  LEFT JOIN barcode_details b ON b.fk_product_id = p.pk_product_id LEFT JOIN goods_receive g ON g.fk_product_id=p.pk_product_id WHERE b.barcode_number =:barcodeNum");
		 
		 query.setParameter("barcodeNum", barcodeNum);
		 list = query.list();
		 
		System.out.println(list.size()+"*************");
		}catch(RuntimeException e){
			
		Log.error("Error in getProductDetailsforbillAsPerBarcode",e);
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;

}


public List getProductDetailsforseedANdPestisidebillAsPerBarcodeNum(
		String barcode) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		 
		 Query query=session.createSQLQuery("SELECT i.batchNo ,p.pk_product_id , i.stock from product_details p LEFT JOIN item_stockforpestiandseed i ON p.pk_product_id = i.fk_product_id WHERE p.pk_product_id =:productId");
		 
		 query.setParameter("barcode", barcode);
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


public List getAllEmployeeDetailsForEdit(Long productID2) {

	System.out.println("into dao product : "+productID2);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT p.product_name, p.manufacturing_company, p.tax_percentage, t.tax_name, s.unit_name, p.buy_price, p.mrp, p.sale_price, p.credit_customer_sale_price, p.weight ,p.hsn FROM product_details p LEFT JOIN sold_units s on s.pk_unit_id =p.fk_unit_id LEFT JOIN tax_details t on t.pk_tax_id = p.fk_tax_id WHERE p.pk_product_id ="+productID2);
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
	 System.out.println("out of dao - return product List : "+list);
			return list;
}

//this is for vendor details 
public List getvenderDetailsToPODetail(Long supID1)
{
	System.out.println("into dao product with vendor details VK : "+supID1);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT city,tin_no,contact_no,address,Id_No FROM supplier_details WHERE  pk_supplier_id ="+supID1);
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
	 System.out.println("out of dao - return product List : "+list);
			return list;
}

//get Vendor GST for outWord
public List getvenderGSTOW(String supplierName)
{
	System.out.println("into dao product with vendor details VK : "+supplierName);
	System.out.println("supppppppppppppppppp"+supplierName);
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT city,tin_no,contact_no,Id_No FROM supplier_details WHERE supplier_name =:supplierName");
		 query.setParameter("supplierName", supplierName);
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
	 System.out.println("out of dao - return product List : "+list);
			return list;
}

//this method for get all product list	
public List getProductList(HttpServletRequest request){
	
	HttpSession usersession = request.getSession(true);
	String userid =(String)usersession.getAttribute("userid"); 
	String shopid =(String)usersession.getAttribute("shopid");
	
	HibernateUtility hbu=null;
	Session session=null;
	List<GetProductDetails> productList=null;
		try {

			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();

			Query query = session.createSQLQuery("SELECT p.product_name, p.manufacturing_company, p.tax_percentage, t.tax_name,p.buy_Price  FROM product_details p  LEFT JOIN tax_details t on t.pk_tax_id = p.fk_tax_id LEFT JOIN categories c on c.pk_cat_id = p.fk_cat_id where p.Shop_id='"+shopid+"' ");
			// Query query = session.createQuery("from PurchaseBill2");
			List<Object[]> list = query.list();

			System.out.println("List in  dao" + list.size());

			productList = new ArrayList<GetProductDetails>(0);

			System.out.println("product list size   " + productList.size());

			for (Object[] object : list) {
				GetProductDetails p = new GetProductDetails();
				
				
				p.setProduct(object[0].toString());
				System.out.println(object[0].toString());
				// p.setCat(object[1].toString());
				p.setManufacturer(object[1].toString());
				System.out.println(object[1].toString());
				p.setTaxPercentage(Double.parseDouble(object[2].toString()));
				System.out.println((object[2].toString()));
				p.setTaxType(object[3].toString());
				System.out.println(object[3].toString());
				p.setBuyPrice(Double.parseDouble(object[4].toString()));
				System.out.println((object[4].toString()));
				

				productList.add(p);

			}
		}catch(RuntimeException e){	

}
finally{

hbu.closeSession(session);	
}

return productList;
}

public List getProductDetailsForTaxGridInGoodsReceive(String proName, String fk_cat_id, String fk_subCat_id) {
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT p.pk_product_id, p.product_name, p.buy_price,p.sale_price,p.weight,p.mrp,p.tax_percentage,p.manufacturing_company,p.fk_cat_id,p.hsn,t.tax_name from product_details p LEFT JOIN tax_details t ON fk_tax_id = t.pk_tax_id where p.product_name=:proName AND p.fk_cat_id=:fk_cat_id AND p.fk_subCat_id=:fk_subCat_id");
		 query.setParameter("proName", proName);
		 query.setParameter("fk_cat_id", fk_cat_id);
		 query.setParameter("fk_subCat_id", fk_subCat_id);
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



public List getAllProductBySCategoryAndBySuppliersForGoodsReceive(String category,
		String supplier) {

	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
			
			Query query = session.createSQLQuery("SELECT p.product_name, p.insert_date from purchase_order p WHERE p.fk_cat_id =:category AND p.fk_supplier_id=:supplier");
			query.setParameter("category", category);
			query.setParameter("supplier", supplier);
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


public List getAdvanceBookedProductDetailsForGoodsReceive(String productId2, String category, String supplier) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT p.fk_product_id ,p.product_name,p.buy_price,p.sale_price,p.weight,p.mrp from purchase_order p WHERE p.product_name=:productId AND  p.fk_cat_id =:category AND p.fk_supplier_id =:supplier ");
		 
		
		 query.setParameter("productId", productId2);
		 query.setParameter("category", category);
		 query.setParameter("supplier", supplier);
		
		 list = query.list();
		 
		System.out.println(list.size()+"===List size");
		}catch(RuntimeException e){
			
		Log.error("Error in getProductDetails",e);
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;

}


public List getAdvanceBookedProductDetailsForGoodsReceiveWithTax(
		String productId3, String category, String supplier) {


	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT p.fk_product_id ,p.product_name,p.buy_price,p.sale_price,p.weight,p.tax_percentage,p.mrp from purchase_order p WHERE p.product_name=:productId AND  p.fk_cat_id =:category AND p.fk_supplier_id =:supplier ");
		 
		
		 query.setParameter("productId", productId3);
		 query.setParameter("category", category);
		 query.setParameter("supplier", supplier);
		
		 System.out.println("product id =="+productId3);
		System.out.println("category id =="+category);
		System.out.println("supplier id =="+supplier);
		 
		 list = query.list();
		 
		System.out.println(list.size()+"===List size");
		}catch(RuntimeException e){
			
		Log.error("Error in getProductDetails",e);
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;


}


public List getpreviousDetsil(String productId2) {
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("Select p.insert_date, p.product_name, p.buy_price, p.sale_price, p.weight, p.mrp from product_details p where p.product_name=:productId ORDER BY pk_product_id DESC LIMIT 1");
		 
		 System.out.println(productId2+"product id in goods receive dao");
		 query.setParameter("productId", productId2);
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

//to get stock Update
public List getAllStockEntry() {
	// TODO Auto-generated method stub
	System.out.println("IN DAO");
	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
	try{
	 hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createQuery("from ProductDetailsBean");
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


public List getProductDetailsForAdvanceBook(String proName) {

	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("Select p.pk_product_id, p.product_name, p.buy_price, p.sale_price, p.weight, p.mrp, p.manufacturing_company, s.unit_name,p.fk_cat_id  from product_details p RIGHT JOIN sold_units s ON p.fk_unit_id = s.pk_unit_id where p.product_name=:proName");
		 
		 System.out.println(proName+"proName in goods receive dao");
		/* System.out.println(fk_subCat_id+"weight in goods receive dao");
		 System.out.println(fk_cat_id+"company in goods receive dao");*/
		
		 query.setParameter("proName", proName);
		/* query.setParameter("fk_cat_id", fk_cat_id);
		 query.setParameter("fk_subCat_id", fk_subCat_id);*/
		 
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


public List getAllProductBySCategoryAndBySuppliersForGoodsReceiveNew(
		String category, String supplier) {


	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
			
			Query query = session.createSQLQuery("SELECT p.product_name, p.insert_date,p.manufacturer, p.weight, p.unit_name  from purchase_order  p WHERE p.fk_cat_id =:category AND p.fk_supplier_id=:supplier");
			query.setParameter("category", category);
			query.setParameter("supplier", supplier);
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


public List getAdvanceBookedProductDetailsForGoodsReceiveNew(String proName,
		String category, String supplier, String company, String weight) {


	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();

		Query query=session.createSQLQuery("SELECT p.fk_product_id ,p.product_name,p.buy_price,p.sale_price,p.weight,p.mrp,p.manufacturer,p.quantity from purchase_order p WHERE p.product_name=:proName AND  p.fk_cat_id =:category AND p.fk_supplier_id =:supplier AND p.manufacturer =:company AND p.weight=:weight ");
		 
		
		 query.setParameter("proName", proName);
		 query.setParameter("category", category);
		 query.setParameter("supplier", supplier);
		 query.setParameter("company", company);
		 query.setParameter("weight", weight);
		 list = query.list();
		 
		System.out.println(list.size()+"===List size");
		}catch(RuntimeException e){
			
		Log.error("Error in getProductDetails",e);
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;


}


public List getAdvanceBookedProductDetailsForGoodsReceiveWithTaxNew(
		String proName, String category, String supplier, String company,
		String weight) {



	HibernateUtility hbu=null;
	Session session=null;
	List list=null;
		
		try{
		 hbu=HibernateUtility.getInstance();
		 session=hbu.getHibernateSession();
		 System.out.println("proName =="+proName);
			System.out.println("category id =="+category);
			System.out.println("supplier id =="+supplier);
			System.out.println("company =="+company);
			System.out.println("weight =="+weight);
			
		Query query=session.createSQLQuery("SELECT p.fk_product_id ,p.product_name,p.buy_price,p.sale_price,p.weight,d.tax_percentage,p.mrp,p.manufacturer from purchase_order p RIGHT JOIN product_details d on p.fk_product_id = d.pk_product_id WHERE p.product_name=:proName AND  p.fk_cat_id =:category AND p.fk_supplier_id =:supplier AND p.weight=:weight AND p.manufacturer=:company");
		 
		
		 query.setParameter("proName", proName);
		 query.setParameter("category", category);
		 query.setParameter("supplier", supplier);
		 query.setParameter("company", company);
		 query.setParameter("weight", weight);
		
		
		 
		 list = query.list();
		 
		System.out.println(list.size()+"===List size");
		}catch(RuntimeException e){
			
		Log.error("Error in getProductDetails",e);
	}finally{
			if(session!=null){
				
				hbu.closeSession(session);
			}
			
		}
	
	return list;



}
public List getAllProductBySCategoryForFertilizerBill() {
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
			Query query = session.createSQLQuery("SELECT s.product_Name,s.fk_SubCat_Id, s.container,s.fk_Cat_Id,s.fk_type_id,c.cat_name,sc.Packing_Type FROM packing s left join categories c on s.fk_Cat_Id=c.pk_cat_id left join packing_type sc on s.fk_type_id=sc.pk_type_id where container>0");
			
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

public List getCapacity(String containerName) {
	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
/* 			Query query = session.createSQLQuery("select p.product_name,p.insert_date from product_details p where p.fk_supplier_id="+supplierId );*/
			Query query = session.createSQLQuery("select pk_type_id,Packing_Type from packing_type where Container_Name='"+containerName+"'");
			
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


public List getAllProductBySCategoryForSeedAndPesticideBill(String category1) {

	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select product_name, manufacturing_company, weight, s.unit_name FROM product_details LEFT JOIN sold_units s ON fk_unit_id = s.pk_unit_id WHERE fk_cat_id =:category1");
			 query.setParameter("category1", category1);
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


public List getAllBatchAndStockForSeedAndPesticideBill(String proName,
		String company, String weight) {

	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select batch_number, Quantity from stock_detail WHERE ProductName =:proName AND CompanyName =:company AND Weight=:weight AND Quantity>0");
			 query.setParameter("proName", proName);
			 query.setParameter("company", company);
			 query.setParameter("weight", weight);
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


public List getAllProductBySCategoryForStockReport() {

	HibernateUtility hbu = null ;
	 Session session = null;
	 List list  = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("select product_name, manufacturing_company FROM product_details ");
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

public List getAllProductDetails()
{
		/*
		 * HttpSession usersession = request.getSession(true); String userid =
		 * (String)usersession.getAttribute("userid"); String shopid =
		 * (String)usersession.getAttribute("shopid");
		 */
	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from ProductDetailsBean ");
		 list = query.list(); 
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



public List getAllProductDetails1(HttpServletRequest request)
{
		
		  HttpSession usersession = request.getSession(true); 
		  String userid = (String)usersession.getAttribute("userid"); 
		  String shopid = (String)usersession.getAttribute("shopid");
		 
	
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createQuery("from ProductDetailsBean where shopId='"+shopid+"' ");
		 list = query.list(); 
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


public List getAllSubCategory(String fk_cat_id)
{
	System.out.println("IN DAO");
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	 List list = null;
	System.out.println("IN DAO"+fk_cat_id);
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 System.out.println("IN DAO"+fk_cat_id);
		 query = session.createSQLQuery("SELECT pk_subcat_id,sub_cat_name from sub_categories where fk_cat_id="+fk_cat_id);
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

public List getProductDetails()
{
	HibernateUtility hbu = null;
	Session session =  null;
	Query query = null;
	// List list = null;
	 List<GetProductDetails> stockList = null;
	 
	 
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 query = session.createSQLQuery("SELECT product_name,c.cat_name,sc.sub_cat_name from product_details left join categories c on fk_cat_id=c.pk_cat_id left join sub_categories sc on fk_subCat_id=sc.pk_subcat_id");
		 List<Object[]> list = query.list(); 
		 stockList = new ArrayList<GetProductDetails>(0);
		 System.out.println("List size of product detail = ="+list.size());
		 for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				GetProductDetails reports = new GetProductDetails();
				reports.setProduct(object[0].toString());
				reports.setCatName(object[1].toString());
				reports.setSubCatName((object[2].toString()));
				stockList.add(reports); 
		
			}
		 
	} catch (RuntimeException e) {
		Log.error("Error in getAllMainCat", e);
	}
	 
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
			return stockList;
	
}
public List getAllProduct()
{
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<ProductDetailsBean> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			query = session.createQuery("from ProductDetailsBean");
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


public List getAllProduct1(HttpServletRequest request)
{	
	HttpSession usersession = request.getSession(true);
	String userid = (String)usersession.getAttribute("userid");
	String shopid = (String)usersession.getAttribute("shopid");
	
		HibernateUtility hbu = null;
		Session session =  null;
		Query query = null;
		 List<ProductDetailsBean> list = null;
		 try {
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			query = session.createQuery("from ProductDetailsBean where shopId='"+shopid+"'");
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

// for clear the product after selection of product name 
public List getAllItemName(HttpServletRequest request) {
	
	HttpSession usersession = request.getSession(true);
	String userid = (String)usersession.getAttribute("userid");
	String shopid = (String)usersession.getAttribute("shopid");
	
	HibernateUtility hbu = null;
	Session session = null;
	Query query = null;
	List<Object[]> list = null;
	List<ProductDetailsBean> itemList = null;
	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	//query = session.createSQLQuery("select p.ProductName, c.category_name, p.HsnSacNo, p.color, p.size,p.FkCatId,p.fkSubCategoryId,sc.subcat_name from product_reg p left join categories c ON p.FkCatId = c.pk_category_id JOIN sub_categories sc on p.fkSubCategoryId = sc.pk_subcat_id GROUP BY p.ProductName, c.category_name, sc.subcat_name");
	query = session.createSQLQuery("select product_name,hsn,buy_price from product_details where shop_id='"+shopid+"'");
	list = query.list();
	System.out.println("Item List" + list);

	itemList = new ArrayList<ProductDetailsBean>(0);
	for (Object[] objects : list) {

		ProductDetailsBean item = new ProductDetailsBean();
		item.setProductName(objects[0].toString());
		item.setHsn(objects[1].toString());
		item.setBuyPrice(Double.parseDouble(objects[2].toString()));
		

	

		itemList.add(item);

	}

	hbu.closeSession(session);
	return itemList;
}

//for clear the product after selection of product name  for Good receive

public List getAllItemName2(HttpServletRequest request) {

	HttpSession usersession = request.getSession(true);
	String userid = (String)usersession.getAttribute("userid");
	String shopid = (String)usersession.getAttribute("shopid");
	
	HibernateUtility hbu = null;
	Session session = null;
	Query query = null;
	List<Object[]> list = null;
	List<ProductDetailsBean> itemList = null;
	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	//query = session.createSQLQuery("select p.ProductName, c.category_name, p.HsnSacNo, p.color, p.size,p.FkCatId,p.fkSubCategoryId,sc.subcat_name from product_reg p left join categories c ON p.FkCatId = c.pk_category_id JOIN sub_categories sc on p.fkSubCategoryId = sc.pk_subcat_id GROUP BY p.ProductName, c.category_name, sc.subcat_name");
	query = session.createSQLQuery("select product_name,hsn,buy_price from product_details where shop_id='"+shopid+"'");
	list = query.list();
	System.out.println("Item List" + list);

	itemList = new ArrayList<ProductDetailsBean>(0);
	for (Object[] objects : list) {

		ProductDetailsBean item = new ProductDetailsBean();
		item.setProductName(objects[0].toString());
		item.setHsn(objects[1].toString());
		item.setBuyPrice(Double.parseDouble(objects[2].toString()));
		

	

		itemList.add(item);

	}

	hbu.closeSession(session);
	return itemList;
}


//for clear the product after selection of product name  for inward Without Inward

public List getAllItemName3(HttpServletRequest request) {

	HttpSession usersession = request.getSession(true);
	String userid = (String)usersession.getAttribute("userid");
	String shopid = (String)usersession.getAttribute("shopid");
	
	HibernateUtility hbu = null;
	Session session = null;
	Query query = null;
	List<Object[]> list = null;
	List<ProductDetailsBean> itemList = null;
	hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	//query = session.createSQLQuery("select p.ProductName, c.category_name, p.HsnSacNo, p.color, p.size,p.FkCatId,p.fkSubCategoryId,sc.subcat_name from product_reg p left join categories c ON p.FkCatId = c.pk_category_id JOIN sub_categories sc on p.fkSubCategoryId = sc.pk_subcat_id GROUP BY p.ProductName, c.category_name, sc.subcat_name");
	query = session.createSQLQuery("select product_name,hsn,buy_price from product_details where shop_id='"+shopid+"'");
	list = query.list();
	System.out.println("Item List" + list);

	itemList = new ArrayList<ProductDetailsBean>(0);
	for (Object[] objects : list) {

		ProductDetailsBean item = new ProductDetailsBean();
		item.setProductName(objects[0].toString());
		item.setHsn(objects[1].toString());
		item.setBuyPrice(Double.parseDouble(objects[2].toString()));
		

	

		itemList.add(item);

	}

	hbu.closeSession(session);
	return itemList;
}
}