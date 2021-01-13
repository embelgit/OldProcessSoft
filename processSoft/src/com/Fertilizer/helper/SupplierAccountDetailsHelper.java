package com.Fertilizer.helper;

import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;

import com.Fertilizer.bean.CustomerBillBean;
import com.Fertilizer.bean.GestSupplyerDetailsForCashBook;
import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.bean.OutwardReportBean;
import com.Fertilizer.bean.vendorBeanCashBook;
import com.Fertilizer.dao.SupplierAccountDetailsDao;
import com.Fertilizer.hibernate.CashBankBookDataDateWise;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.SupplierAccountDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class SupplierAccountDetailsHelper {

	public void suppAccDetails(HttpServletRequest request, HttpServletResponse response) {

		String fk_supplier_id = request.getParameter("fk_supplier_id");
		String billNo = request.getParameter("billNo");
		String totalAmt = request.getParameter("totalAmt");

		SupplierAccountDetailsBean sadb = new SupplierAccountDetailsBean();

		sadb.setFk_supplier_id(Long.parseLong(fk_supplier_id));
		sadb.setBillNo(Long.parseLong(billNo));
		sadb.setTotalAmt(Double.parseDouble(totalAmt));

		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		System.out.println(dateFormat1.format(dateobj));

		sadb.setInsertDate(dateobj);

		SupplierAccountDetailsDao sadd = new SupplierAccountDetailsDao();
		sadd.supplierAccount(sadb);

	}

	public Map getAllBillBySuppliers(String challanNo) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllBillBySuppliers(challanNo);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			GrDetailsBean bean = new GrDetailsBean();
			bean.setPk_GRDetails_id(Long.parseLong((o[0].toString())));
			//bean.setIdno((o[1].toString()));
			System.out.println("hi my name is kidhor1111111111-++++++++++++++" + (o[1].toString()));
			/*bean.setChalladate((Date) o[2]);*/
			bean.setBillno(Double.parseDouble((o[1].toString())));
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails();
			 * System.out.println(Arrays.toString(o)); String quantity =
			 * o[1].toString(); System.out.println("Quantity is"+quantity);
			 * if(quantity.equals("0.0")){ continue; } else{
			 * bean.setProductName(o[0].toString());
			 * bean.setQuantity(Double.parseDouble(o[1].toString())); }
			 */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getPk_GRDetails_id(), bean);

		}
		return map;
	}

	
	
	
	//get bill by supplier
	public Map getAllBillBySuppliers_new(String challanNo) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllBillBySuppliers(challanNo);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			GrDetailsBean bean = new GrDetailsBean();
			bean.setPk_GRDetails_id(Long.parseLong((o[0].toString())));
			bean.setIdno((o[1].toString()));
			System.out.println("hi my name is kidhor1111111111-++++++++++++++" + (o[1].toString()));
			/*bean.setChalladate((Date) o[2]);*/
			bean.setBillno(Double.parseDouble((o[2].toString())));
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails();
			 * System.out.println(Arrays.toString(o)); String quantity =
			 * o[1].toString(); System.out.println("Quantity is"+quantity);
			 * if(quantity.equals("0.0")){ continue; } else{
			 * bean.setProductName(o[0].toString());
			 * bean.setQuantity(Double.parseDouble(o[1].toString())); }
			 */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getPk_GRDetails_id(), bean);

		}
		return map;
	}
	
	
	
	// Get All Challan No From Outward Details 
	
	public Map getAllChallanBySuppliers(String challanNo) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAlOutwardChallanNoBySuppliers(challanNo);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			OutwardReportBean bean = new OutwardReportBean();
			bean.setPkoutwardid(((o[0].toString())));
			bean.setIdno((o[1].toString()));
			System.out.println("hi my name is kidhor1111111111-++++++++++++++" + (o[1].toString()));
			/*bean.setChalladate((Date) o[2]);*/
			bean.setOutwardchallanno(((o[2].toString())));
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails();
			 * System.out.println(Arrays.toString(o)); String quantity =
			 * o[1].toString(); System.out.println("Quantity is"+quantity);
			 * if(quantity.equals("0.0")){ continue; } else{
			 * bean.setProductName(o[0].toString());
			 * bean.setQuantity(Double.parseDouble(o[1].toString())); }
			 */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getPkoutwardid(), bean);

		}
		return map;
	}
	
	// get product name and Inward Date 
	public Map getAllBillBySuppliersUser(String challanNo) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllBillBySuppliersUser1(challanNo);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);

			InwardBean bean = new InwardBean();
			bean.setProductname(o[0].toString());
			bean.setQuantity(Double.parseDouble(o[1].toString()));
			System.out.println("hi my name is kidhor1111111111-++++++++++++++" + (o[1].toString()));
			/*bean.setChalladate((Date) o[2]);*/
			bean.setInwardDate((o[2].toString()));
			bean.setPk_inward_id(Long.parseLong(o[3].toString()));
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails();
			 * System.out.println(Arrays.toString(o)); String quantity =
			 * o[1].toString(); System.out.println("Quantity is"+quantity);
			 * if(quantity.equals("0.0")){ continue; } else{
			 * bean.setProductName(o[0].toString());
			 * bean.setQuantity(Double.parseDouble(o[1].toString())); }
			 */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getPk_inward_id(), bean);

		}
		return map;
	}

	public Map getAllChallanNoBySuppliers(String supplierId) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllChallanNoBySuppliers(supplierId);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails();
			 * System.out.println(Arrays.toString(o)); String quantity =
			 * o[1].toString(); System.out.println("Quantity is"+quantity);
			 * if(quantity.equals("0.0")){ continue; } else{
			 * bean.setProductName(o[0].toString());
			 * bean.setQuantity(Double.parseDouble(o[1].toString()));
			 * 
			 * } //bean.setTotalAmount((Double)o[1]);
			 * 
			 */
			InwardBean bean = new InwardBean();
			bean.setChallanno(o[0].toString());
			bean.setInwardDate(o[1].toString());

			System.out.println("***************" + o[0]);
			map.put(bean.getChallanno(), bean);

		}
		return map;
	}

	public Map getAllBillBySuppliers1(String supplierId) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllBillBySuppliers1(supplierId);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {

			Object[] o = (Object[]) list.get(i);

			GetSupplierDetails bean = new GetSupplierDetails();

			System.out.println(Arrays.toString(o));
			String quantity = o[1].toString();
			System.out.println("Quantity is++++++++------------*************" + quantity);
			if (quantity.equals("0.0")) {
				continue;
			} else {
				bean.setProductName(o[0].toString());
				// bean.setQuantity(Double.parseDouble(o[1]).toString());
				bean.setQuantity(Double.parseDouble(o[1].toString()));
				System.out.println("hi this is quantity+00000000000+++++++++++++++" + (o[1]));
			}
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getProductName(), bean);

		}
		return map;
	}

	// outward challan no for billing
	public Map getOutwardDetails(String supplierId, String product) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getOutwardDetails(supplierId, product);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			OutwardBean bean = new OutwardBean();
			System.out.println(Arrays.toString(o));
			String quantity = o[1].toString();
			System.out.println("Quantity is" + quantity);
			if (quantity.equals("0.0")) {
				continue;
			} else {
				bean.setOutwardchallanno(o[0].toString());
				bean.setOkquantity(Double.parseDouble(o[1].toString()));
			}
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getOutwardchallanno(), bean);

		}
		return map;
	}

	// inword challan no for billing

	public Map getInwardDetails(String supplierId, String product) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getInwardDetails(supplierId, product);
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			OutwardBean bean = new OutwardBean();
			System.out.println(Arrays.toString(o));
			String quantity = o[1].toString();
			System.out.println("Quantity is" + quantity);
			if (quantity.equals("0.0")) {
				continue;
			} else {
				bean.setChallanNo(o[0].toString());
				bean.setOkquantity(Double.parseDouble(o[1].toString()));
			}
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************" + o[0]);
			map.put(bean.getChallanNo(), bean);

		}
		return map;
	}

	// total amount on cashbook for vendor
	public Map getTotalAmtByBillNo(String billNo1, String supplierId) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getTotalAmtByBillNoForCustomer(billNo1, supplierId);
		Map map = new HashMap();

		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			vendorBeanCashBook bean = new vendorBeanCashBook();
			String newTotal = (o[0].toString());
			Double newTotal1 = Double.valueOf(newTotal);
			bean.setGrossTotal1(Double.parseDouble(o[0].toString()));
			System.out.println("***************" + o[0]);
			map.put(bean.getGrossTotal1(), bean);
		}
		return map;
	}

	// total of cashbook for vendor wise
	public Map getTotalAmtByBillNov(String supplier, String supplierId) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getTotalAmtByBillNoForCustomerv(supplier, supplierId);
		Map map = new HashMap();

		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			vendorBeanCashBook bean = new vendorBeanCashBook();
			String newTotal = (o[0].toString());
			Double newTotal1 = Double.valueOf(newTotal);
			bean.setGrossTotal1(Double.parseDouble(o[0].toString()));
			System.out.println("***************kishor Total is  *************" + o[0]);
			map.put(bean.getGrossTotal1(), bean);
		}
		return map;
	}

/*	public Map getRemainingAmtByBillNo(String billNo, String fk_supplier_id, String totalAmount) {

		System.out.println("bill no = " + billNo);
		System.out.println("supplier = " + fk_supplier_id);

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getbalanceAmtByBillNo(billNo, fk_supplier_id);
		Map map = new HashMap();
		// System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if (sic == 0) {
			
			 * GetSupplierDetails bean = new GetSupplierDetails(); Double
			 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
			 * map.put(bean.getBalance(),bean);
			 

			GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
			Double totalAmt = dao.getTotalAmt(billNo, fk_supplier_id);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(), bean);
		} else {
			for (int i = 0; i < list.size(); i++) {
				Object[] o = (Object[]) list.get(i);
				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				Double newBal = (Double.parseDouble(o[0].toString()));
				System.out.println("hi this is new bala++++++++++++++++++" + (o[0].toString()));

				// Double newBal1 = Double.valueOf(newBal);
				System.out.println(newBal + "NEW BALANCE");

				bean.setBalance(newBal);

				System.out.println("***************" + o[0]);
				map.put(bean.getBalance(), bean);
			}
		}

		return map;
	}*/
	
	public Map getRemainingAmtByBillNo(String billNo1, String fk_supplier_id, String totalAmount) {

		System.out.println("bill no = " + billNo1);
		System.out.println("supplier = " + fk_supplier_id);

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getbalanceAmtByBillNo(billNo1, fk_supplier_id);
		Map map = new HashMap();
		// System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if (sic == 0) {
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails(); Double
			 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
			 * map.put(bean.getBalance(),bean);
			 */

			GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
			Double totalAmt = dao.getTotalAmt(billNo1, fk_supplier_id);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(), bean);
		} else {
			for (int i = 0; i < list.size(); i++) {
				Object[] o = (Object[]) list.get(i);
				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				Double newBal = (Double.parseDouble(o[0].toString()));
				System.out.println("hi this is new bala++++++++++++++++++" + (o[0].toString()));

				// Double newBal1 = Double.valueOf(newBal);
				System.out.println(newBal + "NEW BALANCE");

				bean.setBalance(newBal);

				System.out.println("***************" + o[0]);
				map.put(bean.getBalance(), bean);
			}
		}

		return map;
	}

	// get remaining balance after payment vendor wise
	public Map getRemainingAmtByVendorwise(String billNo, String supplier, String totalAmount) {

		System.out.println("bill no = " + billNo);
		System.out.println("supplier = " + supplier);

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getbalanceAmtByvendor(billNo, supplier);
		Map map = new HashMap();
		// System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if (sic == 0) {
			/*
			 * GetSupplierDetails bean = new GetSupplierDetails(); Double
			 * totalAmt = dao.getTotalAmt(billNo); bean.setBalance(totalAmt);
			 * map.put(bean.getBalance(),bean);
			 */

			GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
			Double totalAmt = dao.getTotalAmtRemainingBalance(billNo, supplier);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(), bean);
		} else {
			for (int i = 0; i < list.size(); i++) {
				Object[] o = (Object[]) list.get(i);
				System.out.println("hi this is kishor22222222++++++++++ " + list.size());
				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				Double newBal = (Double.parseDouble(o[0].toString()));
				System.out.println("hi this is new balance 1212++++++++++++++++++" + (o[0].toString()));

				// Double newBal1 = Double.valueOf(newBal);
				System.out.println(newBal + "NEW BALANCE");

				bean.setBalance(newBal);

				System.out.println("***************" + o[0]);
				map.put(bean.getBalance(), bean);
			}
		}

		return map;
	}

	// bamace get by vendor name wise
	public Map getRemainingAmtByBillNov(String billNo, String supplier, String totalAmount,String fk_supplier_id) {
		/*Double total = 0.0;*/

		System.out.println("bill no = " + billNo);
		System.out.println("supplier ======================================= " + supplier);

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getbalanceAmtByBillNov(billNo, supplier, totalAmount,fk_supplier_id);
		Map map = new HashMap();
		// System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if (sic == 0) {
			System.out.println("in firsrt if");
			GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
			Double totalAmt = dao.getTotalAmtv(billNo, supplier, totalAmount);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(), bean);
		} else {
			System.out.println("in firsrt else");
			for (int i = 0; i < list.size(); i++) {
				System.out.println("in firsrt for");
				System.out.println("this is i value   " + i + "and list size " + list.size());
			//	Object[] o = (Object[]) list.get(i);
				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				String str = list.get(i).toString();
				Double newBal = Double.valueOf(str);
				/*Double totalamount = (Double.parseDouble(o[2].toString()));*/

				/*
				 * if (supplier.equals(supplier)) {
				 * System.out.println("hi this is kishor in if "); total =
				 * newBal + totalamount;
				 * 
				 * bean.setBalance(total);
				 * 
				 * 
				 * 
				 * 
				 * } else {
				 */
				System.out.println("hi this is kishor in else   ");

				bean.setBalance(newBal);

				/* } */
			//	System.out.println("***************" + o[0]);
				map.put(bean.getBalance(), bean);
			}
		}

		return map;
	}

	public Map getYesterdarTotalAmount() {
		// TODO Auto-generated method stub
		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getYesterdarTotalAmount();
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			CashBankBookDataDateWise bean = new CashBankBookDataDateWise();
			System.out.println(Arrays.toString(o));
			// bean.setBillNo(o[0].toString());
			bean.setTotalAmount(Double.parseDouble(o[1].toString()));
			// bean.setTotalAmount((Double)o[1]);
			// System.out.println("***************"+o[0]);
			map.put(bean.getTotalAmount(), bean);

		}
		return map;
	}

	public void creditDebitAmount() {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getYesterdarTotalAmount();

		if (list.size() == 0) {

			String yesterday = null;
			final Calendar cal = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			cal.add(Calendar.DATE, -1);
			yesterday = dateFormat.format(cal.getTime());
			System.out.println("Yesterday Date ===+++ " + yesterday);

			CashBankBookDataDateWise cs = new CashBankBookDataDateWise();

			cs.setDate(yesterday);
			cs.setTotalAmount(0.0d);

			SupplierAccountDetailsDao doa = new SupplierAccountDetailsDao();
			doa.registeryesterdayTotal(cs);
			// List list1= dao.getYesterdaySuppCredit(yesterday);

		} else {
			for (int i = 0; i < list.size(); i++) {
				Object[] o = (Object[]) list.get(i);
				/*
				 * TadayRemainingBalance bean = new TadayRemainingBalance();
				 * System.out.println(Arrays.toString(o));
				 * bean.setDate(o[0].toString());
				 * bean.setTotalAmt(Double.parseDouble(o[1].toString()));
				 */

				String yesDate = o[0].toString();
				Double yesTotal = Double.parseDouble(o[1].toString());

				/*
				 * SimpleDateFormat dateFormat1 = new
				 * SimpleDateFormat("yyyy-MM-dd"); Date dateobj = new Date();
				 * System.out.println(dateFormat1.format(dateobj)); String
				 * currDate = dateFormat1.format(dateobj);
				 */

				String yesterday = null;
				final Calendar cal = Calendar.getInstance();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				cal.add(Calendar.DATE, -1);

				yesterday = dateFormat.format(cal.getTime());

				System.out.println("Yesterday Datjhgjhe ===+++ " + yesterday);

				if (yesDate.equals(yesterday)) {

					System.out.println("hello shreemant");
					break;

				} else {
					// List list2= dao.getDiffBetDates();
					String credit = "credit";
					String debit = "debit";
					SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
					Date dateobj = new Date();
					String todayDate = dateFormat1.format(dateobj);
					System.out.println("Today Date :::: " + todayDate);
					HibernateUtility hbu = HibernateUtility.getInstance();
					Session session = hbu.getHibernateSession();

					Query query = session
							.createSQLQuery("select onDate , DATEDIFF(:todayDate,:yesDate) from cashbankbooktable");

					query.setParameter("yesDate", yesDate);
					query.setParameter("todayDate", todayDate);
					List<Object[]> list1 = query.list();
					String diff = null;
					for (Object[] objects : list1) {

						diff = (objects[1].toString());
						System.out.println("date Difference is ==++ " + diff);

					}
					Integer datediff = Integer.parseInt(diff);

					for (int j = 1; j < datediff; j++) {

						String diffDate = null;
						int abc = datediff - j;
						System.out.println("shree == ++" + abc);
						final Calendar calc = Calendar.getInstance();
						SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
						calc.add(Calendar.DATE, -abc);
						diffDate = dateFormat2.format(calc.getTime());
						System.out.println("diff Dates ::::  " + diffDate);

						Query query1 = session.createSQLQuery(
								"select bill_no, sum(payment) from supplier_payment where paymentType=:credit and insert_date=:diffDate");

						query1.setParameter("credit", credit);
						query1.setParameter("diffDate", diffDate);
						Double suppTotal = 0d;
						List<Object[]> list2 = query1.list();
						// String diff = null;
						for (Object[] objects : list2) {
							System.out.println("objects  ==  " + Arrays.toString(objects));
							System.out.println("Size  ==  " + list2.size());
							if (objects[1] == null) {
								suppTotal = 0.0d;
							} else {
								suppTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Supplier Credit Amount ==++ " + suppTotal);
						}

						Query query2 = session.createSQLQuery(
								"select fk_employee_id, sum(payment) from employee_payment where paymentType=:credit and insert_date=:diffDate");

						query2.setParameter("credit", credit);
						query2.setParameter("diffDate", diffDate);
						Double empTotal = 0d;
						List<Object[]> list3 = query2.list();
						// String diff = null;
						for (Object[] objects : list3) {

							if (objects[1] == null) {
								empTotal = 0.0d;
							} else {
								empTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Employee Credit Amount ==++ " + empTotal);
						}

						Query query3 = session.createSQLQuery(
								"select bill_no, sum(payment) from credit_customer_payment where paymentType=:credit and insert_date=:diffDate");

						query3.setParameter("credit", credit);
						query3.setParameter("diffDate", diffDate);
						Double custTotal = 0d;
						List<Object[]> list4 = query3.list();
						// String diff = null;
						for (Object[] objects : list4) {

							if (objects[1] == null) {
								custTotal = 0.0d;
							} else {
								custTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Customer Credit Amount ==++ " + custTotal);
						}

						Query query4 = session.createSQLQuery(
								"select fk_expense_detail_id, sum(credit) from expenditure_payment where insert_date=:diffDate");

						query4.setParameter("diffDate", diffDate);
						Double expanTotal = 0.0d;
						List<Object[]> list5 = query4.list();
						// String diff = null;
						for (Object[] objects : list5) {

							if (objects[1] == null) {
								expanTotal = 0.0d;
							} else {
								expanTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("expandecture Credit Amount ==++ " + expanTotal);
						}

						Query query5 = session.createSQLQuery(
								"select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from fertilizer_billing where insert_date=:diffDate");

						query5.setParameter("diffDate", diffDate);
						Double saleTotal = 0d;
						List<Object[]> list6 = query5.list();
						// String diff = null;
						for (Object[] objects : list6) {

							if (objects[1] == null) {
								saleTotal = 0.0d;
							} else {
								saleTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("fertilizer Sale Amount ==++ " + saleTotal);
						}

						Query query6 = session.createSQLQuery(
								"select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from seed_pesticide_billing where insert_date=:diffDate");

						query6.setParameter("diffDate", diffDate);
						Double saleTotal1 = 0.0d;
						List<Object[]> list7 = query6.list();
						// String diff = null;
						for (Object[] objects : list7) {

							if (objects[1] == null) {
								saleTotal1 = 0.0d;
							} else {
								saleTotal1 = Double.parseDouble(objects[1].toString());
							}
							System.out.println("seed Pestiside Amount ==++ " + saleTotal1);
						}

						Query query10 = session.createSQLQuery(
								"select bill_no, sum(payment) from supplier_payment where paymentType=:debit and insert_date=:diffDate");

						query10.setParameter("debit", debit);
						query10.setParameter("diffDate", diffDate);
						Double suppdebitTotal = 0.0d;
						List<Object[]> list10 = query10.list();
						// String diff = null;
						for (Object[] objects : list10) {

							if (objects[1] == null) {
								suppdebitTotal = 0.0d;
							} else {
								suppdebitTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Supplier debit Amount ==++ " + suppdebitTotal);
						}

						Query query11 = session.createSQLQuery(
								"select fk_employee_id, sum(payment) from employee_payment where paymentType=:debit and insert_date=:diffDate");

						query11.setParameter("debit", debit);
						query11.setParameter("diffDate", diffDate);
						Double empdebitTotal = 0.0d;
						List<Object[]> list11 = query11.list();
						// String diff = null;
						for (Object[] objects : list11) {

							if (objects[1] == null) {
								empdebitTotal = 0.0d;
							} else {
								empdebitTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Employee debit Amount ==++ " + empdebitTotal);
						}

						Query query12 = session.createSQLQuery(
								"select bill_no, sum(payment) from credit_customer_payment where paymentType=:debit and insert_date=:diffDate");

						query12.setParameter("debit", debit);
						query12.setParameter("diffDate", diffDate);
						Double custdebitTotal = 0.0d;
						List<Object[]> list12 = query12.list();
						// String diff = null;
						for (Object[] objects : list12) {

							if (objects[1] == null) {
								custdebitTotal = 0.0d;
							} else {
								custdebitTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("Customer debit Amount ==++ " + custdebitTotal);
						}

						Query query13 = session.createSQLQuery(
								"select fk_expense_detail_id, sum(debit) from expenditure_payment where insert_date=:diffDate");

						query13.setParameter("diffDate", diffDate);
						Double expandebitTotal = 0d;
						List<Object[]> list13 = query13.list();
						// String diff = null;
						for (Object[] objects : list13) {

							if (objects[1] == null) {
								expandebitTotal = 0.0d;
							} else {
								expandebitTotal = Double.parseDouble(objects[1].toString());
							}
							System.out.println("expandecture debit Amount ==++ " + expandebitTotal);
						}

						Query query7 = session.createSQLQuery(
								"SELECT onDate , totalAmount FROM cashbankbooktable ORDER BY pkLastCashId DESC LIMIT 1");

						Double previousTotal = 0.0d;
						List<Object[]> list8 = query7.list();
						// String diff = null;
						for (Object[] objects : list8) {

							previousTotal = Double.parseDouble(objects[1].toString());

							System.out.println("seed Pestiside Amount ==++ " + saleTotal1);
						}

						Double finalTotal = (previousTotal + saleTotal1 + saleTotal + suppdebitTotal + empdebitTotal
								+ custdebitTotal + expandebitTotal) - (suppTotal + empTotal + custTotal + expanTotal);

						CashBankBookDataDateWise cs1 = new CashBankBookDataDateWise();

						cs1.setDate(diffDate);
						cs1.setTotalAmount(finalTotal);

						SupplierAccountDetailsDao doa = new SupplierAccountDetailsDao();
						doa.registeryesterdayTotal(cs1);
					}

				}

			}
		}
	}

	public Map getTodaySaleTotalAmount() {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getTodaySaleTotalAmount();
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			CashBankBookDataDateWise bean = new CashBankBookDataDateWise();
			System.out.println(Arrays.toString(o));

			if (o[1] == null) {
				bean.setTotalAmount(0.0d);
			} else {
				bean.setTotalAmount(Double.parseDouble(o[1].toString()));
			}

			map.put(bean.getTotalAmount(), bean);

		}
		return map;
	}

	public Map getTodaySaleTotalAmount1() {
		// TODO Auto-generated method stub
		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getTodaySaleTotalAmount1();
		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			CashBankBookDataDateWise bean = new CashBankBookDataDateWise();
			System.out.println(Arrays.toString(o));
			if (o[1] == null) {
				bean.setTotalAmount(0.0d);
			} else {
				bean.setTotalAmount(Double.parseDouble(o[1].toString()));
			}
			map.put(bean.getTotalAmount(), bean);

		}
		return map;
	}

	// get all vendor bill no by vendor name
	public Map getAllVendorBillNo(String fk_supplier_id) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllVendorBillNo(fk_supplier_id);
		Map map = new HashMap();
		System.out.println("map++++++++++++++" + map);
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			CustomerBillBean1 bean = new CustomerBillBean1();
			System.out.println(Arrays.toString(o));

			/*
			 * String pendingBal = o[0].toString(); if
			 * (pendingBal.equals("0.0")) { continue;
			 * 
			 * }
			 */ /* else { */
			bean.setBillNo(((o[0].toString())));
			bean.setPk_customer_id(Long.parseLong(o[2].toString()));
			/* } */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************hi this is kishor" + o[0]);
			map.put(bean.getBillNo(), bean);
		}
		return map;
	}

	// for bill copy

	public Map getAllVendorBillNo1(String supplier) {

		SupplierAccountDetailsDao dao = new SupplierAccountDetailsDao();
		List list = dao.getAllVendorBillNo1(supplier);
		Map map = new HashMap();
		System.out.println("map++++++++++++++" + map);
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			CustomerBillBean1 bean = new CustomerBillBean1();
			System.out.println(Arrays.toString(o));

			/*
			 * String pendingBal = o[0].toString(); if
			 * (pendingBal.equals("0.0")) { continue;
			 * 
			 * }
			 */ /* else { */
			bean.setBillNo1(o[0].toString());
			bean.setPk_customer_id(Long.parseLong(o[2].toString()));
			/* } */
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************hi this is kishor" + o[0]);
			map.put(bean.getBillNo1(), bean);
		}
		return map;
	}

	public void VendorBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("BillNum");

		System.out.println("----------------Credit cust Bill No before session create::" + billNo);

		HttpSession session3 = request.getSession();

		/*Long billNo2 = Long.parseLong(billNo);*/
		
		

		session3.setAttribute("VendorBillNo", billNo);

		System.out.println(
				"----------------Credit cust Bill No before session create::" + session3.getAttribute("VendorBillNo"));

	}

}
