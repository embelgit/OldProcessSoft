package com.Fertilizer.helper;

import java.math.BigInteger;
import java.text.DateFormat;
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

import com.Fertilizer.bean.GetCreditCustomerDetails;
import com.Fertilizer.bean.GetTaxDetails;
import com.Fertilizer.dao.CustomerDetailsDao;
import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.dao.TaxCreationDao;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.hibernate.TaxCreationBean;
import com.Fertilizer.utility.HibernateUtility;

public class TaxCreationHelper {

	public void taxCreationDetails(HttpServletRequest request,
			HttpServletResponse response) {
			
		System.out.println("In helper");
		
		String taxType = request.getParameter("taxType");
		
		String taxPercentage = request.getParameter("taxPercentage");
		
		
		
		TaxCreationBean tcb = new TaxCreationBean();
		
		tcb.setTaxType(taxType);
		
		if(!"".equals(taxPercentage)){
				tcb.setTaxPercentage(Double.parseDouble(taxPercentage));
		} 
		else
		{
			tcb.setTaxPercentage(Double.parseDouble("00"));
		}
		
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("user");
		String userid = (String)session.getAttribute("userid");
		String shopid = (String)session.getAttribute("shopid");
		String shopname=(String)session.getAttribute("shopname");
		
		
		tcb.setUserId(Long.parseLong(userid));
		tcb.setUsername(username);
		tcb.setShopId(Long.parseLong(shopid));
		tcb.setShopName(shopname);
		
		TaxCreationDao tco = new TaxCreationDao();
		tco.valTaxCreation(tcb);
		
	}
// Edit Tax
	public void edittaxCreation(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
        String taxType = request.getParameter("taxType1");
        
        String taxName = request.getParameter("taxName");
		
		String taxPercentage = request.getParameter("taxPercentage");
		
		Long txId = Long.parseLong(taxType);
		
		 HibernateUtility hbu = HibernateUtility.getInstance();
		 Session session = hbu.getHibernateSession();
		 Transaction transaction = session.beginTransaction();
		 
		 DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		 Date date2 = new Date();
	
		 TaxCreationBean updateTax = (TaxCreationBean) session.get(TaxCreationBean.class, new Long(txId));
		
		 updateTax.setTaxPercentage(Double.parseDouble(taxPercentage));
		 updateTax.setTaxType(taxName);
		 
		session.saveOrUpdate(updateTax);
		transaction.commit();
		
		
	}

// delete tax 
	public void deleteTaxes(HttpServletRequest request, HttpServletResponse response ) {
		
		String delTax = request.getParameter("delTax");
		   
		TaxCreationDao dao2 = new TaxCreationDao();
		dao2.deleteTaxname(delTax);
			
		}

}
