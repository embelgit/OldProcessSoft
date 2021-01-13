package com.Fertilizer.helper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.CreditCustPaymentDetail;
import com.Fertilizer.bean.SupplierPaymentDetail;
import com.Fertilizer.dao.CustomerPaymentDao;
import com.Fertilizer.dao.FertilizerBillDao1;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.StockDao;
import com.Fertilizer.dao.SupplierAccountDetailsDao;
import com.Fertilizer.dao.SupplierPaymentDao;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.FertilizerBillBean;
import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.SupplierPaymentBean;
import com.Fertilizer.hibernate.VendorPaymentBean;
import com.Fertilizer.utility.HibernateUtility;

public class SupplierCashBankHelper2 {

	
	Double newBal;
	Double balan;
	Double finalpayamt;
	private String pk_vendor_payment_id;
	
	//long customerBill =101l;
	String customerBill="";

	
	
	// register vendor wise payment
	
	public void regSupplierCashBankvendorwisev(HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println("In helper");
		Long Txid=0l;
		
		SupplierPaymentDao dao_1=new SupplierPaymentDao();
		List listtxid=dao_1.getSupplierPaymentTxid();
		
		if(listtxid.size()<=0)
		{
			Txid=1l;
		}
		else
		{
		for (int i = 0; i < listtxid.size(); i++) {
			
		VendorPaymentBean bean=(VendorPaymentBean) listtxid.get(i);
		Txid=bean.getTxId();
		Txid++;
		}
	}
		
		
		//this code for auto  bill no inccerment	
				HttpSession session3 = request.getSession();
				FertilizerBillDao1 data = new FertilizerBillDao1();
				List stkList = data.getCustomerBill1();

				for (int i = 0; i < stkList.size(); i++) {

					VendorPaymentBean st = (VendorPaymentBean) stkList.get(i);
					customerBill = st.getBillNo();
					System.out.println("***************** by vikas by kishor  ================k"+customerBill);
					/*customerBill++;*/
					System.out.println("***************** by vikas k "+customerBill);

				}
			//end auto bill no increment method	
		
		

		
			String supplier = request.getParameter("supplierv");
			
			/*String supplier1 = request.getParameter("supplier");*/
			
			
			String billNo = request.getParameter("billnov1");
			System.out.println(" hi this is kishor++++++++++++++++++++++++++++"+billNo);
			
			
			String totalAmount = request.getParameter("totalAmountv");
			
			String balanceAmountv =  request.getParameter("balanceAmountv");
			
			String bankName = request.getParameter("bankNamev");
			
			String fk_supplier_id = request.getParameter("supplier");
			
			String paymentType = request.getParameter("paymentTypev");
			
			String paymentMode = request.getParameter("paymentModev");
			
			String chequeNum = request.getParameter("chequeNumv");
			
			String cardNum = request.getParameter("cardNumv");
			
			String accNum = request.getParameter("accNumv");
			
			String debitAmount = request.getParameter("debitAmountv");
			
			String tdsdetails = request.getParameter("tdsdetailsv");
			
			String personname = request.getParameter("personnamev");
			
			String nameOnCheck = request.getParameter("nameOnCheckv");
			
			String supPay = request.getParameter("supPayv");
			
			finalpayamt= Double.valueOf(supPay);
			
			VendorPaymentBean bean = new VendorPaymentBean();
			
			bean.setTxId(Txid);
			
			bean.setSupplier(supplier);
			
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			
			bean.setBillNo((billNo));
			
			bean.setBillNo1((billNo));
			
		
			
			

			session3.setAttribute("customerBill", customerBill); 

				String newbill=String.valueOf(customerBill);
			 /*Long customerBill = Long.Stri(newbill);  
			 String newbill1 =String.valueOf(newbill);*/
			
			bean.setBillNo1(newbill);
			System.out.println(" hi this is kishor new bill no is after  =================--------------"+newbill);
			
			
			bean.setPersonname(personname);
			bean.setTdsdetails((tdsdetails));
			bean.setDebitAmount((debitAmount));
			
			
			
			System.out.println("paymentMode "+paymentMode);
			
			//payment details
			if(paymentMode==null){
				bean.setPaymentMode("N/A");
			}
			else{
				bean.setPaymentMode(paymentMode);
			}
			if(tdsdetails==null){
				bean.setTdsdetails("00");
			}
			else {
				bean.setTdsdetails(tdsdetails);
			}
			if(debitAmount==null){
				bean.setDebitAmount("00");
			}
			else {
				bean.setDebitAmount(debitAmount);
			}
		 
		if(paymentMode.equals("cheque")){
			
			 if(chequeNum==null){
					bean.setChequeNum("N/A");
				}
				else{
					bean.setChequeNum(chequeNum);
				}
			 
			 if(nameOnCheck==null){
					bean.setNameOnCheck("N/A");
				}
				else{
					bean.setNameOnCheck(nameOnCheck);
				}
			 }
		else if(paymentMode.equals("card")){
			
				int cardNumLength = cardNum.length();
				 if(cardNumLength > 0){
						
						bean.setCardNum(Long.parseLong(cardNum));
					}
					else{
						bean.setCardNum(null);
					}
		}
	
		else if(paymentMode.equals("neft")){
			 if(bankName==null){
					bean.setBankName("N/A");
				}
				else{
					bean.setBankName(bankName);
				}
			 
		 int accNumLength = accNum.length();
		 if(accNumLength > 0){
			 bean.setAccNum(Long.parseLong(accNum));	
			
			}
			else{
				 bean.setAccNum(null);
			}
		}	
		 
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dateobj = new Date();
			System.out.println(dateFormat1.format(dateobj));
		
			bean.setInsertDate(dateobj);
			
			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session = hbu.getHibernateSession();
			
			//Query to get latest paid amount
			/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
			Query query = session.createSQLQuery("SELECT balance ,bill_no from vendor_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
			query.setParameter("fk_supplier_id",fk_supplier_id);
			List<Object[]> list = query.list();
			
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object[] objects = (Object[]) iterator.next();
				String billno = objects[1].toString();
				System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
				
				Session session1 = hbu.getHibernateSession();
				
				//Query to get latest paid amount
				/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
				Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from vendor_payment WHERE   bill_no =:billno ORDER BY  pk_vendor_payment_id  DESC LIMIT 1;");
				query1.setParameter("billno",billno);
				List<Object[]> list1 = query1.list();
				
				for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
					Object[] objects1 = (Object[]) iterator1.next();
					String newBal1 = objects1[0].toString();
					String bill_no =String.valueOf(objects1[1].toString());
					//Long bill_no= Long.valueOf(objects1[1].toString());
					String tot = objects1[0].toString();
					System.out.println("balance   ==  "+newBal1);
						
					 Double bal= Double.valueOf(newBal1);
					// bal= Double.valueOf(newBal1);
					 if(bal == 0.00 || bal == 0.0 || bal == 0 ){
						 System.out.println("hi this kishor =");
					
					 }else if(bal<=finalpayamt){
						 Double balamt = finalpayamt - bal;
						 finalpayamt = balamt;
						 
						 bean.setBalance(0.0);
						 bean.setBillNo(bill_no);
						 bean.setPaymentType(paymentType);
						 bean.setCredit(bal);
						 bean.setTotalAmount(Double.valueOf(tot));
						 
						 SupplierPaymentDao dao = new SupplierPaymentDao();
						 dao.regSupPayment(bean);
						 
					 }
					 else if(finalpayamt==0.0){
						 System.out.println("hi this kishor =");
					 }else{
						 Double balamt = bal - finalpayamt;
						/* finalpayamt = 0.0;*/
						 
						 bean.setBalance(balamt);
						 bean.setBillNo(bill_no);
						 bean.setPaymentType(paymentType);
						 bean.setCredit(finalpayamt);
						 bean.setTotalAmount(Double.valueOf(tot));
						 
						 SupplierPaymentDao dao = new SupplierPaymentDao();
						 dao.regSupPayment(bean);
						 
						 finalpayamt = 0.0;
					 }
					 
					 
		         
				}
					
	         
			}
	}

	
}
