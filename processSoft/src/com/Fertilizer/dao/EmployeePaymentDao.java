package com.Fertilizer.dao;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.EmployeePaymentDetail;
import com.Fertilizer.bean.SupplierPaymentDetail;
import com.Fertilizer.hibernate.EmployeePaymentBean;
import com.Fertilizer.utility.HibernateUtility;

public class EmployeePaymentDao {

	public void regEmpPayment(EmployeePaymentBean bean) {

		System.out.println("IN DAO");
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful");
		} catch (RuntimeException e) {
			
			try {
				transaction.rollback();
			} catch (RuntimeException e2) {
				
				Log.error("Error in regEmpPayment", e2);
			}
		}
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
		
	}

	
	//Employee Payment for single Date
	public List<EmployeePaymentDetail> getempPaymentDetailsForSingleDate(
			String fDate) {



	    HibernateUtility hbu=null;
	    Session session=null;
	    List<EmployeePaymentDetail> empPaymentList=null;
	    try
	    {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query=session.createSQLQuery("select first_name, last_name, payment, payment_mode, insert_date, person_name,paymentType, reason FROM employee_details RIGHT JOIN employee_payment ON employee_details.pk_empoyee_id = employee_payment.fk_employee_id WHERE DATE(insert_date)=:isInsertDate");
			query.setParameter("isInsertDate", fDate);
			List<Object[]> list = query.list();
		
			empPaymentList= new ArrayList<EmployeePaymentDetail>(0);	
		for (Object[] object : list) {
			System.out.println(Arrays.toString(object));
			
			EmployeePaymentDetail empreports = new EmployeePaymentDetail();
			empreports.setFirstName(object[0].toString());
			empreports.setLastName(object[1].toString());
			empreports.setPaymentAmount(Double.parseDouble(object[2].toString()));
			empreports.setPaymentMode(object[3].toString());
			empreports.setInsertDate((object[4].toString()));
			empreports.setAccountantName(object[5].toString());
			empreports.setPaymentType(object[6].toString());
			
			String type=empreports.getPaymentType();
			
			
			if(type.equals("credit")){
				empreports.setCreditPaymentAmount(Double.parseDouble(object[2].toString()));
				empreports.setDebitPaymentAmount(0.00);
			}
			else{
				empreports.setCreditPaymentAmount(0.00);
				empreports.setDebitPaymentAmount(Double.parseDouble(object[2].toString()));
			}
			empreports.setReason((object[7].toString()));
			empPaymentList.add(empreports);		
	}}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	 finally
	{
	
	if(session!=null){
		hbu.closeSession(session);	
	}
	}
	return empPaymentList;

	}

	//employee payment details for two dates
	public List<EmployeePaymentDetail> getEmployeePaymentDetailsDateWise(
			String fDate, String tDate,String fkEmployeeId) {

		System.out.println(fDate+"first Date In dao");
		System.out.println(tDate+"Second Date In dao");
		HibernateUtility hbu=null;
		Session session=null;
		List<EmployeePaymentDetail> emp1List=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query2 = session.createSQLQuery("select first_name, last_name, payment, payment_mode, insert_date, person_name, paymentType,reason FROM employee_details RIGHT JOIN employee_payment ON employee_details.pk_empoyee_id = employee_payment.fk_employee_id WHERE insert_date BETWEEN '"+fDate+"' AND '"+tDate+"'AND fk_employee_id='"+fkEmployeeId+"'");
			/*query2.setParameter("stDate", fDate);
	        query2.setParameter("edDate", tDate);*/
	        List<Object[]> list = query2.list();
	        emp1List= new ArrayList<EmployeePaymentDetail>(0);
			
			
			for (Object[] object : list) {
					
				EmployeePaymentDetail empreports = new EmployeePaymentDetail();
				
				empreports.setFirstName(object[0].toString());
				empreports.setLastName(object[1].toString());
				empreports.setPaymentAmount(Double.parseDouble(object[2].toString()));
				empreports.setPaymentMode(object[3].toString());
				empreports.setInsertDate((object[4].toString()));
				empreports.setAccountantName(object[5].toString());
				empreports.setPaymentType((object[6].toString()));
				
				String type=empreports.getPaymentType();
			
				if(type.equals("credit")){
					empreports.setCreditPaymentAmount(Double.parseDouble(object[2].toString()));
					empreports.setDebitPaymentAmount(0.00);
				}
				else{
					empreports.setCreditPaymentAmount(0.00);
					empreports.setDebitPaymentAmount(Double.parseDouble(object[2].toString()));
				}
				empreports.setReason((object[7].toString()));
			    emp1List.add(empreports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return emp1List;
		
	
	}


	//get latest Transaction number in Employee_payment
	public List getEmployeePaymentTxid() {
		HibernateUtility hbu=null;
		Session session=null;
		List<EmployeePaymentBean> Txidlist=null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT transaction_id ,person_name FROM employee_payment ORDER BY transaction_id DESC LIMIT 1");

			List<Object[]> list = query.list();
			Txidlist= new ArrayList<EmployeePaymentBean>(0);
			for (Object[] object : list) {
				
				EmployeePaymentBean bean=new EmployeePaymentBean();
				bean.setTxid(Long.parseLong(object[0].toString()));
				bean.setPersonName(object[1].toString());
				
				Txidlist.add(bean);	 
			}}
		catch(RuntimeException e)
		{
			Log.error("Error in getEmployeeTranactionNo()", e);	
		}finally
		{if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return Txidlist;	
	}
	
	
}
