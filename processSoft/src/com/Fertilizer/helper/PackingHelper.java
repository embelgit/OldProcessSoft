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

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.GetpackingDetails;
import com.Fertilizer.bean.OutwardReportBean;
import com.Fertilizer.dao.GoodsReceiveDao;
import com.Fertilizer.dao.PackingDao;
import com.Fertilizer.hibernate.GoodsReceiveBean;
import com.Fertilizer.hibernate.OutwardBean;
import com.Fertilizer.hibernate.PackingBean;
import com.Fertilizer.hibernate.Stock;
import com.Fertilizer.utility.HibernateUtility;

public class PackingHelper {

	Long BillNo = 1l;
	public void PackDetails(HttpServletRequest request,
			HttpServletResponse response) {
			
		System.out.println("IN HELPER");
		PackingDao pd1 = new PackingDao();
		 List stkList2=pd1.getAllPackingEntry();
		 
		 String count1 =request.getParameter("count");
			Long count=Long.parseLong(count1);
			System.out.println(count);
			
			PackingBean pb = new PackingBean();
			
			for(int i =0 ; i< count;i++)
			{
				HttpSession session3 = request.getSession();
				PackingDao data = new PackingDao();
				List stkList  = data.getLastBillNo();
			
				for(int j=0;j<stkList.size();j++){
				
					BillBean st = (BillBean)stkList.get(j);
					BillNo = st.getBillNo();
				
					BillNo++;
				
			}
		
				String supplier  = request.getParameter("supplier");
				String inwardDate = request.getParameter("inwardDate");
				String purchaseDate = request.getParameter("purchaseDate");
				String supplier1  = request.getParameter("supplier1");
				
				String challanNo  = request.getParameter("challanNo");
				String outwardchallanno  = request.getParameter("outwardchallanno");
				
				pb.setSupplier(Long.parseLong(supplier));
				String length = request.getParameter("length"+i);
				if(length==null){
					pb.setLength(Long.parseLong("00"));
				}
				else{
					pb.setLength(Long.parseLong(length));
				}
			
				String productName = request.getParameter("productName"+i);
			if(productName==null){
				pb.setProName("NA");
			}
			else{
				pb.setProName(productName);
			}
			
			String buyPrice = request.getParameter("buyPrice"+i);
			if(buyPrice==null){
				pb.setBuyPrice(Double.parseDouble("00"));
			}
			else{
				pb.setBuyPrice(Double.parseDouble(buyPrice));
			}
			
			/*String typeoffunction = request.getParameter("typeoffunction"+i);
			if(typeoffunction==null){
				pb.setTypeoffunction("NA");
			}
			else{
				pb.setTypeoffunction(typeoffunction);
			}*/
			
			String color = request.getParameter("color"+i);
			if(color==null){
				pb.setColor("NA");
			}
			else{
				pb.setColor(color);
			}
			
			String micron = request.getParameter("micron"+i);
			if(micron==null){
				pb.setMicron(Double.parseDouble("00"));
			}
			else{
				pb.setMicron(Double.parseDouble(micron));
			}
			
			String bundel = request.getParameter("bundel"+i);
			if(bundel==null){
				pb.setBundel(("00"));
			}
			else{
				pb.setBundel((bundel));
			}
			
			String quantityinkg = request.getParameter("quantity"+i);
			System.out.println("quantity = = = ="+quantityinkg);
			if(quantityinkg==null){
				pb.setQuantity(Double.parseDouble("00"));
			}
			else{
				pb.setQuantity(Double.parseDouble(quantityinkg));
			}
			
			String quantityinbundle = request.getParameter("quantityinbundle"+i);
			System.out.println("quantity = = = ="+quantityinbundle);
			if(quantityinbundle==null){
				pb.setQuantityinbundle((Long.parseLong("00")));
			}
			else{
				pb.setQuantityinbundle((Long.parseLong(quantityinbundle)));
				//bean.setDupQuantity(Double.parseDouble(quantityinkg));
			}
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    		Date newDate = null;
    		Date newDate1 = null;
    		try {
    			newDate =	format.parse(purchaseDate);
    			} 
    		catch (ParseException e1) {
    			// TODO Auto-generated catch block
    			e1.printStackTrace();
    		}
    		pb.setPurchaseDate(newDate);
    		
    		try {
    			newDate1 =	format.parse(inwardDate);
    			} 
    		catch (ParseException e1) {
    			// TODO Auto-generated catch block
    			e1.printStackTrace();
    		}
    		pb.setInwardDate(newDate1);
	/*cdb.setSubCategoryName(subCategoryName);*/
	
	session3.setAttribute("BillNo",BillNo);

	if(BillNo == null){
		pb.setBillNo(1l);
	}
	else
	{
		pb.setBillNo(BillNo);	
	}
	
	if(challanNo == null){
		pb.setInwardchallanno("N/A");
	}
	else
	{
		pb.setInwardchallanno(challanNo);	
	}
	
	if(outwardchallanno == null){
		pb.setOutwardchallanno("N/A");
	}
	else
	{
		pb.setOutwardchallanno(outwardchallanno);	
	}
	session3.setAttribute("supplier1",supplier1);
	
	Long item_id = Long.parseLong(request.getParameter("item_id"+i));
	System.out.println("item_id" +item_id);
	
	PackingDao pd = new PackingDao();
	pd.addpacking(pb);
	
	GoodsReceiveDao good = new GoodsReceiveDao();
	good.updateQuantity(productName,quantityinkg,item_id);
	
			 for(int j=0;j<stkList2.size();j++){
	             	
				 Stock st = (Stock)stkList2.get(j);
	             	String itemName = st.getProductName();
	             	Long stockId = st.getPkStockId();
 	             	String stkId = stockId.toString();
	             	//String batchNumber = st.getBatchNum();
	             	/*If ItemName Is Already Exists In Stock Table */ 
	             
	             	 //System.out.println("batchNumber from stock table"+batchNumber);
	         		// System.out.println("batchNo from goods receive"+batchNo);
	    	   System.out.println("In else Part");	
	    	  
	    	   if(productName.equals(itemName)){
	            		 System.out.println("inside If");
	    		   
	    		   			Double qunty = st.getQuantityinkg();
	            		
	            		 Double updatequnty = (double) (qunty - Double.parseDouble(quantityinkg));
	            		
	            		 HibernateUtility hbu = HibernateUtility.getInstance();
	            		 Session session = hbu.getHibernateSession();
	            		 Transaction transaction = session.beginTransaction();
	            		 
	            		 DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	            		 Date date2 = new Date();
	            	
	            		 Stock updateStock = (Stock) session.get(Stock.class, new Long(stkId));
	            		 updateStock.setQuantityinkg(updatequnty);
	            		 
	            		session.saveOrUpdate(updateStock);
	            		transaction.commit();
	            		break;
	            	}
	    	  
		}
			 
				/*HibernateUtility hbu2=null;
				Session session2=null;
				Transaction transaction2 = null;
				
				try
				{
					Long  PkContainerStockId;
				 Double quantity2;
				 hbu2 = HibernateUtility.getInstance();
				 session2 = hbu2.getHibernateSession();
				 transaction2 = session2.beginTransaction();
				
				 Query query2 = session2.createSQLQuery("select pk_container_stock_id , quantity from container_stock_detail where container_name='"+containerName+"' AND  capacity='"+capacity+"' AND  unit='"+unitName+"'");
				
				 List<Object[]> list2 = query2.list();
				  for (Object[] object : list2) {
					  System.out.println(Arrays.toString(object));  
					  PkContainerStockId = Long.parseLong(object[0].toString());
					  quantity2 = Double.parseDouble(object[1].toString());
					  System.out.println("PkStockId " +PkContainerStockId);
					  System.out.println("quantity " +quantity2);
					  
					  Double updatequnty1 = (double) (quantity2 - Double.parseDouble(container));
					  System.out.println("updatequnty " +updatequnty1);
					
					  containerStock Stock1 = (containerStock) session2.load(containerStock.class, new Long(PkContainerStockId));
				    
				    Stock1.setQuantity(updatequnty1);
					 
				    session2.saveOrUpdate(Stock1);
				    transaction2.commit();
				   System.out.println("Success ");	 
				   }
					
			}
				catch(RuntimeException e){
					try{
						transaction2.rollback();
					}catch(RuntimeException rbe)
					{
						Log.error("Couldn't roll back tranaction",rbe);
					}	
				}finally{
					hbu2.closeSession(session2);
				}
		*/
			 
			 
	//stock minus from stock detail table
	/*HibernateUtility hbu1=null;
	Session session1=null;
	Transaction transaction1 = null;
	
	try
	{
	 Long PkStockId;
	 Double quantity1;
	 hbu1 = HibernateUtility.getInstance();
	 session1 = hbu1.getHibernateSession();
	 transaction1 = session1.beginTransaction();
	
	 Query query1 = session1.createSQLQuery("select PkStockId , unpacked_Quantity from stock_detail where ProductName='"+proName+"' AND  FkSubCatId='"+fkSubCatId+"' AND  FkCatId='"+fkCatId+"'");
	
	 List<Object[]> list1 = query1.list();
	 
	  for (Object[] object : list1) {
	  System.out.println(Arrays.toString(object));  
	  PkStockId = Long.parseLong(object[0].toString());
	  quantity1 = Double.parseDouble(object[1].toString());
	  System.out.println("PkStockId " +PkStockId);
	  System.out.println("quantity " +quantity1);
	  
	  Double updatequnty = (double) (quantity1 - Double.parseDouble(packingQuantity));
	  System.out.println("updatequnty " +updatequnty);
	
    Stock Stock = (Stock) session1.load(Stock.class, new Long(PkStockId));
    
    Stock.setUnpackedQuantity(updatequnty);
	 
	 session1.saveOrUpdate(Stock);
    transaction1.commit();
   System.out.println("Success ");	 
   }
	  
	}
	catch(RuntimeException e){
		try{
			transaction1.rollback();
		}catch(RuntimeException rbe)
		{
			Log.error("Couldn't roll back tranaction",rbe);
		}	
	}finally{
		hbu1.closeSession(session1);
	}
  }*/
}
	
}
	
	public Map getAllProductforpacking() {

		int count = 1;
		PackingDao dao = new PackingDao();
		List list= dao.getAllProductBypacking();
		
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetpackingDetails bean = new GetpackingDetails();
			System.out.println(Arrays.toString(o));
			
			
			bean.setProduct(o[0].toString());;
			bean.setQuantityDouble(Double.parseDouble(o[1].toString()));
			bean.setCatid(Long.parseLong(o[2].toString()));
			bean.setSubCatid(Long.parseLong(o[3].toString()));
			bean.setShopid(Long.parseLong(o[4].toString()));
		
			
			//bean.setTotalAmount((Double)o[1]);
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;

	}
	//for challan no
	public List getoutwardDetail(HttpServletRequest request, HttpServletResponse response)
	{
		String ShopName1 = request.getParameter("ShopName1");
		String challanno = request.getParameter("challanno");
		System.out.println("challan No in Helper"+challanno);
		
	    Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			
	     	PackingDao dao=new PackingDao(); 
	     	//GoodsReceiveDao dao = new GoodsReceiveDao();
			List<OutwardBean> outwardlist = dao.getOutwardDetailTable(ShopName1,challanno);
			
			return outwardlist;

	}
	//for product name
	
	public List getoutwardDetailForProduct(HttpServletRequest request, HttpServletResponse response)
	{
		String ShopName3 = request.getParameter("ShopName3");
		String proName = request.getParameter("proName");
		
		System.out.println("challan No in Helper"+proName);
		
	    Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			
	     	PackingDao dao=new PackingDao(); 
	     	//GoodsReceiveDao dao = new GoodsReceiveDao();
			List<OutwardBean> outwardlist = dao.getOutwardDetailTableproduct(ShopName3,proName);
			
			return outwardlist;

	}
	
	//for vendor name
	public List getoutwardDetailForVendor(HttpServletRequest request, HttpServletResponse response)
	{
		String venName = request.getParameter("venName");
		String ShopName4 = request.getParameter("ShopName4");
		//String fDate = request.getParameter("fDate");
		System.out.println("challan No in Helper"+venName+"]]]"+ShopName4) ;
		
	    Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			
	     	PackingDao dao=new PackingDao(); 
	     	//GoodsReceiveDao dao = new GoodsReceiveDao();
			List<OutwardBean> outwardlist = dao.getOutwardDetailTableVendor(ShopName4,venName);
			
			return outwardlist;

	}
	
	public List getOutwardDetailDatewise(HttpServletRequest request, HttpServletResponse response)
	{
		String ShopName2 = request.getParameter("ShopName2");
		String fisDate = request.getParameter("fisDate");
		String endDate = request.getParameter("endDate");
		System.out.println("First date in Helper"+fisDate);
		System.out.println("End Date in Helper"+endDate);
		
	    Map<Long,OutwardReportBean> map = new HashMap<Long,OutwardReportBean>();
	    
	     	PackingDao dao=new PackingDao();
			List<OutwardBean> Outwardlist = dao.getOutwardDetailTableDatewise(ShopName2,fisDate,endDate);
			
			return Outwardlist;

	}
/*Report sor Shop Name*/
	public List getoutwardDetailsTableShopWise(HttpServletRequest request, HttpServletResponse response) {
		String ShopName = request.getParameter("ShopName");
		//String cat = request.getParameter("cat");
		//String fDate = request.getParameter("fDate");
		System.out.println("challan No in Helper"+ShopName);
		
	    Map<Long,OutwardBean> map = new HashMap<Long,OutwardBean>();
			
	     	PackingDao dao=new PackingDao(); 
	     	//GoodsReceiveDao dao = new GoodsReceiveDao();
			List<OutwardBean> outwardlist = dao.getoutwardDetailsTableShopWise(ShopName);
			
			return outwardlist;
	}


}
