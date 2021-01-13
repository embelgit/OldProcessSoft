<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>
<head>
   <script type="text/javascript" src="/processSoft/staticContent/js/taxCreation.js"></script>

<script src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/selectjj.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/buttom.js"></script>
<script src="/processSoft/staticContent/js/jquery.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>

<link href="/processSoft/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
<link href="/processSoft/staticContent/css/dataTables.jqueryui.min.css" rel="stylesheet" type="text/css" media="all">
<link href="/processSoft/staticContent/css/select.css" rel="stylesheet" type="text/css" media="all">
<link href="/processSoft/staticContent/css/button.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
</head>


 <div class="container col-md-offset-1" style="float: left"> 
 		
 		<div class="row">
			<div align="center" style="margin-top: 75px">
				  <h2 class="form-name style_heading">Tax Reports</h2>
			</div>
				 	
			 <div class="row">
				<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color:#c1b1b1;">
				</div>	
			  </div>
		</div>
		<ul class="nav nav-tabs">
			    <li class="active"><a data-toggle="tab" href="#sale"><h4 style="color:blue">Sale</h4></a></li>
			    <li><a data-toggle="tab" href="#purchase"><h4 style="color:blue">Purchase</h4></a></li>
 		</ul>
 		<div class="tab-content" style="float: left">
 	<!--+++++++++++ 	Tax report from sale ++++++++++++++-->
 		<div id="sale" class="tab-pane fade in active">
<%--  <!-- 			<ul class="nav nav-tabs">
			   	<li class="active"><a data-toggle="tab" href="#singleSale"><h4 style="color:blue">Single Date</h4></a></li>
			    <li><a data-toggle="tab" href="#twoSale"><h4 style="color:blue">Between Two Dates</h4></a></li>
 			</ul>
 		<div class="tab-content" style="float: left">
 		<div id="singleSale" class="tab-pane fade in active"> -->
		<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-3 control-label" for="fk_cat_id">Product Category<sup>*</sup></label>  
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
										<input list="cat_drop_for_sale" id="fk_cat_id_for_sale"  class="form-control">
							<datalist id="cat_drop_for_sale">
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
		
						<label class="col-md-3 control-label" >
							Enter Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="fDate" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
					  </div>
				     
				     <div class="row form-group">
				     <div class="col-md-3 col-md-offset-4">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"onclick="taxReportForSale()" value="Search"/>
												     									
						</div>
					</div>	
				</div>
				
					<table id="saleTax" class="display">
						<thead>
							<tr>
							<th>Bill Number</th>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Weight</th>
								<th>Sale Price</th>
								<th>MRP</th>
								<th>Tax Percentage</th>
								<th>Quantity</th>
								<th>Tax Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="8" style="text-align: right">Total Rs:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
		</fieldset>	
	</form>
	</div>
	
<!-- 	Between Two dates -->
	<div id="twoSale" class="tab-pane"> --%>
	<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-3 control-label" for="fk_cat_id">Product Category<sup>*</sup></label>  
			           			 <div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="	glyphicon glyphicon-hand-right"></i>
										</span>
			              				
										<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
										<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
										<%
										   CategoryDetailsDao cddTwo = new CategoryDetailsDao();
			           						List twoList =cddTwo.getAllMainCat();
										
										%>
										<input list="cat_drop_for_sale_Two" id="fk_cat_id_for_sale_Two"  class="form-control">
							<datalist id="cat_drop_for_sale_Two">
										<%
								           for(int i=0;i<twoList.size();i++){
								        	   CategoryDetailsBean catTwo =(CategoryDetailsBean)twoList.get(i);
										%>
					
										<option data-value="<%=catTwo.getCatId()%>" value="<%=catTwo.getCategoryName()%>">
										<%
							      			}
							    		%>
						              	
			            			</datalist>
			            			</div>
            					</div> 
            					 </div>
					 <div class="row form-group">
						<label class="col-md-3 control-label" >
							Enter First Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="fDateTwo" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
						
						<label class="col-md-3 control-label" >
							Enter Second Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="sDateTwo" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
					  </div>
				    
				     <div class="row form-group">
				     <div class="col-md-3 col-md-offset-4">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"onclick="taxFromSaleBetweenTwoDate()" value="Search"/>
												     									
						</div>
					</div>	
				</div>
				
					<table id="saleTaxTwo" class="display">
						<thead>
							<tr>
							<th>Bill Number</th>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Weight</th>
								<th>Sale Price</th>
								<th>MRP</th>
								<th>Tax Percentage</th>
								<th>Quantity</th>
								<th>Tax Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								  <th colspan="8" style="text-align: right">Total Rs:</th>
								<th></th> 
							</tr>
						</tfoot>
					</table>
		</fieldset>	
	</form>
	
	
	</div>


<!--+++++++++++ 	Tax percentage from purchase ++++++++++++++-->
	<div id="purchase" class="tab-pane">

		<form class="form-horizontal" method="post" action="" name="fertiBill">
					<fieldset>
				         <div class="row form-group" style="margin-top: 20px">
								<label class="col-md-3 control-label" for="fk_cat_id">Product Category<sup>*</sup></label>  
			           			 <div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="	glyphicon glyphicon-hand-right"></i>
										</span>
			              				
										<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
										<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
										<%
										   CategoryDetailsDao catDao = new CategoryDetailsDao();
			           						List catList =catDao.getAllMainCat();
										
										%>
										<input list="cat_drop_for_purchase" id="fk_cat_id_for_purchase"  class="form-control">
							<datalist id="cat_drop_for_purchase">
										<%
								           for(int i=0;i<catList.size();i++){
								        	   CategoryDetailsBean catBean =(CategoryDetailsBean)catList.get(i);
										%>
					
										<option data-value="<%=catBean.getCatId()%>" value="<%=catBean.getCategoryName()%>">
										<%
							      			}
							    		%>
						              	
			            			</datalist>
			            			</div>
            					</div>
            					</div> 
					<div class="row form-group">
						<label class="col-md-3 control-label" >
							Enter First Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="fDatePurchase" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
						
						<label class="col-md-3 control-label" >
							Enter Second Date:<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="sDatePurchase" placeholder="Start Date"
									class="form-control input-md" type="text">
							</div>
						</div>
					  </div>
					  
					  <div class="row form-group" >
				     <div class="col-md-3 col-md-offset-4">
						<div class="input-group">
												  
								<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"onclick="taxReportForPurchaseSingleDate()" value="Search"/>
												     									
						</div>
					</div>	
				</div>
				
					<table id="purchaseTaxSingle" class="display">
						<thead>
							<tr>
								<th>Supplier Name</th>
								<th>Tin Number</th>
								<th>Bill Number</th>
								<th>Product Name</th>
								<th>Company Name</th>
								<th>Weight</th>
								<th>Purchase Price</th>
								<th>MRP</th>
								<th>Tax Percentage</th>
								<th>Quantity</th>
								<th>Tax Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
							<th colspan="10" style="text-align: right">Total Rs:</th>
								<th></th>
							</tr>
						</tfoot>
					</table>
		</fieldset>	
	</form>
	</div>
	</div>
</div>