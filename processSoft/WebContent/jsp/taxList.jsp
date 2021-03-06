
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.bean.GetTaxDetails"%>
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
<title>Tax List</title>

<div class="row header_margin_top">
<div class="bill-heading" align="center">
	<h2 class="form-name style_heading">Tax List</h2>
</div>			 
</div>
<script type="text/javascript">
function Back(){
	window.location = "tax.jsp" ;
}
function deletTax(){
	document.getElementById('deleteBtn').disabled = true;
	window.location = "TaxDelete.jsp";
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
<body id="dt_example" >
		
		
		<!-- 
		<div class="row">
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
	TaxCreationDao dao=new TaxCreationDao();
	List list12=dao.getTaxDetails(request);
	%>
	
	<div id="date" align="center"  >
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>

	<div id="demo_jui" align="center"  >
	<div class="table-responsive"  style="width: 600px;" >
		<table id="list" class="table table-bordered display">
		<!-- <table id="list" class="display" border="1"> -->
			<thead>
				<tr>
					
	                <th>Tax</th>	                
					<th>Tax Percentage</th>
					
					
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						GetTaxDetails sr=(GetTaxDetails)list12.get(i);
				%>
				
				<tr>
					
					<td class="align"><%=sr.getTaxType()%></td>
					<td  class="align"><%=sr.getTaxPercentage()%></td>
					
				</tr>
	
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	</div>
	
	<div class="wrapper" align="center"  style="margin-top: 40px">
		<input style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;"  type="button"  value="Back" id="listBtn" class="btn btn-primary  btn-large  button-height-width "  onclick="Back()" /> 
		<input type="button" id="deleteBtn" style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" value="Delete" class="btn btn-primary  btn-large  button-height-width " onclick="deletTax()" />
	</div>
	
</body>

</html>