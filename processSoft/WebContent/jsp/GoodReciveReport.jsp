
<%@page import="com.Fertilizer.bean.grBeanForReport"%>
<%@page import="com.Fertilizer.dao.PoDetailsDao"%>
<%@page import="com.Fertilizer.bean.GetProductDetails"%>
<%@page import="java.util.List"%>
  	<% boolean isHome=false;%>
	<%@include file="commons/header.jsp"%>
	
	<link href="/processSoft/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/processSoft/staticContent/css/dataTables.jqueryui.min.css"  rel="stylesheet" type="text/css" media="all">
	<link rel="stylesheet" href="/processSoft/staticContent/css/tabDemo.css">
 	<link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
    
    <script src="/processSoft/staticContent/js/jquery.min.js"></script>
    <script src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
	<script src="/processSoft/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
	
	
	
<html>
	<head>
		<title>Supplier List</title>
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "GoodReciveReport.jsp" ;
  			}
  			function deletProduct()
    		 {
    		 window.location = "DeletProduct.jsp";
    		 }
  		</script>
	</head>
	<script type="text/javascript"> 
		$(document).ready(function () {
	         var table=$("#list").dataTable();
			 var tableTools = new $.fn.dataTable.TableTools(table, {
				 'sSwfPath':'//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',
				 	'aButtons':['copy','print','csv',{
					 'sExtends':'xls',
					 'sFileName':'Data.xls',
					 'sButtonText': 'Save to Excel'
						}
					]
				});
					$(tableTools.fnContainer()).insertBefore('#list_wrapper');
			});
	</script>
<body id="dt_example" style="min-height:300px;">
	<div class="row">
		<div align="center" style="margin-top: 120px">
			<h2 class="form-name style_heading">Good Receive Report</h2>
		</div>
		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color:#c1b1b1;">
			</div>
		</div>
	</div>		    
	<%
	PoDetailsDao dao=new PoDetailsDao();
	List list12=dao.getGoodReciveDetails();
	%>
	<div id="date">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>
	<div id="demo_jui">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>BillNo</th>
					<th>Quantity</th>
	                <th>Rate</th>
	                <th>Discount</th>
	                <th>GST</th>
	                <th>IGST</th>	                
					<th>Gross Total</th>
					<th>Date</th>
					<th>Shop Name</th>					
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						grBeanForReport sr=(grBeanForReport)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getProductname()%></td>
					<td class="align"><%=sr.getBillno()%></td>
					<td class="align"><%=sr.getQuantity()%></td>
					<td class="align"><%=sr.getRate()%></td>
					<td class="align"><%=sr.getDiscount()%></td>
					<td class="align"><%=sr.getGst()%></td>
					<td class="align"><%=sr.getIgst()%></td>
					<td class="align"><%=sr.getGridTotal()%></td>
					<td class="align"><%=sr.getGRDate()%></td>
					<td class="align"><%=sr.getShop()%></td>					
					
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="wrapper" align="center">
		<!-- <input type="button" value="Back" id="listBtn" class="btn btn-primary" onclick="Back()" />  -->
		<!-- <input type="button" value="Delete Product" id="listBtn2" class="btn btn-primary" onclick="deletProduct()" /> -->
	</div>
</body>
</html>

