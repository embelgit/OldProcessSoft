
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
		<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownDetails") %> <%}%> <%if(abc.equals("english")){%>Product List<%}%> </h2>
			  	</div>
			 
    </div>
  		
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "product_detail.jsp" ;
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
		
		
		
		<!-- <div class="row">
				    <div align="center">
				  		<h2 class="form-name style_heading">Credit Customer List</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
		</div> -->
			    
	<%
	ProductDetailsDao dao=new ProductDetailsDao();
	List list12=dao.getProductList(request);
	
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
					<!-- <th>Category</th> -->
	                <th>Manufacturing Company</th>
	                <th>Tax Name</th>	                
					<th>Tax Percentage</th>
					<th>Rate</th>
					<!-- <th>HSN code</th> -->
					
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						GetProductDetails sr=(GetProductDetails)list12.get(i);
				%>
				
				<tr>
					<td class="align"><%=sr.getProduct()%></td>
					<%-- <td class="align"><%=sr.getCat()%></td> --%>
					<td class="align"><%=sr.getManufacturer()%></td>
					<td class="align"><%=sr.getTaxType()%></td>
					<td class="align"><%=sr.getTaxPercentage()%></td>
					<td class="align"><%=sr.getBuyPrice()%></td>					
					<%-- <td class="align"><%=sr.getHsn()%></td> --%>
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	
	<div class="wrapper" align="center">
		<input type="button" style="  font-size: 25"  value="Back" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="Back()" /> 
		<input type="button" style="  font-size: 25"  value="Delete Product" id="listBtn2" class="btn btn-primary btn-large button-height-width" onclick="deletProduct()" />
	</div>
	
</body>

</html>

