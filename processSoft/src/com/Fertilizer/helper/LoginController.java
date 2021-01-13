package com.Fertilizer.helper;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.Fertilizer.bean.ResponseContext;
import com.Fertilizer.hibernate.AccessControlBean;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.utility.HibernateUtility;
import com.google.gson.Gson;



/**
 * Servlet implementation class Session
 */
public class LoginController extends HttpServlet {
	
	
	public void loginUser(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = request.getParameter("uname");
		String pwd = request.getParameter("pass");
		
		HibernateUtility hbu=HibernateUtility.getInstance();
		Session session1=hbu.getHibernateSession();
		org.hibernate.Query query = session1.createQuery(" from UserDetailsBean where userName = :username AND password = :pwd ");
		query.setParameter("username", un);
		query.setParameter("pwd", pwd);
		UserDetailsBean uniqueResult = (UserDetailsBean) query.uniqueResult();
		
		String userName = uniqueResult.getUserName();
		String password = uniqueResult.getPassword();
		ResponseContext context = new ResponseContext();
		 
		System.out.println(userName);
		
		if(un.equals(userName) && pwd.equals(password)){
		    
			
			out.print("Welcome, " + un);
			HttpSession session = request.getSession(true); // reuse existing
															// session if exist
			response.sendRedirect("/processSoft/jsp/index.html");												// or create one
		/*	SupplierAccountDetailsHelper help = new SupplierAccountDetailsHelper();
			help.creditDebitAmount();*/
			session.setAttribute("user", un);
			//context.setId(1);
			 // 30 seconds
			
		} 
		else {
			//context.setId(0);
			response.sendRedirect("/processSoft/jsp/login.jsp");
		//	((ServletRequest) response).getRequestDispatcher("/processSoft/jsp/login.jsp");
		//	response.sendRedirect("/your/new/location.jsp")
			//RequestDispatcher rd = request.getRequestDispatcher("/SMT/jsp/login.jsp");
			out.println("<font color=red>Either user name or password is wrong.</font>");
		
	      
	   }
		
	
		
		
	/*	
		
		
		
		query.setParameter("username", un);
		query.setParameter("pwd", pwd);
		UserDetailsBean unique = (UserDetailsBean) query.uniqueResult();
		//System.out.println();
		String userName = unique.getUserName();
		String password = unique.getPassword();
		System.out.println(userName+"User name in login helper");
		System.out.println(password+"password in login helper");
	
		
		
   if(unique != null){
	   
	 
		out.print("Welcome, " + un);
		HttpSession session = request.getSession(true);
		response.sendRedirect("/Fertilizer/jsp/index.jsp");
		session.setAttribute("user", un);
		HttpSession session = request.getSession(true); // reuse existing
		response.sendRedirect("/Fertilizer/jsp/index.jsp");												// or create one
		session.setAttribute("user", un);*
		 // 30 seconds
		}
	else{
		
		
		    response.sendRedirect("/Fertilizer/jsp/login.jsp");
	}*/
 }

	
	public void loginUser1(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = request.getParameter("uname");
		String pwd = request.getParameter("pass");
		String userid = request.getParameter("userid");
		String shopid = request.getParameter("shopid");
		String shopname = request.getParameter("shopname");
		HibernateUtility hbu=HibernateUtility.getInstance();
		Session session1=hbu.getHibernateSession();
		org.hibernate.Query query = session1.createQuery("from AccessControlBean where userName = :username AND password = :pwd ");
		query.setParameter("username", un);
		query.setParameter("pwd", pwd);
		AccessControlBean uniqueResult = (AccessControlBean) query.uniqueResult();

		String userName = uniqueResult.getUserName();
		String password = uniqueResult.getPassword();
		String  dbshopid = Long.toString(uniqueResult.getShopId());
		
		
		System.out.println(userName);
		System.out.println(password);

		if(un.equals(userName) && pwd.equals(password) && shopid.equals(dbshopid)){
			//ScheduledBackup.backupOnTime();
			out.print("Welcome, " + un);
			HttpSession session = request.getSession(true); // reuse existing
		
			// session if exist
			
			response.sendRedirect("/processSoft/jsp/index.jsp");					// or create one
		/*	SupplierAccountDetailsHelper help = new SupplierAccountDetailsHelper();
			help.creditDebitAmount();*/
			session.setAttribute("user", un);
			session.setAttribute("userid", userid);
			session.setAttribute("shopid", shopid);
			session.setAttribute("shopname", shopname);
			
			// 30 seconds

			//GoodsReceiveHelper goods = new GoodsReceiveHelper();
			//goods.saveDailyStock();
		} 
		else {
			
			response.sendRedirect("/processSoft/jsp/login.jsp");
			//out.println("<font color=red>Either user name or password is wrong.</font>");
			out.println("alert('User or password incorrect');");	
	
		}
	}
	
	public void language(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String lan = request.getParameter("language");
		HttpSession session = request.getSession(true); // reuse existing
		// session if exist
											// or create one
        session.setAttribute("lan", lan);
	}
	
	
}