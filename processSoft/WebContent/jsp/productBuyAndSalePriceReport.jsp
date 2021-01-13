<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<%@page import="com.Fertilizer.bean.ProductDetailsForReports"%>
<%@page import="com.Fertilizer.dao.ProductDetailsDao"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>

<head>
<link href="/processSoft/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/processSoft/staticContent/css/dataTables.jqueryui.min.css"  rel="stylesheet" type="text/css" media="all">
	<link rel="stylesheet" href="/processSoft/staticContent/css/tabDemo.css">
 	<link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
    
    <script src="/processSoft/staticContent/js/jquery.min.js"></script>
    <script src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
	<script src="/processSoft/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>

<script src="/processSoft/staticContent/js/productDetail.js"></script>
</head>

 <div class="container col-md-offset-1" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Product Buy And Sale Price Reports</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
		</div>
	<ul class="nav nav-tabs">
	    <li class="active"><a data-toggle="tab" href="#home"><h4 style="color:blue">All Products</h4></a></li>
	<!--   <li><a data-toggle="tab" href="#cat"><h4 style="color:blue">As Per Category</h4></a></li>  -->
 	 </ul>
 
 	<div class="tab-content" style="float: left">
   
    <!-------- All Categories ---------->
   
  <div id="home" class="tab-pane fade in active">
   	<div id="report" style="text-align: center">
		<label id="demo" align=></label>
		<script>
		   var date = new Date();
		   document.getElementById("demo").innerHTML = date.toDateString();
		</script>
	</div>

	<script type="text/javascript"> 
		$(document).ready(function () {
			var table=$("#list").dataTable({
				
				 fnRowCallback : function(nRow, aData, iDisplayIndex){
		                $("th:first", nRow).html(iDisplayIndex +1);
		               return nRow;
		            },
				
				 "footerCallback": function ( row, data, start, end, display ) {
			            var api = this.api(), data;
			 
			            // Remove the formatting to get integer data for summation
			            var intVal = function ( i ) {
			                return typeof i === 'string' ?
			                    i.replace(/[\$,]/g, '')*1 :
			                    typeof i === 'number' ?
			                        i : 0;
			            };
			 
			            // Total over all pages
			            total = api
			                .column( 5 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 ); 
			 			console.log(total); 
			 			
			 		
			            // Update footer
			            $( api.column( 5 ).footer() ).html(
			                'Rs'+' '+total
			            );
			            console.log( total);
			            
			    }
			
			
			
				
			});
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

	
	<%
	ProductDetailsDao dao=new ProductDetailsDao();
	List Lis1=dao.getProductDetailsForReport();
	
	%>
	<div id="demo_jui" style="text-align: center">
		<table id="list" class="display" border="1">
			<thead>
				<tr>
					<th>Product Name</th>
	                <th>Manufacturing Company</th>
					<th>Buy Price</th>
					<th>Sale Price</th>
				</tr>
			</thead>
			<tfoot>
            <tr>
                <th></th>
            </tr>
        </tfoot>
			
			<tbody>
   				<%
					for(int i=0;i<Lis1.size();i++){
						ProductDetailsForReports pro = (ProductDetailsForReports)Lis1.get(i);
				%>
				<tr>
					<td class="align"><%=pro.getProductName()%></td>
					<td class="align"><%=pro.getManufacturingCompany()%></td>
					<td class="align"><%=pro.getBuyPrice()%></td>
					<td class="align"><%=pro.getSalePrice()%></td>
				</tr>
				<%
					}
				%>
				
			</tbody>
		</table>
	</div>
 </div>
 <%-- 		
  <!-- ---	As per Category	---- -->
 	<div id="cat" class="tab-pane ">
 		<div class="row"></div>
 				<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				        <div class="row form-group" style="margin-top: 20px">
						<label class="col-md-3 control-label" for="">
							Category<sup>*</sup>
						</label>
						<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   CategoryDetailsDao cdd = new CategoryDetailsDao();
           						List cList =cdd.getAllMainCat();
							
							%>
							<input list="cat_drop" id="fk_cat_id"  class="form-control">
				<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   CategoryDetailsBean cat=(CategoryDetailsBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getCatId()%>" value="<%=cat.getCategoryName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
			
						<div class="col-md-3">
							<div class="input-group">
								<input type="button" id="btn" name="save"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right"
									onclick="getProductDetailAsperCategory()" value="Search" />
							</div>
						</div>
					</div>	
					<div class="table-responsive">
						<table id="example1" class="display">
						<thead>
							<tr>
								<th>Product Name</th>
				                <th>Manufacturing Company</th>
								<th>Buy Price</th>
								<th>Sale Price</th>
							</tr>
						</thead>
						 <tfoot>
							<tr>
								 <!-- <th colspan="2" style="text-align: right">Total:</th> 
								<th></th>  -->
							</tr>
						</tfoot>
					</table>
				</div>
				</fieldset>
				</form>
 		</div>  --%>
 	</div>
</div>

<%@include file="commons/newFooter.jsp" %>

 <%-- <%@include file="commons/footer.jsp" %> --%>