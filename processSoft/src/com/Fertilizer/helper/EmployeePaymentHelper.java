package com.Fertilizer.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fertilizer.bean.EmployeePaymentDetail;
import com.Fertilizer.bean.SupplierPaymentDetail;
import com.Fertilizer.dao.EmployeePaymentDao;
import com.Fertilizer.dao.SupplierPaymentDao;
import com.Fertilizer.hibernate.EmployeePaymentBean;

public class EmployeePaymentHelper {

	public void regEmployeePayment(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("IN helper");
		Long Txid = 0l;

		EmployeePaymentDao dao3 = new EmployeePaymentDao();
		List listtxid = dao3.getEmployeePaymentTxid();

		if (listtxid.size() <= 0) {
			Txid = 1l;
		} else {
			for (int i = 0; i < listtxid.size(); i++) {

				EmployeePaymentBean bean = (EmployeePaymentBean) listtxid.get(i);
				Txid = bean.getTxid();
				Txid++;
			}
		}
		
		String employee = request.getParameter("employee");
		
		String empPay = request.getParameter("empPay");
		System.out.println(empPay);
		
		String personName = request.getParameter("personName");
		
		String reason = request.getParameter("reason");
		
		String paymentMode = request.getParameter("paymentMode");
		
		String chequeNum = request.getParameter("chequeNum");
		
		String cardNum = request.getParameter("cardNum");
		
		String accNum = request.getParameter("accNum");
		
		String bankName = request.getParameter("bankName");
		
		String nameOnCheck = request.getParameter("nameOnCheck");
		
		String paymentType = request.getParameter("paymentType");
		
		EmployeePaymentBean bean = new EmployeePaymentBean();
		
		bean.setFk_employee_id(Long.parseLong(employee));
		bean.setTxid(Txid);
		bean.setPaymentType(paymentType);
		bean.setCredit(Double.parseDouble(empPay));
		bean.setPersonName(personName);
		bean.setReason(reason);
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		
		/*Date pDD = null;
		try {
			pDD = dateFormat1.parse(dateobj);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		//bean.setPurchaseDate(pDD);
	
		bean.setInsertDate(dateobj);
		
		
		
		//payment details
		if(paymentMode==null){
			bean.setPaymentMode("N/A");
		}
		else{
			bean.setPaymentMode(paymentMode);
		}
	 
	if(paymentMode.equals("cheque2")){
		
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
	else if(paymentMode.equals("card2")){
		
			int cardNumLength = cardNum.length();
			 if(cardNumLength > 0){
					
					bean.setCardNum(Long.parseLong(cardNum));
				}
				else{
					bean.setCardNum(null);
				}
	}

	else if(paymentMode.equals("neft2")){
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
		
	HttpSession session2 = request.getSession(true);
	String username = (String)session2.getAttribute("user");
	String userid = (String)session2.getAttribute("userid");
	String shopid = (String)session2.getAttribute("shopid");
	String shopname=(String)session2.getAttribute("shopname");
	
	bean.setUserId(Long.parseLong(userid));
	bean.setUsername(username);
	bean.setShopId(Long.parseLong(shopid));
	bean.setShopName(shopname);
		
		
		EmployeePaymentDao dao = new EmployeePaymentDao();
		dao.regEmpPayment(bean);
		
	}

	public List getEmployeePaymentDetailsForSingleDate(
			HttpServletRequest request, HttpServletResponse response) {
		
		String fDate = request.getParameter("fDate");
		System.out.println(fDate+"Single Date");
		
         Map<Long,EmployeePaymentDetail> map = new HashMap<Long,EmployeePaymentDetail>();
 		
         EmployeePaymentDao dao = new EmployeePaymentDao();
 		List<EmployeePaymentDetail> empList = dao.getempPaymentDetailsForSingleDate(fDate);
 		
 		
 		return empList;
	}

	public List getEmpPaymentByTwoDate(HttpServletRequest request,
			HttpServletResponse response) {
		
		String fDate = request.getParameter("fisDate");
        String tDate = request.getParameter("endDate");
        String fkEmployeeId = request.getParameter("fkEmployeeId");
		
        Map<Long,EmployeePaymentDetail> map = new HashMap<Long,EmployeePaymentDetail>();
		
        EmployeePaymentDao dao = new EmployeePaymentDao();
		List<EmployeePaymentDetail> emp1List = dao.getEmployeePaymentDetailsDateWise(fDate,tDate,fkEmployeeId);
		
		
		return emp1List;
	
	
	}

	
}
