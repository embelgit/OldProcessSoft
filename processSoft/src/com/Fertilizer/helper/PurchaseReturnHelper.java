package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.PoDetailsDao;
import com.Fertilizer.dao.PurchaseReturnDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.GrDetailsBean;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.OutwardReturn;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.PurchaseReturn;
import com.Fertilizer.utility.HibernateUtility;

public class PurchaseReturnHelper {

	// to purchase Return
	public void returntPurchaseGood(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		Integer count = Integer.parseInt(request.getParameter("count"));
		for (int i = 0; i < count; i++) {
			String pk_GRDetails_id = request.getParameter("pk_GRDetails_id" + i);
			String productname = request.getParameter("productname" + i);
			String operation = request.getParameter("operation" + i);
			String quantity = request.getParameter("quantity" + i);
			String rate = request.getParameter("rate" + i);
			String discount = request.getParameter("discount" + i);
			String gst = request.getParameter("gst" + i);
			String igst = request.getParameter("igst" + i);
			String taxAmount = request.getParameter("TaxAmount" + i);
			String unit = request.getParameter("unit" + i);
			String Quantity1 = request.getParameter("Quantity1" + i);
			String gridTotal = request.getParameter("GridTotal" + i);
			String grossTotal = request.getParameter("grosstotal" + i);
			String idno = request.getParameter("idno" + i);
			String suppliername = request.getParameter("supplier");
			String billno = request.getParameter("bill_no");
			String PurReturndate = request.getParameter("Challandate");
			
			System.out.println("pk_GRDetails_id==" + pk_GRDetails_id);
			System.out.println("productname==" + productname);
			System.out.println("operation==" + operation);
			System.out.println("quantity==" + quantity);
			System.out.println("rate==" + rate);
			System.out.println("discount==" + discount);
			System.out.println("gst==" + gst);
			System.out.println("TaxAmount==" + taxAmount);		
			System.out.println("unit==" + unit);
			System.out.println("Quantity1 new1==" + Quantity1);
			System.out.println("Grid TOtal==" + gridTotal);
			System.out.println("GrossTotal==" + grossTotal);
			System.out.println("Hi this is Bill==" + billno);
			System.out.println("PurReturndate==" + PurReturndate);
			
			PurchaseReturnDao dao1 = new PurchaseReturnDao();
			List<GrDetailsBean> ChallanNoIPList=null;
    			ChallanNoIPList =dao1.getQuantity(billno, productname);
    			//int size = ChallanNoIPList.size();
    			
    			double billnoDB = 0d;
    			String productnameDB = "";
    			Double oldQuantityDB = 0d;
    			Long pk_GRDetails_idDB = 0l;
    			
    			for(int i1=0;i1<ChallanNoIPList.size();i1++){
    				
    				GrDetailsBean inwardBean = (GrDetailsBean)ChallanNoIPList.get(i1);
    				
    				pk_GRDetails_idDB = inwardBean.getPk_GRDetails_id();
    				billnoDB =  inwardBean.getBillno();
    				productnameDB = inwardBean.getProductname();
    				oldQuantityDB = inwardBean.getQuantity();
    				System.out.println("In HELPER Start 5 pk_GRDetails_idDB :-"+pk_GRDetails_idDB);
    				System.out.println("In HELPER Start 5 billnoDB :-"+billnoDB);
    				System.out.println("In HELPER Start 5 productnameDB :-"+productnameDB);
    				System.out.println("In HELPER Start 5 oldQuantityDB :-"+oldQuantityDB);
    			}
    			
    			Double updateQuantity = 0d;
    			Double newQuantity = 0d;
    			newQuantity = Double.parseDouble(Quantity1);
    			double d = 1234.56;
    			long billnoDBLong = (long) billnoDB; // x = 1234
    			String billnoDBString = Long.toString(billnoDBLong);
    			System.out.println("In HELPER Start 7 billnoDBLong = "+billnoDBLong);
    			System.out.println("In HELPER Start 7 billnoDBString = "+billnoDBString);    			
    			System.out.println("In HELPER Start 7 billno = "+billno);
    			System.out.println("In HELPER Start 7 productname = "+productname);
    			System.out.println("In HELPER Start 7 productnameDB = "+productnameDB);
    			
    			//if(billno == billnoDBString && productname == productnameDB) {
    			if(billno.equals(billnoDBString) && productname.equals(productnameDB)) {
    				System.out.println("In HELPER Update Quantity Start 0");
    				
    				updateQuantity = oldQuantityDB - newQuantity;
    				
    				HibernateUtility hbu = HibernateUtility.getInstance();
              		Session session2 = hbu.getHibernateSession();
              		org.hibernate.Transaction transaction = session2.beginTransaction();
              	
              		GrDetailsBean updateStock = (GrDetailsBean) session2.get(GrDetailsBean.class, new Long(pk_GRDetails_idDB));
              		
              		updateStock.setQuantity(updateQuantity);
              		
              		session2.saveOrUpdate(updateStock);
              		transaction.commit();
    				System.out.println("In HELPER Updated Quantity End 1");
    			}
			
			
			
			
			PurchaseReturn bean = new PurchaseReturn();

			// bean.setPk_purchase_return_id(Long.parseLong(pkGRDetailsid));
			bean.setFk_gr_id(Long.parseLong(pk_GRDetails_id));
			

			if(!"".equals(billno)){
				bean.setBillno(Long.parseLong(billno));
			} else {
				bean.setBillno(0l);
			}
			if(!"".equals(productname)){
				bean.setProductname(productname);
			} else {
				bean.setProductname("N/A");
			}
			if(!"".equals(operation)){
				bean.setOperation(operation);
			} else {
				bean.setOperation("N/A");
			}
			if(!"".equals(quantity)){
				bean.setQuantity(Double.parseDouble(quantity));
			} else {
				bean.setQuantity(0.0);
			}
			if(!"".equals(rate)){
				bean.setRate(rate);
			} else {
				bean.setRate("0.0");
			}
			if(!"".equals(discount)){
				bean.setDiscount(Double.parseDouble(discount));
			} else {
				bean.setDiscount(0.0);
			}
			if(!"".equals(gst)){
				bean.setGst(Double.parseDouble(gst));
			} else {
				bean.setGst(0.0);
			}
//			if(!"".equals(igst)){
//				bean.setIgst(Double.parseDouble(igst));
//			} else {
//				bean.setIgst(0.0);
//			}
			if(!"".equals(taxAmount)){
				bean.setTaxAmount(Double.parseDouble(taxAmount));
			} else {
				bean.setTaxAmount(0.0);
			}
			if(!"".equals(unit)){
				bean.setUnit(unit);
			} else {
				bean.setUnit("N/A");
			}
			if(!"".equals(Quantity1)){
				bean.setQuantity1(Double.parseDouble(Quantity1));
			} else {
				System.out.println("in Else Quantity1");
				bean.setQuantity1(0.0);
			}
			if(!"".equals(suppliername)){
				bean.setSuppliername(suppliername);
			} else {
				bean.setSuppliername("N/A");
			}
			if(!"".equals(idno)){
				bean.setIdno(idno);
			} else {
				bean.setIdno("N/A");
			}
						
			Date date1 = null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date1 = df.parse(PurReturndate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			bean.setDate(date1);

//			if(!"".equals(gridTotal)){
//				bean.setGridTotal(Double.parseDouble(gridTotal));
//			} else {
//				bean.setGridTotal(0.0);
//			}
			if(!"".equals(grossTotal)){
				bean.setGrossTotal(Double.parseDouble(grossTotal));
			} else {
				bean.setGrossTotal(0.0);
			}
			
//			bean.setProductname(productname);
//			bean.setOperation(operation);
//			bean.setQuantity(Double.parseDouble(quantity));
//			bean.setRate(rate);
			// add this to field
			//bean.setDiscount(Double.parseDouble(discount));
//			bean.setGst(Double.parseDouble(gst));
			//bean.setTaxAmount(TaxAmount);
			//bean.getPurchase_date();
			// bean.setReturn_amount(Double.parseDouble(return_amount));
			// bean.setIgst(Double.parseDouble(igst));
			//bean.setTaxAmount(TaxAmount);
			//bean.setUnit(unit);
//			bean.setQuantity1(Double.parseDouble(Quantity1));
			//bean.setGridTotal(Double.parseDouble(GridTotal));
			//bean.setQuantity1(Double.parseDouble(Quantity1));

			// bean.setPk_GRDetails_id(Long.parseLong(pkGRDetailsid));
//			bean.setSuppliername(suppliername);

			

			
//			bean.setSuppliername(((suppliername)));
			
			/// bean.setCity(city);
			// bean.setGstno(tinNo);
			//bean.setBillno(Double.parseDouble(billno));
			// bean.setAddress(address);
			// bean.setShopName(shopName);
			// bean.setTotal(Double.parseDouble(total));
			//bean.setGrosstotal(Double.parseDouble(grosstotal));

			PurchaseReturnDao sdo = new PurchaseReturnDao();
			sdo.valPurchaseReturn(bean);

			/*
			 * HibernateUtility hbu=null; Session session = null; Transaction transaction =
			 * null;
			 * 
			 * hbu = HibernateUtility.getInstance(); session = hbu.getHibernateSession();
			 * transaction = session.beginTransaction();
			 * 
			 * 
			 * //long customerId = Long.parseLong(customerId); long GridID
			 * =Long.parseLong(pk_GRDetails_id); Double Quan1
			 * =Double.parseDouble(Quantity1);
			 * System.out.println("hi THis is Quan1=="+Quan1); Double Quan
			 * =Double.parseDouble(quantity);
			 * System.out.println("Hi this is New Quan=="+Quan);
			 * 
			 * double NewQuantity = (Quan) - (Quan1);
			 * System.out.println(" Hi this is New NewQuantity===="+NewQuantity); //Double
			 * qunty = st.getStock(); //System.out.println("qunty==="+qunty); //Double
			 * quantity =0.0; //Double Quantity1 = 0.0; //Double updatequnty = (double)
			 * (quantity - Double.parseDouble(Quantity1));
			 * //System.out.println("hi this is updatequnty=="+updatequnty);
			 * 
			 * GrDetailsBean det = (GrDetailsBean) session.get(GrDetailsBean.class, GridID);
			 * 
			 * det.setPk_GRDetails_id(Long.parseLong(pk_GRDetails_id));
			 * det.setProductname(productname); //det.setOperation((operation));
			 * det.setQuantity((NewQuantity)); //det.setRate(Double.parseDouble(rate));
			 * //det.setDiscount(Double.parseDouble((discount)));
			 * //det.setGst(Double.parseDouble(gst));
			 * //det.setIgst(Double.parseDouble(igst)); //det.setTaxAmount((TaxAmount));
			 * //det.setUnit(unit); //det.setGridTotal(Double.parseDouble(GridTotal));
			 * //det.setGrosstotal(Double.parseDouble(grosstotal));
			 * det.setQuantity1(Quantity1); //det.setIdno(idno);
			 * 
			 * 
			 * session.saveOrUpdate(det); transaction.commit();
			 * 
			 * 
			 * HibernateUtility hbu1 = HibernateUtility.getInstance(); Session session1 =
			 * hbu1.getHibernateSession();
			 * 
			 * 
			 * GoodsReceiveDao dao1 = new GoodsReceiveDao(); List stkList2 =
			 * dao1.getAllInwardEntryPurchaseReurn();
			 * 
			 * Transaction transaction1 = session1.beginTransaction();
			 * 
			 * System.out.println("List size"+stkList2.size());
			 * 
			 * for(int j=0;j<stkList2.size();j++){
			 * 
			 * GrDetailsBean st = (GrDetailsBean)stkList2.get(j); Double
			 * bill=st.getBillno(); System.out.println("Hi this Challan NO===="+bill);
			 * String productname1 =st.getProductname();
			 * System.out.println(" Hi this is productname1== "+productname1); Long
			 * pk_goods_receive_id=st.getPk_GRDetails_id();
			 * System.out.println("HI this is pk_goods_receive_id== "+pk_goods_receive_id);
			 * //Double DupQty =st.getDupQuantity();
			 * //System.out.println(" Hi this is Duplicate Qty==="+DupQty);
			 * 
			 * 
			 * if(billno.equals(bill) && productname.equals(productname1)){
			 * 
			 * System.out.println("inside if"); Double rate1 =st.getRate();
			 * 
			 * String productname2 =st.getProductname();
			 * System.out.println(" Hi this is Duplicate Qty1111==="+productname1); Double
			 * quantity1 =st.getQuantity();
			 * System.out.println("Hi this quantity1=="+quantity1); Double Total =
			 * st.getTotal(); System.out.println("Hi TOtal IS =="+Total); Double gTotal =
			 * st.getGrosstotal(); System.out.println("HI this gTotal "+gTotal); Double Dis
			 * =st.getDiscount(); Double GST =st.getGst(); Double IGST =st.getIgst(); Double
			 * GRDTotal =st.getGridTotal(); String TXAmt = st.getTaxAmount();
			 * 
			 * Double dupQuantity=st.getDupQuantity(); Double
			 * Okqnt=Double.parseDouble(okquantity); Double
			 * rjqnt=Double.parseDouble(rejectedquantity); Double
			 * upqnt=Double.parseDouble(unprocessquantity);
			 * 
			 * GrDetailsBean updateStock = (GrDetailsBean) session.get(GrDetailsBean.class,
			 * new Long(pk_goods_receive_id)); double GridTotal1= (GRDTotal) -
			 * (Double.parseDouble(GridTotal)); updateStock.setGridTotal(GridTotal1);
			 * //String TaXamt =(TXAmt)- (TaxAmount);
			 * updateStock.setTaxAmount(String.valueOf(Double.parseDouble(TXAmt)-Double.
			 * parseDouble(TaxAmount))); //updateStock.setIgst(Double.parseDouble(igst));
			 * updateStock.setGst(Double.parseDouble(gst));
			 * updateStock.setDiscount((Double.parseDouble(discount))); double newTotal =
			 * (gTotal) - (Double.parseDouble(GridTotal));
			 * System.out.println(" Hi this is newTotal=="+newTotal);
			 * updateStock.setTotal(newTotal);
			 * 
			 * double newGrosssTotal = (gTotal) - (Double.parseDouble(GridTotal));
			 * System.out.println(" Hi this is newGrosssTotal=="+newGrosssTotal);
			 * updateStock.setGrosstotal(newGrosssTotal); //double updateQuantity =
			 * (DupQty1) + (Double.parseDouble(Quantity1)) ;
			 * //System.out.println(" hi this is updateQuantity=="+updateQuantity);
			 * ////updateStock.setDupQuantity(updateQuantity);
			 * 
			 * 
			 * session1.saveOrUpdate(updateStock);
			 * System.out.println(" hi this is kishor +++++0222222222222++++"+updateStock);
			 * //transaction.commit(); if (!transaction1.wasCommitted())
			 * transaction1.commit(); } }
			 */

		}

	}

	// Get Purchase Vendor Wise
	public List PurchaseReturnVendorNameWise(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String vendorName = request.getParameter("vendorName");
		System.out.println(" Hi this is vendorName === " + vendorName);
		String billNo = request.getParameter("billNo");
		System.out.println(" Hi this is billNo === " + billNo);
		// String GridTotal =request.getParameter("GridTotal");
		System.out.println("{{}}{{" + vendorName);
		PurchaseReturnDao dao = new PurchaseReturnDao();
		List<PurchaseReturnBean> expList = dao.PurchaseReturnVendorNameWise1(billNo, vendorName);
		System.out.println("?????????????????????????}}}}}}}}}}" + expList);
		return expList;
	}

	// get purchase Return Range Wise
	public List PoReturnReportAsPerRangeWise(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String VendorName = request.getParameter("VendorName1");
		System.out.println(" Hi this is VendorName === " + VendorName);
		String fisDate = request.getParameter("fisDate");
		System.out.println(" Hi this is VendorName === " + fisDate);
		String endDate = request.getParameter("endDate");
		// String GridTotal =request.getParameter("GridTotal");
		System.out.println("{{}}{{" + VendorName);
		PurchaseReturnDao dao = new PurchaseReturnDao();
		List<PurchaseReturnBean> expList = dao.PoReturnReportAsPerRangeWise1(VendorName, fisDate, endDate);
		System.out.println("?????????????????????????}}}}}}}}}}" + expList);
		return expList;
	}

	// get all Vendor Name Wise
	public List PoReturnReportAsPerVendorNameWise1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String VendorName = request.getParameter("VendorName2");
		// System.out.println(" Hi this is VendorName === "+VendorName);
		// String fisDate = request.getParameter("fisDate");
		// System.out.println(" Hi this is VendorName === "+fisDate);
		// String endDate = request.getParameter("endDate");
		// String GridTotal =request.getParameter("GridTotal");
		System.out.println("{{}}{{" + VendorName);
		PurchaseReturnDao dao = new PurchaseReturnDao();
		List<PurchaseReturnBean> expList = dao.PoReturnReportAsPerVendorNameWise2(VendorName);
		System.out.println("?????????????????????????}}}}}}}}}}" + expList);
		return expList;
	}

}
