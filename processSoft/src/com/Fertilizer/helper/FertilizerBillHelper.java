package com.Fertilizer.helper;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.CustomerBillBean;
import com.Fertilizer.bean.FertiSaleReturn;
import com.Fertilizer.bean.GetCreditCustomerDetails;
import com.Fertilizer.bean.GetProductDetails;
import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.bean.SaleReports;
import com.Fertilizer.bean.StockDetail;
import com.Fertilizer.dao.CustomerDetailsDao;
import com.Fertilizer.dao.FertilizerBillDao;
import com.Fertilizer.dao.PurchaseReturnDao;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.FertilizerBillBean;
import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.hibernate.PackingBean;
import com.Fertilizer.hibernate.SaleReturnBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.utility.HibernateUtility;


public class FertilizerBillHelper {
	double customerBill;
	public void fertilizerBilling(HttpServletRequest request,
			HttpServletResponse response) {
		
		double billNoForPdf;
		
		FertilizerBillDao dao = new FertilizerBillDao();
		
		List bill = dao.getCustomerBill();
		
		for(int i=0;i<bill.size();i++){
		CustomerBillBean sa=(CustomerBillBean)bill.get(i);
		customerBill= sa.getBillNo();
		System.out.println(customerBill);
		
		customerBill=customerBill+1;
		System.out.println(customerBill);
		
		}
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		FertilizerBillBean bean = new FertilizerBillBean();
		
	for(int i =0 ; i<count;i++)
		{
		
		if(customerBill == 0.0){
			bean.setBillNo((double) 1l);
			billNoForPdf = 1l;
		}
		else
		{
			bean.setBillNo(customerBill);
			billNoForPdf = customerBill;
		}
		
		//Out Of Grid Content
		String customerName = request.getParameter("customerName");
		String village = request.getParameter("village");
		String contactNum = request.getParameter("contactNo");
		String saleDate = request.getParameter("saleDate");
		String gstNo = request.getParameter("gstNo");
		//String aadhar = request.getParameter("aadhar");
		/*String transExpense = request.getParameter("transExpense");*/
		String hamaliExpense = request.getParameter("hamaliExpense");
		/*String transExpenseWithoutGST = request.getParameter("transExpenseWithoutGST");*/
		String hamaliExpenseWithourGST = request.getParameter("hamaliExpenseWithourGST");
		String total = request.getParameter("total");
		String grossTotal = request.getParameter("grossTotal");
		String fkCustomerId = request.getParameter("fkCreditCustomerID");
		String customerHiddenName = request.getParameter("creditCustomerHiddenName");
		/*String fk_shop_id = request.getParameter("fk_shop_id");*/
		String discount = request.getParameter("discount");
		String discountAmount = request.getParameter("discountAmount");

		String creditCustomerName = request.getParameter("creditCustomerName");
		String creditCustomerName1 = request.getParameter("creditCustomerName1");
		
		
		String custgstno=request.getParameter("custgstno");
		String inwardchallanno=request.getParameter("inwardchallanno");
		String outwardchallanno=request.getParameter("outwardchallanno");
		String companyname=request.getParameter("companyname");
		System.out.println("==============CNnn"+companyname);
		if(companyname !=null)
		{
			bean.setCompany(companyname);
		}
		else
		{
			bean.setCompany("N/A");
		}
		
		if(custgstno != null){
			bean.setCustgstno(custgstno);
		}
		else{
			bean.setCustgstno("N/A");
		}
		if(inwardchallanno != null){
			bean.setInwardchallanno(inwardchallanno);
		}
		else{
			bean.setInwardchallanno("N/A");
		}
		if(outwardchallanno != null){
			bean.setOutwardchallanno(outwardchallanno);
		}
		else{
			bean.setOutwardchallanno("N/A");
		}
		if(fkCustomerId != null){
			bean.setFkCreditCustomerId(Long.parseLong(fkCustomerId));
		}
		else{
			bean.setFkCreditCustomerId(0l);
		}
		
		if(customerHiddenName != null){
			bean.setCustomerHiddenName(customerHiddenName);
		}
		else{
			bean.setCustomerHiddenName("N/A");
		}
		
		
		if(gstNo != null){
			bean.setGstNo(gstNo);
		}
		else{
			bean.setGstNo("N/A");
		}
		
		if(customerName != null){
			bean.setCustomerName(customerName);
		}
		else{
			bean.setCustomerName("N/A");
		}
		if(village != null){
			bean.setVillage(village);
		}
		else{
			bean.setVillage("N/A");
		}
		if(contactNum != ""){
			bean.setContact(Long.parseLong(contactNum));
		}
		else{
			bean.setContact(0l);
		}
		if(discount !=""){
			bean.setDiscount(Long.parseLong(discount));
		}
		else{
			bean.setDiscount(0l);
		}
		if(discountAmount !=""){
			bean.setDiscountAmount(Double.parseDouble(discountAmount));
		}
		else{
			bean.setDiscountAmount(0.0);
		}

		if(hamaliExpense != ""){
			Double totalExpense=0d;
			totalExpense=(Double.parseDouble(hamaliExpenseWithourGST)) + (Double.parseDouble(hamaliExpense));
			bean.setHamaliExpense(totalExpense);
		}
		else{
			bean.setHamaliExpense(0.0);
		}
		if(total != null){
			bean.setTotal(Double.parseDouble(total));
		}
		else{
			bean.setTotal(0.0);
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//String pDate = request.getParameter("pDate");
		Date saleDateq = null;
		try {
			saleDateq = dateFormat.parse(saleDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bean.setSaleDate(saleDateq);
		
		if(grossTotal != null){
			bean.setGrossTotal(Double.parseDouble(grossTotal));
		}
		else{
			bean.setGrossTotal(0.0);
		}
		
		
		
		
		// Grid Content
		/*String catId = request.getParameter("cat_id"+i);
		String sub_cat_id = request.getParameter("sub_cat_Id");*/
		String length = request.getParameter("length"+i);
		String proName = request.getParameter("itemName"+i);
		String salePrice = request.getParameter("salePrice"+i);
		String totalPerProductInGrid = request.getParameter("total"+i);
		String bundel = request.getParameter("bundel"+i);
		String weight = request.getParameter("weight"+i);
		String cgst=request.getParameter("cgst"+i);
		String sgst=request.getParameter("sgst"+i);
		String igst=request.getParameter("igst"+i);
		
		
	    /* System.out.println("IN HELPER== == =SUBCAT"+sub_cat_id);
	     System.out.println("IN HELPER== == ="+igst);
		if(catId != null){
			bean.setCatId(Long.parseLong(catId));
		}
		else{
			bean.setCatId(0l);
		}*/
/*		if(subCatId != null){
			bean.setSubCatId(Long.parseLong(subCatId));
		}
		else{
			bean.setSubCatId(0l);
		}*/
		if(proName != null){
			bean.setProductName(proName);
		}
		else{
			bean.setProductName("N/A");
		}
		
		if(weight != null){
			bean.setQuantity(Long.parseLong(weight));
		}
		else{
			bean.setQuantity(0l);
		}
		
		if(weight != null){
			bean.setQuantityAfterReturn(Long.parseLong(weight));
		}
		else{
			bean.setQuantityAfterReturn(0l);
		}
		
		if(cgst != null){
			bean.setCgst(Double.parseDouble(cgst));
		}
		else{
			bean.setCgst(0.0d);
		}
		if(sgst != null){
			bean.setSgst(Double.parseDouble(sgst));
		}
		else{
			bean.setSgst(0.0d);
		}
		if(igst != null){
			bean.setiGst(Double.parseDouble(igst));
		}
		else{
			bean.setiGst(0.0d);
		}
		
		if(salePrice != null){
			bean.setSalePrice(Double.parseDouble(salePrice));
		}
		else{
			bean.setSalePrice(0.0);
		}
		
		if(cgst != null){
			
			bean.setCgst(Double.parseDouble(cgst));
		}
		else{
			bean.setCgst(0.0);
		}
		if(sgst != null){
			
			bean.setSgst(Double.parseDouble(sgst));
		}
		else{
			bean.setSgst(0.0);
		}
		
		if(totalPerProductInGrid != null){
			bean.setTotalInGrid(Double.parseDouble(totalPerProductInGrid));
		}
		else{
			bean.setTotalInGrid(0.0);
		}
		if(length != null){
			bean.setLength(Double.parseDouble(length));
		}
		else{
			bean.setLength(0d);
		}
		if(weight != null){
			bean.setWeight(Double.parseDouble(weight));
		}
		else{
			bean.setWeight(0.0);
		}
		
		if(bundel != null){
			bean.setBundel(Double.parseDouble(bundel));
		}
		else{
			bean.setBundel(0d);
		}
		

		
/*		Double GST= Double.parseDouble(request.getParameter("gst"+i));
*/	/*	Double IGST= Double.parseDouble( request.getParameter("igst"+i));*/
		Double taxAmount=0d;
		Double priceWithoutTax=0d;
		
	
			 Double newSale=Double.parseDouble(request.getParameter("salePrice"+i));
			 bean.setProductRateWithoutTax(newSale);
			 bean.setTaxAmount(0.0);
		
	   /*if( IGST != 0){
			System.out.println("In IGST");
			Double taxPerc=Double.parseDouble(igst);
			Double taxAmnt=Double.parseDouble(salePrice);
		    taxAmount=(taxAmnt*(taxPerc/100));
			System.out.println("tax"+taxAmount);
			 Double newSale=Double.parseDouble(request.getParameter("salePrice"+i));
			  priceWithoutTax=newSale - taxAmount ;
			Double taxAmount1=(priceWithoutTax*(taxPerc/100));
			 priceWithoutTax=newSale - taxAmount1 ;
			 bean.setProductRateWithoutTax(priceWithoutTax);
			System.out.println("2tax"+taxAmount1);
			bean.setTaxAmount(taxAmount1);
			
		}*/
	
	   
		//payment mode
			String paymentMode = request.getParameter("paymentMode");
			String checkNum = request.getParameter("chequeNum");
			String nameOnCheck = request.getParameter("nameOnCheck");
			String cardNo = request.getParameter("cardNum");
			String accNo = request.getParameter("accNum");
			String bankName = request.getParameter("bankName");
			String initialPayment = request.getParameter("initialPayment");
			System.out.println("initialPayment"+initialPayment);
			
			
			if(initialPayment != "" && initialPayment!=null){
				Double balAfterInitialPay=(Double.parseDouble(grossTotal)-Double.parseDouble(initialPayment));
				bean.setBalAfterinitialPayment(balAfterInitialPay);
			}
			else{
				bean.setBalAfterinitialPayment(Double.parseDouble(grossTotal));
			}
			
			if(initialPayment != ""&& initialPayment!=null) {
				bean.setInitialPayment(Double.parseDouble(initialPayment));
			}
			else{
				bean.setInitialPayment(0.0);
			}

			if(customerHiddenName == null){
			System.out.println("paymentMode is "+paymentMode);
			if(paymentMode==null){
					bean.setPaymentMode("N/A");
				}
				else{
					bean.setPaymentMode(paymentMode);
				}
					 
			if(paymentMode.equals("cheque")){
				if(checkNum != null){
					bean.setCheckNo(Long.parseLong(checkNum));
				}
				else{
					bean.setCheckNo(0l);
				}
				if(nameOnCheck != null){
					bean.setNameOnCheck(nameOnCheck);
				}
				else{
					bean.setNameOnCheck("N/A");
				}
					
				}
				
			else if(paymentMode.equals("card")){
				if(cardNo != null){
					bean.setCardNo(Long.parseLong(cardNo));
				}
				else{
					bean.setCardNo(0l);
				}
				}
				
				else if(paymentMode.equals("neft")){
					
					if(accNo != null){
						bean.setAccNo(accNo);
					}
					else{
						bean.setAccNo("N/A");
					}
					if(bankName != null){
						bean.setBankName(bankName);
					}
					else{
						bean.setBankName("N/A");
					}
				}
			}	
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
	
		bean.setInsertDate(dateobj);
		dao.addFertilizerBillingInDAO(bean);
/*		
		// update (minus stock from good receive)
		HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session = hbu.getHibernateSession();
		 Transaction transaction = session.beginTransaction();
		try
		{
		String pkGoodsReceiveId = request.getParameter("PkGoodreceiveId"+i);
		System.out.println(pkGoodsReceiveId+"pkGoodsReceiveId in helper");
		 Query query = session.createSQLQuery("select quantity , dupQuantity from goods_receive where pk_goods_receive_id ="+pkGoodsReceiveId);
		// query.setParameter("pkGoodsReceiveId", pkGoodsReceiveId);
		 
		 List<Object[]> list = query.list();
		 
		  for (Object[] object : list) {
			  System.out.println(Arrays.toString(object));  
			  Double orgQuantity = Double.parseDouble(object[0].toString());
			  Double dupquantity = Double.parseDouble(object[1].toString());
			  System.out.println("orgQuantity " +orgQuantity);
			  System.out.println("dupquantity " +dupquantity);
		 
		    Double updatequantity = (double)(dupquantity -  Double.parseDouble(quantity));
			System.out.println("after minus qunt : "+ quantity);
	        GoodsReceiveBean updateStock = (GoodsReceiveBean) session.get(GoodsReceiveBean.class, new Long(pkGoodsReceiveId));
	       
	        updateStock.setDupQuantity(updatequantity);
	 
	        session.saveOrUpdate(updateStock);
	        transaction.commit();
		  }
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
		*/
		//code for set billno and name in application context for BIll PDF
		
		
				HttpSession billNoSession = request.getSession();
				billNoSession.setAttribute("fertilizerBillNo",billNoForPdf);
				billNoSession.setAttribute("creditCustomerName1",creditCustomerName1);
				
				System.out.println("---------Bill No for pdf in session::"+ billNoForPdf + "----------------");
		
		
		//stock minus from stock detail table
			HibernateUtility hbu1=null;
			Session session1=null;
			Transaction transaction1 = null;
			
			try
			{
			 Long PkStockId;
			 Double quantity1;
			 hbu1 = HibernateUtility.getInstance();
			 session1 = hbu1.getHibernateSession();
			 transaction1 = session1.beginTransaction();
			
  		 Query query1 = session1.createSQLQuery("select pk_pack_id , container from packing where product_Name='"+proName+"'");
/*  		 query1.setParameter("product_name", proName);
  		 query1.setParameter("company_Name", company);
  		 query1.setParameter("weight", weight);
  		query1.setParameter("catId", catId);
  		query1.setParameter("subCatId", subCatId);*/
  		
  	
  		
  		 List<Object[]> list1 = query1.list();
			 
			  for (Object[] object : list1) {
			  System.out.println(Arrays.toString(object));  
			  PkStockId = Long.parseLong(object[0].toString());
			  quantity1 = Double.parseDouble(object[1].toString());
			  System.out.println("PkStockId " +PkStockId);
			 // System.out.println("quantity " +quantity);
			  
			  Double updatequnty = (double) (quantity1 - Double.parseDouble(weight));
			  String qnt= updatequnty.toString();
			  System.out.println("updatequnty " +updatequnty);
    		
			  PackingBean Stock = (PackingBean) session1.load(PackingBean.class, new Long(PkStockId));
   	     
   	     Stock.setContainer(qnt);
   		 
   		 session1.saveOrUpdate(Stock);
   	     transaction1.commit();
   	    System.out.println("Success ");	 
		   }
				
		}
			catch(RuntimeException e){
				try{
					transaction1.rollback();
				}catch(RuntimeException rbe)
				{
					Log.error("Couldn't roll back tranaction",rbe);
				}	
			}finally{
				hbu1.closeSession(session1);
			}
		
		
		}
	}	

	
	public List getSaleDetailsBYDate(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fisDate");
         String tDate = request.getParameter("endDate");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getSaleDetailsDateWise(fDate,tDate);
 		
 		
 		return saleList;
	}
	
	public List getSaleDetailsBYSingalDate(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fDate");
       System.out.println(fDate+"vxvdfvdf");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getSaleDetailsBySingalDateWise(fDate);
 		
 		
 		return saleList;
	}

	

	

public void billGeneration(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("billNo");
		System.out.println("----------------Bill No before session create::"+billNo);
		HttpSession session3 = request.getSession();
		Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("BillNoForCopy", billNo2);
		System.out.println("----------------Bill No before session create::"+session3.getAttribute("BillNoForCopy"));

	}


public void CreditCustmerBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("creditCustbillNo");
		System.out.println("----------------Credit cust Bill No before session create::"+billNo);
		HttpSession session3 = request.getSession();
		Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("CrditCustBillNo", billNo2);
		System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("BillNoForCopy"));

	}
	
	
	public List getCreditAmountByCreditCust(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fisDate");
         String tDate = request.getParameter("endDate");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getAmountByCreditCustPayment(fDate,tDate);
 		
 		
 		return saleList;
	}
	
	public List getAllCreditAmtFromBilling(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fisDate");
         String tDate = request.getParameter("endDate");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getAmountByCustBilling(fDate,tDate);
 		
 		
 		return saleList;
	}

	
	public List getPaidAmountToSupplier(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fisDate");
         String tDate = request.getParameter("endDate");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getPaidAmountToSupplier(fDate,tDate);
 		
 		
 		return saleList;
	}
	
	
	public List getPaidAmountToEmployee(HttpServletRequest request, HttpServletResponse response) 
	{
		 String fDate = request.getParameter("fisDate");
         String tDate = request.getParameter("endDate");
		
         Map<Long,SaleReports> map = new HashMap<Long,SaleReports>();
 		
         FertilizerBillDao dao = new FertilizerBillDao();
 		List<SaleReports> saleList = dao.getPaidAmountToEmployee(fDate,tDate);
 		
 		
 		return saleList;
	}


	public void fertilizerBilling_28_5_17(HttpServletRequest request,
			HttpServletResponse response) {

		
		FertilizerBillDao dao = new FertilizerBillDao();
		
		List bill = dao.getCustomerBill();
		
		for(int i=0;i<bill.size();i++){
		CustomerBillBean sa=(CustomerBillBean)bill.get(i);
		customerBill= sa.getBillNo();
		System.out.println(customerBill);
		
		customerBill=customerBill+1;
		System.out.println(customerBill);
		
		}
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		
		FertilizerBillBean bean = new FertilizerBillBean();
		
	for(int i =0 ; i<count;i++)
		{
		
		if(customerBill == 0.0){
			bean.setBillNo((double) 1l);
		}
		else
		{
			bean.setBillNo(customerBill);	
		}
		
		//Out Of Grid Content
		String customerName = request.getParameter("customerName");
		String village = request.getParameter("village");
		String contactNum = request.getParameter("contactNo");
		String aadhar = request.getParameter("aadhar");
		String transExpense = request.getParameter("transExpense");
		String hamaliExpense = request.getParameter("hamaliExpense");
		String total = request.getParameter("total");
		String grossTotal = request.getParameter("grossTotal");
		String fkCustomerId = request.getParameter("fkCreditCustomerID");
		String customerHiddenName = request.getParameter("creditCustomerHiddenName");
		
		
		if(fkCustomerId != null){
			bean.setFkCreditCustomerId(Long.parseLong(fkCustomerId));
		}
		else{
			bean.setFkCreditCustomerId(0l);
		}
		
		if(customerHiddenName != null){
			bean.setCustomerHiddenName(customerHiddenName);
		}
		else{
			bean.setCustomerHiddenName("N/A");
		}
		
		if(customerName != null){
			bean.setCustomerName(customerName);
		}
		else{
			bean.setCustomerName("N/A");
		}
		if(village != null){
			bean.setVillage(village);
		}
		else{
			bean.setVillage("N/A");
		}
		if(contactNum != null){
			bean.setContact(Long.parseLong(contactNum));
		}
		else{
			bean.setContact(0l);
		}
		if(aadhar != null){
			bean.setAadhar(Long.parseLong(aadhar));
		}
		else{
			bean.setAadhar(0l);
		}
		if(transExpense != null){
			bean.setTransExpense(Double.parseDouble(transExpense));
		}
		else{
			bean.setTransExpense(0.0);
		}
		if(hamaliExpense != null){
			bean.setHamaliExpense(Double.parseDouble(hamaliExpense));
		}
		else{
			bean.setHamaliExpense(0.0);
		}
		if(total != null){
			bean.setTotal(Double.parseDouble(total));
		}
		else{
			bean.setTotal(0.0);
		}
		if(grossTotal != null){
			bean.setGrossTotal(Double.parseDouble(grossTotal));
		}
		else{
			bean.setGrossTotal(0.0);
		}
		
		
		// Grid Content
		String catId = request.getParameter("cat_id"+i);
		String subCatId = request.getParameter("sub_cat_id"+i);
		String proName = request.getParameter("itemName"+i);
		String quantity = request.getParameter("quantity"+i);
		String mrp = request.getParameter("mrp"+i);
		String salePrice = request.getParameter("salePrice"+i);
		String totalPerProductInGrid = request.getParameter("total"+i);
		String taxPercentage = request.getParameter("vatPercentage"+i);
		String company = request.getParameter("companyName"+i);
		String weight = request.getParameter("weight"+i);
		
		if(proName != null){
			bean.setProductName(proName);
		}
		else{
			bean.setProductName("N/A");
		}
	
		if(quantity != null){
			bean.setQuantity(Long.parseLong(quantity));
		}
		else{
			bean.setQuantity(0l);
		}
		if(mrp != null){
			bean.setMrp(Double.parseDouble(mrp));
		}
		else{
			bean.setMrp(0.0);
		}
		if(salePrice != null){
			bean.setSalePrice(Double.parseDouble(salePrice));
		}
		else{
			bean.setSalePrice(0.0);
		}
		if(totalPerProductInGrid != null){
			bean.setTotalInGrid(Double.parseDouble(totalPerProductInGrid));
		}
		else{
			bean.setTotalInGrid(0.0);
		}
		if(taxPercentage != null){
			bean.setTaxPercentage(Double.parseDouble(taxPercentage));
		}
		else{
			bean.setTaxPercentage(0.0);
		}
		if(company != null){
			bean.setCompany(company);
		}
		else{
			bean.setCompany("N/A");
		}
		if(weight != null){
			bean.setWeight(Double.parseDouble(weight));
		}
		else{
			bean.setWeight(0.0);
		}
		
		
		//payment mode
			String paymentMode = request.getParameter("paymentMode");
			String checkNum = request.getParameter("chequeNum");
			String nameOnCheck = request.getParameter("nameOnCheck");
			String cardNo = request.getParameter("cardNum");
			String accNo = request.getParameter("accNum");
			String bankName = request.getParameter("bankName");
			
			if(customerHiddenName == null){
			System.out.println("paymentMode is "+paymentMode);
			if(paymentMode==null){
					bean.setPaymentMode("N/A");
				}
				else{
					bean.setPaymentMode(paymentMode);
				}
					 
			if(paymentMode.equals("cheque")){
				if(checkNum != null){
					bean.setCheckNo(Long.parseLong(checkNum));
				}
				else{
					bean.setCheckNo(0l);
				}
				if(nameOnCheck != null){
					bean.setNameOnCheck(nameOnCheck);
				}
				else{
					bean.setNameOnCheck("N/A");
				}
					
				}
				
			else if(paymentMode.equals("card")){
				if(cardNo != null){
					bean.setCardNo(Long.parseLong(cardNo));
				}
				else{
					bean.setCardNo(0l);
				}
				}
				
				else if(paymentMode.equals("neft")){
					
					if(accNo != null){
						bean.setAccNo(accNo);
					}
					else{
						bean.setAccNo("N/A");
					}
					if(bankName != null){
						bean.setBankName(bankName);
					}
					else{
						bean.setBankName("N/A");
					}
				}
			}	
		
		
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
	
		bean.setInsertDate(dateobj);
		
		
		dao.addFertilizerBillingInDAO(bean);
		
/*		// update (minus stock from good receive)
		HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session = hbu.getHibernateSession();
		 Transaction transaction = session.beginTransaction();
		try
		{
		String pkGoodsReceiveId = request.getParameter("PkGoodreceiveId"+i);
		System.out.println(pkGoodsReceiveId+"pkGoodsReceiveId in helper");
		 Query query = session.createSQLQuery("select quantity , dupQuantity from goods_receive where pk_goods_receive_id ="+pkGoodsReceiveId);
		// query.setParameter("pkGoodsReceiveId", pkGoodsReceiveId);
		 
		 List<Object[]> list = query.list();
		 
		  for (Object[] object : list) {
			  System.out.println(Arrays.toString(object));  
			  Double orgQuantity = Double.parseDouble(object[0].toString());
			  Double dupquantity = Double.parseDouble(object[1].toString());
			  System.out.println("orgQuantity " +orgQuantity);
			  System.out.println("dupquantity " +dupquantity);
		 
		    Double updatequantity = (double)(dupquantity -  Double.parseDouble(quantity));
			System.out.println("after minus qunt : "+ quantity);
	        GoodsReceiveBean updateStock = (GoodsReceiveBean) session.get(GoodsReceiveBean.class, new Long(pkGoodsReceiveId));
	       
	        updateStock.setDupQuantity(updatequantity);
	 
	        session.saveOrUpdate(updateStock);
	        transaction.commit();
		  }
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
			}*/
		
		  
		
		
		//stock minus from stock detail table
			HibernateUtility hbu1=null;
			Session session1=null;
			Transaction transaction1 = null;
			
			try
			{
			 Long PkStockId;
			 Double quantity1;
			 hbu1 = HibernateUtility.getInstance();
			 session1 = hbu1.getHibernateSession();
			 transaction1 = session1.beginTransaction();
			
  		 Query query1 = session1.createSQLQuery("select pk_pack_id , container from packing where product_Name='"+proName+"'And fk_SubCat_Id ='"+subCatId+"' AND fk_Cat_Id='"+catId+"'");
  		 query1.setParameter("product_name", proName);
  		 query1.setParameter("company_Name", company);
  		 query1.setParameter("weight", weight);
  		 
  		 List<Object[]> list1 = query1.list();
			 
			  for (Object[] object : list1) {
			  System.out.println(Arrays.toString(object));  
			  PkStockId = Long.parseLong(object[0].toString());
			  quantity1 = Double.parseDouble(object[1].toString());
			  System.out.println("PkStockId " +PkStockId);
			  System.out.println("quantity " +quantity);
			  
			  Double updatequnty = (double) (quantity1 - Double.parseDouble(quantity));
			  System.out.println("updatequnty " +updatequnty);
    		
   	     Stock Stock = (Stock) session1.load(Stock.class, new Long(PkStockId));
   	     
   	     Stock.setQuantityinkg(updatequnty);
   		 
   		 session1.saveOrUpdate(Stock);
   	     transaction1.commit();
   	    System.out.println("Success ");	 
		   }
				
		}
			catch(RuntimeException e){
				try{
					transaction1.rollback();
				}catch(RuntimeException rbe)
				{
					Log.error("Couldn't roll back tranaction",rbe);
				}	
			}finally{
				hbu1.closeSession(session1);
			}
		
		
		}
		
	
		
	}
	
	public void normalCustFerilizerBillCopy(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("billNo");
		System.out.println("----------------Bill No before session create::"+billNo);
		HttpSession session3 = request.getSession();
		Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("NormalCustFertilizerBillNo", billNo2);
		System.out.println("----------------Bill No before session create::"+session3.getAttribute("NormalCustFertilizerBillNo"));
	
	}
	

public void fertilizerCreditCustmerBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("creditCustbillNo");
		System.out.println("----------------Credit cust Bill No before session create::"+billNo);
		HttpSession session3 = request.getSession();
		Long billNo2 = Long.parseLong(billNo);
		session3.setAttribute("FertilizerCrditCustBillNo", billNo2);
		System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("FertilizerCrditCustBillNo"));

	}


public List getTaxDetailsAsPerCategoryFromSaleBetTwoDate(
		HttpServletRequest request, HttpServletResponse response) {

	
	String cat = request.getParameter("cat");
	String fDate = request.getParameter("fDate");
	String sDate = request.getParameter("sDate");
	System.out.println(cat+"Category in Helper");
	System.out.println(fDate+"fDate in Helper");
	System.out.println(sDate+"sDate in Helper");
	
     Map<Long,GetProductDetails> map = new HashMap<Long,GetProductDetails>();
		
     FertilizerBillDao dao = new FertilizerBillDao();
		List<GetProductDetails> expList = dao.getPurchaseDetailsForCategoryBetTwoDate(cat,fDate,sDate);
		
		
		return expList;

}


public Map getAllFertiIetmByBillNo(String bill_no) {
	// TODO Auto-generated method stub
	    FertilizerBillDao dao = new FertilizerBillDao();
		List list = dao.getAllFertiIetmByBillNo(bill_no);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			FertiSaleReturn bean = new FertiSaleReturn();
			
			
			bean.setPkfertilizerBillId((BigInteger)o[0]);
			bean.setFkGoodsReceive((BigInteger)o[1]);
			bean.setCatId((BigInteger)o[2]);
			bean.setCustomerName(o[3].toString());
			bean.setProductName(o[4].toString());
			bean.setCompany(o[5].toString());
			bean.setWeight(Double.parseDouble(o[6].toString()));
			bean.setSalePrice(Double.parseDouble(o[7].toString()));
			bean.setMrp(0d);
			//bean.setQuantity(0l);
			bean.setAvailbleQuantity((BigInteger)o[9]);
			bean.setTotalInGrid(Double.parseDouble(o[10].toString()));
			//bean.setBarcode((BigInteger)o[11]);
			bean.setAadhar(0l);
			bean.setInsertDate(o[13].toString());
			bean.setCustomerHiddenName(o[14].toString());
			bean.setTaxPercentage(Double.parseDouble(o[15].toString()));
			/*bean.setFk_unit_id((BigInteger)o[5]);*/
			//bean.setQuantity(0l);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getPkfertilizerBillId(),bean);
		}
		return map1;
}



public Map getAllFertiIetmByBillNoSale(String bill_no) {
	// TODO Auto-generated method stub
	    FertilizerBillDao dao = new FertilizerBillDao();
		List list = dao.getAllFertiIetmByBillNoSale(bill_no);
		System.out.println(list.size());
		Map  map1 =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			CustomerBillBean1 bean = new CustomerBillBean1();
			
			
			bean.setPk_customer_id(Long.parseLong(o[0].toString()));
			bean.setCustname(o[1].toString());
			bean.setSaleDate(o[2].toString());
			bean.setProductName(o[3].toString());
			bean.setOperation(o[4].toString());
			bean.setOkquantity(Double.parseDouble(o[5].toString()));
			bean.setReturnQuantity(0d);
			bean.setBuyPrice(Double.parseDouble(o[6].toString()));
			bean.setTotal(Double.parseDouble(o[7].toString()));
			bean.setGrossTotal1(Double.parseDouble(o[8].toString()));
			//bean.setQuantity(0l);
			bean.setDiscount1(Double.parseDouble(o[9].toString()));
			bean.setGst(Long.parseLong(o[10].toString()));
			bean.setIgst(Long.parseLong(o[11].toString()));
			//bean.setBarcode((BigInteger)o[11]);
			bean.setBillNo(o[12].toString());
			bean.setGridTotal(Double.parseDouble(o[13].toString()));
			bean.setCreditcustomer(o[14].toString());
			bean.setTaxamount(Long.parseLong(o[15].toString()));
			
			/*bean.setFk_unit_id((BigInteger)o[5]);*/
			//bean.setQuantity(0l);
			//System.out.println("***************"+o[0]+"\t"+o[5]);
			map1.put(bean.getPk_customer_id(),bean);
		}
		return map1;
}

public void saleReturnAsPerBillNo(HttpServletRequest request,
		HttpServletResponse response) {
	
	// TODO Auto-generated method stub
	Integer count = Integer.parseInt(request.getParameter("count"));
	for(int i =0 ; i <count;i++)
	{
		String bill_no = request.getParameter("bill_no");
		String pkfertilizerBillId = request.getParameter("pkfertilizerBillId"+i);
		String availbleQuantity = request.getParameter("availbleQuantity"+i);
		String productName = request.getParameter("productName"+i);
		String company = request.getParameter("company"+i);
		String weight = request.getParameter("weight"+i);
		String quantity = request.getParameter("quantity1"+i);
		String salePrice = request.getParameter("salePrice"+i);
		String mrp = request.getParameter("mrp"+i);
		String taxPercentage = request.getParameter("taxPercentage"+i);
		String aadhar = request.getParameter("aadhar"+i);
		String customerName = request.getParameter("customerName"+i);
		String saleDate = request.getParameter("insertDate"+i);
		System.out.println("currnt qunt : "+ availbleQuantity);
		System.out.println("return qunt : "+ quantity);
		System.out.println("pkfertilizerBillId  : "+ pkfertilizerBillId);
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		try{
			Double grossTotal=0.0;
			Double stockQuantity =0.0;
			String QuantityFromStock=null;
			 Double newStockQuantity = 0.0;
			 Long pkStockId = 0l;
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 List<Object[]> list  = null;
			 List<Object[]> list2  = null;
			List<StockDetail> stockList = null;
			List<FertilizerBillBean> fertiList = null;
			Long remainingQuantity  = (Long)(Long.parseLong(availbleQuantity) -  Long.parseLong(quantity));
			System.out.println("remaining qunt : "+ remainingQuantity);
			FertilizerBillBean updateStock = (FertilizerBillBean) session.get(FertilizerBillBean.class, new Long(pkfertilizerBillId));
		    updateStock.setReturnQuantity(Long.parseLong(quantity));    
			updateStock.setQuantityAfterReturn(remainingQuantity);
		        
		     
		        //update stock
		        Query query = session.createSQLQuery("select Quantity,PkStockId FROM stock_detail WHERE ProductName='"+productName+"' AND CompanyName='"+company+"' and Weight ="+weight);
		      
		        list = query.list();
		        stockList = new ArrayList<StockDetail>();
				 for (Object[] objects : list) {
					 QuantityFromStock = objects[0].toString();
					 stockQuantity = Double.parseDouble(QuantityFromStock);
					 
					 String pkstock = objects[1].toString();
					 pkStockId = Long.parseLong(pkstock);
				 }
				
				 Double q = Double.parseDouble(quantity);
		         newStockQuantity = stockQuantity + q ;
		        Query query1 = session.createSQLQuery("UPDATE stock_detail SET Quantity ="+newStockQuantity+" WHERE PkStockId="+pkStockId);
		        query1.executeUpdate();
		       
			//Update fertilizer bill table
		    //fetch gross total as per bill number(fkFertilizerBillId)
		      
		        Query query2 = session.createSQLQuery("SELECT gross_total,bill_no FROM fertilizer_billing WHERE pk_fertilizer_bill_id="+pkfertilizerBillId);
		        list2 = query2.list();
		        fertiList = new ArrayList<FertilizerBillBean>();
		        for (Object[] objects : list2) {
					 grossTotal = Double.parseDouble(objects[0].toString());
					
				 }
		        
		        Double salePriceFromGrid = Double.parseDouble(salePrice);
		        Double tax = Double.parseDouble(taxPercentage);
		        Double taxAmount = (tax/100)*salePriceFromGrid;
		        Double newSalePrice = salePriceFromGrid + taxAmount;
		        Double total = Double.parseDouble(quantity) * newSalePrice;
		        Double newGrossTotal = grossTotal - total;
		        System.out.println("grossTotal = = ="+grossTotal);
		        System.out.println("taxAmount = = ="+taxAmount);
		        System.out.println("newSalePrice = = ="+newSalePrice);
		        System.out.println("newGrossTotal = = ="+newGrossTotal);
		        updateStock.setTotalAfterSaleReturn(newGrossTotal);
		        updateStock.setReturnAmount(total);
		        session.saveOrUpdate(updateStock);
		        //add Sale Return to sale_return table
		        SaleReturnBean bean = new SaleReturnBean();
		        bean.setBillNo(Long.parseLong(bill_no));
		        bean.setAadhar(Long.parseLong(aadhar));
		        bean.setCustomerName(customerName);
		        bean.setFkFertilizerBillId(Long.parseLong(pkfertilizerBillId));
		        bean.setProductName(productName);
		        bean.setFkCatId(1l);
		        bean.setSalePrice(Double.parseDouble(salePrice));
		        bean.setMrp(Double.parseDouble(mrp));
		        bean.setTaxPercentage(Double.parseDouble(taxPercentage));
		        bean.setAvailableQuantity(Double.parseDouble(availbleQuantity));
		        bean.setReturnQuantity(Double.parseDouble(quantity));
		        bean.setWeight(Double.parseDouble(weight));
		        bean.setCompany(company);
		        bean.setReturnAmount(total);
		        bean.setSaleDate(saleDate);
		        bean.setFkPesticideBillId(0l);
		        bean.setFkSeedBillId(0l);
		        bean.setBatchNumber("N/A");
		        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				Date dateobj = new Date();
				System.out.println(dateFormat1.format(dateobj));
				bean.setReturnDate(dateobj);
		        
		       session.save(bean);
		        transaction.commit(); 
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
	
	
}




public void saleReturnAsPerBillNo_new(HttpServletRequest request, HttpServletResponse response) {
	
	// TODO Auto-generated method stub
	Integer count = Integer.parseInt(request.getParameter("count"));
	for(int i =0 ; i <count;i++)
	{
		String bill_no = request.getParameter("bill_no");
		String pkfertilizerBillId = request.getParameter("pk_customer_id"+i);
		System.out.println("pkfertilizerBillId"+pkfertilizerBillId);
		String availbleQuantity = request.getParameter("okquantity"+i);
		System.out.println("availbleQuantity"+availbleQuantity);
		String productName = request.getParameter("productName"+i);
		System.out.println("productName"+productName);
		String company = request.getParameter("operation"+i);
		System.out.println("company"+company);
		String weight = request.getParameter("weight"+i);
		String quantity = request.getParameter("returnQuantity"+i);
		System.out.println("quantity"+quantity);
		String salePrice = request.getParameter("buyPrice"+i);
		System.out.println("salePrice"+salePrice);
		String mrp = request.getParameter("mrp"+i);
		String taxPercentage = request.getParameter("gst"+i);
		System.out.println("taxPercentage"+taxPercentage);
		String aadhar = request.getParameter("aadhar"+i);
		String customerName = request.getParameter("creditcustomer"+i);
		System.out.println("customerName"+customerName);
		String saleDate = request.getParameter("saleDate"+i);
		System.out.println("saleDate"+saleDate);
		System.out.println("currnt qunt : "+ availbleQuantity);
		System.out.println("return qunt : "+ quantity);
		System.out.println("pkfertilizerBillId  : "+ pkfertilizerBillId);
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		try{
			Double grossTotal=0.0;
			Double stockQuantity =0.0;
			String QuantityFromStock=null;
			 Double newStockQuantity = 0.0;
			 Long pkStockId = 0l;
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
				
			List<Object[]> list  = null;
			 List<Object[]> list2  = null;
			List<StockDetail> stockList = null;
			List<CustomerBillBean1> fertiList = null;
			Long remainingQuantity  = (Long)(Long.parseLong(availbleQuantity) -  Long.parseLong(quantity));
			System.out.println("remaining qunt : "+ remainingQuantity);
			CustomerBillBean1 updateStock = (CustomerBillBean1) session.get(CustomerBillBean1.class, new Long(pkfertilizerBillId));
		    updateStock.setReturnQuantity(Double.parseDouble(quantity));    
			updateStock.setQuantityAfterReturn(remainingQuantity);
		        
		     
		        //update stock
		        Query query = session.createSQLQuery("select Quantity,PkStockId FROM stock_detail WHERE ProductName='"+productName+"' AND CompanyName='"+company+"'");
		      
		        list = query.list();
		        stockList = new ArrayList<StockDetail>();
				 for (Object[] objects : list) {
					 QuantityFromStock = objects[0].toString();
					 stockQuantity = Double.parseDouble(QuantityFromStock);
					 
					 String pkstock = objects[1].toString();
					 pkStockId = Long.parseLong(pkstock);
				 }
				
				 Double q = Double.parseDouble(quantity);
		         newStockQuantity = stockQuantity + q ;
		        Query query1 = session.createSQLQuery("UPDATE stock_detail SET Quantity ="+newStockQuantity+" WHERE PkStockId="+pkStockId);
		        query1.executeUpdate();
		       
			//Update fertilizer bill table
		    //fetch gross total as per bill number(fkFertilizerBillId)
		      
		        Query query2 = session.createSQLQuery("SELECT gross_Total,bill_no FROM bill_details WHERE pk_customer_id="+pkfertilizerBillId);
		        list2 = query2.list();
		        fertiList = new ArrayList<CustomerBillBean1>();
		        for (Object[] objects : list2) {
					 grossTotal = Double.parseDouble(objects[0].toString());
					
				 }
		        
		        Double salePriceFromGrid = Double.parseDouble(salePrice);
		        Double tax = Double.parseDouble(taxPercentage);
		        Double taxAmount = (tax/100)*salePriceFromGrid;
		        Double newSalePrice = salePriceFromGrid + taxAmount;
		        Double total = Double.parseDouble(quantity) * newSalePrice;
		        Double newGrossTotal = grossTotal - total;
		        System.out.println("grossTotal = = ="+grossTotal);
		        System.out.println("taxAmount = = ="+taxAmount);
		        System.out.println("newSalePrice = = ="+newSalePrice);
		        System.out.println("newGrossTotal = = ="+newGrossTotal);
		        updateStock.setTotalAfterSaleReturn(newGrossTotal);
		        updateStock.setReturnAmount(total);
		        session.saveOrUpdate(updateStock);
				 
		        //add Sale Return to sale_return table
		        SaleReturnBean bean = new SaleReturnBean();
		        bean.setBillNo(Long.parseLong(bill_no));
		       // bean.setAadhar(Long.parseLong(aadhar));
		        bean.setCustomerName(customerName);
		        bean.setFkFertilizerBillId(Long.parseLong(pkfertilizerBillId));
		        bean.setProductName(productName);
		        bean.setFkCatId(1l);
		        bean.setSalePrice(Double.parseDouble(salePrice));
		       // bean.setMrp(Double.parseDouble(mrp));
		        bean.setTaxPercentage(Double.parseDouble(taxPercentage));
		        bean.setAvailableQuantity(Double.parseDouble(availbleQuantity));
		        bean.setReturnQuantity(Double.parseDouble(quantity));
		       // bean.setWeight(Double.parseDouble(weight));
		        bean.setCompany(company);
		       // bean.setReturnAmount(total);
		        bean.setSaleDate(saleDate);
		        bean.setFkPesticideBillId(0l);
		        bean.setFkSeedBillId(0l);
		        bean.setBatchNumber("N/A");
		        SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				Date dateobj = new Date();
				System.out.println(dateFormat1.format(dateobj));
				//bean.setReturnDate(dateobj);
		        
		       session.save(bean);
		        transaction.commit(); 
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
}


public List saleReturnVendorNameWise(HttpServletRequest request, HttpServletResponse response) {
	System.out.println("in helper");
	String vendorName = request.getParameter("vendorName");
	System.out.println(" Hi this is vendorName === " + vendorName);
	String billNo = request.getParameter("billNo");
	System.out.println(" Hi this is billNo === " + billNo);
	FertilizerBillDao dao = new FertilizerBillDao();
	List<SaleReturnBean> expList = dao.saleReturnVendorNameWise(billNo, vendorName);
	System.out.println("expList = " + expList);
	return expList;
}


private void createSQLQuery(String string) {
	// TODO Auto-generated method stub
	
}


public Map getTotalamt( String supplier) {
	
	FertilizerBillDao dao=new FertilizerBillDao();
	List list= dao.getTotalAmount(supplier);
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		Object[] o = (Object[])list.get(i);
		
		FertilizerBillBean bean=new FertilizerBillBean();
		//GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
		//System.out.println(Arrays.toString(o));
		
		//String total = o[0].toString();
		//Double total1 = Double.valueOf(total);
		String total=o[0].toString();
		//System.out.println(total1);
		bean.setSumoftotal(Double.parseDouble(total));
		//bean.setInsertDate(o[1].toString());
		System.out.println("***************"+o[0]);
		System.out.println("Ih helper method getTotal");
		map.put(bean.getCompany(),bean);
		
	}
	return map;


}


}





