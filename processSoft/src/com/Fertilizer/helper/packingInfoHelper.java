package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.PoGridBean;
import com.Fertilizer.bean.SupplierGridBean1;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.PackingInfoDao;
import com.Fertilizer.dao.PoDetailsDao;
import com.Fertilizer.dao.SupplierAccountDetailsDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.UserDetailsBean;
import com.Fertilizer.utility.HibernateUtility;


public class packingInfoHelper {

	
	public void addowd(HttpServletRequest request,
			HttpServletResponse response) throws ParseException {
		
		/*start Session code For Shop Name*/		
		HttpSession sessionv = request.getSession(true);
		 String type1= "";
         String name1 = "";
         String shopName = "";
         if (sessionv != null) {

         if (sessionv.getAttribute("user") != null) {
	     name1 = (String) sessionv.getAttribute("user");
	     System.out.println("session name+++++"+name1);
          HibernateUtility hbu1=HibernateUtility.getInstance();
          Session session2=hbu1.getHibernateSession();
          org.hibernate.Query query1 = session2.createQuery("from UserDetailsBean where userName =:usr");
          query1.setParameter("usr", name1);
          UserDetailsBean userDetail1 = (UserDetailsBean) query1.uniqueResult();
          type1 = userDetail1.getUserName();
          System.out.println("type in session "+type1);
          shopName = userDetail1.getShopName();
          System.out.println("Shop Name In Session by Vikas  "+shopName);
         }
		
         }
		

  		/*end Session code For Shop Name*/	
			
		System.out.println("In helper");
		PackingInfoDao dao=new PackingInfoDao();
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		System.out.println(count);
		
		OutwardBean bean=new OutwardBean();
		
		for(int i =0 ; i< count;i++)
		{
			String productName = request.getParameter("productName"+i);
			String hsn = request.getParameter("hsn"+i);
			String Operation = request.getParameter("operation"+i);
			String okquantity = request.getParameter("okquantity"+i);
			String rejectedquantity = request.getParameter("rejectedquantity"+i);
			String unprocessquantity = request.getParameter("unprocessquantity"+i);
			
			String buyPrice = request.getParameter("buyPrice"+i);
			String description = request.getParameter("description"+i);
			String dupQuantityinward = request.getParameter("dupQuantity"+i);
			System.out.println("hi this isdupQuantityinward=="+dupQuantityinward);
			String GridTotal = request.getParameter("Total"+i);
			System.out.println(" hi this is kishor ===========-----"+GridTotal);
			
			
			String suppliername = request.getParameter("supplierName");
			String outwardDate = request.getParameter("outwardDate");		
			String challanNo = request.getParameter("challanNo");
			String inwardDate = request.getParameter("inwardDate");
			String outwardchallanno = request.getParameter("outwardchallanno");
			//String productName1 = request.getParameter("productName");
			String total = request.getParameter("total");
			String grossTotal = request.getParameter("grossTotal");
			String vechicleNo = request.getParameter("vechicleNo");
			String Description = request.getParameter("Description");
			String tinNo = request.getParameter("tinNo");
			String IdNo = request.getParameter("IdNo");
			//String ShopName = request.getParameter("ShopName");
			
			
			System.out.println("hi this is vikas in Helper vendor code"+IdNo);
			
			
			bean.setProductName(productName);
			bean.setOkquantity(Double.parseDouble(okquantity));
			bean.setRejectedquantity(Double.parseDouble(rejectedquantity));
			bean.setUnprocessquantity(Double.parseDouble(unprocessquantity));
			bean.setBuyPrice(Double.parseDouble(buyPrice));
			bean.setHsn(hsn);
			bean.setDescription(description);
			bean.setGridTotal(Double.parseDouble(GridTotal));
			bean.setBoxDescripation(Description);
			bean.setVechicleNo(vechicleNo);
			bean.setSuppliername(suppliername);
			bean.setTinNo(tinNo);
			bean.setIdNo(IdNo);
			bean.setOperation(Operation);
            bean.setShopName(shopName);
            bean.setDupQuantity(dupQuantityinward);
            
            
			Date  date1=null;
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			date1 = df1.parse(inwardDate);
			
			
			Date  date2=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date2 = df.parse(outwardDate);
			
			
			//bean.setChalladate(date1);
			bean.setOutwardDate(date2);
			bean.setChallanNo(challanNo);
			bean.setInwardDate(date1);
			bean.setOutwardchallanno(outwardchallanno);
			bean.setTotal(Double.parseDouble(total));
			bean.setGrosstotal(Double.parseDouble(grossTotal));
			
			HttpSession billNoSession = request.getSession();
			billNoSession.setAttribute("fertilizerBillNo",outwardchallanno);
			billNoSession.setAttribute("creditCustomerName1",suppliername);
			
			System.out.println("---------Bill No for pdf in session::"+ outwardchallanno + "----------------");
			
			HibernateUtility hbu = HibernateUtility.getInstance();
			Session session = hbu.getHibernateSession();
			
			
			GoodsReceiveDao dao1 = new GoodsReceiveDao();
	        List stkList2  = dao1.getAllInwardEntry();
	        
	        Transaction transaction = session.beginTransaction();
	        
	        System.out.println("List size"+stkList2.size());
			
	        for(int j=0;j<stkList2.size();j++){
	        	
	        InwardBean st = (InwardBean)stkList2.get(j);
			String bill=st.getChallanno();
			String productname =st.getProductname();
			Long pk_goods_receive_id=st.getPk_inward_id();
			
			
			if(challanNo.equals(bill) && productName.equals(productname)){
			
			System.out.println("inside if");
			Double dupQuantity=st.getDupQuantity();
			Double Okqnt=Double.parseDouble(okquantity);
			Double rjqnt=Double.parseDouble(rejectedquantity);
			Double upqnt=Double.parseDouble(unprocessquantity);
				
			InwardBean updateStock = (InwardBean) session.get(InwardBean.class, new Long(pk_goods_receive_id));
			double updateQuantity=dupQuantity - Okqnt - rjqnt - upqnt;
			updateStock.setDupQuantity(updateQuantity);
			
    		 
    		session.saveOrUpdate(updateStock);
    		System.out.println(" hi this is kishor +++++0222222222222++++"+updateStock);
    		//transaction.commit();
    		if (!transaction.wasCommitted())
    			transaction.commit();
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
	        
			dao.valOwDetails(bean);
		}
		
	
}
	public List getProductInGridOnSupplierPurchase2(
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String itemName = request.getParameter("itemName");
		System.out.println(" hi this  is Item name is ----====="+itemName);
		String ChallanNo = request.getParameter("challanNo");
		System.out.println(" hi this is Challan No is ========-----"+ChallanNo);
		
		SupplierDetailsDao dao = new SupplierDetailsDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<OutwardBean> expL= dao.getProductDetail(itemName,ChallanNo);
		 return expL;
		

		 	
			 
		/*SupplierGridBean2 bean = new SupplierGridBean2();
		bean.setProductName(itemName);*/
		/*PoGridBean bean = new PoGridBean();
		SupplierDetailsDao dao = new SupplierDetailsDao();
		List list= dao.getProductDetail(itemName,ChallanNo);
		//Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			
			System.out.println(Arrays.toString(o));
			bean.setProductName(o[0].toString());
			bean.setBuyPrice(Double.parseDouble(o[1].toString()));
			bean.setHsn(o[2].toString());
			bean.setOperationName(o[3].toString());
			bean.setOkquantity(0d);
			bean.setRejectedquantity(0d);
			bean.setUnprocessquantity(0d);
			
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			//map.put(bean.getBuyPrice(),bean);
			
		}
		return bean;*/
		
	
	}
	
	
	
	//	//for bill copy
	
	public Map getAllVendorBillNo2(String supplier)
	{
		
		PackingInfoDao dao = new PackingInfoDao();
		List list = dao.getAllVendorBillNo1(supplier);
		System.out.println("map++++++++++++++++++++/////*****"+list);
		Map map = new HashMap();
		System.out.println("map++++++++++++++++++++/////*****------"+map);
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			OutwardBean bean = new OutwardBean();
			System.out.println(Arrays.toString(o));

			/*String pendingBal = o[0].toString();
			if (pendingBal.equals("0.0")) {
				continue;

			}*/ /*else {*/
				bean.setOutwardchallanno((o[0].toString()));
				bean.setPk_outward_id(Long.parseLong(o[2].toString()));
		/*}*/
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************++++++////////////////hi this is kishor out ++++" + o[0]);
			map.put(bean.getOutwardchallanno(), bean);
	}
		return map;
	}
	
	
	// Outward Bill Copy For Return 	
	
	public Map getAllVendorBillNo3(String supplier)
	{
		
		PackingInfoDao dao = new PackingInfoDao();
		List list = dao.getAllVendorBillNo3(supplier);
		System.out.println("map++++++++++++++++++++/////*****"+list);
		Map map = new HashMap();
		System.out.println("map++++++++++++++++++++/////*****------"+map);
		for (int i = 0; i < list.size(); i++) {
			Object[] o = (Object[]) list.get(i);
			OutwardBean bean = new OutwardBean();
			System.out.println(Arrays.toString(o));

			/*String pendingBal = o[0].toString();
			if (pendingBal.equals("0.0")) {
				continue;

			}*/ /*else {*/
				bean.setOutwardchallanno((o[0].toString()));
				bean.setPk_outward_id(Long.parseLong(o[2].toString()));
		/*}*/
			// bean.setTotalAmount((Double)o[1]);
			System.out.println("***************++++++////////////////hi this is kishor out ++++" + o[0]);
			map.put(bean.getPk_outward_id(), bean);
	}
		return map;
	}
	
	
	
	
	public List getProductInGridInBilling(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//String outwardchallanno = request.getParameter("outwardchallanno");
		
		/*SupplierGridBean2 bean = new SupplierGridBean2();
		bean.setProductName(itemName);*/
	//	OutwardBean bean = new OutwardBean();
	//	SupplierDetailsDao dao = new SupplierDetailsDao();
	//	List<?> list= dao.getProductDetailByChalanaNo(outwardchallanno);
		//Map  mapc =  new HashMap();
		
	//	return bean;
		
		String outwardchallanno = request.getParameter("outwardchallanno");
		
		SupplierDetailsDao dao = new SupplierDetailsDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<OutwardBean> expL= dao.getProductDetailByChalanaNo(outwardchallanno);
		 return expL;
   }
	
	//for Billing using Inwad challan No inwordchallanNo
	public List<OutwardBean> getProductInGridInBillingInwardChallanNo(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String inwordchallanNo = request.getParameter("inwordchallanNo");
		
		//String outwardchallanno = request.getParameter("outwardchallanno");
		
		SupplierDetailsDao dao = new SupplierDetailsDao();
		// Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
		 List<OutwardBean> expL= dao.getProductDetailByInwardChalanaNo(inwordchallanNo);
		 return expL;
		
		
		
		
		/*SupplierGridBean2 bean = new SupplierGridBean2();
		bean.setProductName(itemName);*/
	/*	OutwardBean bean = new OutwardBean();
		SupplierDetailsDao dao = new SupplierDetailsDao();
		List list= dao.getProductDetailByInwardChalanaNo(inwordchallanNo);
		//Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			
			System.out.println(Arrays.toString(o));
			bean.setChallanNo(o[0].toString());
			bean.setProductName(o[1].toString());
			bean.setOkquantity(Double.parseDouble(o[2].toString()));
			bean.setBuyPrice(Double.parseDouble(o[3].toString()));
			bean.setHsn(o[4].toString());
			bean.setOperation(o[5].toString());
			bean.setGst(0d);
			bean.setIGst(0d);
			bean.setOkquantity1(Double.parseDouble(o[2].toString()));
			System.out.println("hi this is vikas in packing helper"+o[4].toString());
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			//map.put(bean.getBuyPrice(),bean);
			
		}
		return bean;*/
   }
	//outward bill
	public void VendorBillCOPY(HttpServletRequest request, HttpServletResponse response) {
		String billNo = request.getParameter("BillNum");
		
		System.out.println("----------------Credit cust Bill No before session create::"+billNo);
		
		HttpSession session3 = request.getSession();
		
		/*Long billNo2 = Long.parseLong(billNo);*/
		String billNo2 =String.valueOf(billNo);
		
		String bill = billNo2.toString();
		
		session3.setAttribute("VendorBillNo", bill);
		
		System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("VendorBillNo"));
		
	}
	
	//outward return  bill
		public void VendorBillCOPY2(HttpServletRequest request, HttpServletResponse response) {
			String billNo = request.getParameter("OutwardChallanNo");
			
			System.out.println("----------------Credit cust Bill No before session create::"+billNo);
			
			HttpSession session3 = request.getSession();
			
			/*Long billNo2 = Long.parseLong(billNo);*/
			String billNo2 =String.valueOf(billNo);
			
			String bill = billNo2.toString();
			
			session3.setAttribute("VendorBillNo", bill);
			
			System.out.println("----------------Credit cust Bill No before session create::"+session3.getAttribute("VendorBillNo"));
			
		}
	
}