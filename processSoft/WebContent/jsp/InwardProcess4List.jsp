<!-- InwardProcess4List.jsp -->
<%@page import="com.Fertilizer.bean.InwardProcess4Bean"%>
<%@page import="com.Fertilizer.dao.InwardProcess4Dao"%>
<%@page import="com.Fertilizer.hibernate.OperationDetailsBean"%>

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
		<title>Inward Process 4 List</title>
		
  			<div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			    <%
			InwardProcess4Dao dao2 = new InwardProcess4Dao();
   			List operaionNameList =dao2.getInwardProcess4Operaion();
   			
   			Long pkOperationDetailsId = 0l;
   			String operationName = "";
   			
   			for(int i=0;i<operaionNameList.size();i++){
	    		 OperationDetailsBean operaionBean =(OperationDetailsBean)operaionNameList.get(i);
	    		 
	    		 pkOperationDetailsId = operaionBean.getPkOperationDetailsId();
	    		 operationName = operaionBean.getOperationName();
   			}
		%>
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownDetails") %> <%}%> <%if(abc.equals("english")){%> Inward Process 4 <%=operationName%> List <%}%> </h2>
			  	</div>		 
    </div>
  		<script type="text/javascript">
  			function Back()
  			{
  				window.location = "InwardProcess4.jsp" ;
  			}
  			function deletSupplier()
    		 {
  				document.getElementById('deleteVenderDtlBtn').disabled = true;
    		 	window.location = "DeletSupplier.jsp";
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
				  		<h2 class="form-name style_heading">Supplier List</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
		</div> -->
			    
	<%
	InwardProcess4Dao dao=new InwardProcess4Dao();
	List list12=dao.getInwardProcess4List(request);
	%>	
	<div id="date" style="margin-left:10px;">
		<label id="demo"></label>
		<script>
			var date = new Date();
			document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>

	<div id="demo_jui">
	<div class="table-list">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Operation Name</th>
					<th>Purchase Order No</th>
	                <th>Challan No</th>
	                <th>Send To Operation</th>              
	                <th>Comment</th>
				</tr>
			</thead>
			
			<tbody>
   				<%
					for(int i=0;i<list12.size();i++){
						InwardProcess4Bean sr=(InwardProcess4Bean)list12.get(i);
				%>		
				<tr>
					<td class="align"><%=sr.getOperationName()%></td>
					<td class="align"><%=sr.getPurchaseOrderNo()%></td>
					<td class="align"><%=sr.getChallanNo()%></td>
					<td class="align"><%=sr.getSendToOperationName()%></td>
					<td class="align"><%=sr.getComment()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		</div>
	</div>
	<br>
	<div class="wrapper" align="center">
		<input type="button" value="Back" id="listBtn" style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" class="btn btn-primary  btn-large  button-height-width" onclick="Back()" /> 
<!-- 		<input type="button" value="Delete Vendor" style="font-size: 25" id="deleteVenderDtlBtn" class="btn btn-primary  btn-large  button-height-width" onclick="deletSupplier()" /> -->
	</div>	
</body>
</html>

