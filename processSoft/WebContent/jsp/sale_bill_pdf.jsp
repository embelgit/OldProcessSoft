
<%-- <%@page import="org.apache.batik.script.Window"%> --%>
<%-- <%@page import="com.embel.bean.NumToWord"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.embel.bean.TotalPurchaseReport"%>
<%@page import="com.itextpdf.text.pdf.PdfEncodings"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
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

<%@page import="com.embel.bean.NumberToWord"%>


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
 <%@page import="com.itextpdf.text.log.SysoLogger"%>
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
	Long billno = (Long) session.getAttribute("BillNo");
	String ClientName = (String) session.getAttribute("partyName");
	
	double expenseExtra =0;
	double totalAmount = 0;
	double vatAmount = 0;
	double interGstAmount = 0;
	int itemCount = 0;
	String totAmountStr = "";
	String vatAmountStr = "";
	String extraExpence = "";
	double totalBags = 0;
	double packingOfBag = 0;
	String allItemNames = "";
	String AllInOne = "";
	double TotalOfTotalAmtWithoutVat = 0;
	double half = 2;
	double gsttax = 0;

	System.out.print(":::::::::::::::::::::::::::::::::::::::::BillNO:-" + billno + "::::::::::::::::::::::::::::");
	System.out.print(":::::::::::::::::::::::::::::::::::::::::BillNO:-" + ClientName + "::::::::::::::::::::::::::::");

	DecimalFormat df = new DecimalFormat("#.00");

	Connection conn = null;

	try {

		Document document = new Document();
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cereals", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT productname.ItemName,salestock.partyName,salestock.purchaseDate,salestock.transportationName,salestock.vehicleNo,salestock.bags,salestock.packing,salestock.totalWeight,salestock.ratePerQut,salestock.vat,salestock.vatAmt,salestock.totalAmtWithVat,salestock.brokerName,salestock.pcontactNo,salestock.transportationName,salestock.gstTinNo,salestock.extraExpence,salestock.stateName,salestock.stateCode,salestock.placeOfSupply,productname.hsnsacNo,supp_detail.address,salestock.iGstAmount FROM productname INNER JOIN salestock ON productname.PkProNameId = salestock.pkItemId INNER JOIN supp_detail ON  salestock.partyName = supp_detail.supp_name WHERE salestock.billNo =" + billno);

		/* 1-ItemName
		2-partyName
		3-purchaseDate
		4-transportationName
		5-vehicleNo
		6-bags
		7-packing
		8-ratePerQut
		9-totalWeight
		10-vat
		11-vatAmt
		12-totalAmtWithVat 
		13-brokerName*/

		Font font17Bold = new Font(Font.FontFamily.TIMES_ROMAN, 17, Font.BOLD, BaseColor.BLACK);
		Font font16Bold = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.BLACK);
		Font font14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		/* String stdver1 = (String) sdf.format(d1);
		String day = sdf1.format(d1.getDate());
		String Time = sdf2.format(d1.getTime());
		String dtfinl = stdver1; */

		//Header Containt Table

		PdfPTable headertable = new PdfPTable(3);
		headertable.setWidthPercentage(100);

		float[] HeadercolumnWidths = { 0.7f, 0.9f,0.7f };
		headertable.setWidths(HeadercolumnWidths);

		PdfPCell headerTable_cell;

		headerTable_cell = new PdfPCell(new Phrase("GSTIN : 27BONPP7288H1Z3 \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM );
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("||SHRI MAHAVIRAY NAMAH|| \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.BOTTOM);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("Subject To Nanded Jurisdiction \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.RIGHT | Rectangle.BOTTOM);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase(""));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder(Rectangle.LEFT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		
		headerTable_cell = new PdfPCell(new Phrase("TAX INVOICE\n ", font17Bold));
		headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		headerTable_cell.setFixedHeight(20f);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder(Rectangle.TOP ); //| Rectangle.LEFT | Rectangle.RIGHT);
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase(""));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.RIGHT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);

		document.add(headertable);
		
		PdfPTable headertable1 = new PdfPTable(2);
		headertable1.setWidthPercentage(100);

		float[] HeadercolumnWidths1 = { 0.9f, 0.7f};
		headertable1.setWidths(HeadercolumnWidths1);

		PdfPCell headerTable_cell1;
		
		
		headerTable_cell1 = new PdfPCell(new Phrase("Om Paras Traders", font17Bold));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headerTable_cell1.setBorder(Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);

		
		headerTable_cell1 = new PdfPCell(new Phrase("Email-id: sanketpatni777@gmail.com\n"));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Grain Merchant & Commission Agent"));
		headerTable_cell1.setBorder(Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("PAN No: BONPP7288H"));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Bhokar Road, TAMSA Tq. Hadgaon.\n "));
		headerTable_cell1.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Mob. 9860614777\n "));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
		headertable1.addCell(headerTable_cell1);

		document.add(headertable1);

		rs.next();

		//Information table

		PdfPTable infotable = new PdfPTable(2);
		infotable.setWidthPercentage(100);

		float[] infoColumnWidths = { 0.9f, 0.7f };
		infotable.setWidths(infoColumnWidths);

		PdfPCell InfoTable_cell;

		InfoTable_cell = new PdfPCell(new Phrase("Bill No : " + billno+"  Date : " + rs.getString("purchaseDate")));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("Truck No : " + rs.getString("vehicleNo") + "\n "));
		/* headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT); */
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("M/S: " + ClientName));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("Transport : " + rs.getString("transportationName") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("Address :" + rs.getString("address")+"\n"));
		InfoTable_cell.setRowspan(2);
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("Broker : " + rs.getString("brokerName") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("Contact No : " + rs.getString("pcontactNo") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("GSTIN : " + rs.getString("gstTinNo") + "\n "));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("Place Of Supply: "+rs.getString("placeOfSupply")+"\n"));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("State : "+rs.getString("stateName")+ " State Code  :"+rs.getString("stateCode")+"\n"));
		InfoTable_cell.setRowspan(1);
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase());
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		infotable.addCell(InfoTable_cell);

		document.add(infotable);

		//end informatin

		//table for particulars
		PdfPTable table = new PdfPTable(9);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.6f, 0.5f, 0.3f, 0.3f, 0.4f, 0.4f, 0.4f,0.4f, 0.5f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;
		rs.beforeFirst();

		table_cell = new PdfPCell(new Phrase("Particular"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("HSN/SAC"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Bags"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Packing (Kg)"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Total Weight (Kg)"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Rate Per Quintal"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("GST Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("IGST Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		while (rs.next()) {

	 expenseExtra = rs.getDouble("extraExpence");
	 
	 gsttax =gsttax + rs.getDouble("vatAmt");
	
	String itemName = rs.getString("ItemName");
	table_cell = new PdfPCell(new Phrase("\n " + itemName));
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String HsnSac = rs.getString("hsnsacNo");
	table_cell = new PdfPCell(new Phrase("\n " + HsnSac));
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	
	String bags = String.valueOf(rs.getDouble("bags"));
	table_cell = new PdfPCell(new Phrase("\n " + bags));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String packing = String.valueOf(rs.getDouble("packing"));
	table_cell = new PdfPCell(new Phrase("\n " + packing));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String totalWeight = String.valueOf(rs.getDouble("totalWeight"));
	table_cell = new PdfPCell(new Phrase("\n " + totalWeight));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String ratePerQut = String.valueOf(rs.getDouble("ratePerQut"));
	table_cell = new PdfPCell(new Phrase("\n " + ratePerQut));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String vatAmt = String.valueOf(rs.getDouble("vatAmt"));
	table_cell = new PdfPCell(new Phrase("\n " + vatAmt));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	
	String iGstAmount = String.valueOf(rs.getDouble("iGstAmount"));
	table_cell = new PdfPCell(new Phrase("\n " + iGstAmount));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	double gst = rs.getDouble("vatAmt");
	double igst = rs.getDouble("iGstAmount");
	double totalAmtWithoutVat = 0;
	if(igst == 0){
	 totalAmtWithoutVat = rs.getDouble("totalAmtWithVat") - rs.getDouble("vatAmt");
	}
	else if(igst != 0){
		totalAmtWithoutVat = rs.getDouble("totalAmtWithVat") - rs.getDouble("iGstAmount");
	}
	String strTotalAmtWithoutVat = df.format(totalAmtWithoutVat);

	/* String totalAmtWithVat =String.valueOf(rs.getDouble("totalAmtWithVat")); */
	table_cell = new PdfPCell(new Phrase("\n " + strTotalAmtWithoutVat));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	TotalOfTotalAmtWithoutVat = TotalOfTotalAmtWithoutVat + totalAmtWithoutVat;

	double vAmt = rs.getDouble("vatAmt");
	vatAmount = vatAmount + vAmt;
	
	double newiGstAmount =  rs.getDouble("iGstAmount");
	interGstAmount = interGstAmount+newiGstAmount;
	
	double totalAmt = rs.getDouble("totalAmtWithVat");
	totalAmount = totalAmount + totalAmt;

	itemCount++;

	//code for total item display on second pdf form of sale bill

	allItemNames = itemName;
	totalBags = rs.getDouble("bags");
	packingOfBag = rs.getDouble("packing");

	AllInOne += allItemNames + "  " + String.valueOf(totalBags) + "  Bags  " + String.valueOf(packingOfBag) + "  Kg  ";

		}

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);
		
		String empty = " ";

		table_cell = new PdfPCell(new Phrase("State : Maharashtra"+" State Code : 27"));
		table_cell.setColspan(4);
		table.addCell(table_cell);
		
		/* String strItemCount = String.valueOf(itemCount);
		table_cell = new PdfPCell(new Phrase(" #Item (" + strItemCount + ")"));
		table.addCell(table_cell); */

		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPadding(0.5f);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPaddingBottom(1);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPaddingBottom(1);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		vatAmountStr = String.valueOf(vatAmount);
		table_cell = new PdfPCell(new Phrase("Total", font14));
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		String TotalOfTotalAmtWithoutVatStr = df.format(TotalOfTotalAmtWithoutVat);
		table_cell = new PdfPCell(new Phrase(TotalOfTotalAmtWithoutVatStr, font14));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase());
		table_cell.setColspan(6);
		table_cell.setRowspan(6);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("CGST Total"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		double cgst = gsttax/half;
		String halfGst = String.valueOf(cgst);
		table_cell = new PdfPCell(new Phrase(halfGst));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("SGST Total"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(halfGst));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		
		table_cell = new PdfPCell(new Phrase("GST Amount"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(vatAmountStr));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		String interGstAmountStr = String.valueOf(interGstAmount);
		table_cell = new PdfPCell(new Phrase("IGST Amount"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(interGstAmountStr));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Freight/Advance"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		String expense = String.valueOf(expenseExtra);

		table_cell = new PdfPCell(new Phrase(expense));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		/* Double doubleVatAmount = Double.parseDouble(vatAmountStr);
		String vatAmtStr;
		if(doubleVatAmount>0 && doubleVatAmount!=null){
			vatAmtStr = df.format(doubleVatAmount);
		}else{
			vatAmtStr = "0.00";
		} */

		table_cell = new PdfPCell(new Phrase("Total Amount Including Tax"));
		table_cell.setColspan(2);
		table.addCell(table_cell);

		double GrandTotal = Double
				.parseDouble(TotalOfTotalAmtWithoutVatStr)
				+ Double.parseDouble(vatAmountStr)
				+ Double.parseDouble(expense)
				+ Double.parseDouble(interGstAmountStr);
		String strTotalWithVat = String.valueOf(df.format(GrandTotal));

		table_cell = new PdfPCell(new Phrase(strTotalWithVat));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(table_cell);

		long longAmt = Math.round(GrandTotal);
		String strGrandTotal = String.valueOf(longAmt);
		int intGrandTotal = Integer.parseInt(strGrandTotal);
		//String amtInWord = NumberToWord.convert(intAmt);

		NumToWord w = new NumToWord();
		String amtInWord = w.convert(intGrandTotal);

		table_cell = new PdfPCell(new Phrase("\n Rupees in words : "
				+ amtInWord + " Only/-\n "));
		table_cell.setColspan(9);
		table.addCell(table_cell);

		document.add(table);

		//footer table

		PdfPTable footerTable = new PdfPTable(2);
		footerTable.setWidthPercentage(100);

		float[] footerColumnWidths = { 0.8f, 0.7f };
		footerTable.setWidths(footerColumnWidths);

		PdfPCell footerTable_cell;

		/* 	footerTable_cell = new PdfPCell(new Phrase("*Goods once sold will not taken back  under any circumstance.\n*Interest @24% pa will charged on  overdue payment\n*Payment bz pazee A/C, charged  on overdue payment\n*No claim for storage breakage  will be enterained once the material  has been delivered form warehouse."));
			footerTable.addCell(footerTable_cell); */

		footerTable_cell = new PdfPCell(
				new Phrase(
						"BANK- The Bhagyalakshmi Mahila Sahakari Bank TAMSA\n IFSC code: HDFC0CBLMSB\n A/C No: 07174000090\n\nBank - STATE BANK OF INDIA,TAMSA\n A/C No: 62244858142\n IFSC Code: SBIN0020307"));
		footerTable.addCell(footerTable_cell);

		footerTable_cell = new PdfPCell(new Phrase(
				"\n\n\n\n\n\n From :\n Om Paras Traders,Tamasa\n\n\n",
				font16Bold));
		footerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		footerTable.addCell(footerTable_cell);

		document.add(footerTable);

		//-------------------------------------This is secound page------------------------------------

		document.newPage();

		document.add(new Paragraph(
				"                                                                          || SHREE || "));
		document.add(new Paragraph(
				"                                                   SUBJECT TO NANDED JURISDICTION "));
		document.add(new Paragraph(
				"                                                                  OM PARAS TRADERS"));
		document.add(new Paragraph(
				"                                                GRAIN MARCHANT & COMMISHION AGENT "));
		document.add(new Paragraph(
				"                                                         Bhokar Road, TAMSA Tq. Hadgaon."));
		document.add(new Paragraph("    "));
		document.add(new Paragraph(
				"----------------------------------------------------------------------------------------------------------------------------------"));
		rs.first();
		document.add(new Paragraph(
				"Bill No : "
						+ billno
						+ "                                                                                                     Date : "
						+ rs.getString("purchaseDate")));
		document.add(new Paragraph("    "));

		document.add(new Paragraph("Shree " + ClientName + "."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		//document.add(new Paragraph("KATNI"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph("Today, Om Paras Traders"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph("have Dispatched  " + AllInOne
				+ " By vehicle No : " + rs.getString("vehicleNo") + "."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"Please check all goods while receiveing and let us know if any discrepancy in the received goods. Do pay Rs."
						+ GrandTotal + " to our Representative ."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		//document.add(new Paragraph("This deal is done under "+brokerName+" reference."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"                                                                    Yours Faithfully  OM PARAS TRADERS"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"--------------------------------------------------Thank You, Visit Again!---------------------------------------------"));

		// step 5
		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>

 --%>
 
 <%-- <%@page import="org.apache.batik.script.Window"%> --%>
<%@page import="com.embel.bean.NumToWord"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.embel.bean.TotalPurchaseReport"%>
<%@page import="com.itextpdf.text.pdf.PdfEncodings"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
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

<%@page import="com.embel.bean.NumberToWord"%>


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
 <%@page import="com.itextpdf.text.log.SysoLogger"%>
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
	Long billno = (Long) session.getAttribute("BillNo");
	String ClientName = (String) session.getAttribute("partyName");
	
	double expenseExtra =0;
	double totalAmount = 0;
	double vatAmount = 0;
	double interGstAmount = 0;
	int itemCount = 0;
	String totAmountStr = "";
	String vatAmountStr = "";
	String extraExpence = "";
	double totalBags = 0;
	double packingOfBag = 0;
	String allItemNames = "";
	String AllInOne = "";
	double TotalOfTotalAmtWithoutVat = 0;
	double TotalOfTotalAmtWithoutVat1 = 0;
	double half = 2;
	double gsttax = 0;
	String hsnsac1 = "";
	String HsnSac = "";
	double GrandTotal = 0.0;
	System.out.print(":::::::::::::::::::::::::::::::::::::::::BillNO:-" + billno + "::::::::::::::::::::::::::::");
	System.out.print(":::::::::::::::::::::::::::::::::::::::::ClientName:-" + ClientName + "::::::::::::::::::::::::::::");

	DecimalFormat df = new DecimalFormat("#.00");

	Connection conn = null;

	try {
		

		Document document = new Document();
		PdfWriter.getInstance(document, response.getOutputStream());
		document.open();

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cereals", "root", "root");
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("SELECT productname.ItemName,salestock.partyName,salestock.purchaseDate,salestock.transportationName,salestock.vehicleNo,salestock.bags,salestock.packing,salestock.totalWeight,salestock.ratePerQut,salestock.vat,salestock.vatAmt,salestock.totalAmtWithVat,salestock.brokerName,salestock.pcontactNo,salestock.transportationName,salestock.gstTinNo,salestock.extraExpence,salestock.stateName,salestock.stateCode,salestock.placeOfSupply,productname.hsnsacNo,supp_detail.address,salestock.iGstAmount FROM productname INNER JOIN salestock ON productname.PkProNameId = salestock.pkItemId INNER JOIN supp_detail ON  salestock.partyName = supp_detail.supp_name WHERE salestock.billNo ="+ billno);

		/* 1-ItemName
		2-partyName
		3-purchaseDate
		4-transportationName
		5-vehicleNo
		6-bags
		7-packing
		8-ratePerQut
		9-totalWeight
		10-vat
		11-vatAmt
		12-totalAmtWithVat 
		13-brokerName*/

		Font font17Bold = new Font(Font.FontFamily.TIMES_ROMAN, 17, Font.BOLD, BaseColor.BLACK);
		Font font16Bold = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD, BaseColor.BLACK);
		Font font14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD, BaseColor.BLACK);
		Font font12 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD, BaseColor.BLACK);
		Font font13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.BOLD, BaseColor.BLACK);

		Font Normalfont13 = new Font(Font.FontFamily.TIMES_ROMAN, 13, Font.NORMAL, BaseColor.BLACK);
		Font Normalfont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.NORMAL, BaseColor.BLACK);
		Font ufont14 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.UNDERLINE, BaseColor.BLACK);

		System.out.println("Query Execute");
		Date d1 = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("E");
		SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss  ");
		sdf2.setTimeZone(TimeZone.getTimeZone("IST"));

		/* String stdver1 = (String) sdf.format(d1);
		String day = sdf1.format(d1.getDate());
		String Time = sdf2.format(d1.getTime());
		String dtfinl = stdver1; */

		document.add(new Paragraph("                                                                   Tax Invoice                   "));
		document.add(new Paragraph("    "));
		//Header Containt Table

		rs.next();
		PdfPTable headertable = new PdfPTable(3);
		headertable.setWidthPercentage(100);

		float[] HeadercolumnWidths = { 0.9f, 0.5f,0.5f };
		headertable.setWidths(HeadercolumnWidths);

		PdfPCell headerTable_cell;

		/* headerTable_cell = new PdfPCell(new Phrase("GSTIN : 27BONPP7288H1Z3 \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM );
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("||SHRI MAHAVIRAY NAMAH|| \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.BOTTOM);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("Subject To Nanded Jurisdiction \n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.RIGHT | Rectangle.BOTTOM);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase(""));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder(Rectangle.LEFT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		
		headerTable_cell = new PdfPCell(new Phrase("TAX INVOICE\n ", font17Bold));
		headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		headerTable_cell.setFixedHeight(20f);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder(Rectangle.TOP ); //| Rectangle.LEFT | Rectangle.RIGHT);
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase(""));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setBorder( Rectangle.RIGHT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell); */
		
		headerTable_cell = new PdfPCell(new Phrase("OM PARAS TRADERS ",font17Bold));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(6);
		headerTable_cell.setRowspan(3);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.LEFT );
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("Invoice No :" +billno));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setRowspan(3);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.BOTTOM | Rectangle.RIGHT | Rectangle.LEFT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
		headerTable_cell = new PdfPCell(new Phrase("Dated :" + rs.getString("purchaseDate")));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		//headerTable_cell.setColspan(2);
		headerTable_cell.setRowspan(3);
		headerTable_cell.setBorder( Rectangle.TOP | Rectangle.RIGHT | Rectangle.BOTTOM |Rectangle.LEFT);
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
			
		headerTable_cell = new PdfPCell(new Phrase("Bhokar Road,Tamsa, Tq.Hadgaon \nGSTIN/UIN : 27BONPP7288H1Z3 \nContact: 9860614777 \nE-Mail : sanketpatni777@gmail.com\n\n\n"));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		//headerTable_cell.setColspan(6);
		headerTable_cell.setRowspan(6);
		headerTable_cell.setBorder( Rectangle.LEFT | Rectangle.BOTTOM );
		// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headertable.addCell(headerTable_cell);
		
			headerTable_cell = new PdfPCell(new Phrase("Delivery Note :"));
			//headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			//headerTable_cell.setColspan(2);
			headerTable_cell.setRowspan(3);
			headerTable_cell.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
			// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
			headertable.addCell(headerTable_cell);
			
			headerTable_cell = new PdfPCell(new Phrase("Mode/Terms of Payment : "));
			//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			//headerTable_cell.setColspan(2);
			headerTable_cell.setRowspan(3);
			headerTable_cell.setBorder( Rectangle.TOP | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.LEFT);
			// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
			headertable.addCell(headerTable_cell);
			
			headerTable_cell = new PdfPCell(new Phrase("Supplier's Ref :"));
			//headerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			//headerTable_cell.setColspan(2);
			headerTable_cell.setRowspan(3);
			headerTable_cell.setBorder( Rectangle.TOP | Rectangle.BOTTOM | Rectangle.RIGHT | Rectangle.LEFT);
			// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
			headertable.addCell(headerTable_cell);
			
			headerTable_cell = new PdfPCell(new Phrase("Other Reference(s) : "));
			//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
			//headerTable_cell.setColspan(2);
			headerTable_cell.setRowspan(3);
			headerTable_cell.setBorder( Rectangle.TOP | Rectangle.RIGHT | Rectangle.BOTTOM | Rectangle.LEFT);
			// headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
			headertable.addCell(headerTable_cell);

		document.add(headertable);
		
		PdfPTable headertable1 = new PdfPTable(3);
		headertable1.setWidthPercentage(100);

		float[] HeadercolumnWidths1 = { 0.9f, 0.5f, 0.5f};
		headertable1.setWidths(HeadercolumnWidths1);

		PdfPCell headerTable_cell1;
		
		
		/* headerTable_cell1 = new PdfPCell(new Phrase("Om Paras Traders", font17Bold));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headerTable_cell1.setBorder(Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);

		
		headerTable_cell1 = new PdfPCell(new Phrase("Email-id: sanketpatni777@gmail.com\n"));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Grain Merchant & Commission Agent"));
		headerTable_cell1.setBorder(Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("PAN No: BONPP7288H"));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Bhokar Road, TAMSA Tq. Hadgaon.\n "));
		headerTable_cell1.setBorder(Rectangle.LEFT | Rectangle.BOTTOM);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Mob. 9860614777\n "));
		headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setBorder(Rectangle.RIGHT | Rectangle.BOTTOM);
		headertable1.addCell(headerTable_cell1); */
		
		headerTable_cell1 = new PdfPCell(new Phrase("Buyer :"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT );
		headertable1.addCell(headerTable_cell1);

		
		headerTable_cell1 = new PdfPCell(new Phrase("Buyer's Order No:"));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Dated :"));
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase(ClientName,font17Bold));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder(  Rectangle.LEFT  );
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Despatch Document No : " + rs.getString("vehicleNo")));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);

		headerTable_cell1 = new PdfPCell(new Phrase("Delivery Note Date : "));
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase(rs.getString("address")+" \n"+rs.getString("stateName")+ " Code  :"+rs.getString("stateCode")+ "\nGSTIN : " + rs.getString("gstTinNo") +"\n\n\n"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		headerTable_cell1.setRowspan(6);
		headerTable_cell1.setBorder(  Rectangle.LEFT | Rectangle.BOTTOM  );
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Despatched through :  "+ rs.getString("transportationName")));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Destination :  "+rs.getString("placeOfSupply")));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase("Terms of Delivery :  "+ rs.getString("transportationName")));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM | Rectangle.LEFT);
		headertable1.addCell(headerTable_cell1);
		
		headerTable_cell1 = new PdfPCell(new Phrase(""));
		//headerTable_cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
		headerTable_cell1.setRowspan(3);
		headerTable_cell1.setBorder( Rectangle.TOP | Rectangle.BOTTOM |Rectangle.RIGHT );
		headertable1.addCell(headerTable_cell1);

		document.add(headertable1);

		

		//Information table

		/* PdfPTable infotable = new PdfPTable(2);
		infotable.setWidthPercentage(100);

		float[] infoColumnWidths = { 0.9f, 0.7f };
		infotable.setWidths(infoColumnWidths);

		PdfPCell InfoTable_cell;

		InfoTable_cell = new PdfPCell(new Phrase("Bill No : " + billno+"  Date : " + rs.getString("purchaseDate")));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("Aadhar No : " + rs.getString("vehicleNo") + "\n "));
		//headerTable_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);

		InfoTable_cell = new PdfPCell(new Phrase("M/S: " + ClientName));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */

		/* InfoTable_cell = new PdfPCell(new Phrase("Transport : " + rs.getString("transportationName") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */
		
		/* InfoTable_cell = new PdfPCell(new Phrase("Address :" + rs.getString("address")+"\n"));
		InfoTable_cell.setRowspan(2);
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("Broker : " + rs.getString("brokerName") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */
		
		/* InfoTable_cell = new PdfPCell(new Phrase("Contact No : " + rs.getString("pcontactNo") + "\n "));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */

		/* InfoTable_cell = new PdfPCell(new Phrase("GSTIN : " + rs.getString("gstTinNo") + "\n "));
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */

		/* InfoTable_cell = new PdfPCell(new Phrase("Place Of Supply: "+rs.getString("placeOfSupply")+"\n"));
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell);
		
		InfoTable_cell = new PdfPCell(new Phrase("State : "+rs.getString("stateName")+ " State Code  :"+rs.getString("stateCode")+"\n"));
		InfoTable_cell.setRowspan(1);
		InfoTable_cell.setBorder(Rectangle.LEFT);
		InfoTable_cell.setFixedHeight(20f);
		infotable.addCell(InfoTable_cell); */
		/* 
		InfoTable_cell = new PdfPCell(new Phrase());
		InfoTable_cell.setBorder(Rectangle.RIGHT);
		infotable.addCell(InfoTable_cell);

		document.add(infotable); */

		//end informatin

		//table for particulars
		PdfPTable table = new PdfPTable(9);
		table.setWidthPercentage(100);

		float[] columnWidths = { 0.6f, 0.5f, 0.3f, 0.3f, 0.4f, 0.4f, 0.4f,0.4f, 0.5f };
		table.setWidths(columnWidths);

		PdfPCell table_cell;
		rs.beforeFirst();

		table_cell = new PdfPCell(new Phrase("Particular"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("HSN/SAC"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Bags"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Packing (Kg)"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Total Weight (Kg)"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Rate Per Quintal"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("GST Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("IGST Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Amount"));
		table_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(table_cell);

		while (rs.next()) {

	 expenseExtra = rs.getDouble("extraExpence");
	 
	 gsttax =gsttax + rs.getDouble("vatAmt");
	
	String itemName = rs.getString("ItemName");
	table_cell = new PdfPCell(new Phrase("\n " + itemName));
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	 HsnSac = rs.getString("hsnsacNo");
	table_cell = new PdfPCell(new Phrase("\n " + HsnSac));
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	
	hsnsac1 = rs.getString("hsnsacNo");
	
	String bags = String.valueOf(rs.getDouble("bags"));
	table_cell = new PdfPCell(new Phrase("\n " + bags));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String packing = String.valueOf(rs.getDouble("packing"));
	table_cell = new PdfPCell(new Phrase("\n " + packing));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String totalWeight = String.valueOf(rs.getDouble("totalWeight"));
	table_cell = new PdfPCell(new Phrase("\n " + totalWeight));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String ratePerQut = String.valueOf(rs.getDouble("ratePerQut"));
	table_cell = new PdfPCell(new Phrase("\n " + ratePerQut));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	String vatAmt = String.valueOf(rs.getDouble("vatAmt"));
	table_cell = new PdfPCell(new Phrase("\n " + vatAmt));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	
	String iGstAmount = String.valueOf(rs.getDouble("iGstAmount"));
	table_cell = new PdfPCell(new Phrase("\n " + iGstAmount));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);
	double gst = rs.getDouble("vatAmt");
	double igst = rs.getDouble("iGstAmount");
	double totalAmtWithoutVat = 0;
	if(igst == 0){
	 totalAmtWithoutVat = rs.getDouble("totalAmtWithVat") - rs.getDouble("vatAmt");
	}
	else if(igst != 0){
		totalAmtWithoutVat = rs.getDouble("totalAmtWithVat") - rs.getDouble("iGstAmount");
	}
	String strTotalAmtWithoutVat = df.format(totalAmtWithoutVat);

	/* String totalAmtWithVat =String.valueOf(rs.getDouble("totalAmtWithVat")); */
	table_cell = new PdfPCell(new Phrase("\n " + strTotalAmtWithoutVat));
	table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
	table.addCell(table_cell);

	TotalOfTotalAmtWithoutVat = TotalOfTotalAmtWithoutVat + totalAmtWithoutVat + gst + igst;

	TotalOfTotalAmtWithoutVat1 = TotalOfTotalAmtWithoutVat1 + totalAmtWithoutVat ;
	double vAmt = rs.getDouble("vatAmt");
	vatAmount = vatAmount + vAmt;
	
	double newiGstAmount =  rs.getDouble("iGstAmount");
	interGstAmount = interGstAmount+newiGstAmount;
	
	double totalAmt = rs.getDouble("totalAmtWithVat");
	totalAmount = totalAmount + totalAmt;

	itemCount++;

	//code for total item display on second pdf form of sale bill

	allItemNames = itemName;
	totalBags = rs.getDouble("bags");
	packingOfBag = rs.getDouble("packing");

	AllInOne += allItemNames + "  " + String.valueOf(totalBags) + "  Bags  " + String.valueOf(packingOfBag) + "  Kg  ";

		}

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("\n\n\n"));
		table_cell.setBorder(Rectangle.RIGHT | Rectangle.LEFT);
		table.addCell(table_cell);
		
		String empty = " ";

		table_cell = new PdfPCell(new Phrase("State : Maharashtra"+" State Code : 27"));
		table_cell.setColspan(4);
		table.addCell(table_cell);
		
		/* String strItemCount = String.valueOf(itemCount);
		table_cell = new PdfPCell(new Phrase(" #Item (" + strItemCount + ")"));
		table.addCell(table_cell); */

		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPadding(0.5f);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPaddingBottom(1);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(empty));
		table_cell.setPaddingBottom(1);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		vatAmountStr = String.valueOf(vatAmount);
		table_cell = new PdfPCell(new Phrase("Total", font14));
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		String TotalOfTotalAmtWithoutVatStr = df.format(TotalOfTotalAmtWithoutVat);
		table_cell = new PdfPCell(new Phrase(TotalOfTotalAmtWithoutVatStr, font14));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
	/* 	
		table_cell = new PdfPCell(new Phrase());
		table_cell.setColspan(6);
		table_cell.setRowspan(6);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("CGST Total"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell); */
		
		double cgst = gsttax/half;
		String halfGst = String.valueOf(cgst);
		/* table_cell = new PdfPCell(new Phrase(halfGst));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase("SGST Total"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(halfGst));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		
		table_cell = new PdfPCell(new Phrase("GST Amount"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		table_cell = new PdfPCell(new Phrase(vatAmountStr));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);
		
		String interGstAmountStr = String.valueOf(interGstAmount);
		table_cell = new PdfPCell(new Phrase("IGST Amount"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase(interGstAmountStr));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		table_cell = new PdfPCell(new Phrase("Freight/Advance"));
		table_cell.setColspan(2);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell);

		String expense = String.valueOf(expenseExtra);

		table_cell = new PdfPCell(new Phrase(expense));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table_cell.setPaddingBottom(2);
		table_cell.setPaddingTop(1);
		table.addCell(table_cell); */
		 /* Double doubleVatAmount = Double.parseDouble(vatAmountStr);
		String vatAmtStr;
		if(doubleVatAmount>0 && doubleVatAmount!=null){
			vatAmtStr = df.format(doubleVatAmount);
		}else{
			vatAmtStr = "0.00";
		} */

		/* table_cell = new PdfPCell(new Phrase("Total Amount Including Tax"));
		table_cell.setColspan(2);
		table.addCell(table_cell); */

		GrandTotal = Double.parseDouble(TotalOfTotalAmtWithoutVatStr);
		String strTotalWithVat = String.valueOf(df.format(GrandTotal));

		/* table_cell = new PdfPCell(new Phrase(strTotalWithVat));
		table_cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		table.addCell(table_cell); */

		long longAmt = Math.round(GrandTotal);
		String strGrandTotal = String.valueOf(longAmt);
		int intGrandTotal = Integer.parseInt(strGrandTotal);
		//String amtInWord = NumberToWord.convert(intAmt);

		NumToWord w = new NumToWord();
		String amtInWord = w.convert(intGrandTotal);

		table_cell = new PdfPCell(new Phrase("\n Amount Chargeable (in words) :\n INR "
				+ amtInWord + " Only/-\n "));
		table_cell.setColspan(9);
		table.addCell(table_cell);

		document.add(table);
		
		PdfPTable footerTable1 = new PdfPTable(6);
		footerTable1.setWidthPercentage(100);

		float[] footerColumnWidths1 = { 0.9f, 0.5f, 0.5f, 0.5f, 0.5f, 0.5f};
		footerTable1.setWidths(footerColumnWidths1);

		PdfPCell footerTable_cell1;
				
		footerTable_cell1 = new PdfPCell(new Phrase("HSN/SAC \n"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Taxable Value"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Central Tax"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(2);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		
		footerTable_cell1 = new PdfPCell(new Phrase("State Tax"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(2);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Rate"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(1);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Amount"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(1);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT);
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Rate"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(1);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Amount"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setColspan(1);
		footerTable_cell1.setRowspan(1);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		


		footerTable_cell1 = new PdfPCell(new Phrase("\n " + HsnSac));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);

		
		
		//String TotalOfTotalAmtWithoutVatStr1 = df.format(TotalOfTotalAmtWithoutVat);
		String TotalOfTotalAmtWithoutVatStr1= df.format(TotalOfTotalAmtWithoutVat1);
		footerTable_cell1 = new PdfPCell(new Phrase(TotalOfTotalAmtWithoutVatStr1, font14));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("2.50%"));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase(halfGst));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);
		
	
		footerTable_cell1 = new PdfPCell(new Phrase("2.50%"));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);
		
		
		footerTable_cell1 = new PdfPCell(new Phrase(halfGst));
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setPaddingBottom(2);
		footerTable_cell1.setPaddingTop(1);
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase("Total"));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		
		footerTable_cell1 = new PdfPCell(new Phrase(TotalOfTotalAmtWithoutVatStr1, font14));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase(""));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase(halfGst));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase(""));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		footerTable_cell1 = new PdfPCell(new Phrase(halfGst));
		//headerTable_cell.setBorder(headerTable_cell.NO_BORDER);
		footerTable_cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		footerTable_cell1.setRowspan(2);
		footerTable_cell1.setBorder( Rectangle.TOP | Rectangle.LEFT | Rectangle.BOTTOM | Rectangle.RIGHT );
		footerTable1.addCell(footerTable_cell1);
		
		double GrandTotal1 = (vatAmount);
		String strTotalWithVat1 = String.valueOf(df.format(GrandTotal1));
		
		long longAmt1 = Math.round(GrandTotal1);
		String strGrandTotal1 = String.valueOf(longAmt1);
		int intGrandTotal1 = Integer.parseInt(strGrandTotal1);
		
		NumToWord w1 = new NumToWord();
		String amtInWord1 = w1.convert(intGrandTotal1);

		footerTable_cell1 = new PdfPCell(new Phrase("\n Tax Amount (in words) : INR "
				+ amtInWord1 + " Only/-\n "));
		footerTable_cell1.setColspan(6);
		footerTable_cell1.setRowspan(8);
		footerTable1.addCell(footerTable_cell1);
		
		document.add(footerTable1);
		
		//footer table

		PdfPTable footerTable = new PdfPTable(2);
		footerTable.setWidthPercentage(100);

		float[] footerColumnWidths = { 0.5f, 0.7f };
		footerTable.setWidths(footerColumnWidths);

		PdfPCell footerTable_cell;

		/* 	footerTable_cell = new PdfPCell(new Phrase("*Goods once sold will not taken back  under any circumstance.\n*Interest @24% pa will charged on  overdue payment\n*Payment bz pazee A/C, charged  on overdue payment\n*No claim for storage breakage  will be enterained once the material  has been delivered form warehouse."));
			footerTable.addCell(footerTable_cell); */

				footerTable_cell = new PdfPCell(new Phrase( ));
		footerTable_cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		//footerTable_cell.setBorder(footerTable_cell.NO_BORDER);
		footerTable_cell.setRowspan(9);
		footerTable.addCell(footerTable_cell);

		 footerTable_cell = new PdfPCell(
				new Phrase(
						"Company's Bank Details \nBank Name               : State Bank of India \nA/c No                       : 62244858142 \nBranch & IFS Code   : Tamasa & SBIN0020307\nBank Name               : The Bhagyalakshmi Mahila Sahakari Bank TAMSA \nA/c No                       : 07174000090 \nBranch & IFS Code   : Tamasa & HDFC0CBLMSB"));
		 //footerTable_cell.setBorder(footerTable_cell.NO_BORDER);
		 footerTable_cell.setRowspan(9);
		 footerTable.addCell(footerTable_cell);

		
		document.add(footerTable);
		
		
		//footer table

				PdfPTable footerTable2 = new PdfPTable(2);
				footerTable2.setWidthPercentage(100);

				float[] footerColumnWidths2 = { 0.7f, 0.9f };
				footerTable2.setWidths(footerColumnWidths2);

				PdfPCell footerTable_cell2;

				/* 	footerTable_cell = new PdfPCell(new Phrase("*Goods once sold will not taken back  under any circumstance.\n*Interest @24% pa will charged on  overdue payment\n*Payment bz pazee A/C, charged  on overdue payment\n*No claim for storage breakage  will be enterained once the material  has been delivered form warehouse."));
					footerTable.addCell(footerTable_cell); */

						footerTable_cell2 = new PdfPCell(new Phrase("Company's PAN    : BONPP7288H \n Declaration\n We declare that this invoice shows the \nactual price of the goods described and \nthat all particulars are true and correct" ));
				footerTable_cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
				//footerTable_cell.setBorder(footerTable_cell.NO_BORDER);
				footerTable_cell1.setRowspan(7);
				footerTable2.addCell(footerTable_cell2);

				 footerTable_cell2 = new PdfPCell(
						new Phrase("                            For OM PARAS TRADERS     \n\n\n\n                                  Authorised Signatory" ));
				 //footerTable_cell.setBorder(footerTable_cell.NO_BORDER);
				 footerTable_cell2.setRowspan(7);
				 footerTable2.addCell(footerTable_cell2);

				
				document.add(footerTable2);
		
		//-------------------------------------This is secound page------------------------------------

		document.newPage();

		document.add(new Paragraph(
				"                                                                          || SHREE || "));
		document.add(new Paragraph(
				"                                                   SUBJECT TO NANDED JURISDICTION "));
		document.add(new Paragraph(
				"                                                                 OM PARAS TRADERS"));
		document.add(new Paragraph(
				"                                                GRAIN MARCHANT & COMMISHION AGENT "));
		document.add(new Paragraph(
				"                                                        Bhokar Road, TAMSA Tq.Hadgaon"));
		document.add(new Paragraph("    "));
		document.add(new Paragraph(
				"----------------------------------------------------------------------------------------------------------------------------------"));
		rs.first();
		document.add(new Paragraph(
				"Bill No : "
						+ billno
						+ "                                                                                                     Date : "
						+ rs.getString("purchaseDate")));
		document.add(new Paragraph("    "));

		document.add(new Paragraph("Shree " + ClientName + "."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		//document.add(new Paragraph("KATNI"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph("Today, OM PARAS Traders"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph("have Dispatched  " + AllInOne
				+ " By vehicle No : " + rs.getString("vehicleNo") + "."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"Please check all goods while receiveing and let us know if any discrepancy in the received goods. Do pay Rs."
						+ GrandTotal + " to our Representative ."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		//document.add(new Paragraph("This deal is done under "+brokerName+" reference."));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"                                                                    Yours Faithfully  OM PARAS TRADERS"));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(" "));
		document.add(new Paragraph(
				"--------------------------------------------------Thank You, Visit Again!---------------------------------------------"));

		// step 5
		rs.close();
		stmt.close();
		conn.close();
		document.close();

	} catch (DocumentException de) {
		throw new IOException(de.getMessage());
	}
%>