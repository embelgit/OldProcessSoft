package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.ExpenditurePaymentDetail;
import com.Fertilizer.dao.ExpenditurePaymentDao;
import com.Fertilizer.dao.FertilizerBillDao1;
import com.Fertilizer.dao.SupplierPaymentDao;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.SupplierPaymentBean;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.hibernate.VendorPaymentBean;
import com.Fertilizer.utility.HibernateUtility;



public class FertilizerBillHelper1 {
//long customerBill = 101l; 
String customerBill ="";
	public void fertilizerBilling1(HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		
		
		/*start Session code For Shop Name*/		
		HttpSession sessionv = request.getSession(true);
		 String type1= "";
         String name1 = "";
         String shopName = "";
         if (sessionv != null) {

         if (sessionv.getAttribute("user") != null) {
	     name1 = (String) sessionv.getAttribute("user");
	     System.out.println("session name+++++"+name1);
          HibernateUtility hbu1=HibernateUtility.getInstance();
          Session session2=hbu1.getHibernateSession();
          org.hibernate.Query query1 = session2.createQuery("from UserDetailsBean where userName =:usr");
          query1.setParameter("usr", name1);
          UserDetailsBean userDetail1 = (UserDetailsBean) query1.uniqueResult();
          type1 = userDetail1.getUserName();
          System.out.println("type in session "+type1);
          shopName = userDetail1.getShopName();
          System.out.println("Shop Name In Session by Vikas  "+shopName);
         }
		
         }
		

  		/*end Session code For Shop Name*/	
		
			
		System.out.println("In helper");
	//this code for auto  bill no inccerment	
		HttpSession session3 = request.getSession();
		FertilizerBillDao1 data = new FertilizerBillDao1();
		List stkList = data.getCustomerBill();

		for (int i = 0; i < stkList.size(); i++) {

			CustomerBillBean1 st = (CustomerBillBean1) stkList.get(i);
			customerBill = st.getBillNo();
			System.out.println("***************** by vikas  k"+customerBill);
			//customerBill++;
			System.out.println("***************** by vikas k "+customerBill);

		}
		
		session3.setAttribute("customerBill", customerBill); 
		
		
		HttpSession session4 = request.getSession();
		String billNo1 = request.getParameter("billNo");
		
		System.out.println(" hi this is Bill no is by Session is ==--  111"+billNo1);
		//String billNo2 =String.valueOf(billNo1);
		
		//String bill = billNo1.toString();
		
		session4.setAttribute("customerBill", billNo1);
		System.out.println(" hi this is Bill no is by Session is ==--  222"+billNo1);
		
		
	//end auto bill no increment method	
	
		FertilizerBillDao1 dao=new FertilizerBillDao1();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		
		
		CustomerBillBean1 bean=new CustomerBillBean1();
		
		for(int i=0 ; i< count;i++)
		{
			String productName = request.getParameter("productName"+i);
			System.out.println("hhhhhhhhhhhhhhh"+productName);
			String hsn = request.getParameter("hsn"+i);
			System.out.println("hi this is vikas in firtilizer helper   ----"+hsn);
			String okquantity = request.getParameter("okquantity"+i);
			System.out.println("qqqqqqqqqqq"+okquantity);
			String Gst = request.getParameter("Gst"+i);
			System.out.println(" hi this is GST iS ===="+Gst);
			String IGst = request.getParameter("IGst"+i);
			String TaxAmount = request.getParameter("TaxAmount"+i);
			//String outChallanno = request.getParameter("outChallanno"+i);
			String buyPrice = request.getParameter("buyPrice"+i);
			String operation = request.getParameter("operation"+i);
			System.out.println("Hi this is Billing Operation"+operation);
			String description = request.getParameter("description"+i);
			String Total = request.getParameter("Total"+i);
			System.out.println(" hi this is total ++++++++++"+Total);
			
			System.out.println("hi this is kishor the total//////////****-----"+Total);
			String suppliername = request.getParameter("supplierName");
			String billNo = request.getParameter("billNo");
			String creditCustomer = request.getParameter("creditCustomer");
			String fk_supplier_id = request.getParameter("supplier");
			System.out.println("hi this kishor fk_supplier_id 9999999*****************"+fk_supplier_id);
			String custName = request.getParameter("custName");		
			String address = request.getParameter("address");
			String contactNo1 = request.getParameter("contactNo1");
			String gstNo2 = request.getParameter("gstNo2");
			String saleDate2 = request.getParameter("saleDate2");
			//String ShopName = request.getParameter("ShopName");
			//String custgstno = request.getParameter("custgstno");
			String outwardchallanno = request.getParameter("outwardchallanno");
			String paymentMode2 = request.getParameter("paymentMode2");
			String initialPayment = request.getParameter("initialPayment");
			
			
			//String gridTotal = request.getParameter("Total1");
			
			//System.out.println("hi this is kidhor grid  total 000000000*****-123458---+++++"+gridTotal);
			
			double gridTotal = 0.0;
			double asd = Double.parseDouble(okquantity);
		
			double xyz = Double.parseDouble(buyPrice);
			gridTotal = asd * xyz;
			
			String gstForExpense1 = request.getParameter("gstForExpense1");
			String totalWithExpense1 = request.getParameter("totalWithExpense1");
			String discount1 = request.getParameter("discount1");
			String discountAmount1 = request.getParameter("discountAmount1");
			String hamaliExpence3 = request.getParameter("hamaliExpence3");
			String hamaliExpence1 = request.getParameter("hamaliExpence1");
			String grossTotal1 = request.getParameter("grossTotal1");
			System.out.println(" hit his os gross total===="+grossTotal1);
			String InwardChallanNo = request.getParameter("inwordchallanNo");
			String vehicle =request.getParameter("vehicle");
			System.out.println("Hi this is vikas print Inword challlan No ;;;;;;;;;;;''''''"+vehicle);
			System.out.println("Hi this is vikas print Inword challlan No ;;;;;;;;;;;''''''"+InwardChallanNo);
			
			
			
			/*Long amount = bean.getInitialPayment();
			double subtotal = Double.parseDouble(initialPayment);
			*/
			
			/*if(gstNo2 != null){
				bean.setGstNo2((gstNo2));
			}
			else{
				bean.setGstNo2(00);
			}*/
			bean.setProductName(productName);
			bean.setHsn(hsn);
			bean.setOkquantity(Double.parseDouble(okquantity));
		    bean.setGst(Long.parseLong(Gst));
		    bean.setIgst(Long.parseLong(IGst));
		    bean.setTaxamount(Long.parseLong(TaxAmount));
			bean.setBuyPrice(Double.parseDouble(buyPrice));
			bean.setOperation(operation);
			bean.setDescription(description);
			bean.setGridTotal(gridTotal);
			bean.setTotal(Double.parseDouble(Total));
			System.out.println("hi this is total=-=-==="+Total);
			bean.setShopName(shopName);
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setSuppliername(suppliername);
			bean.setBillNo1(billNo);
			//bean.setBillNo(billNo);
			
			bean.setBillNo(billNo1);

			Date  date1=null;
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df1.parse(saleDate2);
			
/*			session3.setAttribute("customerBill", customerBill); */
			//bean.setBillNo(customerBill);
			System.out.println(" hi this is kishor =================--------------"+customerBill);
			
			bean.setCreditcustomer(creditCustomer);
		    bean.setCustname(custName);
		    bean.setAddress(address);
		    bean.setVehicle(vehicle);
		    bean.setContactNo1(Long.parseLong(contactNo1));
		    bean.setGstNo2(gstNo2);
			//bean.setSaleDate2(date1);
		    bean.setSaleDate(saleDate2);
			// this field give the problem for bill printing and GST Number only in number
			//bean.setCustgstno(Long.parseLong(gstNo2));
			bean.setOutwardchallanno(outwardchallanno);
			bean.setPaymentMode2(paymentMode2);
			
			bean.setInwardChallanNo(InwardChallanNo);
			
			
			if(initialPayment !="")
			{
				bean.setInitialPayment(Long.parseLong(initialPayment));
			}
			else
			{
				bean.setInitialPayment(0l);
			}
			
			bean.setGstForExpense1(Double.parseDouble(gstForExpense1));
			bean.setTotalWithExpense1(Double.parseDouble(totalWithExpense1));
			
			if(discount1 !="")
			{
				bean.setDiscount1(Double.parseDouble(discount1));
			}
			else
			{
				bean.setDiscount1(0.0);
			}
			
			if(discountAmount1 !="")
			{
				bean.setDiscountAmount1(Double.parseDouble(discountAmount1));
			}
			else
			{
				bean.setDiscountAmount1(0.0);
			}
			
			if(hamaliExpence1 !="")
			{
				bean.setHamaliExpence1(Double.parseDouble(hamaliExpence1));
			}
			else
			{
				bean.setHamaliExpence1(0.0);
			}
			
			if(hamaliExpence3 !="")
			{
				bean.setHamaliExpence3(Double.parseDouble(hamaliExpence3));
			}
			else
			{
				bean.setHamaliExpence3(0.0);
			}
			bean.setGrossTotal1(Double.parseDouble(grossTotal1));
			
			HttpSession session = request.getSession(true);
			String username = (String)session.getAttribute("user");
			String userid = (String)session.getAttribute("userid");
			String shopid = (String)session.getAttribute("shopid");
			String shopname=(String)session.getAttribute("shopname");
			
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			
			dao.valBillDetails(bean);
			
		if(i==0)
		{
			
			VendorPaymentBean bean1 = new VendorPaymentBean();
			
			double pqr1 =Double.parseDouble(initialPayment);
			System.out.println("hi this is kishor Initian 555555-------------*****"+pqr1);

			System.out.println("hi this is kishor Initian 555555-------------*****"+initialPayment);
			bean1.setSupplier((suppliername));
			bean1.setBillNo((billNo1));
			//bean1.setBillNo(billNo);
			System.out.println(" hi this is kishor biradar 123 bill no is ======------"+billNo);
			System.out.println(" hi this is vendor bill no ===========--------------------=========="+customerBill);
			
			bean1.setBillNo1(billNo);
			
			bean1.setPersonname("N/A");
			bean1.setSupplier(creditCustomer);
			bean1.setSupplier1((Long.parseLong(fk_supplier_id)));
			bean1.setPayment(Double.parseDouble(initialPayment));
			bean1.setTdsdetails(initialPayment);
			bean1.setCredit(Double.parseDouble(initialPayment));
			bean1.setDebitAmount(("0"));
			bean1.setTotalAmount(Double.parseDouble("0"));
			System.out.println("hi ths is kishor payment -*************************"+initialPayment);
			bean1.setPaymentMode(paymentMode2);
			bean1.setChequeNum("N/A");
			bean1.setNameOnCheck("N/A");
		    bean1.setCardNum(Long.parseLong("0"));
		    bean1.setAccNum(Long.parseLong("0"));
		    bean1.setPaymentType("credit");
		    bean1.setBankName("N/A");
		    bean1.setInsertDate(date1);
		    bean1.setBalance(Double.parseDouble(grossTotal1));
		    bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    
		    SupplierPaymentDao dao1 = new SupplierPaymentDao();
			dao1.regvendorPayment(bean1);
		}
		    /*Double balance = 0d;
		    if("0".equals(paymentMode2)){
		    	System.out.println("Cash Amt"+paymentMode2);
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(paymentMode2);
		    	bean1.setCredit(Double.parseDouble(paymentMode2));
		    	bean1.setBalance(balance);
		    	System.out.println("Balance Amt"+balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    	
		    }
		    
		    if(!"0".equals(paymentMode2)){
		    	System.out.println("Cash Amt"+paymentMode2);
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(paymentMode2);
		    	bean1.setCredit(Double.parseDouble(paymentMode2));
		    	bean1.setBalance(balance);
		    	System.out.println("Balance Amt"+balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    	
		    }*/
		    
	       /* if(!"0".equals(chequeAmt)){
		    	
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(chequeAmt);
		    	bean1.setCredit(Double.parseDouble(chequeAmt));
		    	bean1.setBalance(balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    }
	        
	        if(!"0".equals(cardAmt)){
		    	
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(cardAmt);
		    	bean1.setCredit(Double.parseDouble(cardAmt));
		    	bean1.setBalance(balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    }
	        
	       if(!"0".equals(creditAmt)){
		    	
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(creditAmt);
		    	bean1.setCredit(Double.parseDouble(creditAmt));
		    	bean1.setBalance(balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    }
	       
	       if(!"0".equals(neftAmt)){
		    	
		    	balance = Double.parseDouble(grossTotal1) - Double.parseDouble(neftAmt);
		    	bean1.setCredit(Double.parseDouble(neftAmt));
		    	bean1.setBalance(balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    }
	       
	       if(!"0".equals(cardAmount) && !"0".equals(cashAmount)){
		    	
	    	   Double cardAmount1 = Double.parseDouble(cardAmount);
	    	   Double cashAmount1 =	Double.parseDouble(cashAmount);	   
	    	   Double addCardCash =  cardAmount1 + cashAmount1;
	    	   
		    	balance = Double.parseDouble(grossTotal1) - (addCardCash);
		    	bean1.setCredit(addCardCash);
		    	bean1.setBalance(balance);
		    	bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    }*/
			
		/*SupplierPaymentDao dao1 = new SupplierPaymentDao();
			dao1.regvendorPayment(bean1);*/
			
			/*SupplierPaymentDao venDao = new SupplierPaymentDao();
			List venList  = venDao.getAllVendorEntry1(suppliername,fk_supplier_id);
			 
		    System.out.println("size of data == "+venList.size());
			//if table is empty for strok table
			if(venList.size() == 0){
				VendorPaymentBean vendorBean = new VendorPaymentBean();
				vendorBean.setSupplier((suppliername));
				vendorBean.setBillNo((customerBill));
				
				vendorBean.setPersonname("N/A");
				vendorBean.setSupplier(creditCustomer);
				vendorBean.setSupplier1((Long.parseLong(fk_supplier_id)));
				vendorBean.setPayment(Double.parseDouble(initialPayment));
				vendorBean.setTdsdetails(initialPayment);
				vendorBean.setCredit(Double.parseDouble(initialPayment));
				vendorBean.setDebitAmount(("0"));
				vendorBean.setTotalAmount(Double.parseDouble("0"));
				System.out.println("hi ths is kishor payment -yes*************************"+initialPayment);
				vendorBean.setPaymentMode(paymentMode2);
				vendorBean.setChequeNum("N/A");
				vendorBean.setNameOnCheck("N/A");
				vendorBean.setCardNum(Long.parseLong("0"));
				vendorBean.setAccNum(Long.parseLong("0"));
				vendorBean.setPaymentType("credit");
				vendorBean.setBankName("N/A");
				vendorBean.setInsertDate(date1);
				vendorBean.setBalance(Double.parseDouble(grossTotal1));
				vendorBean.setTotalAmount(Double.parseDouble(grossTotal1));
				SupplierPaymentDao emptyStockdao = new SupplierPaymentDao();
				emptyStockdao.addVendorDetails(vendorBean);
			}
			
			//if table is not empty
			else{
				for(int j=0;j<venList.size();j++){
					VendorPaymentBean notEmptyBean =(VendorPaymentBean)venList.get(j);
				 
				 Double quantityFromTable = notEmptyBean.getBalance();
				 
				
				 Long pkBookStockTableId = notEmptyBean.getPkVenPaymentId();
				 
				 double addeduantity = quantityFromTable + Long.parseLong(grossTotal1);
				 
	       		 HibernateUtility hbu = HibernateUtility.getInstance();
	       		 Session session = hbu.getHibernateSession();
	       		 Transaction transaction = session.beginTransaction();
	       		 
	       		VendorPaymentBean updateStock = (VendorPaymentBean) session.get(VendorPaymentBean.class, new Long(pkBookStockTableId));
	       		 updateStock.setBalance(addeduantity);
	       		 
	       		 session.saveOrUpdate(updateStock);
	       		 transaction.commit();
				}*/
		
			
		}	
	
	}
	
	
	
	
	
	public void fertilizerBilling1_new(HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		
		
		/*start Session code For Shop Name*/		
		HttpSession sessionv = request.getSession(true);
		 String type1= "";
         String name1 = "";
         String shopName = "";
         if (sessionv != null) {

         if (sessionv.getAttribute("user") != null) {
	     name1 = (String) sessionv.getAttribute("user");
	     System.out.println("session name+++++"+name1);
          HibernateUtility hbu1=HibernateUtility.getInstance();
          Session session2=hbu1.getHibernateSession();
          org.hibernate.Query query1 = session2.createQuery("from UserDetailsBean where userName =:usr");
          query1.setParameter("usr", name1);
          UserDetailsBean userDetail1 = (UserDetailsBean) query1.uniqueResult();
          type1 = userDetail1.getUserName();
          System.out.println("type in session "+type1);
          shopName = userDetail1.getShopName();
          System.out.println("Shop Name In Session by Vikas  "+shopName);
         }
		
         }
		

  		/*end Session code For Shop Name*/	
		
			
		System.out.println("In helper");
	//this code for auto  bill no inccerment	
		HttpSession session3 = request.getSession();
		FertilizerBillDao1 data = new FertilizerBillDao1();
		List stkList = data.getCustomerBill();

		for (int i = 0; i < stkList.size(); i++) {

			CustomerBillBean1 st = (CustomerBillBean1) stkList.get(i);
			customerBill = st.getBillNo();
			System.out.println("***************** by vikas  k"+customerBill);
			//customerBill++;
			System.out.println("***************** by vikas k "+customerBill);

		}
		
		session3.setAttribute("customerBill", customerBill); 
		
		
		HttpSession session4 = request.getSession();
		String billNo1 = request.getParameter("billNo");
		
		System.out.println(" hi this is Bill no is by Session is ==--  111"+billNo1);
		//String billNo2 =String.valueOf(billNo1);
		
		//String bill = billNo1.toString();
		
		session4.setAttribute("customerBill", billNo1);
		System.out.println(" hi this is Bill no is by Session is ==--  222"+billNo1);
		
		
	//end auto bill no increment method	
	
		FertilizerBillDao1 dao=new FertilizerBillDao1();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		
		
		CustomerBillBean1 bean=new CustomerBillBean1();
		
		for(int i=0 ; i< count;i++)
		{
			String productName = request.getParameter("productName"+i);
			System.out.println("hhhhhhhhhhhhhhh"+productName);
			String hsn = request.getParameter("hsn"+i);
			System.out.println("hi this is vikas in firtilizer helper   ----"+hsn);
			String okquantity = request.getParameter("okquantity"+i);
			System.out.println("qqqqqqqqqqq"+okquantity);
			String Gst = request.getParameter("Gst"+i);
			System.out.println(" hi this is GST iS ===="+Gst);
			String IGst = request.getParameter("IGst"+i);
			String TaxAmount = request.getParameter("TaxAmount"+i);
			//String outChallanno = request.getParameter("outChallanno"+i);
			String buyPrice = request.getParameter("buyPrice"+i);
			String operation = request.getParameter("operation"+i);
			System.out.println("Hi this is Billing Operation"+operation);
			String description = request.getParameter("description"+i);
			String Total = request.getParameter("Total"+i);
			System.out.println(" hi this is total ++++++++++"+Total);
			
			System.out.println("hi this is kishor the total//////////****-----"+Total);
			String suppliername = request.getParameter("supplierName");
			String billNo = request.getParameter("billNo");
			String creditCustomer = request.getParameter("creditCustomer");
			String fk_supplier_id = request.getParameter("supplier");
			System.out.println("hi this kishor fk_supplier_id 9999999*****************"+fk_supplier_id);
			String custName = request.getParameter("custName");		
			String address = request.getParameter("address");
			String contactNo1 = request.getParameter("contactNo1");
			String gstNo2 = request.getParameter("gstNo2");
			String saleDate2 = request.getParameter("saleDate2");
			//String ShopName = request.getParameter("ShopName");
			//String custgstno = request.getParameter("custgstno");
			String outwardchallanno = request.getParameter("outwardchallanno");
			String paymentMode2 = request.getParameter("paymentMode2");
			String initialPayment = request.getParameter("initialPayment");
			
			
			//String gridTotal = request.getParameter("Total1");
			
			//System.out.println("hi this is kidhor grid  total 000000000*****-123458---+++++"+gridTotal);
			
			double gridTotal = 0.0;
			double asd = Double.parseDouble(okquantity);
		
			double xyz = Double.parseDouble(buyPrice);
			gridTotal = asd * xyz;
			
			String gstForExpense1 = request.getParameter("gstForExpense1");
			String totalWithExpense1 = request.getParameter("totalWithExpense1");
			String discount1 = request.getParameter("discount1");
			String discountAmount1 = request.getParameter("discountAmount1");
			String hamaliExpence3 = request.getParameter("hamaliExpence3");
			String hamaliExpence1 = request.getParameter("hamaliExpence1");
			String grossTotal1 = request.getParameter("grossTotal1");
			System.out.println(" hit his os gross total===="+grossTotal1);
			String InwardChallanNo = request.getParameter("inwordchallanNo");
			String vehicle =request.getParameter("vehicle");
			System.out.println("Hi this is vikas print Inword challlan No ;;;;;;;;;;;''''''"+vehicle);
			System.out.println("Hi this is vikas print Inword challlan No ;;;;;;;;;;;''''''"+InwardChallanNo);
			
			
			
			/*Long amount = bean.getInitialPayment();
			double subtotal = Double.parseDouble(initialPayment);
			*/
			
			/*if(gstNo2 != null){
				bean.setGstNo2((gstNo2));
			}
			else{
				bean.setGstNo2(00);
			}*/
			bean.setProductName(productName);
			bean.setHsn(hsn);
			bean.setOkquantity(Double.parseDouble(okquantity));
		    bean.setGst(Long.parseLong(Gst));
		    bean.setIgst(Long.parseLong(IGst));
		    bean.setTaxamount(Long.parseLong(TaxAmount));
			bean.setBuyPrice(Double.parseDouble(buyPrice));
			bean.setOperation(operation);
			bean.setDescription(description);
			bean.setGridTotal(gridTotal);
			bean.setTotal(Double.parseDouble(Total));
			System.out.println("hi this is total=-=-==="+Total);
			bean.setShopName(shopName);
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setSuppliername(suppliername);
			bean.setBillNo1(billNo);
			//bean.setBillNo(billNo);
			
			bean.setBillNo(billNo1);

			Date  date1=null;
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df1.parse(saleDate2);
			
/*			session3.setAttribute("customerBill", customerBill); */
			//bean.setBillNo(customerBill);
			System.out.println(" hi this is kishor =================--------------"+customerBill);
			
			bean.setCreditcustomer(creditCustomer);
		    bean.setCustname(custName);
		    bean.setAddress(address);
		    bean.setVehicle(vehicle);
		    bean.setContactNo1(Long.parseLong(contactNo1));
		    bean.setGstNo2(gstNo2);
			bean.setSaleDate2(date1);
			// this field give the problem for bill printing and GST Number only in number
			//bean.setCustgstno(Long.parseLong(gstNo2));
			bean.setOutwardchallanno(outwardchallanno);
			bean.setPaymentMode2(paymentMode2);
			
			bean.setInwardChallanNo(InwardChallanNo);
			
			
			if(initialPayment !="")
			{
				bean.setInitialPayment(Long.parseLong(initialPayment));
			}
			else
			{
				bean.setInitialPayment(0l);
			}
			
			bean.setGstForExpense1(Double.parseDouble(gstForExpense1));
			bean.setTotalWithExpense1(Double.parseDouble(totalWithExpense1));
			
			if(discount1 !="")
			{
				bean.setDiscount1(Double.parseDouble(discount1));
			}
			else
			{
				bean.setDiscount1(0.0);
			}
			
			if(discountAmount1 !="")
			{
				bean.setDiscountAmount1(Double.parseDouble(discountAmount1));
			}
			else
			{
				bean.setDiscountAmount1(0.0);
			}
			
			if(hamaliExpence1 !="")
			{
				bean.setHamaliExpence1(Double.parseDouble(hamaliExpence1));
			}
			else
			{
				bean.setHamaliExpence1(0.0);
			}
			
			if(hamaliExpence3 !="")
			{
				bean.setHamaliExpence3(Double.parseDouble(hamaliExpence3));
			}
			else
			{
				bean.setHamaliExpence3(0.0);
			}
			bean.setGrossTotal1(Double.parseDouble(grossTotal1));
			
			HttpSession session = request.getSession(true);
			String username = (String)session.getAttribute("user");
			String userid = (String)session.getAttribute("userid");
			String shopid = (String)session.getAttribute("shopid");
			String shopname=(String)session.getAttribute("shopname");
			
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			
			dao.valBillDetails(bean);
			
		if(i==0)
		{
			
			VendorPaymentBean bean1 = new VendorPaymentBean();
			
			double pqr1 =Double.parseDouble(initialPayment);
			System.out.println("hi this is kishor Initian 555555-------------*****"+pqr1);

			System.out.println("hi this is kishor Initian 555555-------------*****"+initialPayment);
			bean1.setSupplier((suppliername));
			bean1.setBillNo((billNo1));
			//bean1.setBillNo(billNo);
			System.out.println(" hi this is kishor biradar 123 bill no is ======------"+billNo);
			System.out.println(" hi this is vendor bill no ===========--------------------=========="+customerBill);
			
			bean1.setBillNo1(billNo);
			
			bean1.setPersonname("N/A");
			bean1.setSupplier(creditCustomer);
			bean1.setSupplier1((Long.parseLong(fk_supplier_id)));
			bean1.setPayment(Double.parseDouble(initialPayment));
			bean1.setTdsdetails(initialPayment);
			bean1.setCredit(Double.parseDouble(initialPayment));
			bean1.setDebitAmount(("0"));
			bean1.setTotalAmount(Double.parseDouble("0"));
			System.out.println("hi ths is kishor payment -*************************"+initialPayment);
			bean1.setPaymentMode(paymentMode2);
			bean1.setChequeNum("N/A");
			bean1.setNameOnCheck("N/A");
		    bean1.setCardNum(Long.parseLong("0"));
		    bean1.setAccNum(Long.parseLong("0"));
		    bean1.setPaymentType("credit");
		    bean1.setBankName("N/A");
		    bean1.setInsertDate(date1);
		    bean1.setBalance(Double.parseDouble(grossTotal1));
		    bean1.setTotalAmount(Double.parseDouble(grossTotal1));
		    
		    SupplierPaymentDao dao1 = new SupplierPaymentDao();
			dao1.regvendorPayment(bean1);
		}
		    
		
			
		}	
	
	}
	
	
	
	
	
	public List getgstsaleAsPerRangeWise(HttpServletRequest request,
			HttpServletResponse response) {

		String fDate = request.getParameter("startDate1");
		System.out.println(" hi this is kishor+++++++++++++++++++++ "+fDate);
        String tDate = request.getParameter("enddate1");
    	System.out.println(" hi this is kishor+++++++++++++++++++++ "+fDate);
    	String zero =request.getParameter("0");
        Map<Long,CustomerBillBean1> map = new HashMap<Long,CustomerBillBean1>();
		
        FertilizerBillDao1 dao = new FertilizerBillDao1();
		List<Object> exp1List1 = dao.getgstSalewholerangewise(fDate,tDate);
		
		
		return exp1List1;
	
	
	}
	

	public List getgstsalereportAsPerRangeWise(HttpServletRequest request,
			HttpServletResponse response) {

		String fDate = request.getParameter("fisDate");
        String tDate = request.getParameter("endDate");
		
        Map<Long,CustomerBillBean1> map = new HashMap<Long,CustomerBillBean1>();
		
        FertilizerBillDao1 dao = new FertilizerBillDao1();
		List<CustomerBillBean1> exp1List1 = dao.getgstSalereportrangewise(fDate,tDate);
		
		
		return exp1List1;
	
	
	}

	
}
