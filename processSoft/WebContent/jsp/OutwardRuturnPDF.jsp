
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
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
<%@page import="java.util.List"%>

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
	String outwardchallanno = (String) session.getAttribute("fertilizerBillNo");
	 String suppliername = (String) session.getAttribute("creditCustomerName1"); 
 
	int a = 1;
	double sum = 0.0;
	double tax = 0.0;
	String taxVal = "";
	String inwardChallan="";
	String PONo="";
	String PODate="";
	String inwardChallanDate="";
	double swachaTax = 0.0;
	double groTOT = 0.0;
	String xx1 = "";
	/* String ShopName = ""; */
	/* String Sname = ""; */
	double iGST = 0d;
	double GST = 0d;
	double ShopId = 0d;
	double gstTotal =0d;
	double igstTotal =0d;
	double gstTotal1 =0d;
	double igstTotal1 =0d;
	double discount=0d;
	double intialPay=0d;
	double sale=0d;
	double tota=0d;
	/* Double discount=0d; */
	String grossT = "";
	 String VechicleNo = null;
	 String Dis = null;
	 String   boxDescription = null;
	Connection conn = null;
	String okQty = null;
	String forrj = null;
	String forup = null;
	double TotalokQty = 0.0 ;
	double forTotal = 0.0;
	double unprocessquantity =0.0;
	double forTotal1 =0.0;
	double rejectedquantity =0.0;
	double forTotal2 =0.0;
	String ShopName1 = "sainath industries";
	String ShopName = "SAHYADRI ENTERPRISES";


	try {

		// step 1
		Document document = new Document();

		// step 2

		PdfWriter.getInstance(document, response.getOutputStream());

		// step 3
		document.open();
		/* Image image1 = Image.getInstance("C:/omsailogo1.jpg");
		Image image2 = Image.getInstance("C:/sainath logo.jpg"); */

		

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/process_soft", "root", "root");
		Statement stmt = conn.createStatement();

		//ResultSet rs = stmt.executeQuery("select product_name,village,sale_price,total_amount from fertilizer_bill WHERE customerBill=" + billno);

		//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount,expenses,gross_total from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + 166);
		//ResultSet rs = stmt.executeQuery("select o.IdNo,o.suppliername,o.challan_No,o.vechicleNo,o.inwardDate,o.outward_date,o.productName,o.ShopName,o.description,o.rejectedquantity,o.rate,o.unprocessquantity,o.boxDescripation,o.okquantity,p.pono,p.PODate,o.tinNo,O.operation,o.hsn from outward_details o left join inwand_details p on o.challan_No=p.challanno  where o.outwardchallan_no='"+outwardchallanno+"'");
		//ResultSet rs = stmt.executeQuery("select o.IdNo,o.suppliername,o.challan_No,o.vechicleNo,o.inwardDate,o.outward_date,o.productName,o.ShopName,o.description,o.rejectedquantity,o.rate,o.unprocessquantity,o.boxDescripation,o.okquantity,o.tinNo,O.operation,o.hsn from outward_details o   where o.outwardchallan_no='"+outwardchallanno+"'");
		//ResultSet rs = stmt.executeQuery("select o.IdNo,o.suppliername,o.challan_No,o.vechicleNo,o.inwardDate,o.outward_date,o.productName,o.ShopName,o.description,o.rejectedquantity,o.rate,o.unprocessquantity,o.boxDescripation,o.okquantity,o.tinNo,O.operation,o.hsn,sd.address from outward_details o JOIN supplier_details sd on o.suppliername=sd.supplier_name  where o.outwardchallan_no='"+outwardchallanno+"'");
		ResultSet rs = stmt.executeQuery("select o.idno,o.SupplierName,o.ChallanNo,o.vehicleName,o.InwardDate,o.OutwardDate,o.ProductName,o.ShopName,o.description,o.RejQty,o.Rate,o.UnprocesQty,o.description,o.OkQuantity,o.hsn,O.Operaation,o.hsn,o.date,o.ReturnQty,o.boxDescription,sd.address,sd.tin_no from outward_return o JOIN supplier_details sd on o.SupplierName=sd.supplier_name where o.outwardChallanno='"+outwardchallanno+"'");
				
		
		rs.first();
		
		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));
/* 
		Date billDate = new Date();
		SimpleDateFormat dateFormater = new SimpleDateFormat("dd-MM-yyyy");
		String StrBillDate = dateFormater.format(billDate); */
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

		Font font13Bold = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);
		Font font12Bold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font11Bold = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.BOLD, BaseColor.BLACK);

		Font Normalfont11 = new Font(Font.FontFamily.TIMES_ROMAN, 11, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);
       
		
		// step 4
				/* /* System.out.println("Befor IF shop name by vikas "+rs.getString("ShopName"));
				System.out.println("Befor IF shop name by kishor"+ShopName1);
				 */ 
			/* 	if(ShopName1.equals(rs.getString("ShopName"))){
				System.out.println("if loop For om sai");
				image2.scaleToFit(100f, 200f);
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
				} */
		
		PdfPTable table11 = new PdfPTable(1);
		table11.setWidthPercentage(100);

		float[] columnWidths11 = { 0.4f};
		table11.setWidths(columnWidths11);
		
		PdfPCell table_cell11;
		

		table_cell11 = new PdfPCell(new Phrase("Outward Return Challan", font15Bold));
		table_cell11.setHorizontalAlignment(Element.ALIGN_CENTER);
		//table_cell11.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
		table_cell11.setPaddingBottom(7f);
	    table_cell11.setPaddingTop(5f);
		table_cell11.setColspan(1);
		table11.addCell(table_cell11);
		
		document.add(table11);
		// step 4
		
		PdfPTable table = new PdfPTable(3);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.4f ,0.3f,0.2f};
		table.setWidths(columnWidths);

		PdfPCell table_cell;
		
				inwardChallan = rs.getString("ChallanNo");
				inwardChallanDate = rs.getString("InwardDate");
				/* PONo = rs.getString("pono"); */
			/* 	PODate = rs.getString("PODate");
				System.out.println("PODate +++++++++++"+PODate);  */
				
				/*  Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(PODate); 
				 SimpleDateFormat dateFormater1 = new SimpleDateFormat("dd-MM-yyyy");
				 String pDate = dateFormater1.format(date1);  */
				  
				 Date iwDate=new SimpleDateFormat("yyyy-MM-dd").parse(inwardChallanDate); 
				 SimpleDateFormat dateFormater2 = new SimpleDateFormat("dd-MM-yyyy");
				 String iDate = dateFormater2.format(iwDate); 
				
				
			//ShopName =rs.getString("ShopName");
			table_cell = new PdfPCell(new Phrase(""+ShopName.toUpperCase(), font15Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.TOP | Rectangle.LEFT | Rectangle.RIGHT);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("To" , font12));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.LEFT);
			table_cell.setColspan(2);
			table.addCell(table_cell);

			table_cell = new PdfPCell(new Phrase("Plot No, L-9", font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.LEFT | Rectangle.RIGHT );
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("" +suppliername , font12));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT );
			table_cell.setColspan(2);
			table.addCell(table_cell);
			

			table_cell = new PdfPCell(new Phrase("(Part 1) MIDC, Nagapur, ", font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			
			String tinNo = rs.getString("tin_no");
			table_cell = new PdfPCell(new Phrase("GST-No -"+tinNo,font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder(  Rectangle.RIGHT);
			table_cell.setColspan(2);
			table.addCell(table_cell);  
			
			table_cell = new PdfPCell(new Phrase("Ahmednagar -414 111  ", font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			String Address =rs.getString("address");
			table_cell = new PdfPCell(new Phrase("Address:-  "+Address,font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);			
			table_cell.setBorder( Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell); 
			
			 table_cell = new PdfPCell(new Phrase("",font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell); 
			
			table_cell = new PdfPCell(new Phrase("\n", font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("Inward Challan No :" +inwardChallan,font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);			
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			//table_cell = new PdfPCell(new Phrase("Date : "+inwardChallanDate ,font12NoBold));
			table_cell = new PdfPCell(new Phrase("Date : " +iDate,font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			String IdNo = rs.getString("idno");
			table_cell = new PdfPCell(new Phrase("Vendor Code No.:"+IdNo, font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			table_cell = new PdfPCell(new Phrase("Challan No: " + outwardchallanno,font12Bold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			
			String outwarddate =rs.getString("OutwardDate");
			

		     Date ODate=new SimpleDateFormat("yyyy-MM-dd").parse(outwarddate); 
			 SimpleDateFormat dateFormater3 = new SimpleDateFormat("dd-MM-yyyy");
			 String OdDate = dateFormater3.format(ODate); 
			
			
			table_cell = new PdfPCell(new Phrase("Date : " + OdDate,font12NoBold));
			//table_cell = new PdfPCell(new Phrase("Date : "+outwarddate,font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell.setBorder(Rectangle.RIGHT | Rectangle.TOP | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			table.addCell(table_cell);
			
			
		/* 	String VechicleNo = rs.getString("vechicleNo");
			table_cell = new PdfPCell(new Phrase("Vechicle No: "+VechicleNo, font12NoBold));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setPaddingBottom(7f);
			table_cell.setPaddingTop(5f);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			
			table.addCell(table_cell); */

			//String VechicleNo = rs.getString("vechicleNo");
			table_cell = new PdfPCell(new Phrase(""));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setPaddingBottom(7f);
			table_cell.setPaddingTop(5f);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM);
			table_cell.setColspan(1);
			
			table.addCell(table_cell);
			
			String inwordChallAn = rs.getString("ChallanNo");
			/* table_cell = new PdfPCell(new Phrase("Inward Challan No: "+inwordChallAn , font12NoBold)); */
			table_cell = new PdfPCell(new Phrase("  "));
			table_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
			table_cell.setPaddingBottom(7f);
			table_cell.setPaddingTop(5f);
			table_cell.setBorder( Rectangle.LEFT | Rectangle.RIGHT | Rectangle.BOTTOM); 
			 
			
			table_cell.setColspan(3);
			table.addCell(table_cell);
			
			document.add(table);
			


		PdfPTable table3 = new PdfPTable(8);
		table3.setWidthPercentage(100);

		float[] columnWidths3 = { 0.3f, 0.2f,0.2f,0.22f, 0.2f, 0.2f, 0.3f,0.25f };
		table3.setWidths(columnWidths3);

		PdfPCell table_cell3;

		table_cell3 = new PdfPCell(new Phrase("Goods Details", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Operation", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		
		table_cell3 = new PdfPCell(new Phrase("Hsn Code", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Date", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("Return Qty", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		
		System.out.println("hi i am kishor "+rejectedquantity);
		table_cell3 = new PdfPCell(new Phrase("Reject Qty", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Unprocess Qty", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("Description", Normalfont11));
		table_cell3.setBorderWidth(1f);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setPaddingBottom(4f);
		table3.addCell(table_cell3); 

		rs.beforeFirst();
		
		//ResultSet rs = stmt.executeQuery("select fertilizer_bill.product_name,village, manufacturing_company, batch_no, expiry_date, fertilizer_bill.weight, quantity, fertilizer_bill.sale_price, total_amount, total_amount from fertilizer_bill left join product_details on fertilizer_bill.fk_product_id = product_details.pk_product_id where fertilizer_bill.customerBill =" + billno);
		while (rs.next()) {
			
			inwardChallan = rs.getString("ChallanNo");
			inwardChallanDate = rs.getString("InwardDate");
			
			 boxDescription = rs.getString("boxDescription");
			
			String product_name = rs.getString("ProductName");
			String date = rs.getString("date");
			
			 Date ODate1=new SimpleDateFormat("yyyy-MM-dd").parse(date); 
			 SimpleDateFormat dateFormater4 = new SimpleDateFormat("dd-MM-yyyy");
			 String OdDate1 = dateFormater3.format(ODate1); 
			
			table_cell3 = new PdfPCell(new Phrase(product_name , font12NoBold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			String operation = rs.getString("Operaation");
			table_cell3 = new PdfPCell(new Phrase(operation, font12NoBold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			
			String hsn = rs.getString("hsn");
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3 = new PdfPCell(new Phrase(hsn, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			String manufacturing_company = rs.getString("date");
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			//table_cell3 = new PdfPCell(new Phrase(manufacturing_company, font12NoBold));
			table_cell3 = new PdfPCell(new Phrase(OdDate1, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			String hsnNumber = rs.getString("ReturnQty");
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3 = new PdfPCell(new Phrase(hsnNumber, font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);

			double weight = rs.getDouble("RejQty");
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(weight), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			
			
			
			
		/* 	
			forup = rs.getString("unprocessquantity");
			//forTotal1 = Integer.parseInt(forup);
			forTotal1 = Double.parseDouble(forup);
			unprocessquantity = unprocessquantity + forTotal1; */

			String quantity = rs.getString("UnprocesQty");
			System.out.println("hi kishor*********+++++++------"+quantity);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3 = new PdfPCell(new Phrase(String.valueOf(quantity), font12NoBold));
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3);
			//this is Grid discription
			 String Gritdisc = rs.getString("description");
			table_cell3 = new PdfPCell(new Phrase(Gritdisc, font12NoBold));
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM);
			table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
			table_cell3.setBorderWidth(1f);
			table_cell3.setPaddingTop(2);
			table_cell3.setPaddingBottom(2);
			table3.addCell(table_cell3); 
			
			okQty = rs.getString("ReturnQty");
			System.out.println("hi this kishor+++++++++++//////////////*************"+okQty);
			//forTotal = Integer.parseInt(okQty);
			forTotal= Double.parseDouble(okQty);
		
			 VechicleNo = rs.getString("vehicleName");
			 Dis = rs.getString("description");
			  boxDescription = rs.getString("boxDescription");
			 //ShopName =rs.getString("ShopName");

			 
				TotalokQty = TotalokQty + forTotal;
				
				forup = rs.getString("UnprocesQty");
				//forTotal1 = Integer.parseInt(forup);
				forTotal1 = Double.parseDouble(forup);
				unprocessquantity = unprocessquantity + forTotal1;
				
				forrj = rs.getString("RejQty");
				forTotal2 = Double.parseDouble(forrj);
				rejectedquantity = rejectedquantity + forTotal2;
				
				System.out.println("hi this kishor+++++"+forTotal2);
				
		}
		
		
		
		table_cell3 = new PdfPCell(new Phrase("\n\n\n\n\n", Normalfont11));
		table_cell3.setColspan(8);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT   | Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n\n\n\n", Normalfont11));
		table_cell3.setColspan(8);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT  | Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		
		table_cell3 = new PdfPCell(new Phrase("Total Qty:"));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell3.setBorder(Rectangle.LEFT  | Rectangle.TOP | Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		System.out.println("hi this kishor+++++"+TotalokQty);
		table_cell3 = new PdfPCell(new Phrase(""+TotalokQty, font12NoBold ));
		table_cell3.setColspan(1);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP  | Rectangle.BOTTOM |Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
	System.out.println("hi this kishor---------"+rejectedquantity);
		table_cell3 = new PdfPCell(new Phrase(""+rejectedquantity, font12NoBold ));
		table_cell3.setColspan(1);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP  | Rectangle.BOTTOM |Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		
		System.out.println("hi this kishor/////////"+unprocessquantity);
		table_cell3 = new PdfPCell(new Phrase(""+unprocessquantity, font12NoBold ));
		table_cell3.setColspan(1);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP  | Rectangle.BOTTOM |Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("", font12NoBold ));
		table_cell3.setColspan(1);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP  | Rectangle.BOTTOM |Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		//String VechicleNo = rs.getString("vechicleNo");
		//table_cell = new PdfPCell(new Phrase("Vechicle No: "+VechicleNo, font12NoBold));
		table_cell3 = new PdfPCell(new Phrase("Vehicle No:"+VechicleNo, font12NoBold));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP  | Rectangle.BOTTOM |Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
			
		//String desc =rs.getString("boxDescripation");
		//String boxDescription = rs.getString("boxDescription");
		table_cell3 = new PdfPCell(new Phrase("Description:"+boxDescription, font12NoBold));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.LEFT  | Rectangle.TOP | Rectangle.RIGHT |  Rectangle.BOTTOM);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3); 
		
	
		table_cell3 = new PdfPCell(new Phrase("\n\n\n\n\n\n\n\n", Normalfont11));
		table_cell3.setColspan(8);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT  | Rectangle.RIGHT  );
		
		table3.addCell(table_cell3);
		 
		

		table_cell3 = new PdfPCell(new Phrase("RECEIVED THE ABOVE MENTIONED GOODS", Normalfont11));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT | Rectangle.TOP);
		table_cell3.setBorderWidth(1f);
		table3.addCell(table_cell3);
		
		
		
		table_cell3 = new PdfPCell(new Phrase("                 For :- "+ShopName.toUpperCase(),font13Bold));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_LEFT);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.TOP);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("IN GOOD ORDER AND CONDITION", Normalfont11));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder( Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table_cell3.setPaddingLeft(3);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("", Normalfont11));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n\n", Normalfont11));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);

		table_cell3 = new PdfPCell(new Phrase("\n\n", Normalfont11));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("SIGNATURE", Normalfont11));
		table_cell3.setColspan(2);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.LEFT );
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);		
		
		table_cell3 = new PdfPCell(new Phrase("LABOUR CHARGES ONLY", font11Bold));
		table_cell3.setColspan(4);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.TOP);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("SIGNATURE", Normalfont11));
		table_cell3.setColspan(2);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		table_cell3 = new PdfPCell(new Phrase("\n", Normalfont11));
		table_cell3.setColspan(3);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.BOTTOM | Rectangle.LEFT );
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		
		
		table_cell3 = new PdfPCell(new Phrase("FormatNo:FM.ADM.10 REV No - 01 ", Normalfont11));
		table_cell3.setColspan(3);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.BOTTOM );
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		
		
		table_cell3 = new PdfPCell(new Phrase("\n", Normalfont11));
		table_cell3.setColspan(2);
		table_cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		table_cell3.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);
		table_cell3.setBorderWidth(1f);
		table_cell3.setPaddingBottom(3);
		table3.addCell(table_cell3);
		
		

		document.add(table3); 
		// step 5 

		rs.close();
		stmt.close();
		conn.close();
		document.close();
		

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>
