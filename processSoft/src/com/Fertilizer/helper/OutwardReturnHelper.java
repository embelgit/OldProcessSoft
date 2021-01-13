package com.Fertilizer.helper;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.OutwardReturnBean;
import com.Fertilizer.bean.PurchaseReturnBean;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.OutwardReturnDao;
import com.Fertilizer.dao.PurchaseReturnDao;
import com.Fertilizer.hibernate.InwardBean;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.OutwardReturn;
import com.Fertilizer.utility.HibernateUtility;

public class OutwardReturnHelper {

	

	// TO OutWard Purchase Return 
	public void returntPurchasereturntOutward(HttpServletRequest request,
			HttpServletResponse response)  {
		// TODO Auto-generated method stub
		
		
		Integer count = Integer.parseInt(request.getParameter("count"));
		for(int i =0 ; i <count;i++)
		{
			String pkoutwardid = request.getParameter("pkoutwardid"+i);
			String ProductName = request.getParameter("ProductName"+i);
			String hsn = request.getParameter("hsn"+i);
			String Operaation = request.getParameter("Operaation"+i);
			String ChallanNo = request.getParameter("ChallanNo"+i);
			String description = request.getParameter("description"+i);
			String Rate = request.getParameter("Rate"+i);
			String OkQuantity = request.getParameter("OkQuantity"+i);
			String UnprocesQty = request.getParameter("UnprocesQty"+i);
			String RejQty = request.getParameter("RejQty"+i);
			String Quantity1 = request.getParameter("Quantity1"+i);
			String Totalvalue = request.getParameter("TotalValue"+i);
			
			String idno = request.getParameter("idno"+i);
			String vehicleName = request.getParameter("vehicleName"+i);
			String InwardDate = request.getParameter("InwardDate"+i);
			String OutwardDate = request.getParameter("OutwardDate"+i);
			String ShopName = request.getParameter("ShopName"+i);
			String boxDescription = request.getParameter("boxDescription"+i);
			String supplier = request.getParameter("supplier");
			String Challanno = request.getParameter("Challanno");
			String Outreturndate = request.getParameter("Challandate");
			System.out.println(" Hi this is Date Is "+Outreturndate);
			
			System.out.println("hi this  Outward Challan No=="+Challanno);
			
			
			/*String suppliername = request.getParameter("suppliername"+i);
			String billno = request.getParameter("billno"+i);
			*/
			
			    
			OutwardReturn bean = new OutwardReturn();
			
			bean.setPkGRDetailsid(Long.parseLong(pkoutwardid));
			bean.setProductName((ProductName));
			bean.setHsn(hsn);
			bean.setOperaation((Operaation));
			bean.setChallanNo((ChallanNo));
			//add this to field
			bean.setDescription(description);
			bean.setRate(Double.parseDouble(Rate));
			bean.setOkQuantity(Double.parseDouble(OkQuantity));
			bean.setUnprocesQty(Double.parseDouble(UnprocesQty));
			bean.setRejQty(Double.parseDouble(RejQty));
			//bean.setGridTotal(Double.parseDouble(GridTotal));
			bean.setQuantity1(Double.parseDouble(Quantity1));
			bean.setTotalValue(Double.parseDouble(Totalvalue));
			bean.setOutwardChallanno(Challanno);
			bean.setIdno(idno);
			bean.setVehicleName(vehicleName);
			bean.setInwardDate(InwardDate);
			bean.setOutwardDate(OutwardDate);
			//bean.setShopName(ShopName);
			bean.setBoxDescription(boxDescription);
			
			//bean.setPk_GRDetails_id(Long.parseLong(pkGRDetailsid));
			//bean.setSuppliername(suppliername);
			
			Date  date1=null;
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date1 = df.parse(Outreturndate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			bean.setOutretDate(date1);
			bean.setSupplierName(((supplier)));
			//bean.setIdno(idno);
			//bean.setCity(city);
			//bean.setGstno(tinNo);
			//bean.setBillno(Double.parseDouble(billno));
			//bean.setAddress(address);
			//bean.setShopName(shopName);
			//bean.setTotal(Double.parseDouble(total));
			//bean.setGrosstotal(Double.parseDouble(grosstotal));
			
			HttpSession session3 = request.getSession(true);
			String username = (String)session3.getAttribute("user");
			String userid = (String)session3.getAttribute("userid");
			String shopid = (String)session3.getAttribute("shopid");
			String shopname=(String)session3.getAttribute("shopname");
			
			bean.setUserId(Long.parseLong(userid));
			bean.setUsername(username);
			bean.setShopId(Long.parseLong(shopid));
			bean.setShopName(shopname);
			
			OutwardReturnDao sdo = new OutwardReturnDao();
			sdo.valPurchaseReturnOutward(bean);
			

			HibernateUtility hbu=null;
			Session session = null;
			Transaction transaction = null;
			
			HttpSession billNoSession = request.getSession();
			billNoSession.setAttribute("fertilizerBillNo",Challanno);
			billNoSession.setAttribute("creditCustomerName1",supplier);
			
			System.out.println("---------Bill No for pdf in session::"+ Challanno + "----------------");
			
			
			 hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
		
		
			//long customerId = Long.parseLong(customerId);
			long GridID =Long.parseLong(pkoutwardid);
			Double OkQTY =Double.parseDouble(OkQuantity);
			//System.out.println("hi this is OkQTY== "+OkQTY);
			Double Quant =Double.parseDouble(Quantity1);
			//System.out.println("Hi this is Quant =="+Quant);
			
			Double NewQty = (OkQTY) - (Quant);
			//System.out.println("Hi this is NewQty=="+NewQty);
			//Double qunty = st.getStock();
    		 //System.out.println("qunty==="+qunty);
			//Double quantity =0.0;
			//Double Quantity1 = 0.0;
    		//Double updatequnty = (double) (quantity - Double.parseDouble(Quantity1));
    		 //System.out.println("hi this is updatequnty=="+updatequnty);
			
			OutwardBean det = (OutwardBean) session.get(OutwardBean.class, GridID);
			
			det.setPk_outward_id(Long.parseLong(pkoutwardid));
			det.setProductName(ProductName);
			det.setOkquantity(NewQty);
			
			
		    session.saveOrUpdate(det);
			transaction.commit();
		
			// Get  The Inward Return 
			HibernateUtility hbu1 = HibernateUtility.getInstance();
			Session session1 = hbu1.getHibernateSession();
			
			
			GoodsReceiveDao dao1 = new GoodsReceiveDao();
	        List stkList2  = dao1.getAllInwardEntry();
	        
	        Transaction transaction1 = session1.beginTransaction();
	        
	        System.out.println("List size "+stkList2.size());
			
	        for(int j=0;j<stkList2.size();j++){
	        	
	        InwardBean st = (InwardBean)stkList2.get(j);
			String bill=st.getChallanno();
			//System.out.println("Hi this Challan NO===="+bill);
			String productname =st.getProductname();
			Long pk_goods_receive_id=st.getPk_inward_id();
			Double DupQty =st.getDupQuantity();
			Double qty =st.getQuantity();
			
			//System.out.println(" Hi this is Duplicate Qty==="+DupQty);
			
			
			if(ChallanNo.equals(bill) && ProductName.equals(productname)){
			
			System.out.println("inside if");
			Double DupQty1 =st.getDupQuantity();
			System.out.println(" Hi this is Duplicate Qty1111==="+DupQty);
			String productname1 =st.getProductname();
			Double GDTotal = st.getGridTotal();
			System.out.println("Inward Grid total==="+GDTotal);
			Double GSTotal = st.getGrosstotal();
			System.out.println("Inward Grid total==="+GSTotal);
			
			
		/*	Double dupQuantity=st.getDupQuantity();
			Double Okqnt=Double.parseDouble(okquantity);
			Double rjqnt=Double.parseDouble(rejectedquantity);
			Double upqnt=Double.parseDouble(unprocessquantity);*/
				
			InwardBean updateStock = (InwardBean) session1.get(InwardBean.class, new Long(pk_goods_receive_id));
			//double updateQuantity=dupQuantity - Okqnt - rjqnt - upqnt;
			double updatedupQuantity = (DupQty1) + (Double.parseDouble(Quantity1)) ;
			//double updatedQuantity = (qty) - (Double.parseDouble(Quantity1));
			double NewTotal = (GDTotal) - (Double.parseDouble(Totalvalue));
			//System.out.println(" hi this is updateQuantity=="+updateQuantity);
			updateStock.setDupQuantity(updatedupQuantity);
			//updateStock.setQuantity(updatedQuantity);
			updateStock.setGridTotal(NewTotal);
			updateStock.setTotal(NewTotal);
			updateStock.setGrosstotal(NewTotal);
			
			
    		 
    		session1.saveOrUpdate(updateStock);
    		//System.out.println(" hi this is kishor +++++0222222222222++++"+updateStock);
    		//transaction.commit();
    		if (!transaction1.wasCommitted())
    			transaction1.commit();
			}
			}
			
       // Get the Outward reutn 
			HibernateUtility hbu2 = HibernateUtility.getInstance();
			Session session2 = hbu2.getHibernateSession();
			
			
			GoodsReceiveDao dao2 = new GoodsReceiveDao();
	        List stkList3  = dao2.getAllInwardEntryOutward();
	        
	        Transaction transaction2 = session2.beginTransaction();
	        
	        System.out.println("List size"+stkList3.size());
			
	        for(int j=0;j<stkList3.size();j++){
	        	
	        OutwardBean st = (OutwardBean)stkList3.get(j);
			String bill1=st.getChallanNo();
			System.out.println("Hi this Challan NO===="+bill1);
			String productname =st.getProductName();
			Long pk_goods_receive_idout=st.getPk_outward_id();
			Double GdTOtal =st.getGridTotal();
			Double GsTotal =st.getGrosstotal();
			System.out.println(" Hi this is Outward  GdTOtal ==="+GdTOtal);
			System.out.println(" Hi this is Outward  GsTotal ==="+GsTotal);
			
			if(ChallanNo.equals(bill1) && ProductName.equals(productname)){
			
			System.out.println("inside if");
			//Double DupQty1 =st.getDupQuantity();
			//System.out.println(" Hi this is Duplicate Qty1111==="+DupQty);
			//String productname1 =st.getProductname();
			
			
		/*	Double dupQuantity=st.getDupQuantity();
			Double Okqnt=Double.parseDouble(okquantity);
			Double rjqnt=Double.parseDouble(rejectedquantity);
			Double upqnt=Double.parseDouble(unprocessquantity);*/
				
			OutwardBean updateStock = (OutwardBean) session2.get(OutwardBean.class, new Long(pk_goods_receive_idout));
			//double updateQuantity=dupQuantity - Okqnt - rjqnt - upqnt;
			double NewTotal = (GdTOtal) - (Double.parseDouble(Totalvalue)) ;
			System.out.println(" hi this is NewTotal=="+NewTotal);
			updateStock.setGridTotal(NewTotal);
			updateStock.setGrosstotal(NewTotal);
			updateStock.setTotal(NewTotal);
			
    		 
    		session2.saveOrUpdate(updateStock);
    		//System.out.println(" hi this is kishor +++++0222222222222++++"+updateStock);
    		//transaction.commit();
    		if (!transaction2.wasCommitted())
    			transaction2.commit();
			}
			}
			
		}
		
	}
	
	
	// Get Outward Vendor Wise 
	public List OutwardReturnVendorNameWise1(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("in helper");
		String VendorName = request.getParameter("VendorName");
		System.out.println(" Hi this is VendorName === "+VendorName);
		String challanno = request.getParameter("challanno");
		System.out.println(" Hi this is challanno === "+challanno);
		//String GridTotal =request.getParameter("GridTotal");
		System.out.println("{{}}{{"+VendorName);
		OutwardReturnDao dao = new OutwardReturnDao();
		List<OutwardReturnBean> expList = dao.OutwardReturnVendorNameWise1(challanno,VendorName);
		System.out.println("?????????????????????????}}}}}}}}}}"+expList);
		return expList;
	}
	
	// get Outward Return Range Wise
				public List OutwardReturnReportAsPerRangeWise(HttpServletRequest request, HttpServletResponse response) {
					System.out.println("in helper");
					String VendorName = request.getParameter("VendorName1");
					System.out.println(" Hi this is VendorName === "+VendorName);
					String fisDate = request.getParameter("fisDate");
					System.out.println(" Hi this is VendorName === "+fisDate);
					String endDate = request.getParameter("endDate");
					//String GridTotal =request.getParameter("GridTotal");
					System.out.println("{{}}{{"+VendorName);
					OutwardReturnDao dao = new OutwardReturnDao();
					List<OutwardReturnBean> expList = dao.OutwardReturnReportAsPerRangeWise1(VendorName,fisDate,endDate);
					System.out.println("?????????????????????????}}}}}}}}}}"+expList);
					return expList;
				}
				
				// get all Vendor Name Wise for Outward REturn
				public List OutwardReturnReportAsPerVendorNameWise(HttpServletRequest request, HttpServletResponse response) {
					System.out.println("in helper");
					String VendorName = request.getParameter("VendorName2");
					//System.out.println(" Hi this is VendorName === "+VendorName);
					//String fisDate = request.getParameter("fisDate");
					//System.out.println(" Hi this is VendorName === "+fisDate);
					//String endDate = request.getParameter("endDate");
					//String GridTotal =request.getParameter("GridTotal");
					System.out.println("{{}}{{"+VendorName);
					OutwardReturnDao dao = new OutwardReturnDao();
					List<OutwardReturnBean> expList = dao.OutwardReturnReportAsPerVendorNameWise1(VendorName);
					System.out.println("?????????????????????????}}}}}}}}}}"+expList);
					return expList;
				}
}
