package com.Fertilizer.helper;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.GetBarcode;
import com.Fertilizer.bean.GetEmployeeDetails;
import com.Fertilizer.bean.GetProductDetailPO;
import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.bean.ProductDetailsForReports;
import com.Fertilizer.dao.BarcodeDetailDao;
import com.Fertilizer.dao.CategoryDetailsDao;
import com.Fertilizer.dao.EmployeeDetailsDao;
import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.BarcodeDetailsBean;
import com.Fertilizer.hibernate.EmployeeDetailsBean;
import com.Fertilizer.hibernate.Packing_InfoBean;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.SubCategoryDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class ProductDetailsHelper {

	Long barcodeNo;
	BigInteger productId;
	public void productDetails(HttpServletRequest request,
			HttpServletResponse response) {
		
				System.out.println("In helper");
				
				
				String productName = request.getParameter("productName");
				
				
				String manufacturingCompany = request.getParameter("manufacturingCompany");
				System.out.println("hi this is kishor ++++++++++++++++++++++++++++++++ "+manufacturingCompany);
				
		
				
				String Rate = request.getParameter("Rate");
				
				String IdNo = request.getParameter("IdNo");
				
				
		
				
				String fkTaxId = request.getParameter("fkTaxId");
				
				String taxPercentage = request.getParameter("taxPercentage");
				
			
				
				String hsn = request.getParameter("hsn");
                
				System.out.println("hsn = = ="+hsn);
				
				ProductDetailsDao pd = new ProductDetailsDao();
				
				List stkList  = pd.getAllStockEntry();
				
				System.out.println("list size+++="+stkList.size());
				// If Stock Is Empty  
		        if(stkList.size() == 0){
					System.out.println("IN Stock Empty");
		        	ProductDetailsBean pdb = new ProductDetailsBean();	
		        	
				/*if(!"".equals(buyPrice)){
							pdb.setBuyPrice(Double.parseDouble(buyPrice));
					} else
					{
						pdb.setBuyPrice(Double.parseDouble("00"));
					}*/
					
					
					if(!"".equals(Rate)){
						pdb.setSalePrice(Double.parseDouble(Rate));
					} else
					{
						pdb.setSalePrice(Double.parseDouble("00"));
					}
					
					if(!"".equals(Rate)){
						pdb.setBuyPrice(Double.parseDouble(Rate));
					} else
					{
						pdb.setBuyPrice(0.0);
					}
		        	
		        	/*if(!"".equals(unitName)){
						pdb.setUnitName(unitName);
					} else
					{
						pdb.setUnitName("N/A");
					}*/
		        	
				
					if(!"".equals(hsn)){
						pdb.setHsn(hsn);
					} else
					{
						pdb.setHsn("00");
					}
					
					SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
					Date dateobj = new Date();
					System.out.println(dateFormat1.format(dateobj));
					
					pdb.setInsertDate(dateobj);
					
					if(fkTaxId == null){
						pdb.setFkTaxId(0l);
					}
					else{
						pdb.setFkTaxId(Long.parseLong((fkTaxId)));
					}
					
					if(taxPercentage == null){
						pdb.setTaxPercentage(0.0);
					}
					else{
						pdb.setTaxPercentage(Double.parseDouble(taxPercentage));
					}
					
					if(!"".equals(manufacturingCompany)){
						pdb.setManufacturingCompany(manufacturingCompany);
				} else
				{
					pdb.setManufacturingCompany("N/A");
				}
					
					
					/*pdb.setFk_cat_id(Long.parseLong(fk_cat_id));
					pdb.setFk_subCat_id(Long.parseLong(fk_subCat_id));
					*/
					//pdb.setFk_shop_id(Long.parseLong(fk_shop_id));
					//sSystem.out.println("fk_subCat_id==="+fk_subCat_id);
					/*pdb.setFk_supplier_id(Long.parseLong(fk_supplier_id));*/
					pdb.setProductName(productName);
				/*	pdb.setFk_unit_id(Long.parseLong(fk_unit_id));
					pdb.setWeight(Double.parseDouble(weight));*/
					
					/*if(creditSalePrice == null){
						pdb.setCreditSalePrice(0.0d);
					}
					else{
						pdb.setCreditSalePrice(Double.parseDouble(CreditSalePrice));
					}*/
					HttpSession session = request.getSession(true);
					String username = (String)session.getAttribute("user");
					String userid = (String)session.getAttribute("userid");
					String shopid = (String)session.getAttribute("shopid");
					String shopname=(String)session.getAttribute("shopname");
					
					pdb.setUserId(Long.parseLong(userid));
					pdb.setUsername(username);
					pdb.setShopId(Long.parseLong(shopid));
					pdb.setShopName(shopname);
					
				    ProductDetailsDao pdd = new ProductDetailsDao();
				    pdd.productDetail(pdb);
		        }
		        else/*To Update Stock Table If It is Not Empty */
		        {
		        	
		        for(int i=0;i<stkList.size();i++){
		        	System.out.println("inside else");
		        	
		        	ProductDetailsBean st = (ProductDetailsBean)stkList.get(i);
		        	Long ItemId = st.getProdctId();
		        	String ProductName = st.getProductName();
		        	/*String Comapny = st.getManufacturingCompany();*/
		        	Double Weight = st.getWeight();
		        	Long fk_cat_id2=st.getFk_cat_id();
		        	Long fk_subCat_id2=st.getFk_subCat_id();

		        	//If ItemName Is Already Exists In Stock Table  
		        	if(productName.equals(ProductName)){
		        		System.out.println("inside if");
		        		break;
		        	}
		        	else
		        	{
		        		/*ItemName is Not Exists */
		        		if(i+1 == stkList.size()){
		        			System.out.println("IN item not exist");
		        			 ProductDetailsBean pdb1 = new ProductDetailsBean();
		        			 
		        			/* if(!"".equals(buyPrice)){
									pdb1.setBuyPrice(Double.parseDouble(buyPrice));
							} else
							{
								pdb1.setBuyPrice(Double.parseDouble("00"));
							}
							
							
							if(!"".equals(salePrice)){
								pdb1.setSalePrice(Double.parseDouble(salePrice));
							} else
							{
								pdb1.setSalePrice(Double.parseDouble("00"));
							}*/
						
					
							SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
							Date dateobj = new Date();
							System.out.println(dateFormat1.format(dateobj));
							
							pdb1.setInsertDate(dateobj);
							
							if(fkTaxId == null){
								pdb1.setFkTaxId(0l);
							}
							else{
								pdb1.setFkTaxId(Long.parseLong((fkTaxId)));
							}
							
							if(taxPercentage == null){
								pdb1.setTaxPercentage(0.0);
							}
							else{
								pdb1.setTaxPercentage(Double.parseDouble(taxPercentage));
							}
							
							/*if(!"".equals(unitName)){
								pdb1.setUnitName(unitName);
							} else
							{
								pdb1.setUnitName("N/A");
							}
							*/
							/*if(mrp == null){
								pdb1.setMrp(0.0);
							}
							else{
								pdb1.setMrp(Double.parseDouble(mrp));
							}*/
/*							
							
							
							pdb1.setManufacturingCompany(manufacturingCompany);
							/*pdb1.setFk_cat_id(Long.parseLong(fk_cat_id));
							pdb1.setFk_subCat_id(Long.parseLong(fk_subCat_id));
							//pdb1.setFk_shop_id(Long.parseLong(fk_shop_id));
							//System.out.println("ItemName is Not Exists fk_subCat_id==="+fk_subCat_id);
							/*pdb.setFk_supplier_id(Long.parseLong(fk_supplier_id));*/
							pdb1.setProductName(productName);
							pdb1.setIdNo(IdNo);
							pdb1.setBuyPrice(Double.parseDouble(Rate));
							pdb1.setHsn(hsn);
							pdb1.setManufacturingCompany(manufacturingCompany);
							/*pdb1.setFk_unit_id(Long.parseLong(fk_unit_id));
							pdb1.setWeight(Double.parseDouble(weight));*/
							
							/*if(creditSalePrice == ""){
								pdb1.setCreditSalePrice(0.0d);
							}
							else{
								pdb1.setCreditSalePrice(Double.parseDouble(creditSalePrice));
							}*/
							
						
						  HttpSession session = request.getSession(true); 
						  String username = (String)session.getAttribute("user");
						  String userid = (String)session.getAttribute("userid");
						  String shopid =(String)session.getAttribute("shopid"); 
						  String shopname=(String)session.getAttribute("shopname");
						 
						  pdb1.setUserId(Long.parseLong(userid));
						  pdb1.setUsername(username);
						  pdb1.setShopId(Long.parseLong(shopid)); 
						  pdb1.setShopName(shopname);
						 
							
						    ProductDetailsDao pdd1 = new ProductDetailsDao();
						    pdd1.productDetail(pdb1);
		        			
		        			
		        			
		        		}
		        	
		           
		        }

		     }		
				
		 }	
	}
	
	
	public Map getAllProduct(String supplierId) {
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List list= dao.getAllProductBySuppliers(supplierId);
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetails bean = new GetProductDetails();
			System.out.println(Arrays.toString(o));
			bean.setProduct(o[0].toString());;
			bean.setInsertDate(o[1].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getProduct(),bean);
			
		}
		return map;
	}


	
	public Map getAllProductByCatAndBySup(String category ) {
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List list= dao.getAllProductBySCategoryAndBySuppliers(category );
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetails bean = new GetProductDetails();
			System.out.println(Arrays.toString(o));
			bean.setProduct(o[0].toString());;
			bean.setInsertDate(o[1].toString());
			bean.setManufacturer(o[2].toString());
			bean.setWeight(Double.parseDouble(o[3].toString()));
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(bean.getProduct(),bean);
			
		}
		return map;
	}

public Map getAllProductByCatForadvance(String category ) {
		int count = 1;
		ProductDetailsDao dao = new ProductDetailsDao();
		List list= dao.getAllProductBySCategoryAndBySuppliers(category );
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetails bean = new GetProductDetails();
			System.out.println(Arrays.toString(o));
			bean.setProduct(o[0].toString());;
			bean.setInsertDate(o[1].toString());
			/*bean.setManufacturer(o[2].toString());
			bean.setWeight(Double.parseDouble(o[3].toString()));
			bean.setUnitName(o[4].toString());*/
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;
	}
	
	

	public Map getProductDetailsForPO(String productId) {
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List list = dao.getProductDetails(productId);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetailPO bean = new GetProductDetailPO();
			
			
			bean.setProductID((BigInteger)o[0]);
			bean.setProductName((String)o[1]);
			bean.setBuyPrice((BigDecimal)o[2]);
			bean.setSalePrice((BigDecimal)o[3]);
			bean.setWeight((BigDecimal)o[4]);
			bean.setMrp((BigDecimal)o[5]);
			/*bean.setFk_unit_id((BigInteger)o[5]);*/
			bean.setQuantity(0l);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getProductID(),bean);
		}
		return map1;
		
	}

	public Map getProductDetailsForGoodsReceiveForTax(String proName, String fk_cat_id, String fk_subCat_id) {
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List list = dao.getProductDetailsForTaxGridInGoodsReceive(proName,fk_cat_id,fk_subCat_id);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetailPO bean = new GetProductDetailPO();
			
			
			bean.setProductID((BigInteger)o[0]);
			bean.setProductName((String)o[1]);
			bean.setBuyPrice((BigDecimal)o[2]);
			bean.setSalePrice((BigDecimal)o[3]);
			bean.setWeight((BigDecimal)o[4]);
			bean.setMrp((BigDecimal)o[5]);
			bean.setTaxPercentage((BigDecimal)o[6]);
			bean.setManufacturer((String)o[7]);
			 //bean.setCatId((String)o[8]);
			 bean.setCatIDforVAt((BigInteger)o[8]);
			 bean.setHsn((String)o[9]);
			 bean.setTaxName((String)o[10]);
			 
			 String tax=bean.getTaxName();
			  System.out.println(tax);
			  BigDecimal taxperc=bean.getTaxPercentage();
			  
			  if(tax.equals("GST0") || tax.equals("GST5") || tax.equals("GST12") || tax.equals("GST18") || tax.equals("GST28")){
				  bean.setGst(taxperc);
				  bean.setIgst(BigDecimal.ZERO);
			  }
			  else{
				  bean.setGst(BigDecimal.ZERO);
				  bean.setIgst(taxperc);
			  }
			  
			
			  
			// System.out.println("Cat id in helper = ="+(String)o[8]);
			/*bean.setFk_unit_id((BigInteger)o[5]);*/
			bean.setQuantity(0l);
			bean.setDcNum(BigDecimal.ZERO);
			BigDecimal	w=bean.getWeight();
			bean.setWeightAftShortMinus(w);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getProductID(),bean);
		}
		return map1;
		
	}
	
public Map getProductDetailsforbill(String productId) {
		
		ProductDetailsDao dao = new ProductDetailsDao();
		List list = dao.getProductDetailsforbill(productId);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetProductDetailPO bean = new GetProductDetailPO();
			
			
			bean.setProductID((BigInteger)o[0]);
			bean.setProductName((String)o[1]);
			bean.setBuyPrice((BigDecimal)o[2]);
			bean.setSalePrice((BigDecimal)o[3]);
			bean.setWeight((BigDecimal)o[4]);
			/*bean.setFk_unit_id((BigInteger)o[5]);*/
			//bean.setBatchNo((BigInteger)o[5]);
			String batchNo = (String)o[5];
			if (batchNo!=null) {
				
				bean.setBatchNo(batchNo);
			}
			else {
				bean.setBatchNo(batchNo);
			}
			java.sql.Date expiryDate = (java.sql.Date)o[6];
			
			
			
			
			if (expiryDate==null) {
				
				bean.setExpireDate("N/A");
			}
			else {
				
				bean.setExpireDate(o[6].toString());
				
			}
			
			bean.setTaxPercentage((BigDecimal)o[7]);
			bean.setQuantity(1l);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getProductID(),bean);
		}
		return map1;
		
	}
public Map getProductDetailsforseedANdPestisidebill(String productId) {
	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsforseedANdPestisidebill(productId);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		System.out.println(Arrays.toString(o));
		GetProductDetailPO bean = new GetProductDetailPO();
		
		String batchNo = (String)o[0];
		
		
			
			bean.setBatchNo(batchNo);
	
		bean.setProductID((BigInteger)o[1]);
		bean.setQuantityForBatchNo((BigDecimal)o[2]);
		//bean.setQuantity(1l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getBatchNo(),bean);
	}
	return map1;
	
}

public Map getProductDetailsByBatchNo(String batchNo1) {
	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsByBatchNo(batchNo1);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		//bean.setBatchNo((BigInteger)o[5]);
		String batchNo = (String)o[5];
		
		if (batchNo!=null) {
			
			bean.setBatchNo(batchNo);
		}
		else {
			bean.setBatchNo(batchNo);
		}
		java.sql.Date expiryDate = (java.sql.Date)o[6];
		
		
		
		
		if (expiryDate==null) {
			
			bean.setExpireDate("N/A");
		}
		else {
			
			bean.setExpireDate(o[6].toString());
			
		}
		bean.setTaxPercentage((BigDecimal)o[7]);
		bean.setQuantity(1l);
		System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getBatchNo(),bean);
	}
	return map1;
	
}
/*	public Map getProductDetailsPO(String itemName) {

		ProductDetailsDao dao = new ProductDetailsDao();
		List list = dao.getProductDetails(itemName);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			PoItemDisplayBean bean = new PoItemDisplayBean();
			
			bean.setItemID((BigInteger)o[0]);
			bean.setColor((String)o[1]);
			bean.setItemName((String)o[2]);
			bean.setBuyPriceForItemNAme((BigDecimal)o[3]);
			bean.setSize((String)o[4]);
			bean.setQuantity(1l);
			bean.setModel((String)o[5]);
			bean.setVatPec((Double)o[6]);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getItemID(),bean);
		}
		return map1;
	}*/




public List getProductDetailForReportAsPerCategory(HttpServletRequest request,
		HttpServletResponse response) {
	
	String cat = request.getParameter("cat");
	System.out.println(cat+"Selected Category");
	
     Map<Long,ProductDetailsForReports> map = new HashMap<Long,ProductDetailsForReports>();
		
     ProductDetailsDao dao = new ProductDetailsDao();
		List<ProductDetailsForReports> productList = dao.getProductDetailForReportAsPerCat(cat);
		
		
		return productList;

	
}

public Map getAllProductByGodown(String fk_godown_id) {
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductByGodown(fk_godown_id );
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setInsertDate(o[1].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(bean.getProduct(),bean);
		
	}
	return map;
}


public Map getProductDetailsGodowm(String productId) {
	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsGodowm(productId);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(1l);
		String batchNo = (String)o[5];
		if (batchNo.equals("")) {
			bean.setBatchNo("0");
		}
		else {
			bean.setBatchNo(batchNo);
		}
		java.sql.Date expiryDate = (java.sql.Date)o[6];
		
		
		
		
		if (expiryDate==null) {
			
			bean.setExpireDate("N/A");
		}
		else {
			
			bean.setExpireDate(o[6].toString());
			
		}
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	
}


public Map getProductDetailsforbillByBarcode(String barcode) {

	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsforbillAsPerBarcode(barcode);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		//bean.setBatchNo((BigInteger)o[5]);
		String batchNo = (String)o[5];
		if (batchNo!=null) {
			
			bean.setBatchNo(batchNo);
		}
		else {
			bean.setBatchNo(batchNo);
		}
		java.sql.Date expiryDate = (java.sql.Date)o[6];
		
		
		
		
		if (expiryDate==null) {
			
			bean.setExpireDate("N/A");
		}
		else {
			
			bean.setExpireDate(o[6].toString());
			
		}
		bean.setQuantity(1l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	

}


public Map getProductDetailsforseedANdPestisidebillAsPerBarcode(String barcode) {

	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsforseedANdPestisidebillAsPerBarcodeNum(barcode);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		System.out.println(Arrays.toString(o));
		GetProductDetailPO bean = new GetProductDetailPO();
		
		String batchNo = (String)o[0];
		
		
			
			bean.setBatchNo(batchNo);
	
		bean.setProductID((BigInteger)o[1]);
		bean.setQuantityForBatchNo((BigDecimal)o[2]);
		//bean.setQuantity(1l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getBatchNo(),bean);
	}
	return map1;
	

}


public Map getProductDetailsForEdit(Long productID2) {


	
 	ProductDetailsDao dao1 = new ProductDetailsDao();
	List catList = dao1.getAllEmployeeDetailsForEdit(productID2);
	
	Map  map =  new HashMap();
	for(int i=0;i<catList.size();i++)
	{
		Object[] o = (Object[])catList.get(i);
	
		GetProductDetails bean = new GetProductDetails();
		bean.setProduct(o[0].toString());
		bean.setManufacturer(o[1].toString());
		bean.setTaxPercentage(Double.parseDouble(o[2].toString()));
		bean.setTaxType(o[3].toString());
		bean.setUnitName("");
		bean.setBuyPrice(Double.parseDouble(o[5].toString()));
		bean.setHsncode(o[10].toString());
		System.out.println("hi this  is HSN No is "+(o[10].toString()));
		/*bean.setMrp(Double.parseDouble(o[5].toString()));
		bean.setSalePrice(Double.parseDouble(o[6].toString()));*/
		/*bean.setCreditSalePrice(Double.parseDouble(o[7].toString()));*/
		bean.setWeight(0d);
		//bean.setHsn(o[9].toString());
		
		map.put(bean.getManufacturer(),bean);
	}
	System.out.println("out of helper return map : "+map);
	return map;

}

//get vender details for poDetails

public Map getvenderDetailsToPODetail(Long supID1)
{
	ProductDetailsDao dao1 = new ProductDetailsDao();
	List supList = dao1.getvenderDetailsToPODetail(supID1);
	
	Map  map =  new HashMap();
	for(int i=0;i<supList.size();i++)
	{
		Object[] o = (Object[])supList.get(i);
	
		GetSupplierDetails bean = new GetSupplierDetails();
		bean.setCity(o[0].toString());
		bean.setTin(o[1].toString());
		bean.setContactNo((BigInteger)o[2]);
		bean.setAddress(o[3].toString());
		bean.setIdNo(o[4].toString());
		
		map.put(bean.getCity(),bean);
	}
	System.out.println("this is vender for Pod Details VK : "+map);
	return map;
}
//get Vendor GST for OutWord

public Map getvenderGSTforOWDetails(String supplierName)
{
	ProductDetailsDao dao1 = new ProductDetailsDao();
	List supList = dao1.getvenderGSTOW(supplierName);
	
	Map  map =  new HashMap();
	for(int i=0;i<supList.size();i++)
	{
		Object[] o = (Object[])supList.get(i);
	
		GetSupplierDetails bean = new GetSupplierDetails();
		bean.setCity(o[0].toString());
		bean.setTin(o[1].toString());
		bean.setContactNo((BigInteger)o[2]);
		bean.setIdNo(o[3].toString());
		map.put(bean.getCity(),bean);
	}
	System.out.println("this is vender for Pod Details VK : "+map);
	return map;
}


public void editProductDetail(HttpServletRequest request,
		HttpServletResponse response) {


	String productName = request.getParameter("productName");
	String rate =request.getParameter("rate");
	String productId = request.getParameter("productId");
	String manufacturingCompany = request.getParameter("manufacturingCompany");
	System.out.println(" hi this is Kishor ==-------============---"+manufacturingCompany);
	String fk_tax_id = request.getParameter("fk_tax_id");
	
	System.out.println("this is a tax id////////////////////"+fk_tax_id);
	
	String taxPercentage = request.getParameter("taxPercentage");
	/*String buyPrice = request.getParameter("buyPrice");
	String mrp = request.getParameter("mrp");
	String salePrice = request.getParameter("salePrice");
	String creditSalePrice = request.getParameter("creditSalePrice");*/
	String existedTax = request.getParameter("existedTax");
	String existedTaxPercentage = request.getParameter("existedTaxPercentage");
	String newHsn = request.getParameter("hsncode");
	System.out.println("hi this is Lishor Newhsn Code Is=====---==-=--- "+newHsn);
	
	HibernateUtility hbu=null;
	Session session = null;
	Transaction transaction = null;
	
	 hbu = HibernateUtility.getInstance();
	session = hbu.getHibernateSession();
	 transaction = session.beginTransaction();

	//long customerId = Long.parseLong(customerId);
	long productID =Long.parseLong(productId);
	ProductDetailsBean det = (ProductDetailsBean) session.get(ProductDetailsBean.class, productID);
	
	
	
	if(rate == null){
		det.setBuyPrice(Double.parseDouble("N/A"));
	}
	else{
		det.setBuyPrice(Double.parseDouble(rate));
	}
	if(productName == null){
		det.setProductName("N/A");
	}
	else{
		det.setProductName(productName);
	}
	
	if(fk_tax_id == null){
		System.out.println("taxid in if");
		det.setFkTaxId(Long.parseLong(existedTax));
	}
	else{
		System.out.println("taxid in "+fk_tax_id);
		det.setFkTaxId(Long.parseLong(fk_tax_id));
	}
	
	if(taxPercentage == null){
		
		det.setTaxPercentage(Double.parseDouble(existedTaxPercentage));
	}
	else{
		det.setTaxPercentage(Double.parseDouble(taxPercentage));
	}
	

	if(manufacturingCompany == null){
		det.setManufacturingCompany("N/A");
	}
	else{
		det.setManufacturingCompany(manufacturingCompany);
	}
	
	if(newHsn == null){
		det.setHsn("N/A");
	}
	else{
		det.setHsn((newHsn));
	}

	
	
    session.merge(det);
	transaction.commit();
	
	System.out.println("Record updated successfully.");

	

}


public Map getAllProductByCatAndBySupForGoodsReceive(String category,
		String supplier) {

	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryAndBySuppliersForGoodsReceive(category , supplier);
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setInsertDate(o[1].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(bean.getProduct(),bean);
		
	}
	return map;

}


public Map getBookedProductDetails(String productId2, String supplier, String category) {
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getAdvanceBookedProductDetailsForGoodsReceive(productId2,category,supplier);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setMrp((BigDecimal)o[5]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(0l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	

}


public Map getBookedProductDetailsWithTax(String productId3, String supplier,
		String category) {

	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getAdvanceBookedProductDetailsForGoodsReceiveWithTax(productId3,category,supplier);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setTaxPercentage((BigDecimal)o[5]);
		bean.setMrp((BigDecimal)o[6]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(0l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	


}


public Map getpreviousDetsil(String productId2) {
	// TODO Auto-generated method stub
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getpreviousDetsil(productId2);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setDate((Date)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setMrp((BigDecimal)o[5]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(0l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
}


public Map getProductDetailsForAdvanceBooking(String proName) {
	
	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getProductDetailsForAdvanceBook(proName);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setMrp((BigDecimal)o[5]);
		bean.setManufacturer(o[6].toString());
		bean.setUnitName(o[7].toString());
		bean.setCatId(o[8].toString());
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(0l);
		System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	

}


public Map getAllProductByCatAndBySupForGoodsReceiveNew(String category,
		String supplier) {
	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryAndBySuppliersForGoodsReceiveNew(category , supplier);
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setInsertDate(o[1].toString());
		bean.setManufacturer(o[2].toString());
		bean.setWeight(Double.parseDouble(o[3].toString()));
		bean.setUnitName(o[4].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;


}


public Map getBookedProductDetailsNew(String proName, String supplier,
		String category, String company, String weight) {
	

	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getAdvanceBookedProductDetailsForGoodsReceiveNew(proName,category,supplier,company,weight);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setMrp((BigDecimal)o[5]);
		bean.setManufacturer((String)o[6]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(Long.parseLong(o[7].toString()));
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	


	
}


public Map getBookedProductDetailsWithTax(String proName, String supplier,
		String category, String company, String weight) {


	ProductDetailsDao dao = new ProductDetailsDao();
	List list = dao.getAdvanceBookedProductDetailsForGoodsReceiveWithTaxNew(proName,category,supplier,company,weight);
	System.out.println(list.size());
	Map  map1 =  new HashMap();
	
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetailPO bean = new GetProductDetailPO();
		
		
		bean.setProductID((BigInteger)o[0]);
		bean.setProductName((String)o[1]);
		bean.setBuyPrice((BigDecimal)o[2]);
		bean.setSalePrice((BigDecimal)o[3]);
		bean.setWeight((BigDecimal)o[4]);
		bean.setTaxPercentage((BigDecimal)o[5]);
		bean.setMrp((BigDecimal)o[6]);
		bean.setManufacturer((String)o[7]);
		/*bean.setFk_unit_id((BigInteger)o[5]);*/
		bean.setQuantity(0l);
		//System.out.println("***************"+o[0]+"\t"+o[5]);
		map1.put(bean.getProductID(),bean);
	}
	return map1;
	



}
public Map getAllProductByCatForFertiBill() {

	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryForFertilizerBill();
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setFkSubCatId(Long.parseLong(o[1].toString()));
		bean.setQuantityDouble(Double.parseDouble(o[2].toString()));
		bean.setFkCatId(Long.parseLong(o[3].toString()));
		bean.setFkPackTypeId(Long.parseLong(o[4].toString()));
		bean.setCatName(o[5].toString());
		bean.setSubCatName(o[6].toString());
		
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}

public Map getCapacity(String containerName) {

	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getCapacity(containerName);
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		Packing_InfoBean bean = new Packing_InfoBean();
		System.out.println(Arrays.toString(o));
		bean.setPacking_Id(Long.parseLong(o[0].toString()));;
		bean.setPacking_Type(((o[1].toString())));
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}


public Map getAllProductByCatForSeedAndPestiBill(String category1) {


	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryForSeedAndPesticideBill(category1);
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setManufacturer(o[1].toString());
		bean.setWeight(Double.parseDouble(o[2].toString()));
		bean.setUnitName(o[3].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;


}

/*public Map getAllProductByCatForSeedAndPestiBill(String category1,
		String category2) {


	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryForSeedAndPesticideBill(category1,category2);
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setManufacturer(o[1].toString());
		bean.setWeight(Double.parseDouble(o[2].toString()));
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;


}*/

public Map getAllBatchNumAndStockForSeedBilling(String proName, String company,
		String weight) {

	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllBatchAndStockForSeedAndPesticideBill(proName,company,weight);
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setBatchNum(o[0].toString());
		bean.setStock(Double.parseDouble(o[1].toString()));
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;



}


public Map getAllProductByCatForStockReport() {
	int count = 1;
	ProductDetailsDao dao = new ProductDetailsDao();
	List list= dao.getAllProductBySCategoryForStockReport();
	
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		GetProductDetails bean = new GetProductDetails();
		System.out.println(Arrays.toString(o));
		bean.setProduct(o[0].toString());;
		bean.setManufacturer(o[1].toString());
/*		bean.setWeight(Double.parseDouble(o[2].toString()));*/
		/*bean.setUnitName(o[3].toString());*/
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;
}

public void deleteProduct(HttpServletRequest request, HttpServletResponse response ) {
	
	String delProName = request.getParameter("delProName");
	   
	ProductDetailsDao dao2 = new ProductDetailsDao();
	dao2.deleteProduct(delProName);
		
	}


public Map getSubCatDetails(String fk_cat_id) {
      
	int count=1;
	System.out.println("IN HELPER");
	/*String fk_cat_id = request.getParameter("fk_cat_id");
	
	System.out.println("=== == ==="+fk_cat_id);
	
	
	SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
	
	scdb.setFk_cat_id(Long.parseLong(fk_cat_id));*/
	
	ProductDetailsDao cdd = new ProductDetailsDao();
	List list=cdd.getAllSubCategory(fk_cat_id);
	
	System.out.println("list ======"+list.size());
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		System.out.println("IN HELPER");
		Object[] o = (Object[])list.get(i);
		SubCategoryDetailsBean bean = new SubCategoryDetailsBean();
		System.out.println(Arrays.toString(o));
		bean.setSubcatId(Long.parseLong(o[0].toString()));
		bean.setSubcategoryName(o[1].toString());
		//bean.setTotalAmount((Double)o[1]);
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}

// for clear the Grid data 
public List getAllProductDetails1(HttpServletRequest request) {
	ProductDetailsDao dow = new ProductDetailsDao();
	List l = dow.getAllItemName(request);
	System.out.println("Product List size in helper" + l.size());
	return l;
}
public List getAllProductDetails2(HttpServletRequest request) {
	ProductDetailsDao dow = new ProductDetailsDao();
	List l = dow.getAllItemName2(request);
	System.out.println("Product List size in helper" + l.size());
	return l;
}
public List getAllProductDetails3(HttpServletRequest request) {
	ProductDetailsDao dow = new ProductDetailsDao();
	List l = dow.getAllItemName3(request);
	System.out.println("Product List size in helper" + l.size());
	return l;
}

}
