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

public class SupplierCashBankHelper {

	Double bal;
	Double newBal;
	Double balan;
	private String pk_vendor_payment_id;
	
	
	public void regSupplierCashBank(HttpServletRequest request,
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
			String supplier = request.getParameter("supplier1");
			System.out.println("hi this is supplier==---"+supplier);
			
			/*String supplier1 = request.getParameter("supplier");
			System.out.println("hi this is kishor 4578*********"+supplier1);*/
			System.out.println("supplier value in supplier cash book helper  ----"+supplier);
			
			String billNo1 = request.getParameter("billNo1");
			System.out.println(" hi this is kishor biaradar===========------======="+billNo1);
			
			/*String billNo = request.getParameter("billNo");*/
			
			String totalAmount = request.getParameter("totalAmount");
			
			String bankName = request.getParameter("bankName");
			
			String fk_supplier_id = request.getParameter("supplier");
			System.out.println("hi this is supplier Id Is ==---"+supplier);
			
			System.out.println("hi this is ksishor supplier**************"+fk_supplier_id);
			
			String paymentType = request.getParameter("paymentType");
			
			String paymentMode = request.getParameter("paymentMode");
			
			String chequeNum = request.getParameter("chequeNum");
			
			String cardNum = request.getParameter("cardNum");
			
			String accNum = request.getParameter("accNum");
			
			String debitAmount = request.getParameter("debitAmount");
			
			String tdsdetails = request.getParameter("tdsdetails");
			
			String personname = request.getParameter("personname");
			
			String nameOnCheck = request.getParameter("nameOnCheck");
			
			String supPay = request.getParameter("supPay");
			
			
			VendorPaymentBean bean = new VendorPaymentBean();
			
			
			bean.setSupplier(supplier);
			
			bean.setSupplier1(Long.parseLong(fk_supplier_id));
			bean.setTxId(Txid);
			bean.setBillNo1((billNo1));
			System.out.println("hi this is ksihor String bill==========-----------------======"+billNo1);
			bean.setBillNo(((billNo1)));
			System.out.println("hi this is ksihor Long no  bill==========-----------------======"+billNo1);
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
			Query query = session.createSQLQuery("SELECT balance ,bill_no from vendor_payment WHERE  bill_no =:billNo1 ORDER BY  pk_vendor_payment_id  DESC LIMIT 1 ;");
			query.setParameter("billNo1",billNo1);
			List<Object[]> list = query.list();
			
			for (Iterator iterator = list.iterator(); iterator.hasNext();) {
				Object[] objects = (Object[]) iterator.next();
				String newBal = objects[0].toString();
				System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+newBal);
					//BigDecimal bigDecimal = new BigDecimal(newBal);
	                bal= Double.valueOf(newBal);
	           
				System.out.println(bal);
			}
			
	
		
			if (bal==null) {
				
				Double balance = Double.parseDouble(totalAmount);
				
				if(paymentType.equals("credit"))
				{
					Double newBal = balance - Double.parseDouble(supPay);
					
            		 Transaction transaction = session.beginTransaction();
            		 
					
					bean.setBalance(newBal);
					bean.setPaymentType(paymentType);
					bean.setCredit(Double.parseDouble(supPay));
					
					//this method get data from billDetail table using CustomerBillBean1 through this (getAllPurschaseEntry) method
					GoodsReceiveDao dao1 = new GoodsReceiveDao();
			        List stkList2  = dao1.getAllPurschaseEntry();
			        
			        System.out.println("List size"+stkList2.size());
					
			        for(int j=0;j<stkList2.size();j++){
			        	
			        	CustomerBillBean1 st = (CustomerBillBean1)stkList2.get(j);
					String bill=st.getBillNo();
					Long pk_goods_receive_id=st.getPk_customer_id();
					
					if(billNo1.equals(bill)){
					
					System.out.println("inside if");
						
					CustomerBillBean1 updateStock = (CustomerBillBean1) session.get(CustomerBillBean1.class, new Long(pk_goods_receive_id));
					updateStock.setGrossTotal1(newBal);
            		 
            		session.saveOrUpdate(updateStock);
            		transaction.commit();
            		
					}
					}
				}	
				else{
					if(paymentType.equals("debit"))
					{
						Double newBal = balance + Double.parseDouble(supPay);
						//Double newbal1 =balance + Double.parseDouble(supPay);
						
					 
						
						 Transaction transaction = session.beginTransaction();
						
						bean.setBalance(newBal);
						bean.setPaymentType(paymentType);
						bean.setCredit(Double.parseDouble(supPay));
						
						GoodsReceiveDao dao1 = new GoodsReceiveDao();
				        List stkList2  = dao1.getAllPurschaseEntry();
				        
				        System.out.println("List size"+stkList2.size());
						
				        for(int j=0;j<stkList2.size();j++){
				        	
				        	CustomerBillBean1 st = (CustomerBillBean1)stkList2.get(j);
				        	String bill=st.getBillNo();
							Long pk_goods_receive_id=st.getPk_customer_id();
						
						if(billNo1.equals(bill)){
						
						System.out.println("inside if");
							
						CustomerBillBean1 updateStock = (CustomerBillBean1) session.get(CustomerBillBean1.class, new Long(pk_goods_receive_id));
						updateStock.setGrossTotal1(newBal);
	            		 
	            		session.saveOrUpdate(updateStock);
	            		transaction.commit();
						}
				        }
					}
					else{
					
					bean.setCredit(0.0);
					}
				}
				
				
				
					bean.setTotalAmount(Double.parseDouble(totalAmount));
					
			SupplierPaymentDao dao = new SupplierPaymentDao();
			dao.regSupPayment(bean);
			}
			
			else{
				
				Double balance = Double.parseDouble(totalAmount);
				
				
				
				if(paymentType.equals("credit"))
				{
					Double newBal = bal - Double.parseDouble(supPay);
					
					bean.setBalance(newBal);
					bean.setPaymentType(paymentType);
					bean.setCredit(Double.parseDouble(supPay));
					
					 Transaction transaction = session.beginTransaction();
					
					GoodsReceiveDao dao1 = new GoodsReceiveDao();
			        List stkList2  = dao1.getAllPurschaseEntry();
			        
			        System.out.println("List size"+stkList2.size());
					
			        for(int j=0;j<stkList2.size();j++){
			        	
			        	CustomerBillBean1 st = (CustomerBillBean1)stkList2.get(j);
			        	String bill=st.getBillNo();
						Long pk_goods_receive_id=st.getPk_customer_id();
					
					if(billNo1.equals(bill)){
					
					System.out.println("inside if By VK");
						
					CustomerBillBean1 updateStock = (CustomerBillBean1) session.get(CustomerBillBean1.class, new Long(pk_goods_receive_id));
					//updateStock.setGrossTotal1(newBal);
            		 
            		session.saveOrUpdate(updateStock);
            		transaction.commit();
					}
			       }
				}
				else{
					if(paymentType.equals("debit"))
					{
						Double newBal = bal + Double.parseDouble(supPay);
						/*System.out.println("debit balance = "+supPay);
						System.out.println("current balace = "+balance);
						System.out.println("debit balance = " +newBal);*/
						bean.setBalance(newBal);
						bean.setPaymentType(paymentType);
						bean.setCredit(Double.parseDouble(supPay));
						
						Transaction transaction = session.beginTransaction();
						
						GoodsReceiveDao dao1 = new GoodsReceiveDao();
				        List stkList2  = dao1.getAllPurschaseEntry();
				        
				        System.out.println("List size"+stkList2.size());
						
				        for(int j=0;j<stkList2.size();j++){
				        	
				        	CustomerBillBean1 st = (CustomerBillBean1)stkList2.get(j);
				        	String bill=st.getBillNo();
							Long pk_goods_receive_id=st.getPk_customer_id();
						
						if(billNo1.equals(bill)){
						
						System.out.println("inside if By VK");
							
						CustomerBillBean1 updateStock = (CustomerBillBean1) session.get(CustomerBillBean1.class, new Long(pk_goods_receive_id));
						updateStock.setGrossTotal1(newBal);
	            		session.saveOrUpdate(updateStock);
	            		transaction.commit();
						}
				        }
				       }
					else{
					
					bean.setCredit(0.0);
					}
				}

				bean.setTotalAmount(Double.parseDouble(totalAmount));
				
				
				HttpSession session2 = request.getSession(true);
				String username = (String)session2.getAttribute("user");
				String userid = (String)session2.getAttribute("userid");
				String shopid = (String)session2.getAttribute("shopid");
				String shopname=(String)session2.getAttribute("shopname");
				
				bean.setUserId(Long.parseLong(userid));
				bean.setUsername(username);
				bean.setShopId(Long.parseLong(shopid));
				bean.setShopName(shopname);
				
				SupplierPaymentDao dao = new SupplierPaymentDao();
				dao.regSupPayment(bean);
				
			}
			
		}
	


	public List getSupplierPaymentDetailsBySingleDate(
			HttpServletRequest request, HttpServletResponse response) {
		String fDate = request.getParameter("fDate");
		System.out.println(fDate+"Single Date");
		
         Map<Long,SupplierPaymentDetail> map = new HashMap<Long,SupplierPaymentDetail>();
 		
         SupplierPaymentDao dao = new SupplierPaymentDao();
 		List<SupplierPaymentDetail> supList = dao.getCreditCustPaymentDetailsForSingleDate(fDate);
 		
 		
 		return supList;

	}

	public List getSupplierPaymentByTwoDate(HttpServletRequest request,
			HttpServletResponse response) {

		
		String fDate = request.getParameter("fisDate");
        String tDate = request.getParameter("endDate");
        String fkSupplierId = request.getParameter("supplier8");
        System.out.println(" hi this is kishor Supplier Name Is---==== "+fkSupplierId);
		
        Map<Long,SupplierPaymentDetail> map = new HashMap<Long,SupplierPaymentDetail>();
		
        SupplierPaymentDao dao = new SupplierPaymentDao();
		List<SupplierPaymentDetail> sup1List = dao.getSupplierDetailsDateWise(fDate,tDate,fkSupplierId);
		
		
		return sup1List;
	
	}
	//Vendor Name Wise
	public List getVendorPaymentByTwoDate(HttpServletRequest request,
			HttpServletResponse response) {

		
		String fDate = request.getParameter("fisDate");
        String tDate = request.getParameter("endDate");
        String fkSupplierId = request.getParameter("supplier9kb");
        System.out.println("hi this is kishor Suuplier NAme is ----====="+fkSupplierId);
		
        Map<Long,SupplierPaymentBean> map = new HashMap<Long,SupplierPaymentBean>();
		
        SupplierPaymentDao dao = new SupplierPaymentDao();
		List<SupplierPaymentBean> sup1List = dao.getVendorDetailsDateWise(fDate,tDate,fkSupplierId);
		System.out.println("sup1List++++++++++++++"+sup1List);
		
		
		return sup1List;
	
	}

	public List getSupplierPaymentDetailsByBillNumber(
			HttpServletRequest request, HttpServletResponse response) {

		String billNo1 = request.getParameter("billNo1");
		String fkSupplierId = request.getParameter("supplier");
		
		
         Map<Long,VendorPaymentBean> map = new HashMap<Long,VendorPaymentBean>();
 		
         SupplierPaymentDao dao = new SupplierPaymentDao();
 		List<VendorPaymentBean> supList = dao.getCreditCustPaymentDetailsAsBill(billNo1,fkSupplierId);
 		
 		
 		return supList;

	
	}

	public List getSupplierPaymentDetailsByNames(HttpServletRequest request,
			HttpServletResponse response) {
		String fkSupplierId = request.getParameter("supplier7");
		System.out.println("print supplier name in supplierCashBank Helper by kishor ++++++++++++++"+fkSupplierId);
		
        Map<Long,SupplierPaymentDetail> map = new HashMap<Long,SupplierPaymentDetail>();
		
        SupplierPaymentDao dao = new SupplierPaymentDao();
		List<SupplierPaymentDetail> supList = dao.getCreditCustPaymentDetailsAsBill(fkSupplierId);
		
		
		return supList;
	}
		
	
	}


