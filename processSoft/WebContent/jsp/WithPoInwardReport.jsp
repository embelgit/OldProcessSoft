<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.InwardBean"%>
<%@page import="com.Fertilizer.dao.GoodsReceiveDao"%>
<%@page import="com.Fertilizer.hibernate.GoodsReceiveBean"%>
<%@page import="java.util.List"%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- <script src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/selectjj.js"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/buttom.js"></script>
<script src="/processSoft/staticContent/js/jquery.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.dataTables.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/jqueryUi.js"></script>

<link href="/processSoft/staticContent/css/dataTa.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/processSoft/staticContent/css/dataTables.jqueryui.min.css"
	rel="stylesheet" type="text/css" media="all">
<link href="/processSoft/staticContent/css/select.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/processSoft/staticContent/css/button.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="stylesheet"
	href="/processSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="/processSoft/staticContent/css/ui.jqgrid.min.css"> -->
	<script src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/selectjj.js"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/buttom.js"></script>
<script src="/processSoft/staticContent/js/jquery.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<script src="/processSoft/staticContent/js/jquery.dataTables.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="/processSoft/staticContent/js/jqueryUi.js"></script>

<link href="/processSoft/WebContent/staticContent/css/dataTa.css"
	rel="stylesheet" type="text/css" media="all" />
<link href="/processSoft/staticContent/css/dataTables.jqueryui.min.css"
	rel="stylesheet" type="text/css" media="all">
<link href="/processSoft/staticContent/css/select.css" rel="stylesheet"
	type="text/css" media="all">
<link href="/processSoft/staticContent/css/button.css" rel="stylesheet"
	type="text/css" media="all">
<link rel="stylesheet"
	href="/processSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet"
	href="/processSoft/staticContent/css/ui.jqgrid.min.css">

<!-- For datatable to pdf,print,excel etc conversion -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>

<script type="text/javascript"
	src="//cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="//cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css">

<script type="text/javascript"
	src="/processSoft/staticContent/js/WithPoinwardreport.js"></script>
	

</head>
<body>


	<div class="container col-md-offset-1" style="float: left">
		<div class="row">
			<div align="center" style="margin-top: 75px">
				<h2 class="form-name style_heading">With Po Inward Process Report</h2>
			</div>

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#Challannowise"><h4
					style="color: blue">Challan No Wise</h4></a></li>
		<li><a data-toggle="tab" href="#TwoDatewise"><h4
					style="color: blue">Range</h4></a></li>
		<li><a data-toggle="tab" href="#productNamewise"><h4
					style="color: blue">Product Name Wise</h4></a></li>
		<li><a data-toggle="tab" href="#vendorNamewise"><h4
					style="color: blue">Vendor Name Wise</h4></a></li>
		<li><a data-toggle="tab" href="#ShopNamewise"><h4
					style="color: blue">Shop Name Wise</h4></a></li>

	</ul>


	<div class="tab-content" style="float: left">
		<!-- Challan No Wise Inward report -->
		<div id="Challannowise" class="tab-pane active">

			<form class="form-horizontal" method="post" action=""
				name="inwardreport">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="ShopName1">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3" style="width: 22%">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
							shopDetailsDao dao2 = new shopDetailsDao();
           						List ShopList2 =dao2.getAllShop();
							
							%>
								<input list="ShopName_drop1" id="ShopName1" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1"> <%
					           for(int i=0;i<ShopList2.size();i++){
					        	   shopDetailsBean bean2 =(shopDetailsBean)ShopList2.get(i);
							%>

								<option data-value="<%=bean2.getShopId()%>"
									value="<%=bean2.getShopName()%>">
									<%
				      			}
				    		%>
								
								</datalist>
							</div>
						</div>

						<label class="col-md-2 control-label" for="fk_cat_id">Challan
							No <sup>*</sup>
						</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>

								<%
										   //CategoryDetailsDao cdd = new CategoryDetailsDao();
										   GoodsReceiveDao gri=new GoodsReceiveDao();
			           						List cList =gri.getInwardDetails();
										
										%>
								<input list="bill_drop" id="Billno"
									placeholder="Select Challan No" class="form-control">
								<datalist id="bill_drop"> <%
								           for(int i=0;i<cList.size();i++){
								        	   
								        	   InwardBean cat=(InwardBean)cList.get(i);
								        	  // CategoryDetailsBean cat=(CategoryDetailsBean)cList.get(i);
										%>

								<option data-value="<%=cat.getPk_inward_id()%>"
									value="<%=cat.getChallanno()%>">
									<%
							      			}
							    		%>
								
								</datalist>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-3">
								<div class="input-group">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="inwardReportValidation()" value="Search" />
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="inwardtableForReport" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Supplier Name</th>
									<th>Challan No</th>
									<th>Po No</th>
									<th>Challan Date</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!-- DateWise Inward report -->
		<div id="TwoDatewise" class="tab-pane ">

			<form class="form-horizontal" method="post" action=""
				name="TwoDateinwardreport">
				<fieldset>

					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="ShopName1">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
							shopDetailsDao dao3 = new shopDetailsDao();
           						List ShopList3 =dao3.getAllShop();
							
							%>
								<input list="ShopName_drop1" id="ShopName2" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1"> <%
					           for(int i=0;i<ShopList3.size();i++){
					        	   shopDetailsBean bean3 =(shopDetailsBean)ShopList3.get(i);
							%>

								<option data-value="<%=bean3.getShopId()%>"
									value="<%=bean3.getShopName()%>">
									<%
				      			}
				    		%>
								
								</datalist>
							</div>
						</div>

					</div>

					<div class="row form-group" style="margin-top: 20px">
						<div class="row form-group">
							<label class="col-md-2 control-label" for="customerName">
								Start Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-user"></i>
									</span> <input type="date" id="fisDate" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>

							<label class="col-md-2 control-label" for="endDate">End
								Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-map-marker"></i>
									</span> <input type="date" id="endDate" placeholder="End Date"
										class="form-control input-md ac_district" type="text">
								</div>
							</div>
						 
						<div class="row form-group">
							<div class="col-md-3">
								<div class="input-group">
									<div align="right">
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="inwardReportDatewiseValidation()" value="Search" />
								</div>
								</div>
							</div>
						</div>
					</div>
                 </div>

					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="inwardtableForReportDatewise" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Supplier Name</th>
									<th>Challan No</th>
									<th>Po No</th>
									<th>Challan Date</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>
		<!-- Product Name Wise Inward report -->

		<div id="productNamewise" class="tab-pane">

			<form class="form-horizontal" method="post" action=""
				name="productinwardreport">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="ShopName2">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
							shopDetailsDao dao4 = new shopDetailsDao();
           						List ShopList4 =dao3.getAllShop();
							
							%>
								<input list="ShopName_drop1" id="ShopName3" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1"> <%
					           for(int i=0;i<ShopList4.size();i++){
					        	   shopDetailsBean bean4 =(shopDetailsBean)ShopList4.get(i);
							%>

								<option data-value="<%=bean4.getShopId()%>"
									value="<%=bean4.getShopName()%>">
									<%
				      			}
				    		%>
								
								</datalist>
							</div>
						</div>

						<label class="col-md-2 control-label" for="fk_cat_id">Product
							Name <sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>

								<%
										   //CategoryDetailsDao cdd = new CategoryDetailsDao();
										   GoodsReceiveDao Pngri=new GoodsReceiveDao();
			           						List pList =Pngri.getInwardProductDetails();
										
										%>
								<input list="pro_drop" id="proName"
									placeholder="Select Product Name" class="form-control">
								<datalist id="pro_drop"> <%
								           for(int i=0;i<pList.size();i++){
								        	   
								        	   InwardBean proN=(InwardBean)pList.get(i);
								        	  // CategoryDetailsBean cat=(CategoryDetailsBean)cList.get(i);
										%>

								<option data-value="<%=proN.getPk_inward_id()%>"
									value="<%=proN.getProductname()%>">
									<%
							      			}
							    		%>
								
								</datalist>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-2">
								<div class="input-group">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="ProductNameWiseinwardReportValidation()"
											value="Search" />
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="inwardtableForReportproductNameWise" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Supplier Name</th>
									<th>Challan No</th>
									<th>Po No</th>
									<th>Challan Date</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!--   Inword report Vendor Name Wise    -->

		<div id="vendorNamewise" class="tab-pane">

			<form class="form-horizontal" method="post" action=""
				name="vendorinwardreport">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">
						
						<label class="col-md-2 control-label" for="ShopName3">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
							shopDetailsDao dao5 = new shopDetailsDao();
           						List ShopList5 =dao5.getAllShop();
							
							%>
								<input list="ShopName_drop1" id="ShopName4" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1"> <%
					           for(int i=0;i<ShopList5.size();i++){
					        	   shopDetailsBean bean5 =(shopDetailsBean)ShopList5.get(i);
							%>

								<option data-value="<%=bean5.getShopId()%>"
									value="<%=bean5.getShopName()%>">
									<%
				      			}
				    		%>
								
								</datalist>
							</div>
						</div>
						
						<label class="col-md-2 control-label" for="fk_cat_id">Vendor
							Name <sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>

								<%
										   //CategoryDetailsDao cdd = new CategoryDetailsDao();
										   GoodsReceiveDao vngri=new GoodsReceiveDao();
			           						List vList =vngri.getInwardvendorDetails();
										
										%>
								<input list="ven_drop" id="venName"
									placeholder="Select Vendor Name" class="form-control">
								<datalist id="ven_drop"> <%
								           for(int i=0;i<vList.size();i++){
								        	  InwardBean venN=(InwardBean)vList.get(i);
								        	
										%>

								<option data-value="<%=venN.getPk_inward_id()%>"
									value="<%=venN.getSuppliername()%>">
									<%
							      			}
							    		%>
								
								</datalist>
							</div>


						</div>
						<div class="row form-group">
							<div class="col-md-2">
								<div class="input-group">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="vendorNameWiseinwardReportValidation()"
											value="Search" />
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="inwardtableForReportvendorNameWise" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Supplier Name</th>
									<th>Challan No</th>
									<th>Po No</th>
									<th>Challan Date</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!--   Inword report Shop Name Wise    -->

		<div id="ShopNamewise" class="tab-pane">

			<form class="form-horizontal" method="post" action=""
				name="Shopinwardreport">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="proName">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
							shopDetailsDao dao = new shopDetailsDao();
           						List ShopList =dao.getAllShop();
							
							%>
								<input list="ShopName_drop" id="ShopName" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop"> <%
					           for(int i=0;i<ShopList.size();i++){
					        	   shopDetailsBean bean =(shopDetailsBean)ShopList.get(i);
							%>

								<option data-value="<%=bean.getShopId()%>"
									value="<%=bean.getShopName()%>">
									<%
				      			}
				    		%>
								
								</datalist>
							</div>
						</div>


						<div class="row form-group">
							<div class="col-md-3">
								<div class="input-group">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="ShopNameWiseinwardReportValidation()" value="Search" />
									</div>
								</div>
							</div>
						</div>

					</div>


					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="inwardtableForReportShopNameWise" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Supplier Name</th>
									<th>Challan No</th>
									<th>Po No</th>
									<th>Challan Date</th>
									<th>Product Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="7" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

	</div>
</body>
</html>
