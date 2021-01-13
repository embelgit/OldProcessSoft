<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.Fertilizer.utility.NumToWord"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="java.util.Formatter"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="com.itextpdf.text.pdf.codec.Base64.OutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>

<%@ page trimDirectiveWhitespaces="true"%>

<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.util.List"%> import java.math.*;
<%@page import="java.math.BigInteger"%>

<%@ page import="com.itextpdf.text.Element"%>
<%--  <%@page import="com.itextpdf.text.log.SysoLogger"%> --%>
<%@page import="java.util.List"%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.pdf.PdfGState"%>

<%
	response.setContentType("application/pdf");
	
	  //	Long billno=(Long)session.getAttribute("VendorBillNo"); 
	  	String  billno=(String)session.getAttribute("VendorBillNo"); 
	  	
	  	
	  	System.out.println("////////////////////////////////////////////////"+billno);
	 
		Connection conn = null;
		double gsttotal;
		double cgst_amt;
		double sgst_amt;
		String Grand_Total="";
		//String ShopName1 = "sainath industries";
		String ShopName = "SAHYADRI ENTERPRISES";
		String forsainath = "";
		String forOmSai = "";
		String vehicle= "";
		String Gridamount = "";
		double amount = 0.0;
		double bgst = 0.0;
		String outwardDate1 ="";
		String igstper="";
		String Discount ="";
	
		String DiscountAmount = "";
		
		double igst_amt=0.0;
		String Amountabc="";
		double TotalokQty=0.0;
		double forTotal =0.0;
		double SNEW=0.0;
		double totalGst = 0.0;
		double cgst = 0.0;
		double sgst = 0.0;
		int a = 1;
		double totalIgst =0.0;
		
	 	try {

		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
		
	/* 	Image image1 = Image.getInstance("C:/omsailogo1.jpg");
		Image image2 = Image.getInstance("C:/sainath logo.jpg");
 */
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/process_soft", "root", "root");
		Statement stmt = conn.createStatement();
		 ResultSet rs=null;
			//ResultSet rs = stmt.executeQuery("select product_name,village,sale_price,total_amount from fertilizer_bill WHERE customerBill=" + billno);

			//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount,expenses,gross_total from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + 166);
			//ResultSet rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,pd.idno,pd.date,bd.ShopName,bd.custname FROM bill_details bd join po_details pd WHERE bill_no ='"+billno+"'");
			//ResultSet rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,pd.idno,pd.date,bd.ShopName,bd.custname,id.challandate FROM bill_details bd join po_details pd join inwand_details id WHERE bill_no ='"+billno+"'");
			//ResultSet rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.challandate FROM bill_details bd join inwand_details id WHERE bill_no1 ='"+billno+"' GROUP BY bd.pk_customer_id");
			//ResultSet rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.challandate FROM bill_details bd join inwand_details id  on bd.creditcustomer=id.suppliername WHERE bill_no ='"+billno+"' ORDER BY pk_customer_id DESC LIMIT 1");
			//ResultSet rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.inwardDate FROM bill_details bd join outward_details id  on bd.creditcustomer=id.suppliername and  bd.outwardchallan_no = id.outwardchallan_no WHERE bill_no ='"+billno+"' ");
			  rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.inwardDate,id.challan_No,bd.discount  FROM bill_details bd join outward_details id  on bd.creditcustomer=id.suppliername and  bd.outwardchallan_no = id.outwardchallan_no WHERE bill_no1 ='"+billno+"'  GROUP  BY  bd.product_name ");
			//select fb.product_name,fb.hsn,fb.length,fb.quantity,fb.sale_price,fb.cgst,fb.sgst,fb.igst,fb.Discount_perc,fb.Discount_amount,fb.gross_total,fb.CustomerGstNo,fb.InwardChallanNo,fb.OutwardChallanNo,sd.supplier_name,sd.address from fertilizer_billing fb  INNER JOIN supplier_details sd on fb.fk_customer_id= sd.pk_supplier_id WHERE bill_no="+billno
			System.out.println(rs);
			if(!rs.next())
			{
				System.out.println("1st is empty");
				rs=null;
				 
				rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.inwardDate,id.challan_No,bd.discount  FROM bill_details bd join inwand_details id  on bd.creditcustomer=id.suppliername and  bd.InwardChallanNo = id.challan_No WHERE bill_no1 ='"+billno+"' GROUP  BY  bd.product_name  ");
				//rs = stmt.executeQuery("SELECT bd.creditcustomer,bd.product_name,bd.tax_amount,bd.address,bd.outwardchallan_no,bd.InwardChallanNo,bd.discount_Amount,bd.gst_No,bd.okquantity,bd.sale_Date,bd.buy_Price,bd.total,bd.gst,bd.Igst,bd.gross_Total,bd.vehicle,bd.description,bd.hsn,bd.Operation,bd.grid_Total,bd.ShopName,bd.custname,id.challandate,id.challanno FROM bill_details bd join inwand_details id  on bd.creditcustomer=id.suppliername and  bd.InwardChallanNo = id.challanno WHERE bill_no1 ='"+billno+"' GROUP  BY  bd.product_name  ");
			}
			
			rs.first();		

		
		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		 /* Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate);
		  */
	
	
		String stdver1 = (String) sdf.format(d1);
		//String day = sdf1.format(d1.getDate());
		//String Time = sdf2.format(d1.getTime());
		String dtfinl = stdver1;

		DecimalFormat df = new DecimalFormat("#.00");

		Font font15Bold = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD, BaseColor.BLACK);
		Font font15BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font12NoBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font font12BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD | Font.UNDERLINE, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font16BoldUnderline = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD | Font.UNDERLINE, BaseColor.RED);

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
		
		Font NormalRedfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.RED);
		Font NormalRedfont16 = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.NORMAL, BaseColor.RED);

		// step 4

	/* 	System.out.println("Befor IF shop name by vikas "+rs.getString("ShopName"));
		System.out.println("Befor IF shop name by kishor"+ShopName1);
		
		if(ShopName1.equals(rs.getString("ShopName"))){
		System.out.println("if loop For om sai");
		/* image2.scaleToFit(100f, 200f);
		Image imageCenter2 = Image.getInstance(image2);
		imageCenter2.setAlignment(Image.MIDDLE);
		document.add(imageCenter2);
		}
		else {
			
			System.out.println("if loop For Sainath");
			image1.scaleToFit(100f, 200f);
			Image imageCenter1 = Image.getInstance(image1); 
			imageCenter1.setAlignment(Image.MIDDLE);
			document.add(imageCenter1);
		}
		 */
		
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.4f ,0.4f,0.4f};
		table.setWidths(columnWidths);

		PdfPCell table_cell;

			table_cell = new PdfPCell(new Phrase("", Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(table_cell);
	
			table_cell = new PdfPCell(new Phrase("TAX INVOICE", font13));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setPaddingBottom(6f);
			table_cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("               (ISI Certified)", Normalfont11));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.NO_BORDER);
			table.addCell(table_cell);
			
			document.add(table);
															
			
			PdfPTable table2 = new PdfPTable(3);
			table2.setWidthPercentage(100);

			float[] columnWidths2 = { 0.5f,0.3f,0.2f};
			table2.setWidths(columnWidths2);

			PdfPCell table_cell2;
			
			//ShopName=rs.getString("ShopName");
			table_cell2 = new PdfPCell(new Phrase(ShopName.toUpperCase(), font16BoldUnderline));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table2.addCell(table_cell2);
			
			String newBillNo = String.valueOf(billno);
			table_cell2 = new PdfPCell(new Phrase("INVOICE NO:- "+billno, Normalfont12));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table2.addCell(table_cell2);
			
				//outwardDate1 =rs.getString("sale_Date");
				outwardDate1 =rs.getString("sale_Date");
			System.out.println(" hi this is kishor Date =======----------======"+outwardDate1);
			Date cDate=new SimpleDateFormat("yyyy-MM-dd").parse(outwardDate1); 
			 SimpleDateFormat dateFormater3 = new SimpleDateFormat("dd-MM-yyyy");
			 String CdDate = dateFormater3.format(cDate);
			
			table_cell2 = new PdfPCell(new Phrase("Date-"+CdDate, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.RIGHT|Rectangle.TOP);
			table2.addCell(table_cell2);
			

			table_cell2 = new PdfPCell(new Phrase("\nGSTIN NO - 27ACWFS5742B1ZR",font12BoldUnderline));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT);
			table2.addCell(table_cell2);
				
				
			/*  String OutwardChallanNo=rs.getString("outwardchallan_no");
			table_cell2 = new PdfPCell(new Phrase("O/C No : "+OutwardChallanNo, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2); 
			 */
			 
			 String InwardChallanNo1 =rs.getString("challan_No");
			 /* String InwardChallanNo2 =rs.getString("challanno");
			 System.out.println("hi this is Inward New Challan No*************-------"+InwardChallanNo2); */
			 table_cell2 = new PdfPCell(new Phrase("Your Inward Challan No:"+InwardChallanNo1, Normalfont11 ));
			 table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			 table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			 table2.addCell(table_cell2);
			
					  
				String outwardDate=rs.getString("inwardDate");
				/* String outwarddate2=rs.getString("challandate");
				System.out.println("hi this is Inward New Challan Date*************-------"+outwarddate2); */
				 Date date2=new SimpleDateFormat("yyyy-MM-dd").parse(outwardDate); 
				 SimpleDateFormat dateFormater1 = new SimpleDateFormat("dd-MM-yyyy");
				 String oDate = dateFormater1.format(date2);
				 
			System.out.println("hi this is kishor new date ************"+oDate);
			
			table_cell2 = new PdfPCell(new Phrase("Date :"+oDate,Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
		
			
			
			
			
			table_cell2 = new PdfPCell(new Phrase("Plot No, L-9(Part 1) MIDC, Nagapur,                     Ahmednagar -414 111                                           				      Email :botheakshay@gmail.com",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT);
			table2.addCell(table_cell2);
			
			/* String InwardChallanNo=rs.getString("idno"); */
			table_cell2 = new PdfPCell(new Phrase(" ", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
				/*  String inwardDate=rs.getString("date");
				 Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(inwardDate); 
				 SimpleDateFormat dateFormater2 = new SimpleDateFormat("dd-MM-yyyy");
				 String iDate = dateFormater2.format(date1); */
				 
			table_cell2 = new PdfPCell(new Phrase("",Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
			
			table_cell2 = new PdfPCell(new Phrase(""));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
			table_cell2 = new PdfPCell(new Phrase(""));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder( Rectangle.RIGHT |Rectangle.TOP  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			
			document.add(table2);
			
			
			PdfPTable table3 = new PdfPTable(2);
			table3.setWidthPercentage(100);

			float[] columnWidths3 = { 0.5f,0.5f};
			table3.setWidths(columnWidths3);

			PdfPCell table_cell3;

			String name=rs.getString("creditcustomer");
			table_cell3 = new PdfPCell(new Phrase("Billing To : "+name, Normalfont12));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP);
			table3.addCell(table_cell3);
			
			//String address=rs.getString("");
			String custname =rs.getString("custname");
			table_cell3 = new PdfPCell(new Phrase("VENDOR CODE : "+custname, Normalfont12));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			
			
			String address=rs.getString("address");
			table_cell3 = new PdfPCell(new Phrase("Address : "+address, Normalfont12));
			table_cell3.setHorizontalAlignment(Rectangle.LEFT |Rectangle.RIGHT );
			table_cell3.setBorder(Rectangle.LEFT | Rectangle.RIGHT);
			table3.addCell(table_cell3);
			
			//ShopName=rs.getString("ShopName");
			table_cell3 = new PdfPCell(new Phrase("", Normalfont12));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			String CustomerGstNo=rs.getString("gst_No");
			table_cell3 = new PdfPCell(new Phrase("GSTNO : "+CustomerGstNo, Normalfont12));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT |Rectangle.RIGHT  |Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
			/* 
			String OutwardChallanNo=rs.getString("outwardchallan_no");
			table_cell2 = new PdfPCell(new Phrase("O/C No : "+OutwardChallanNo, Normalfont11));
			table_cell2.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell2.setBorder(Rectangle.LEFT | Rectangle.RIGHT  | Rectangle.BOTTOM);
			table2.addCell(table_cell2);
			 */
			String OutwardChallanNo=rs.getString("outwardchallan_no");
			table_cell3 = new PdfPCell(new Phrase("O/C No : "+OutwardChallanNo, Normalfont11));
			table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell3.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table3.addCell(table_cell3);
			
		
		
			document.add(table3);
		
			
			PdfPTable table4 = new PdfPTable(1);
			table4.setWidthPercentage(100);

			float[] columnWidths4 = { 30f};
			table4.setWidths(columnWidths4);

			PdfPCell table_cell4;

			table_cell4 = new PdfPCell(new Phrase(""));
			table_cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell4.setBorder(Rectangle.NO_BORDER);
			table4.addCell(table_cell4);
			
			table_cell4 = new PdfPCell(new Phrase("", Normalfont13));
			table_cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell4.setBorder(Rectangle.NO_BORDER);
			table4.addCell(table_cell4);
		
			document.add(table4);
			
			
			PdfPTable table5 = new PdfPTable(2);
			table5.setWidthPercentage(100);

			float[] columnWidths5 = { 0.5f,0.5f};
			table5.setWidths(columnWidths5);

			PdfPCell table_cell5;
			
			//String //name=rs.getString("supplier_name");
			table_cell5 = new PdfPCell(new Phrase(""));
			table_cell5.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell5.setBorder(Rectangle.NO_BORDER);
			table5.addCell(table_cell5);

			table_cell5 = new PdfPCell(new Phrase(""));
			table_cell5.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell5.setBorder(Rectangle.NO_BORDER);
			table5.addCell(table_cell5);
			
			/* table_cell5 = new PdfPCell(new Phrase(""));
			table_cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell5.setBorder(Rectangle.NO_BORDER);
			table5.addCell(table_cell5);
			
			table_cell5 = new PdfPCell(new Phrase(""));
			table_cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell5.setBorder(Rectangle.NO_BORDER);
			table5.addCell(table_cell5);  */
		
			document.add(table5);
			
			
			PdfPTable table8 = new PdfPTable(2);
			table8.setWidthPercentage(100);

			float[] columnWidths8 = { 0.5f,0.5f};
			table8.setWidths(columnWidths8);

			PdfPCell table_cell8;
			
			//String address=rs.getString("address");
			table_cell8 = new PdfPCell(new Phrase(""));
			table_cell8.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell8.setBorder(Rectangle.NO_BORDER);
			table8.addCell(table_cell8);

			//String CustomerGstNo=rs.getString("CustomerGstNo");
			table_cell8 = new PdfPCell(new Phrase(""));
			table_cell8.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell8.setBorder(Rectangle.NO_BORDER);
			table8.addCell(table_cell8);
			
			table_cell8 = new PdfPCell(new Phrase("\n"));
			table_cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell8.setBorder(Rectangle.NO_BORDER);
			table8.addCell(table_cell8);
			
			table_cell8 = new PdfPCell(new Phrase("\n"));
			table_cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell8.setBorder(Rectangle.NO_BORDER);
			table8.addCell(table_cell8); 
		
			document.add(table8);
			
	//end informatin
			
			
			PdfPTable table6 = new PdfPTable(8);
			table6.setWidthPercentage(100);

			float[] columnWidths6 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table6.setWidths(columnWidths6);
			
			
			PdfPTable table10 = new PdfPTable(8);
			table10.setWidthPercentage(100);

			float[] columnWidths10 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table10.setWidths(columnWidths10);
			
			
			PdfPTable table11 = new PdfPTable(8);
			table11.setWidthPercentage(100);

			float[] columnWidths11 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table11.setWidths(columnWidths11);
			

			PdfPTable table12 = new PdfPTable(8);
			table12.setWidthPercentage(100);

			float[] columnWidths12 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table12.setWidths(columnWidths12);
			
			
			PdfPTable table13 = new PdfPTable(8);
			table13.setWidthPercentage(100);

			float[] columnWidths13 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table13.setWidths(columnWidths13);
			
			
			PdfPTable table14 = new PdfPTable(8);
			table14.setWidthPercentage(100);

			float[] columnWidths14 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table14.setWidths(columnWidths14);
			
			
			PdfPTable table15 = new PdfPTable(8);
			table15.setWidthPercentage(100);

			float[] columnWidths15 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table15.setWidths(columnWidths15);
			
			
			PdfPTable table16 = new PdfPTable(8);
			table16.setWidthPercentage(100);

			float[] columnWidths16 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table16.setWidths(columnWidths16);
			
			
			PdfPTable table17 = new PdfPTable(8);
			table17.setWidthPercentage(100);

			float[] columnWidths17 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table17.setWidths(columnWidths17);
			
			PdfPTable table18 = new PdfPTable(8);
			table18.setWidthPercentage(100);

			float[] columnWidths18 = { 0.4f,0.2f,0.3f,0.2f,0.3f,0.3f,0.3f,0.3f};
			table18.setWidths(columnWidths18);
			
			
			
			//PdfPCell table_cell6;
			
			PdfPCell table_cell6;
			rs.beforeFirst();
			
			
			
				 PdfPCell cell1 = new PdfPCell(new Paragraph("ProductName"));
		        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
				PdfPCell cell2 = new PdfPCell(new Paragraph("HSN"));
				cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell3 = new PdfPCell(new Paragraph("Operation"));
			    cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell4 = new PdfPCell(new Paragraph("Qty"));
			    cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell5 = new PdfPCell(new Paragraph("TaxAmount")); 
			    cell5.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell6 = new PdfPCell(new Paragraph("Description")); 
			    cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell7 = new PdfPCell(new Paragraph("Rate")); 
			    cell7.setHorizontalAlignment(Element.ALIGN_CENTER);
			    PdfPCell cell8 = new PdfPCell(new Paragraph("Amount")); 
			    cell8.setHorizontalAlignment(Element.ALIGN_CENTER);
			    
			   
			   	table6.addCell(cell1);
			    table6.addCell(cell2);
			 	table6.addCell(cell3);
			    table6.addCell(cell4); 
			    table6.addCell(cell5); 
			    table6.addCell(cell6); 
			    table6.addCell(cell7); 
			    table6.addCell(cell8); 
			    
			 	table10.addCell(cell1);
			    table10.addCell(cell2);
			    table10.addCell(cell3);
			    table10.addCell(cell4);
			    table10.addCell(cell5);
			    table10.addCell(cell6); 
			    table10.addCell(cell7); 
			    table10.addCell(cell8); 
			   

			    table11.addCell(cell1);
			    table11.addCell(cell2);
			    table11.addCell(cell3);
			    table11.addCell(cell4); 
			    table11.addCell(cell5);
			    table11.addCell(cell6); 
			    table11.addCell(cell7); 
			    table11.addCell(cell8); 
			    
				
			    table12.addCell(cell1);
			    table12.addCell(cell2);
			    table12.addCell(cell3);
			    table12.addCell(cell4); 
			    table12.addCell(cell5);
			    table12.addCell(cell6); 
			    table12.addCell(cell7); 
			    table12.addCell(cell8); 
			    
			    
			    table13.addCell(cell1);
			    table13.addCell(cell2);
			    table13.addCell(cell3);
			    table13.addCell(cell4); 
			    table13.addCell(cell5);
			    table13.addCell(cell6); 
			    table13.addCell(cell7); 
			    table13.addCell(cell8); 
			    
			    table14.addCell(cell1);
			    table14.addCell(cell2);
			    table14.addCell(cell3);
			    table14.addCell(cell4); 
			    table14.addCell(cell5);
			    table14.addCell(cell6); 
			    table14.addCell(cell7); 
			    table14.addCell(cell8); 
			    
			    table15.addCell(cell1);
			    table15.addCell(cell2);
			    table15.addCell(cell3);
			    table15.addCell(cell4); 
			    table15.addCell(cell5);
			    table15.addCell(cell6); 
			    table15.addCell(cell7); 
			    table15.addCell(cell8); 
			    
			    table16.addCell(cell1);
			    table16.addCell(cell2);
			    table16.addCell(cell3);
			    table16.addCell(cell4); 
			    table16.addCell(cell5);
			    table16.addCell(cell6); 
			    table16.addCell(cell7); 
			    table16.addCell(cell8); 
			    
			    table17.addCell(cell1);
			    table17.addCell(cell2);
			    table17.addCell(cell3);
			    table17.addCell(cell4); 
			    table17.addCell(cell5);
			    table17.addCell(cell6); 
			    table17.addCell(cell7); 
			    table17.addCell(cell8); 
			    
			    table18.addCell(cell1);
			    table18.addCell(cell2);
			    table18.addCell(cell3);
			    table18.addCell(cell4); 
			    table18.addCell(cell5);
			    table18.addCell(cell6); 
			    table18.addCell(cell7); 
			    table18.addCell(cell8); 
	    

		

			// from here the vlaue can be inserted
		while (rs.next())
		{
			if(a<6)	{
			
				 Discount = rs.getString("discount"); 
				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
				 DiscountAmount = rs.getString("discount_Amount");
				//System.out.println("hi this is DiscountAmount++++++++++++++++++"+DiscountAmount);
			 String gt1=rs.getString("gross_Total");
				System.out.println("hi this is total++++++++++++++++++"+gt1);
				long totalInLong = Math.round(Double.parseDouble(gt1)) ;
				String grossTotal = String.valueOf(totalInLong);
				int grossTotalInInteger = Integer.parseInt(grossTotal);  
			
				NumToWord w = new NumToWord();
				String amtInWord1 = w.convert(grossTotalInInteger);
				 Amountabc=String.valueOf(amtInWord1);

			 
		System.out.println("hi this is Kishor ==========-------"+Amountabc);
		
		Grand_Total=rs.getString("gross_Total");
		System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
			
				vehicle = rs.getString("vehicle");
				 bgst = rs.getDouble("gst");
			
			String pronm=rs.getString("product_name");
			table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
            table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			String hsn=rs.getString("hsn");
		 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			String length=rs.getString("operation");//length.
			table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			String quantity =rs.getString("okquantity");//bundel this is quantity
			table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			String weight =rs.getString("tax_amount");//main qty
			table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String hsn =rs.getString("okquantity");//hsm
			if(hsn==null)
			{
				hsn="0";
			} */
			String Description =rs.getString("description");
			table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			/* String Discount_perc =rs.getString("Discount_perc");
			String discount_amt=rs.getString("Discount_amount");
			table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			String sale_price =rs.getString("buy_Price");
			table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			String x=rs.getString("okquantity");
			String y=rs.getString("buy_Price");
			String z=rs.getString("discount_Amount");
		
			double qty=Double.parseDouble(x);
			double price=Double.parseDouble(y);
			double discount=Double.parseDouble(z);
			amount=(qty*price);
			
			String Toamt = rs.getString("grid_Total");
			forTotal= Double.parseDouble(Toamt);
			TotalokQty = TotalokQty + forTotal;
			
			
			 Gridamount =rs.getString("grid_Total");
			table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			
				out.println("this is gst "+bgst);
			  double gstset = bgst/2;
			  
			  System.out.println(" hi this is kishor ++++++100+++"+gstset);
			  
			  
			 cgst=gstset;
			 
			 sgst=gstset;
			 gsttotal=cgst+sgst;
			 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
			 
			 String gt=rs.getString("gross_total");
			 System.out.println(" hi this is kishor ++++++1+++"+gt);
			 double grand_tot=Double.parseDouble(gt);
			 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
			 
			 double gst=Math.round(((amount*gsttotal)/100));
			 
			 totalGst = totalGst+gst;
			 
			 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
			 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
			 
			 cgst_amt=gst/2;
			 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
			 
			 sgst_amt=cgst_amt;
			 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
			 
			 
			  String  newcgst_amt=String.valueOf(cgst_amt);
			 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
			 String  newsgst_amt=String.valueOf(cgst_amt);
			
			 SNEW =cgst_amt+cgst_amt; 
			 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
			 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
			 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
			 
				String asd = rs.getString("grid_Total");
				double ttt = Double.parseDouble(asd);
				
				
				if(cgst<=0 || sgst<=0)
				{
					igstper=rs.getString("Igst");
					System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
					double igst=Double.parseDouble(igstper);
					System.out.println("hi this is Igst++++"+igst);
					igst_amt=((ttt*igst)/100);
					System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
					System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
				}
				else
				{
					igstper="00";
					igst_amt=0.0d;
				}
				totalIgst=totalIgst+igst_amt;
				System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
				 String txamt =rs.getString("gross_total");
			a=a+1;
			}
			else {
				   if(a<11)
				   {
						 
					    Discount = rs.getString("discount"); 
						//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
						 DiscountAmount = rs.getString("discount_Amount");
					   String gt1=rs.getString("gross_Total");
							System.out.println("hi this is total++++++++++++++++++"+gt1);
							long totalInLong = Math.round(Double.parseDouble(gt1)) ;
							String grossTotal = String.valueOf(totalInLong);
							int grossTotalInInteger = Integer.parseInt(grossTotal);  
						
							NumToWord w = new NumToWord();
							String amtInWord1 = w.convert(grossTotalInInteger);
							 Amountabc=String.valueOf(amtInWord1);

						 
					System.out.println("hi this is Kishor ==========-------"+Amountabc);
					
					Grand_Total=rs.getString("gross_Total");
					System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
						
							vehicle = rs.getString("vehicle");
							 bgst = rs.getDouble("gst");
						
						String pronm=rs.getString("product_name");
						table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
			            table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);
						
						String hsn=rs.getString("hsn");
					 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);
						
						String length=rs.getString("operation");//length.
						table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);

						String quantity =rs.getString("okquantity");//bundel this is quantity
						table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);
						
						
						String weight =rs.getString("tax_amount");//main qty
						table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);
						
						/* String hsn =rs.getString("okquantity");//hsm
						if(hsn==null)
						{
							hsn="0";
						} */
						String Description =rs.getString("description");
						table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);

						/* String Discount_perc =rs.getString("Discount_perc");
						String discount_amt=rs.getString("Discount_amount");
						table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6); */
						
						String sale_price =rs.getString("buy_Price");
						table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);

						
						String x=rs.getString("okquantity");
						String y=rs.getString("buy_Price");
						String z=rs.getString("discount_Amount");
					
						double qty=Double.parseDouble(x);
						double price=Double.parseDouble(y);
						double discount=Double.parseDouble(z);
						amount=(qty*price);
						
						String Toamt = rs.getString("grid_Total");
						forTotal= Double.parseDouble(Toamt);
						TotalokQty = TotalokQty + forTotal;
						
						
						 Gridamount =rs.getString("grid_Total");
						table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
						table_cell6.setBorderWidth(1f);
						table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
						table_cell6.setPaddingBottom(4f);
						table6.addCell(table_cell6);
						
						
						
						
							out.println("this is gst "+bgst);
						  double gstset = bgst/2;
						  
						  System.out.println(" hi this is kishor ++++++100+++"+gstset);
						  
						  
						 cgst=gstset;
						 
						 sgst=gstset;
						 gsttotal=cgst+sgst;
						 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
						 
						 String gt=rs.getString("gross_total");
						 System.out.println(" hi this is kishor ++++++1+++"+gt);
						 double grand_tot=Double.parseDouble(gt);
						 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
						 
						 double gst=Math.round(((amount*gsttotal)/100));
						 
						 totalGst = totalGst+gst;
						 
						 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
						 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
						 
						 cgst_amt=gst/2;
						 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
						 
						 sgst_amt=cgst_amt;
						 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
						 
						 
						  String  newcgst_amt=String.valueOf(cgst_amt);
						 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
						 String  newsgst_amt=String.valueOf(cgst_amt);
						
						 SNEW =cgst_amt+cgst_amt; 
						 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
						 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
						 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
						 
							String asd = rs.getString("grid_Total");
							double ttt = Double.parseDouble(asd);
							
							totalIgst=totalIgst+igst_amt;
							
							if(cgst<=0 || sgst<=0)
							{
								igstper=rs.getString("Igst");
								System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
								double igst=Double.parseDouble(igstper);
								System.out.println("hi this is Igst++++"+igst);
								igst_amt=((ttt*igst)/100);
								System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
								System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
							}
							else
							{
								igstper="00";
								igst_amt=0.0d;
							}
							
							
							totalIgst=totalIgst+igst_amt;
							System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
							
							 String txamt =rs.getString("gross_total");
						a=a+1;  
				   
				   }
				   
				   else {
			    		  if(a<16)
			    		  {
					
			    			   Discount = rs.getString("discount"); 
			  				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
			  				 DiscountAmount = rs.getString("discount_Amount");
			    			  String gt1=rs.getString("gross_Total");
								System.out.println("hi this is total++++++++++++++++++"+gt1);
								long totalInLong = Math.round(Double.parseDouble(gt1)) ;
								String grossTotal = String.valueOf(totalInLong);
								int grossTotalInInteger = Integer.parseInt(grossTotal);  
							
								NumToWord w = new NumToWord();
								String amtInWord1 = w.convert(grossTotalInInteger);
								 Amountabc=String.valueOf(amtInWord1);

							 
						System.out.println("hi this is Kishor ==========-------"+Amountabc);
						
						Grand_Total=rs.getString("gross_Total");
						System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
							
								vehicle = rs.getString("vehicle");
								 bgst = rs.getDouble("gst");
							
							String pronm=rs.getString("product_name");
							table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
				            table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);
							
							String hsn=rs.getString("hsn");
						 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);
							
							String length=rs.getString("operation");//length.
							table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);

							String quantity =rs.getString("okquantity");//bundel this is quantity
							table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);
							
							
							String weight =rs.getString("tax_amount");//main qty
							table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);
							
							/* String hsn =rs.getString("okquantity");//hsm
							if(hsn==null)
							{
								hsn="0";
							} */
							String Description =rs.getString("description");
							table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);

							/* String Discount_perc =rs.getString("Discount_perc");
							String discount_amt=rs.getString("Discount_amount");
							table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6); */
							
							String sale_price =rs.getString("buy_Price");
							table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);

							
							String x=rs.getString("okquantity");
							String y=rs.getString("buy_Price");
							String z=rs.getString("discount_Amount");
						
							double qty=Double.parseDouble(x);
							double price=Double.parseDouble(y);
							double discount=Double.parseDouble(z);
							amount=(qty*price);
							
							String Toamt = rs.getString("grid_Total");
							forTotal= Double.parseDouble(Toamt);
							TotalokQty = TotalokQty + forTotal;
							
							
							 Gridamount =rs.getString("grid_Total");
							table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
							table_cell6.setBorderWidth(1f);
							table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
							table_cell6.setPaddingBottom(4f);
							table6.addCell(table_cell6);
							
							
							
							
								out.println("this is gst "+bgst);
							  double gstset = bgst/2;
							  
							  System.out.println(" hi this is kishor ++++++100+++"+gstset);
							  
							  
							 cgst=gstset;
							 
							 sgst=gstset;
							 gsttotal=cgst+sgst;
							 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
							 
							 String gt=rs.getString("gross_total");
							 System.out.println(" hi this is kishor ++++++1+++"+gt);
							 double grand_tot=Double.parseDouble(gt);
							 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
							 
							 double gst=Math.round(((amount*gsttotal)/100));
							 
							 totalGst = totalGst+gst;
							 
							 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
							 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
							 
							 cgst_amt=gst/2;
							 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
							 
							 sgst_amt=cgst_amt;
							 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
							 
							 
							  String  newcgst_amt=String.valueOf(cgst_amt);
							 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
							 String  newsgst_amt=String.valueOf(cgst_amt);
							
							 SNEW =cgst_amt+cgst_amt; 
							 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
							 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
							 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
							 
								String asd = rs.getString("grid_Total");
								double ttt = Double.parseDouble(asd);
								totalIgst=totalIgst+igst_amt;
							
								
								if(cgst<=0 || sgst<=0)
								{
									igstper=rs.getString("Igst");
									System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
									double igst=Double.parseDouble(igstper);
									System.out.println("hi this is Igst++++"+igst);
									igst_amt=((ttt*igst)/100);
									System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
									System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
								}
								else
								{
									igstper="00";
									igst_amt=0.0d;
								}
								
								totalIgst=totalIgst+igst_amt;
								System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
								 String txamt =rs.getString("gross_total");
							a=a+1;    
			    		  }
			    		  
			    		  else {
		            		  if(a<26)
		            		  { 
			    		  
		            			   Discount = rs.getString("discount"); 
		          				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		          				 DiscountAmount = rs.getString("discount_Amount");
		            			  String gt1=rs.getString("gross_Total");
									System.out.println("hi this is total++++++++++++++++++"+gt1);
									long totalInLong = Math.round(Double.parseDouble(gt1)) ;
									String grossTotal = String.valueOf(totalInLong);
									int grossTotalInInteger = Integer.parseInt(grossTotal);  
								
									NumToWord w = new NumToWord();
									String amtInWord1 = w.convert(grossTotalInInteger);
									 Amountabc=String.valueOf(amtInWord1);

								 
							System.out.println("hi this is Kishor ==========-------"+Amountabc);
							
							Grand_Total=rs.getString("gross_Total");
							System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
								
									vehicle = rs.getString("vehicle");
									 bgst = rs.getDouble("gst");
								
								String pronm=rs.getString("product_name");
								table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
					            table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);
								
								String hsn=rs.getString("hsn");
							 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);
								
								String length=rs.getString("operation");//length.
								table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);

								String quantity =rs.getString("okquantity");//bundel this is quantity
								table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);
								
								
								String weight =rs.getString("tax_amount");//main qty
								table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);
								
								/* String hsn =rs.getString("okquantity");//hsm
								if(hsn==null)
								{
									hsn="0";
								} */
								String Description =rs.getString("description");
								table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);

								/* String Discount_perc =rs.getString("Discount_perc");
								String discount_amt=rs.getString("Discount_amount");
								table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6); */
								
								String sale_price =rs.getString("buy_Price");
								table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);

								
								String x=rs.getString("okquantity");
								String y=rs.getString("buy_Price");
								String z=rs.getString("discount_Amount");
							
								double qty=Double.parseDouble(x);
								double price=Double.parseDouble(y);
								double discount=Double.parseDouble(z);
								amount=(qty*price);
								
								String Toamt = rs.getString("grid_Total");
								forTotal= Double.parseDouble(Toamt);
								TotalokQty = TotalokQty + forTotal;
								
								
								 Gridamount =rs.getString("grid_Total");
								table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
								table_cell6.setBorderWidth(1f);
								table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
								table_cell6.setPaddingBottom(4f);
								table6.addCell(table_cell6);
								
								
								
								
									out.println("this is gst "+bgst);
								  double gstset = bgst/2;
								  
								  System.out.println(" hi this is kishor ++++++100+++"+gstset);
								  
								  
								 cgst=gstset;
								 
								 sgst=gstset;
								 gsttotal=cgst+sgst;
								 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
								 
								 String gt=rs.getString("gross_total");
								 System.out.println(" hi this is kishor ++++++1+++"+gt);
								 double grand_tot=Double.parseDouble(gt);
								 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
								 
								 double gst=Math.round(((amount*gsttotal)/100));
								 
								 totalGst = totalGst+gst;
								 
								 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
								 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
								 
								 cgst_amt=gst/2;
								 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
								 
								 sgst_amt=cgst_amt;
								 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
								 
								 
								  String  newcgst_amt=String.valueOf(cgst_amt);
								 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
								 String  newsgst_amt=String.valueOf(cgst_amt);
								
								 SNEW =cgst_amt+cgst_amt; 
								 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
								 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
								 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
								 
									String asd = rs.getString("grid_Total");
									double ttt = Double.parseDouble(asd);
									totalIgst=totalIgst+igst_amt;
								
									
									if(cgst<=0 || sgst<=0)
									{
										igstper=rs.getString("Igst");
										System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
										double igst=Double.parseDouble(igstper);
										System.out.println("hi this is Igst++++"+igst);
										igst_amt=((ttt*igst)/100);
										System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
										System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
									}
									else
									{
										igstper="00";
										igst_amt=0.0d;
									}
									
									totalIgst=totalIgst+igst_amt;
									System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
									 String txamt =rs.getString("gross_total");
								a=a+1; 
		            			  
		            		  }
			    		  
		            		  else {
		                		  if(a<31)
		                		  {
		                			  
		                			  
		                			  Discount = rs.getString("discount"); 
		              				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		              				 DiscountAmount = rs.getString("discount_Amount");
		                			  String gt1=rs.getString("gross_Total");
										System.out.println("hi this is total++++++++++++++++++"+gt1);
										long totalInLong = Math.round(Double.parseDouble(gt1)) ;
										String grossTotal = String.valueOf(totalInLong);
										int grossTotalInInteger = Integer.parseInt(grossTotal);  
									
										NumToWord w = new NumToWord();
										String amtInWord1 = w.convert(grossTotalInInteger);
										 Amountabc=String.valueOf(amtInWord1);

									 
								System.out.println("hi this is Kishor ==========-------"+Amountabc);
								
								Grand_Total=rs.getString("gross_Total");
								System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
									
										vehicle = rs.getString("vehicle");
										 bgst = rs.getDouble("gst");
									
									String pronm=rs.getString("product_name");
									table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
						            table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);
									
									String hsn=rs.getString("hsn");
								 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);
									
									String length=rs.getString("operation");//length.
									table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);

									String quantity =rs.getString("okquantity");//bundel this is quantity
									table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);
									
									
									String weight =rs.getString("tax_amount");//main qty
									table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);
									
									/* String hsn =rs.getString("okquantity");//hsm
									if(hsn==null)
									{
										hsn="0";
									} */
									String Description =rs.getString("description");
									table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);

									/* String Discount_perc =rs.getString("Discount_perc");
									String discount_amt=rs.getString("Discount_amount");
									table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6); */
									
									String sale_price =rs.getString("buy_Price");
									table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);

									
									String x=rs.getString("okquantity");
									String y=rs.getString("buy_Price");
									String z=rs.getString("discount_Amount");
								
									double qty=Double.parseDouble(x);
									double price=Double.parseDouble(y);
									double discount=Double.parseDouble(z);
									amount=(qty*price);
									
									String Toamt = rs.getString("grid_Total");
									forTotal= Double.parseDouble(Toamt);
									TotalokQty = TotalokQty + forTotal;
									
									
									 Gridamount =rs.getString("grid_Total");
									table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
									table_cell6.setBorderWidth(1f);
									table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
									table_cell6.setPaddingBottom(4f);
									table6.addCell(table_cell6);
									
									
									
									
										out.println("this is gst "+bgst);
									  double gstset = bgst/2;
									  
									  System.out.println(" hi this is kishor ++++++100+++"+gstset);
									  
									  
									 cgst=gstset;
									 
									 sgst=gstset;
									 gsttotal=cgst+sgst;
									 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
									 
									 String gt=rs.getString("gross_total");
									 System.out.println(" hi this is kishor ++++++1+++"+gt);
									 double grand_tot=Double.parseDouble(gt);
									 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
									 
									 double gst=Math.round(((amount*gsttotal)/100));
									 
									 totalGst = totalGst+gst;
									 
									 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
									 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
									 
									 cgst_amt=gst/2;
									 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
									 
									 sgst_amt=cgst_amt;
									 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
									 
									 
									  String  newcgst_amt=String.valueOf(cgst_amt);
									 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
									 String  newsgst_amt=String.valueOf(cgst_amt);
									
									 SNEW =cgst_amt+cgst_amt; 
									 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
									 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
									 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
									 
										String asd = rs.getString("grid_Total");
										double ttt = Double.parseDouble(asd);
										totalIgst=totalIgst+igst_amt;
									
										
										if(cgst<=0 || sgst<=0)
										{
											igstper=rs.getString("Igst");
											System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
											double igst=Double.parseDouble(igstper);
											System.out.println("hi this is Igst++++"+igst);
											igst_amt=((ttt*igst)/100);
											System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
											System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
										}
										else
										{
											igstper="00";
											igst_amt=0.0d;
										}
										
										totalIgst=totalIgst+igst_amt;
										System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
										 String txamt =rs.getString("gross_total");
									a=a+1;   
		                			  
		                			}
		                		  else {
		                    		  if(a<36){
		                    			  
		                    			   Discount = rs.getString("discount"); 
		                  				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		                  				 DiscountAmount = rs.getString("discount_Amount");
		                    			  String gt1=rs.getString("gross_Total");
											System.out.println("hi this is total++++++++++++++++++"+gt1);
											long totalInLong = Math.round(Double.parseDouble(gt1)) ;
											String grossTotal = String.valueOf(totalInLong);
											int grossTotalInInteger = Integer.parseInt(grossTotal);  
										
											NumToWord w = new NumToWord();
											String amtInWord1 = w.convert(grossTotalInInteger);
											 Amountabc=String.valueOf(amtInWord1);

										 
									System.out.println("hi this is Kishor ==========-------"+Amountabc);
									
									Grand_Total=rs.getString("gross_Total");
									System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
										
											vehicle = rs.getString("vehicle");
											 bgst = rs.getDouble("gst");
										
										String pronm=rs.getString("product_name");
										table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
							            table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);
										
										String hsn=rs.getString("hsn");
									 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);
										
										String length=rs.getString("operation");//length.
										table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);

										String quantity =rs.getString("okquantity");//bundel this is quantity
										table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);
										
										
										String weight =rs.getString("tax_amount");//main qty
										table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);
										
										/* String hsn =rs.getString("okquantity");//hsm
										if(hsn==null)
										{
											hsn="0";
										} */
										String Description =rs.getString("description");
										table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);

										/* String Discount_perc =rs.getString("Discount_perc");
										String discount_amt=rs.getString("Discount_amount");
										table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6); */
										
										String sale_price =rs.getString("buy_Price");
										table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);

										
										String x=rs.getString("okquantity");
										String y=rs.getString("buy_Price");
										String z=rs.getString("discount_Amount");
									
										double qty=Double.parseDouble(x);
										double price=Double.parseDouble(y);
										double discount=Double.parseDouble(z);
										amount=(qty*price);
										
										String Toamt = rs.getString("grid_Total");
										forTotal= Double.parseDouble(Toamt);
										TotalokQty = TotalokQty + forTotal;
										
										
										 Gridamount =rs.getString("grid_Total");
										table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
										table_cell6.setBorderWidth(1f);
										table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
										table_cell6.setPaddingBottom(4f);
										table6.addCell(table_cell6);
										
										
										
										
											out.println("this is gst "+bgst);
										  double gstset = bgst/2;
										  
										  System.out.println(" hi this is kishor ++++++100+++"+gstset);
										  
										  
										 cgst=gstset;
										 
										 sgst=gstset;
										 gsttotal=cgst+sgst;
										 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
										 
										 String gt=rs.getString("gross_total");
										 System.out.println(" hi this is kishor ++++++1+++"+gt);
										 double grand_tot=Double.parseDouble(gt);
										 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
										 
										 double gst=Math.round(((amount*gsttotal)/100));
										 
										 totalGst = totalGst+gst;
										 
										 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
										 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
										 
										 cgst_amt=gst/2;
										 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
										 
										 sgst_amt=cgst_amt;
										 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
										 
										 
										  String  newcgst_amt=String.valueOf(cgst_amt);
										 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
										 String  newsgst_amt=String.valueOf(cgst_amt);
										
										 SNEW =cgst_amt+cgst_amt; 
										 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
										 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
										 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
										 
											String asd = rs.getString("grid_Total");
											double ttt = Double.parseDouble(asd);
											
											totalIgst=totalIgst+igst_amt;
											
											if(cgst<=0 || sgst<=0)
											{
												igstper=rs.getString("Igst");
												System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
												double igst=Double.parseDouble(igstper);
												System.out.println("hi this is Igst++++"+igst);
												igst_amt=((ttt*igst)/100);
												System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
												System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
											}
											else
											{
												igstper="00";
												igst_amt=0.0d;
											}
											
											totalIgst=totalIgst+igst_amt;
											System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
											 String txamt =rs.getString("gross_total");
										a=a+1;   
			                			  
		                    		  }
		                    		  else {
		                        		  if(a<41)
		                        		  {
		                        			   Discount = rs.getString("discount"); 
		                      				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		                      			 DiscountAmount = rs.getString("discount_Amount");
			                    			    String gt1=rs.getString("gross_Total");
												System.out.println("hi this is total++++++++++++++++++"+gt1);
												long totalInLong = Math.round(Double.parseDouble(gt1)) ;
												String grossTotal = String.valueOf(totalInLong);
												int grossTotalInInteger = Integer.parseInt(grossTotal);  
											
												NumToWord w = new NumToWord();
												String amtInWord1 = w.convert(grossTotalInInteger);
												 Amountabc=String.valueOf(amtInWord1);

											 
										System.out.println("hi this is Kishor ==========-------"+Amountabc);
										
										Grand_Total=rs.getString("gross_Total");
										System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
											
												vehicle = rs.getString("vehicle");
												 bgst = rs.getDouble("gst");
											
											String pronm=rs.getString("product_name");
											table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
								            table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);
											
											String hsn=rs.getString("hsn");
										 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);
											
											String length=rs.getString("operation");//length.
											table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);

											String quantity =rs.getString("okquantity");//bundel this is quantity
											table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);
											
											
											String weight =rs.getString("tax_amount");//main qty
											table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);
											
											/* String hsn =rs.getString("okquantity");//hsm
											if(hsn==null)
											{
												hsn="0";
											} */
											String Description =rs.getString("description");
											table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);

											/* String Discount_perc =rs.getString("Discount_perc");
											String discount_amt=rs.getString("Discount_amount");
											table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6); */
											
											String sale_price =rs.getString("buy_Price");
											table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);

											
											String x=rs.getString("okquantity");
											String y=rs.getString("buy_Price");
											String z=rs.getString("discount_Amount");
										
											double qty=Double.parseDouble(x);
											double price=Double.parseDouble(y);
											double discount=Double.parseDouble(z);
											amount=(qty*price);
											
											String Toamt = rs.getString("grid_Total");
											forTotal= Double.parseDouble(Toamt);
											TotalokQty = TotalokQty + forTotal;
											
											
											 Gridamount =rs.getString("grid_Total");
											table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
											table_cell6.setBorderWidth(1f);
											table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
											table_cell6.setPaddingBottom(4f);
											table6.addCell(table_cell6);
											
											
											
											
												out.println("this is gst "+bgst);
											  double gstset = bgst/2;
											  
											  System.out.println(" hi this is kishor ++++++100+++"+gstset);
											  
											  
											 cgst=gstset;
											 
											 sgst=gstset;
											 gsttotal=cgst+sgst;
											 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
											 
											 String gt=rs.getString("gross_total");
											 System.out.println(" hi this is kishor ++++++1+++"+gt);
											 double grand_tot=Double.parseDouble(gt);
											 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
											 
											 double gst=Math.round(((amount*gsttotal)/100));
											 
											 totalGst = totalGst+gst;
											 
											 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
											 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
											 
											 cgst_amt=gst/2;
											 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
											 
											 sgst_amt=cgst_amt;
											 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
											 
											 
											  String  newcgst_amt=String.valueOf(cgst_amt);
											 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
											 String  newsgst_amt=String.valueOf(cgst_amt);
											
											 SNEW =cgst_amt+cgst_amt; 
											 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
											 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
											 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
											 
												String asd = rs.getString("grid_Total");
												double ttt = Double.parseDouble(asd);
												totalIgst=totalIgst+igst_amt;
											
												
												if(cgst<=0 || sgst<=0)
												{
													igstper=rs.getString("Igst");
													System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
													double igst=Double.parseDouble(igstper);
													System.out.println("hi this is Igst++++"+igst);
													igst_amt=((ttt*igst)/100);
													System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
													System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
												}
												else
												{
													igstper="00";
													igst_amt=0.0d;
												}
												
												totalIgst=totalIgst+igst_amt;
												System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
												 String txamt =rs.getString("gross_total");
											a=a+1;   	  
		                        			  
		                        		  }
		                        		  else {
		                            		  if(a<46){
		                            			  
				                    			    
		                            			  
		                            			  
		                            			   Discount = rs.getString("discount"); 
		                          				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		                          				 DiscountAmount = rs.getString("discount_Amount");
		                            			  String gt1=rs.getString("gross_Total");
													System.out.println("hi this is total++++++++++++++++++"+gt1);
													long totalInLong = Math.round(Double.parseDouble(gt1)) ;
													String grossTotal = String.valueOf(totalInLong);
													int grossTotalInInteger = Integer.parseInt(grossTotal);  
												
													NumToWord w = new NumToWord();
													String amtInWord1 = w.convert(grossTotalInInteger);
													 Amountabc=String.valueOf(amtInWord1);

												 
											System.out.println("hi this is Kishor ==========-------"+Amountabc);
											
											Grand_Total=rs.getString("gross_Total");
											System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
												
													vehicle = rs.getString("vehicle");
													 bgst = rs.getDouble("gst");
												
												String pronm=rs.getString("product_name");
												table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
									            table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												String hsn=rs.getString("hsn");
											 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												String length=rs.getString("operation");//length.
												table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												String quantity =rs.getString("okquantity");//bundel this is quantity
												table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												
												String weight =rs.getString("tax_amount");//main qty
												table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												/* String hsn =rs.getString("okquantity");//hsm
												if(hsn==null)
												{
													hsn="0";
												} */
												String Description =rs.getString("description");
												table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												/* String Discount_perc =rs.getString("Discount_perc");
												String discount_amt=rs.getString("Discount_amount");
												table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6); */
												
												String sale_price =rs.getString("buy_Price");
												table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												
												String x=rs.getString("okquantity");
												String y=rs.getString("buy_Price");
												String z=rs.getString("discount_Amount");
											
												double qty=Double.parseDouble(x);
												double price=Double.parseDouble(y);
												double discount=Double.parseDouble(z);
												amount=(qty*price);
												
												String Toamt = rs.getString("grid_Total");
												forTotal= Double.parseDouble(Toamt);
												TotalokQty = TotalokQty + forTotal;
												
												
												 Gridamount =rs.getString("grid_Total");
												table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												
												
												
													out.println("this is gst "+bgst);
												  double gstset = bgst/2;
												  
												  System.out.println(" hi this is kishor ++++++100+++"+gstset);
												  
												  
												 cgst=gstset;
												 
												 sgst=gstset;
												 gsttotal=cgst+sgst;
												 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
												 
												 String gt=rs.getString("gross_total");
												 System.out.println(" hi this is kishor ++++++1+++"+gt);
												 double grand_tot=Double.parseDouble(gt);
												 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
												 
												 double gst=Math.round(((amount*gsttotal)/100));
												 
												 totalGst = totalGst+gst;
												 
												 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
												 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
												 
												 cgst_amt=gst/2;
												 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
												 
												 sgst_amt=cgst_amt;
												 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
												 
												 
												  String  newcgst_amt=String.valueOf(cgst_amt);
												 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
												 String  newsgst_amt=String.valueOf(cgst_amt);
												
												 SNEW =cgst_amt+cgst_amt; 
												 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
												 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
												 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
												 
													String asd = rs.getString("grid_Total");
													double ttt = Double.parseDouble(asd);
													
													totalIgst=totalIgst+igst_amt;
													
													if(cgst<=0 || sgst<=0)
													{
														igstper=rs.getString("Igst");
														System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
														double igst=Double.parseDouble(igstper);
														System.out.println("hi this is Igst++++"+igst);
														igst_amt=((ttt*igst)/100);
														System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
														System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
													}
													else
													{
														igstper="00";
														igst_amt=0.0d;
													}
													
													totalIgst=totalIgst+igst_amt;
													System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
													 String txamt =rs.getString("gross_total");
												a=a++;   	  
			                        			   
		                            		 }
		                            		  else{
		                            			  Discount = rs.getString("discount"); 
		                          				//System.out.println("hi this is DisCount++++++++++++++++++"+Discount);
		                          				 DiscountAmount = rs.getString("discount_Amount");
		                            			  
				                    			  String gt1=rs.getString("gross_Total");
													System.out.println("hi this is total++++++++++++++++++"+gt1);
													long totalInLong = Math.round(Double.parseDouble(gt1)) ;
													String grossTotal = String.valueOf(totalInLong);
													int grossTotalInInteger = Integer.parseInt(grossTotal);  
												
													NumToWord w = new NumToWord();
													String amtInWord1 = w.convert(grossTotalInInteger);
													 Amountabc=String.valueOf(amtInWord1);

												 
											System.out.println("hi this is Kishor ==========-------"+Amountabc);
											
											Grand_Total=rs.getString("gross_Total");
											System.out.println("hi this is Kishor ==========--12-----"+Grand_Total);
												
													vehicle = rs.getString("vehicle");
													 bgst = rs.getDouble("gst");
												
												String pronm=rs.getString("product_name");
												table_cell6 = new PdfPCell(new Phrase(pronm+"", Normalfont11));
									            table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												String hsn=rs.getString("hsn");
											 	table_cell6 = new PdfPCell(new Phrase(hsn+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												String length=rs.getString("operation");//length.
												table_cell6 = new PdfPCell(new Phrase(length+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												String quantity =rs.getString("okquantity");//bundel this is quantity
												table_cell6 = new PdfPCell(new Phrase(quantity+"" , Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												
												String weight =rs.getString("tax_amount");//main qty
												table_cell6 = new PdfPCell(new Phrase(weight+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												/* String hsn =rs.getString("okquantity");//hsm
												if(hsn==null)
												{
													hsn="0";
												} */
												String Description =rs.getString("description");
												table_cell6 = new PdfPCell(new Phrase(Description+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												/* String Discount_perc =rs.getString("Discount_perc");
												String discount_amt=rs.getString("Discount_amount");
												table_cell6 = new PdfPCell(new Phrase(""+discount_amt, Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6); */
												
												String sale_price =rs.getString("buy_Price");
												table_cell6 = new PdfPCell(new Phrase(sale_price+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);

												
												String x=rs.getString("okquantity");
												String y=rs.getString("buy_Price");
												String z=rs.getString("discount_Amount");
											
												double qty=Double.parseDouble(x);
												double price=Double.parseDouble(y);
												double discount=Double.parseDouble(z);
												amount=(qty*price);
												
												String Toamt = rs.getString("grid_Total");
												forTotal= Double.parseDouble(Toamt);
												TotalokQty = TotalokQty + forTotal;
												
												
												 Gridamount =rs.getString("grid_Total");
												table_cell6 = new PdfPCell(new Phrase(Gridamount+"", Normalfont11));
												table_cell6.setBorderWidth(1f);
												table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
												table_cell6.setPaddingBottom(4f);
												table6.addCell(table_cell6);
												
												
												
												
													out.println("this is gst "+bgst);
												  double gstset = bgst/2;
												  
												  System.out.println(" hi this is kishor ++++++100+++"+gstset);
												  
												  
												 cgst=gstset;
												 
												 sgst=gstset;
												 gsttotal=cgst+sgst;
												 System.out.println(" hi this is kishor ++++++0+++"+gsttotal);
												 
												 String gt=rs.getString("gross_total");
												 System.out.println(" hi this is kishor ++++++1+++"+gt);
												 double grand_tot=Double.parseDouble(gt);
												 System.out.println(" hi this is kishor ++++++2+++"+grand_tot);
												 
												 double gst=Math.round(((amount*gsttotal)/100));
												 
												 totalGst = totalGst+gst;
												 
												 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+amount);
												 System.out.println("hi this is kishor amount++++++++++++++++++-858585-****/////"+gst);
												 
												 cgst_amt=gst/2;
												 System.out.println(" hi this is kishor ++++++3+++"+cgst_amt);
												 
												 sgst_amt=cgst_amt;
												 System.out.println(" hi this is kishor ++++++4+++SGST+++++"+sgst_amt);
												 
												 
												  String  newcgst_amt=String.valueOf(cgst_amt);
												 System.out.println(" hi this is kishor ++++++5++++++++"+newcgst_amt); 
												 String  newsgst_amt=String.valueOf(cgst_amt);
												
												 SNEW =cgst_amt+cgst_amt; 
												 System.out.println(" hi this is kishor ++++++6++++++++"+cgst_amt); 
												 System.out.println(" hi this is kishor ++++++7++++++++"+sgst_amt); 
												 System.out.println(" hi this is kishor ++++++8++++++++"+SNEW); 
												 
													String asd = rs.getString("grid_Total");
													double ttt = Double.parseDouble(asd);
													
													totalIgst=totalIgst+igst_amt;
													
													if(cgst<=0 || sgst<=0)
													{
														igstper=rs.getString("Igst");
														System.out.println("hi this is kishor++++++++++++++-------------122************ "+igstper);
														double igst=Double.parseDouble(igstper);
														System.out.println("hi this is Igst++++"+igst);
														igst_amt=((ttt*igst)/100);
														System.out.println("hi this is kishor++++++++++++++-------------***********123* "+igst_amt);
														System.out.println("hi this is kishor++++++++++++++-------------***********12315----+++* "+grand_tot);
													}
													else
													{
														igstper="00";
														igst_amt=0.0d;
													}
													totalIgst=totalIgst+igst_amt;
													System.out.println(" hi this is IGST Amount Total Is================-----====+++++++ 7777======="+totalIgst);
													 String txamt =rs.getString("gross_total");
												a=a+1; 
		                            		  	}
		                        		  }
		                    		  }
		                		  }
		            		  }
			    		  }
				   }
			}
			
	}
		
			
			
			
		if(a>1 && a<=6 ){
			
			
			
		/* this cell is for mode of tranasport and showing total amount */
		
		table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
		table_cell6.setColspan(8);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
		table_cell6.setBorderWidth(1f);
		table_cell6.setPaddingBottom(3);
		table6.addCell(table_cell6);
		
	 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
		table_cell6.setColspan(8);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
		table_cell6.setBorderWidth(1f);
		table_cell6.setPaddingBottom(3);
		table6.addCell(table_cell6); 
		
		table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(5);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(2);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
		table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(2);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		
		
		/*after that this cells are for GST no and gramd total*/
		
		 
		table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(2);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
	    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell6.setPaddingBottom(2f);
		table6.addCell(table_cell6);
		
		table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(3);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(2f);
		table6.addCell(table_cell6);

		//gst divided in two value using below method
		  
		
		 
		//calculation of CGST amount
		/* String gt=rs.getString("gross_total");
		double grand_tot=Double.parseDouble(gt);
		double cgst=rs.getDouble("cgst");
		double cgst_amt=0.0d;
		cgst_amt=Math.round(((grand_tot*cgst)/100)); */
		
		
		
		table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);

		table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		 

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(5);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		/* String gt=rs.getString("gross_total");
		double grand_tot=Double.parseDouble(gt); */
		/* double sgst=rs.getDouble("sgst");
		double sgst_amt=0.0d;
		grand_tot=grand_tot-cgst_amt;
		sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
		
		table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);

		table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6); 

		

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(5);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		
/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setBorder(Rectangle.NO_BORDER);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6); */
		
		/*-------- Start IGST Code------ */
	
		table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
	
		table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
	
		table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(5);
		//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		

		table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		
		
		table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
	
		table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
	
		/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		 */

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setColspan(6);
		table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		
		/* String gt=rs.getString("gross_total");
		double grand_tot=Double.parseDouble(gt); */
		//double sgst=rs.getDouble("sgst");
		//double sgst_amt=0.0d;
		//grand_tot=grand_tot-cgst_amt;
		//sgst_amt=Math.rint(((grand_tot*sgst)/100));

		
		/*-------- End IGST Code------ */
		
		/* ------------Grand  Total-------------- */
		
	
		
		table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);

		
		table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setBorder(Rectangle.LEFT);
		//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setBorder(Rectangle.NO_BORDER);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);

		table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell6.setBorderWidth(1f);
		table_cell6.setBorder(Rectangle.NO_BORDER);
		table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell6.setPaddingBottom(4f);
		table6.addCell(table_cell6);
		
		document.add(table6);
	
		/* -------------End Grand Total -------------*/
		
		PdfPTable table7 = new PdfPTable(1);
		table7.setWidthPercentage(100);

		float[] columnWidths7 = { 0.9f};
		table7.setWidths(columnWidths7);

		PdfPCell table_cell7;

		
		
	
		table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
		table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
		table_cell7.setBorderWidth(1f);
		table7.addCell(table_cell7);
		
		table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
		table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
		table_cell7.setBorderWidth(1f);
		table7.addCell(table_cell7);
	
		document.add(table7);
		
		
		
		PdfPTable table9 = new PdfPTable(2);
		table9.setWidthPercentage(100);

		float[] columnWidths9 = { 0.6f,0.4f};
		table9.setWidths(columnWidths9);
		
		PdfPCell table_cell9;

		
		table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
		table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
		table_cell9.setBorderWidth(1f);
		table9.addCell(table_cell9);
		
		table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
		table_cell9.setBorderWidth(1f);
		table9.addCell(table_cell9);

		table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
		table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
		table9.addCell(table_cell9);
		
		
		
		table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
		table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
		table_cell9.setBorderWidth(1f);
		table9.addCell(table_cell9);
		

	
		document.add(table9);
		
		}			
		
		if(a>6 && a<=11 ){		
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		}			
		if(a>11 && a<=16){
			
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		}			
		if(a>16 && a<=21){
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);	
	
		
		}			
		if(a>26 && a<=31){
			
		
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		
		}			
		if(a>31 && a<=36){
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);	
		
		}			
		if(a>36 && a<=41)
		{
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		
		
		}			
		if(a>41 && a<=46){
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		}			
		if(a>46){
			
			/* this cell is for mode of tranasport and showing total amount */
			
			table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6);
			
		 	table_cell6 = new PdfPCell(new Phrase("\n\n\n", Normalfont11));
			table_cell6.setColspan(8);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
			table_cell6.setBorderWidth(1f);
			table_cell6.setPaddingBottom(3);
			table6.addCell(table_cell6); 
			
			table_cell6 = new PdfPCell(new Phrase("MODE OF TRANSPORT:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("TOTAL", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			//System.out.println("hi this is kishor amount++++++++++++++++++--------****/////"+amount);
			table_cell6 = new PdfPCell(new Phrase(""+TotalokQty, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			/*after that this cells are for GST no and gramd total*/
			
			 
			table_cell6 = new PdfPCell(new Phrase("Vehicle No:", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(2);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
		    table_cell6.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase(" "+vehicle, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(3);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(2f);
			table6.addCell(table_cell6);

			//gst divided in two value using below method
			  
			
			 
			//calculation of CGST amount
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt);
			double cgst=rs.getDouble("cgst");
			double cgst_amt=0.0d;
			cgst_amt=Math.round(((grand_tot*cgst)/100)); */
			
			
			
			table_cell6 = new PdfPCell(new Phrase("C-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(sgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			/* double sgst=rs.getDouble("sgst");
			double sgst_amt=0.0d;
			grand_tot=grand_tot-cgst_amt;
			sgst_amt=Math.rint(((grand_tot*sgst)/100)); */
			
			table_cell6 = new PdfPCell(new Phrase("S-GST", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			 table_cell6 = new PdfPCell(new Phrase(cgst+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase(""+totalGst/2, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); 

			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
	/* 			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6); */
			
			/*-------- Start IGST Code------ */
		
			table_cell6 = new PdfPCell(new Phrase("I-GST ", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(igstper+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+totalIgst, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(5);
			//table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			

			table_cell6 = new PdfPCell(new Phrase("Discount", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			
			table_cell6 = new PdfPCell(new Phrase(Discount+"%", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			table_cell6 = new PdfPCell(new Phrase(""+DiscountAmount, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
		
			/* table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			 */

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setColspan(6);
			table_cell6.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.TOP |Rectangle.BOTTOM);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			
			/* String gt=rs.getString("gross_total");
			double grand_tot=Double.parseDouble(gt); */
			//double sgst=rs.getDouble("sgst");
			//double sgst_amt=0.0d;
			//grand_tot=grand_tot-cgst_amt;
			//sgst_amt=Math.rint(((grand_tot*sgst)/100));

			
			/*-------- End IGST Code------ */
			
			/* ------------Grand  Total-------------- */
			
		
			
			table_cell6 = new PdfPCell(new Phrase("Grand Total", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			
			table_cell6 = new PdfPCell(new Phrase(""+Grand_Total, Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.LEFT);
			//table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);

			table_cell6 = new PdfPCell(new Phrase("", Normalfont11));
			table_cell6.setBorderWidth(1f);
			table_cell6.setBorder(Rectangle.NO_BORDER);
			table_cell6.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell6.setPaddingBottom(4f);
			table6.addCell(table_cell6);
			
			document.add(table6);
		
			/* -------------End Grand Total -------------*/
			
			PdfPTable table7 = new PdfPTable(1);
			table7.setWidthPercentage(100);

			float[] columnWidths7 = { 0.9f};
			table7.setWidths(columnWidths7);

			PdfPCell table_cell7;

			
			
		
			table_cell7 = new PdfPCell(new Phrase("Amount Chargeable(in words) ", Normalfont11));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
			
			table_cell7 = new PdfPCell(new Phrase(""+Amountabc+" Rupees Only/-", Normalfont13));
			table_cell7.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell7.setBorder(Rectangle.LEFT |Rectangle.RIGHT |Rectangle.BOTTOM);
			table_cell7.setBorderWidth(1f);
			table7.addCell(table_cell7);
		
			document.add(table7);
			
			
			
			PdfPTable table9 = new PdfPTable(2);
			table9.setWidthPercentage(100);

			float[] columnWidths9 = { 0.6f,0.4f};
			table9.setWidths(columnWidths9);
			
			PdfPCell table_cell9;

			
			table_cell9 = new PdfPCell(new Phrase("Declaration", NormalRedfont12));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			
			table_cell9 = new PdfPCell(new Phrase(" For "+ShopName.toUpperCase(), Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);

			table_cell9 = new PdfPCell(new Phrase("I/We hereby certify that our registration  certificate under Maharashtra value tax act 2002 is in force on the date on which the good specified in this 'tax invoice' is made by me/us & it shall be accounted for in the turnover of sales while filling of return and the due tax,If any payble on the sale has been paid or shall be paid.", Normalfont11));
			table_cell9.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table9.addCell(table_cell9);
			
			
			
			table_cell9 = new PdfPCell(new Phrase("\n\n\nAuthorised Signatory"));
			table_cell9.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell9.setBorder(Rectangle.LEFT | Rectangle.RIGHT |Rectangle.BOTTOM );
			table_cell9.setBorderWidth(1f);
			table9.addCell(table_cell9);
			

		
			document.add(table9);
		
		}			
		
		
		
			
			
			
			
			
			
			
		rs.close();
		
		stmt.close();
		conn.close();
		document.close();
			
	 	
	}
	 catch (DocumentException de)
	{
		throw new IOException(de.getMessage());
	}
%>
								