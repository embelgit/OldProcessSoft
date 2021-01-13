package com.Fertilizer.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.GestSupplyerDetailsForCashBook;
import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.hibernate.CashBankBookDataDateWise;
import com.Fertilizer.hibernate.SupplierAccountDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.hibernate.SupplierPaymentBean;
import com.Fertilizer.utility.HibernateUtility;

public class SupplierAccountDetailsDao {

			public void supplierAccount(SupplierAccountDetailsBean sadb) {
		
				System.out.println("In DAO");
				
				HibernateUtility hbu=null;
				Session session = null;
				Transaction transaction = null;
				
				try{
				 hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
			
				 System.out.println("Tx started");
				 
				 Long fkSupplierId = sadb.getFk_supplier_id();
				 SupplierDetailsBean detail = (SupplierDetailsBean) session.load(SupplierDetailsBean.class, fkSupplierId);
					System.out.println(detail);
					sadb.setSupplierDetailsBean(detail);
				session.save(sadb);
				transaction.commit();
				System.out.println("Successful");
				}
				catch(RuntimeException e){
					try{
						transaction.rollback();
					}catch(RuntimeException rbe)
					{
						Log.error("Couldn't roll back tranaction",rbe);
					}	
				}finally{
				hbu.closeSession(session);
				}
		}

			
			
			public List getAllBillBySuppliers(String challanNo) {
				System.out.println("========"+challanNo);
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+challanNo);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		 			//Query query = session.createSQLQuery("select productname,dup_quantity,inwardDate from inwand_details where challan_No=:challanNo");
		 			Query query = session.createSQLQuery("select pk_gr_id,billno from gr_details where suppliername=:challanNo  GROUP BY billno ");
		 			query.setParameter("challanNo", challanNo);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}
			
			 // Get All Outward Challan No From Outward
			public List getAlOutwardChallanNoBySuppliers(String challanNo) {
				System.out.println("========"+challanNo);
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+challanNo);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		 			//Query query = session.createSQLQuery("select productname,dup_quantity,inwardDate from inwand_details where challan_No=:challanNo");
		 			Query query = session.createSQLQuery("select pk_outward_id,IdNo,outwardchallan_no from outward_details where suppliername=:challanNo GROUP BY outwardchallan_no");
		 			query.setParameter("challanNo", challanNo);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}
			// Get All Product Name and Inward Date 
			public List getAllBillBySuppliersUser1(String challanNo) {
				System.out.println("========"+challanNo);
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+challanNo);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		 			Query query = session.createSQLQuery("select productname,dup_quantity,inwardDate,pk_inward_id from inwand_details where challan_No=:challanNo");
		 			//Query query = session.createSQLQuery("select pk_gr_id,idno,billno from gr_details where suppliername=:challanNo GROUP BY pk_gr_id ");
		 			query.setParameter("challanNo", challanNo);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}

			
			
			public List getAllChallanNoBySuppliers(String supplierId) {
				
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+supplierId);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String qty = "0";
		 			Query query = session.createSQLQuery("select challan_No,inwardDate from inwand_details where suppliername=:supplierId AND dup_quantity !=:qty");
		 			query.setParameter("supplierId", supplierId);
		 			query.setParameter("qty", qty);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}


			public List getAllBillBySuppliers1(String supplierId) {
				
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+supplierId);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		 			Query query = session.createSQLQuery("select s.product_Name,s.quantity from  packing s  where s.supplier=:supplierId");
		 			query.setParameter("supplierId", supplierId);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}
	//outward challan no for billing		
			public List getOutwardDetails(String supplierId,String product) {
				
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+supplierId);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String qty="0";
		 			Query query = session.createSQLQuery("select s.outwardchallan_no,s.okquantity from  outward_details s  where s.suppliername=:supplierId and s.productName=:product");
		 			//Query query = session.createSQLQuery("select s.outwardchallan_no,s.okquantity from  outward_details s  where s.suppliername=:supplierId and s.okquantity!=:qty");
		 			query.setParameter("supplierId", supplierId);
		 			query.setParameter("product", product);
		 			//query.setParameter("qty", qty);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}
			
			//inword challan no for billing
			public List getInwardDetails(String supplierId,String product) {
				
				 HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 System.out.println("Supllier Id"+supplierId);
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String qty ="0";
		 			Query query = session.createSQLQuery("select s.challan_No,s.quantity from  inwand_details s where s.suppliername=:supplierId and s.productname=:product");
		 			//Query query = session.createSQLQuery("select s.challanno,s.quantity from  inwand_details s where s.suppliername=:supplierId AND dup_quantity !=:qty");

		 			query.setParameter("supplierId", supplierId);
		 			query.setParameter("product", product);
		 			//query.setParameter("qty", qty);
		 			list = query.list();
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			
			}

			public List getTotalAmtByBillNoForCustomer(String billNo1, String supplierId) {
				
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String abc ="0.00";
		 			//Query query = session.createSQLQuery("select SUM(b.gross_Total),total from bill_details b where b.bill_no1=:billNo1");
		 			Query query = session.createSQLQuery("select SUM(total_amount),pk_vendor_payment_id from vendor_payment where bill_no=:billNo1 and payment=:abc ");
		 			query.setParameter("billNo1",billNo1);
		 			query.setParameter("abc", abc);
		 			//query.setParameter("supplierId",supplierId);
		 			list = query.list();
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
		    	
			}
/// vendor all supplier payment 
			
public List getTotalAmtByBillNoForCustomerv(String supplier, String supplierId) {
				
	System.out.println(" hi this supplier Id *********"+supplierId);
	
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String abc ="0.00";
		    		 String pqr ="credit";
		 			//Query query = session.createSQLQuery("select sum(gross_Total),pk_customer_id  from  bill_details where creditcustomer=:supplierv ");
		 			Query query = session.createSQLQuery("select sum(total_amount),fk_supplier_id from  vendor_payment where supplier=:supplierv AND payment=:abc and paymentType=:pqr");
		 			//Query query = session.createSQLQuery("SELECT sum(total_amount),pk_customer_id  from vendor_payment where supplier=:supplierv");
		 			
		 			//Query query = session.createSQLQuery("select sum(total_amount),fk_supplier_id from  vendor_payment where supplier=:supplierv AND payment=:abc and paymentType=:pqr");
		 			
		    		// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where b.bill_no=:billNo And b.creditcustomer=:supplier");
		 			query.setParameter("supplierv",supplier);
		 			query.setParameter("abc", abc);
		 			query.setParameter("pqr", pqr);
		 			//query.setParameter("pk_customer_id",pk_customer_id);
		 			list = query.list();
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
		    	
			}
			
			


			public List getbalanceAmtByBillNo(String billNo1,String fk_supplier_id) {
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 Query query = session.createSQLQuery("SELECT balance , total_amount from vendor_payment WHERE bill_no =:billNo1 AND fk_supplier_id =:fk_supplier_id ORDER BY pk_vendor_payment_id DESC LIMIT 1");
		 			query.setParameter("billNo1",billNo1);
		 			query.setParameter("fk_supplier_id",fk_supplier_id);
		 			list = query.list();
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			}
			
	// get remaining balance after payment vendor wise 
			

			public List getbalanceAmtByvendor(String billNo,String supplier) {
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list  = null;
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String abc="0";
		    		 String credit="credit";
		    		 //Query query = session.createSQLQuery("SELECT balance , total_amount from supplier_payment WHERE bill_no =:billNo AND supplier =:supplier ORDER BY pk_supplier_payment_id DESC LIMIT 1");
		    		// Query query = session.createSQLQuery("select balance, pk_supplier_payment_id FROM supplier_payment where supplier=:supplier AND bill_no=:abc AND paymentType=:credit ORDER BY pk_supplier_payment_id DESC LIMIT 1");
		    		 Query query = session.createSQLQuery("select balance, pk_vendor_payment_id FROM vendor_payment where supplier=:supplier AND bill_no=:abc AND paymentType=:credit ORDER BY pk_vendor_payment_id DESC LIMIT 1");

		    		//query.setParameter("billNo",billNo);
		 			query.setParameter("supplier",supplier);
		 			query.setParameter("abc",abc);
		 			query.setParameter("credit",credit);
		 			list = query.list();
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list;
			}
			
			
			//vendor all  payment 
			
			
			
			// balane get by the vendor wise 
			public List getbalanceAmtByBillNov(String billNo, String supplier, String totalAmount, String fk_supplier_id) {
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List list45  = new ArrayList();
		    	 Double balance = 0.0;
		   
		    	 try {
		    		
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession();
		    		 String credit="credit";
		    		/* String abc ="0.00";*/
		    		 //Query query = session.createSQLQuery("SELECT balance , total_amount from supplier_payment WHERE bill_no =:billNo AND supplier =:supplier ORDER BY pk_supplier_payment_id DESC LIMIT 1");
		    		// Query query = session.createSQLQuery("SELECT balance, total_amount from supplier_payment WHERE pk_supplier_payment_id AND supplier =:supplierv AND bill_no=:billNov AND paymentType='credit' ORDER BY pk_supplier_payment_id DESC LIMIT 1");
		    		// Query query = session.createSQLQuery("SELECT balance, total_amount from vendor_payment WHERE pk_vendor_payment_id AND supplier =:supplierv AND bill_no=:billNov AND paymentType='credit' ORDER BY pk_vendor_payment_id DESC LIMIT 1");
		    		// Query query = session.createSQLQuery("SELECT balance, total_amount,bd.gross_Total,bd.fk_supplier_id from vendor_payment JOIN bill_details bd on vendor_payment.fk_supplier_id = bd.fk_supplier_id WHERE supplier =:supplierv   AND paymentType='credit' and payment!=:abc ORDER BY pk_vendor_payment_id DESC LIMIT 1");
		    	//	 Query query = session.createSQLQuery("SELECT sum(balance), total_amount from vendor_payment WHERE fk_supplier_id=:fk_supplier_id and balance!=0 AND paymentType='credit' ORDER BY pk_vendor_payment_id DESC LIMIT 1");
		    		 
		    		/*query.setParameter("billNov",billNo);*/
		    		/* query.setParameter("abc",abc);*/
		 		//	query.setParameter("supplierv",supplier);
		 		//	query.setParameter("fk_supplier_id", fk_supplier_id);
		 			
		 			
		 			//query.setParameter("credit", credit);
		 	//		list = query.list();
		 			
		 		
					
					//Query to get latest paid amount
					/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
					Query query = session.createSQLQuery("SELECT balance ,bill_no from vendor_payment WHERE  fk_supplier_id =:fk_supplier_id group by bill_no ;");
					//Query query = session.createSQLQuery("SELECT balance ,bill_no1 from vendor_payment WHERE  fk_supplier_id =:fk_supplier_id  GROUP BY pk_vendor_payment_id DESC LIMIT 1 ;");
					query.setParameter("fk_supplier_id",fk_supplier_id);
					List<Object[]> list = query.list();
					
					for (Iterator iterator = list.iterator(); iterator.hasNext();) {
						Object[] objects = (Object[]) iterator.next();
						String billno = objects[1].toString();
						System.out.println("hi this is kishor1111111111111111155555555555555++++++++++++"+billno);
						
						Session session1 = hbu.getHibernateSession();
						
						//Query to get latest paid amount
						/*Query query = session.createSQLQuery("SELECT balance ,bill_no from supplier_payment WHERE  bill_no =:billNo ORDER BY  pk_supplier_payment_id  DESC LIMIT 1 ;");*/
						Query query1 = session1.createSQLQuery("SELECT balance ,bill_no, total_amount from vendor_payment WHERE   bill_no =:billno ORDER BY  pk_vendor_payment_id  DESC LIMIT 1;");
						query1.setParameter("billno",billno);
						List<Object[]> list1 = query1.list();
						
						for (Iterator iterator1 = list1.iterator(); iterator1.hasNext();) {
							Object[] objects1 = (Object[]) iterator1.next();
							String newBal1 = objects1[0].toString();
							/*Long bill_no= Long.valueOf(objects1[1].toString());*/
							String bill_no= String.valueOf(objects1[1].toString());
							String tot = objects1[0].toString();
							System.out.println("balance   ==  "+newBal1);
								
							 Double bal= Double.valueOf(newBal1);
							
							 balance = balance + bal;
							 
				         
						}
							
					}
					
					list45.add(balance);
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return list45;
			}
			
		
	public Double getTotalAmtv(String billNo, String supplier, String totalAmount) {
				
				HibernateUtility hbu = null ;
		    	 Session session = null;
		    	 List<Object[]> list  = null;
		    	 Double totalAmt = null;
		    	 List<GestSupplyerDetailsForCashBook> itemlist = null;
		    	 try {
		    		 hbu = HibernateUtility.getInstance();
		    		 session = hbu.getHibernateSession(); 
		 			 //Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where b.bill_no=:billNo And b.creditcustomer=:supplier");
		 			Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where pk_customer_id And b.creditcustomer=:supplierv  ");
		    		// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplierv");
		 			//query.setParameter("billNov",billNo);
		 			query.setParameter("supplierv",supplier);
		 			System.out.println("hi this s000000+++++++++"+supplier);
		 			list = query.list();
		 			 itemlist = new ArrayList<GestSupplyerDetailsForCashBook>(0);
		 			 
		 			 for (Object[] objects : list) {
		 				 
		 				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
		 				 
		 				String newBal = (objects[0].toString());
		 				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
		 				totalAmt = Double.valueOf(newBal);
		 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
		 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
						
		 				itemlist.add(bean);
		 				}
		 			
		 			
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
					
		    	 finally
				 {
					 if (session!=null) {
						hbu.closeSession(session);
					}
				 }
					return totalAmt;
		    	
			}

// get all vendor wise payment 
	
	
public Double getTotalAmt(String billNo1, String supplier) {
			
			HibernateUtility hbu = null ;
	    	 Session session = null;
	    	 List<Object[]> list  = null;
	    	 Double totalAmt = null;
	    	 List<GestSupplyerDetailsForCashBook> itemlist = null;
	    	 try {
	    		 hbu = HibernateUtility.getInstance();
	    		 session = hbu.getHibernateSession(); 
	 			Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where b.bill_no1=:billNo1 And b.creditcustomer=:supplier");
	    		// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplier");
	 			query.setParameter("billNo1",billNo1);
	 			query.setParameter("supplier",supplier);
	 			System.out.println("hi this s000000+++++++++"+supplier);
	 			list = query.list();
	 			 itemlist = new ArrayList<GestSupplyerDetailsForCashBook>(0);
	 			 
	 			 for (Object[] objects : list) {
	 				 
	 				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
	 				 
	 				String newBal = (objects[0].toString());
	 				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
	 				totalAmt = Double.valueOf(newBal);
	 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
	 				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
					
	 				itemlist.add(bean);
	 				}
	 			
	 			
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
				
	    	 finally
			 {
				 if (session!=null) {
					hbu.closeSession(session);
				}
			 }
				return totalAmt;
	    	
		}

//get remaining balance after payment 

public Double getTotalAmtRemainingBalance(String billNo, String supplier) {
	
	HibernateUtility hbu = null ;
	 Session session = null;
	 List<Object[]> list  = null;
	 Double totalAmt = null;
	 List<GestSupplyerDetailsForCashBook> itemlist = null;
	 try {
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession(); 
			Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where b.bill_no=:billNo And b.creditcustomer=:supplier");
		// Query query = session.createSQLQuery("select SUM(b.gross_Total),pk_customer_id from bill_details b where  b.creditcustomer=:supplier");
			query.setParameter("billNo",billNo);
			query.setParameter("supplier",supplier);
			System.out.println("hi this s000000+++++++++"+supplier);
			list = query.list();
			 itemlist = new ArrayList<GestSupplyerDetailsForCashBook>(0);
			 
			 for (Object[] objects : list) {
				 
				GestSupplyerDetailsForCashBook bean = new GestSupplyerDetailsForCashBook();
				 
				String newBal = (objects[0].toString());
				System.out.println("hi this is kishor 55555555+++++++++++++++++"+newBal);
				totalAmt = Double.valueOf(newBal);
				System.out.println("hi this is kishor 555544444+++++++++++++++++"+totalAmt);
				System.out.println("hi this is kishor 555544444+++++++++++++++++"+newBal);
			
				itemlist.add(bean);
				}
			
			
	} catch (Exception e) {
		e.printStackTrace();
		// TODO: handle exception
	}
		
	 finally
	 {
		 if (session!=null) {
			hbu.closeSession(session);
		}
	 }
		return totalAmt;
	
}
// get Last Bill No 
public List getLastBillNo() {
	// TODO Auto-generated method stub
	HibernateUtility hbu=null;
	Session session=null;
	List<SupplierPaymentBean> saleList=null;
	try
	{
		hbu = HibernateUtility.getInstance();
	 session = hbu.getHibernateSession();
	 Query query = session.createSQLQuery("SELECT bill_no,pk_supplier_payment_id FROM supplier_payment ORDER BY pk_supplier_payment_id DESC LIMIT 1");
		
		List<Object[]> list = query.list();
		 saleList= new ArrayList<SupplierPaymentBean>(0);
		for (Object[] object : list) {
			System.out.println(Arrays.toString(object));
			SupplierPaymentBean reports = new SupplierPaymentBean();
			reports.setBillNo(Long.parseLong(object[0].toString()));
			saleList.add(reports);	 
	}}
	catch(Exception e)
	{
		e.printStackTrace();	
	}finally
	{if(session!=null){
		session.close();	
	}
	}
	return saleList;
}

	public List getYesterdarTotalAmount() {
		// TODO Auto-generated method stub
		 HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createSQLQuery("SELECT onDate , totalAmount FROM cashbankbooktable ORDER BY pkLastCashId DESC LIMIT 1");
 			list = query.list();
 			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
			
    	 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	}



	public List getYesterdaySuppCredit(String yesterday) {
		// TODO Auto-generated method stub
		return null;
	}



	public void registeryesterdayTotal(CashBankBookDataDateWise cs) {
		// TODO Auto-generated method stub
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		try{
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		 System.out.println("Tx started");
		 
		
		session.save(cs);
		transaction.commit();
		System.out.println("Successful");
		}
		catch(RuntimeException e){
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
		hbu.closeSession(session);
		}
		
	}



	public List getDiffBetDates() {
		// TODO Auto-generated method stub
		
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
		Date dateobj = new Date();
		String todayDate = dateFormat1.format(dateobj);
		
		 HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
 			Query query = session.createQuery("SELECT date , totalAmount FROM CashBankBookDataDateWise ORDER BY date DESC LIMIT 1");
 			list = query.list();
 			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
			
    	 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	}



	public List getTodaySaleTotalAmount() {
		// TODO Auto-generated method stub
		 HibernateUtility hbu = null ;
    	 Session session = null;
    	 List list  = null;
    	 
    	   SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = new Date();
			String date = (dateFormat1.format(date1));
    	 
    	 try {
    		 hbu = HibernateUtility.getInstance();
    		 session = hbu.getHibernateSession();
    		/*Query query = session.createSQLQuery("select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from fertilizer_billing where insert_date=:date");*/
    		 Query query = session.createSQLQuery("select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from fertilizer_billing where insert_date=:date");
    		 query.setParameter("date",date);
 			list = query.list();
 			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
			
    	 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	}



	public List getTodaySaleTotalAmount1() {
		// TODO Auto-generated method stub
		HibernateUtility hbu = null ;
   	 Session session = null;
   	 List list  = null;
   	 
   	   SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = new Date();
			String date = (dateFormat1.format(date1));
   	 
   	 try {
   		 hbu = HibernateUtility.getInstance();
   		 session = hbu.getHibernateSession();
   		Query query = session.createSQLQuery("select DISTINCT COUNT(DISTINCT bill_no), sum(DISTINCT  gross_total) from seed_pesticide_billing where insert_date=:date");
   		query.setParameter("date",date);
			list = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
			
   	 finally
		 {
			 if (session!=null) {
				hbu.closeSession(session);
			}
		 }
			return list;
	}
	
	//get BIll no  for vemdor getAllVendorBillNo 
	
	public List getAllVendorBillNo(String fk_supplier_id)
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		
		try {
			//String paymentdone = "y";
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			String abc = "0.0";
			/*Query query = session.createSQLQuery("SELECT b.bill_no, b.gross_Total, b.pk_customer_id FROM bill_details b WHERE b.creditcustomer ='" + supplier + "'");*/
			Query query = session.createSQLQuery("SELECT bill_no,total_amount,pk_vendor_payment_id FROM vendor_payment WHERE fk_supplier_id =:fk_supplier_id and payment=:abc");
			//Query query = session.createSQLQuery("SELECT  b.bill_no, b.payment FROM supplier_payment b where b.balance > 0.0 and supplier = ''" + supplier + "''");
			//Query query = session.createSQLQuery("SELECT  b.bill_no, b.gross_Total, b.pk_customer_id FROM bill_details b JOIN supplier_payment s on  b.creditcustomer ='" + supplier + "' WHERE  s.balance > '"+abc+"' and b.initial_Payment > '"+abc+"' GROUP BY bill_no");
			//Query query = session.createSQLQuery("SELECT  b.bill_no, b.gross_Total, b.pk_customer_id FROM bill_details b JOIN supplier_payment s on s.balance = '"+abc+"'  WHERE   b.creditcustomer ='" + supplier + "' GROUP BY bill_no");
			//Query query = session .createSQLQuery("SELECT  b.bill_no, b.gross_Total, b.pk_customer_id FROM bill_details b JOIN supplier_payment s on b.bill_no = s.bill_no  WHERE s.balance >'"+abc+"' GROUP BY balance");
			//Query query = session.createSQLQuery("SELECT b.bill_no, b.gross_Total, b.pk_customer_id, s.balance FROM bill_details b join supplier_payment s WHERE b.creditcustomer = '" + supplier + "' and b.bill_no=s.bill_no and s.balance!=0");
			//Query query = session .createSQLQuery("SELECT b.bill_no, b.gross_Total, b.pk_customer_id FROM bill_details b JOIN supplier_payment s WHERE b.creditcustomer ='" + supplier + "' AND  s.balance > '"+abc+"' GROUP BY bill_no");
			query.setParameter("fk_supplier_id", fk_supplier_id);
			query.setParameter("abc", abc);
			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
		
	}
	
	//for bill copy
	
	public List getAllVendorBillNo1(String supplier)
	{
		
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		
		try {
			//String paymentdone = "y";
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			/*String abc = "0.0";*/
			Query query = session.createSQLQuery("SELECT b.bill_no1, b.gross_Total, b.pk_customer_id FROM bill_details b WHERE b.creditcustomer ='" + supplier + "'");
			list = query.list();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

		finally {
			if (session != null) {
				hbu.closeSession(session);
			}
		}
		return list;
		
	}
	
	//get bill no for supplier payment 
	
	public List getAllBillNO()
	{
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createQuery("from SupplierPaymentBean group by bill_no");
		 list = query.list();
		 System.out.println("List size in dao"+list.size());
		}
			catch(Exception e){	
				e.printStackTrace();
		}
			finally
			{
					if(session!=null){
					hbu.closeSession(session);
				}
			}
		
	return list;
	}
}
