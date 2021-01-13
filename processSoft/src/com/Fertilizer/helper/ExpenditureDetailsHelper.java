package com.Fertilizer.helper;

import java.math.BigInteger;
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

import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.dao.ExpenditureDetailsDao;
import com.Fertilizer.dao.ProductDetailsDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.ExpenditureDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class ExpenditureDetailsHelper {

	public void expenseDetails(HttpServletRequest request,
			HttpServletResponse response) {

		String expenseName = request.getParameter("expenseName");
		
		ExpenditureDetailsBean bean = new ExpenditureDetailsBean();
		
		bean.setExpenseName(expenseName);
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));
		
		bean.setInsertDate(dateobj);
		
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("user");
		String userid = (String)session.getAttribute("userid");
		String shopid = (String)session.getAttribute("shopid");
		String shopname=(String)session.getAttribute("shopname");
		
		
		bean.setUserId(Long.parseLong(userid));
		bean.setUsername(username);
		bean.setShopId(Long.parseLong(shopid));
		bean.setShopName(shopname);
		
		
		ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		dao.addExpenseDetails(bean);
	}
	
	public void deleteExpenditure(HttpServletRequest request, HttpServletResponse response ) {
		
		String delExpenditureNameId = request.getParameter("delExpenditureNameId");
		
		ExpenditureDetailsDao dao2 = new ExpenditureDetailsDao();
		dao2.deleteExpenditure(delExpenditureNameId);		
	}
	
	public Map getExpenditureDetailsToEdit(String pkExpenseDetailsId) {
		
	 	System.out.println("into helper class");
	 	ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
		List catList = dao.getExpenditureDetailsToEdit(pkExpenseDetailsId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			ExpenditureDetailsBean bean = new ExpenditureDetailsBean();
			
			bean.setPkExpenseDetailsId(Long.parseLong(o[0].toString()));
			bean.setExpenseName(o[1].toString());
			bean.setInsertDate((Date)o[2]);
			
			map.put(bean.getExpenseName(),bean);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	}
	
	public void updateExpenditureDetails(HttpServletRequest request, HttpServletResponse response) {
	 
		String pkExpenseDetailsId1 = request.getParameter("pkExpenseDetailsId");
		String NewExpenseName = request.getParameter("NewExpenseName");
		
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		transaction = session.beginTransaction();
		
		long pkExpenseDetailsId =Long.parseLong(pkExpenseDetailsId1);
		ExpenditureDetailsBean update = (ExpenditureDetailsBean) session.get(ExpenditureDetailsBean.class, pkExpenseDetailsId);
		
		update.setExpenseName(NewExpenseName);
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date lastUpdateDate = new Date();
		System.out.println(dateFormat1.format(lastUpdateDate));
		
		update.setInsertDate(lastUpdateDate);
		
	    session.saveOrUpdate(update);
		transaction.commit();
		
		System.out.println("Record updated successfully.");	
	}
	
}
