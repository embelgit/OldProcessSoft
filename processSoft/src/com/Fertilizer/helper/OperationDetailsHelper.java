package com.Fertilizer.helper;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Fertilizer.dao.OperationDetailsDao;
import com.Fertilizer.hibernate.OperationDetailsBean;

public class OperationDetailsHelper {

	public void operationDetails(HttpServletRequest request,
			HttpServletResponse response) {

		String operationName = request.getParameter("operationName");
		
		OperationDetailsBean bean = new OperationDetailsBean();
		
		bean.setOperationName(operationName);
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date(0);
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
		
		OperationDetailsDao dao = new OperationDetailsDao();
		dao.addOperationDetails(bean);
	}
}
