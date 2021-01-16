
<%@page import="com.Fertilizer.hibernate.InwardBean"%>
<%@page import="com.Fertilizer.hibernate.OutwardBean"%>
<%@page import="com.Fertilizer.hibernate.CustomerDetailsBean"%>
<%@page import="com.Fertilizer.dao.CustomerDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<head>


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

<script src="/processSoft/staticContent/js/saleReports.js"></script>
</head>

<div class="container">
	<div class="row">
		<div align="center" style="margin-top: 120px">
			<h2 class="form-name style_heading">Sale Report</h2>
		</div>

		<div class="row">
			<div class="col-sm-offset-1 col-md-10">
				<hr style="border-top-color: #c1b1b1;">
			</div>
		</div>
	</div>
</div>

<!---------- 	CategoryWise Sale reports -------------->

<div class="tab-pane active" id="home">


	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="tab"	href="#supplierSingleDate"><h4 style="color: blue">Customer	Namewise</h4></a></li>
		<li><a data-toggle="tab" href="#supplierBetweenTwoDate"><h4	style="color: blue">Range Wise</h4></a></li>

		<li><a data-toggle="tab" href="#outwordChallen"><h4	style="color: blue">Outward Challan Wise</h4></a></li>

		<li><a data-toggle="tab" href="#InwordChallen"><h4 style="color: blue">Inward Challan Wise</h4></a></li>

		<li><a data-toggle="tab" href="#ShopWise"><h4 style="color: blue">Shop Name Wise</h4></a></li>
		
		<li><a data-toggle="tab" href="#ShopWiseInward"><h4 style="color: blue">Shop Name Wise Inward </h4></a></li>
		
		<li><a data-toggle="tab" href="#ShopWiseOutWard"><h4 style="color: blue">Shop Name Wise Outward </h4></a></li>
		
		<li><a data-toggle="tab" href="#BillWiseSaleReport"><h4 style="color: blue">BillNo Wise Report</h4></a></li>
					

	</ul>

	<div class="tab-content" style="float: left">


		<div id="supplierSingleDate" class="tab-pane active">
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
			<form class="form-horizontal" method="post" action=""
				name="saleReportForm">
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
									shopDetailsDao dao6 = new shopDetailsDao();
									List ShopList6 = dao6.getAllShop();
								%>
								<input list="ShopName_drop1" id="ShopName1" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1">
									<%
										for (int i = 0; i < ShopList6.size(); i++) {
											shopDetailsBean bean6 = (shopDetailsBean) ShopList6.get(i);
									%>

									<option data-value="<%=bean6.getShopId()%>"
										value="<%=bean6.getShopName()%>">
										<%
											}
										%>
									
								</datalist>
							</div>
						</div>

						<label class="col-md-2 control-label" for="fk_cat_id">Vendor
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>


								<%
									SupplierDetailsDao dao = new SupplierDetailsDao();
									List supppp = dao.getAllSupplier1(request);
								%>

								<input type="text" id="creditCustomer" list="cust_drop1"
									class="form-control"
									onchange="custDetail.getVillageName();custDetail.getContactNo();custDetail.getName();custDetail.gstNo();getCustName();getSupWiseBillingProduct()">
								<datalist id="cust_drop1">

									<%
										for (int i = 0; i < supppp.size(); i++) {
											SupplierDetailsBean bean = (SupplierDetailsBean) supppp.get(i);
									%>
									<option data-value="<%=bean.getSupId()%>"
										value="<%=bean.getDealerName()%> "></option>
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
											onclick="saleReportForSingleDateAsPerCategory()"
											value="Search" />
									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="sale1" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
								    <th>Bill NO</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Outward Challan No</th>
									<th>Inward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="9" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!------ 	Between Two Dates  ----->
		<div id="supplierBetweenTwoDate" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="saleReportFormRange">
				<fieldset>
					<div class="row form-group">
						<label class="col-md-2 control-label" for="ShopName3">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
									shopDetailsDao dao7 = new shopDetailsDao();
									List ShopList7 = dao7.getAllShop();
								%>
								<input list="ShopName_drop1" id="ShopName3" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1">
									<%
										for (int i = 0; i < ShopList7.size(); i++) {
											shopDetailsBean bean7 = (shopDetailsBean) ShopList7.get(i);
									%>

									<option data-value="<%=bean7.getShopId()%>"
										value="<%=bean7.getShopName()%>">
										<%
											}
										%>
									
								</datalist>
							</div>
						</div>
					</div>
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
									<div align="center">
										<input type="button" id="btn" name="save" style="margin: 0 21px;"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="saleReportBetweenTwoDatesAsPerCat()" value="Search" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleBetTwoDates" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill No</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Outward Challan No</th>
									<th>Inward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total</th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="9" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!--THis tab for Outward Challan Wise Report  -->

		<div id="outwordChallen" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="saleReportFormChallenNo">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="ShopName4">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
									shopDetailsDao dao8 = new shopDetailsDao();
									List ShopList8 = dao8.getAllShop();
								%>
								<input list="ShopName_drop1" id="ShopName4" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1">
									<%
										for (int i = 0; i < ShopList8.size(); i++) {
											shopDetailsBean bean8 = (shopDetailsBean) ShopList8.get(i);
									%>

									<option data-value="<%=bean8.getShopId()%>"
										value="<%=bean8.getShopName()%>">
										<%
											}
										%>
									
								</datalist>
							</div>
						</div>

						<label class="col-md-2 control-label" for="OutwordChallan">Outward
							Challan NO<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>

								<%
									SupplierDetailsDao dao2 = new SupplierDetailsDao();
									List supppp2 = dao2.getChallenWiseDetailsForDeopdown();
								%>

								<input type="text" id="OutwordChallan" list="cust_drop3"
									class="form-control"">
								<datalist id="cust_drop3">
									<%
										for (int i = 0; i < supppp2.size(); i++) {
											OutwardBean bean1 = (OutwardBean) supppp2.get(i);
									%>

									<option data-value="<%=bean1.getPk_outward_id()%>"
										value="<%=bean1.getOutwardchallanno()%> "></option>
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
										<input type="button" id="btn" name="save" style="margin: 0 21px;"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="saleReportForSingleDateAsPerChallenNo()"
											value="Search" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleChalan" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill NO</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Outward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total</th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="8" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>


		<!-- this is reoprt is for Inward wise -->


		<div id=InwordChallen class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="saleReportFormInwordChallenNo">
				<fieldset>
					<div class="row form-group" style="margin-top: 20px">

						<label class="col-md-2 control-label" for="ShopName5">Shop
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
									shopDetailsDao dao9 = new shopDetailsDao();
									List ShopList9 = dao9.getAllShop();
								%>
								<input list="ShopName_drop1" id="ShopName5" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop1">
									<%
										for (int i = 0; i < ShopList9.size(); i++) {
											shopDetailsBean bean9 = (shopDetailsBean) ShopList9.get(i);
									%>

									<option data-value="<%=bean9.getShopId()%>"
										value="<%=bean9.getShopName()%>">
										<%
											}
										%>
									
								</datalist>
							</div>
						</div>

						<label class="col-md-2 control-label" for="InwordChallan">Inward
							Challan NO<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>


								<%
									SupplierDetailsDao dao3 = new SupplierDetailsDao();
									List supppp3 = dao3.getInwordChallenWiseDetailsForDeopdown();
								%>

								<input type="text" id="InwordChallan" list="cust_drop4"
									class="form-control"">
								<datalist id="cust_drop4">
									<%
										for (int i = 0; i < supppp3.size(); i++) {
											InwardBean bean4 = (InwardBean) supppp3.get(i);
									%>

									<option data-value="<%=bean4.getPk_inward_id()%>"
										value="<%=bean4.getChallanno()%> "></option>

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
										<input type="button" id="btn" name="save" style="margin: 0 21px;"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											onclick="saleReportAsPerInwordChallenNo()" value="Search" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleChalaninw" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill NO</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Inward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total </th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="8" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>

		<!-- this is reoprt is for Shop Wise -->

		<div id="ShopWise" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="SaleReportShopNameForm">
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
									shopDetailsDao dao5 = new shopDetailsDao();
									List ShopList = dao5.getAllShop();
								%>
								<input list="ShopName_drop" id="ShopName" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop">
									<%
										for (int i = 0; i < ShopList.size(); i++) {
											shopDetailsBean bean = (shopDetailsBean) ShopList.get(i);
									%>

									<option data-value="<%=bean.getShopId()%>"
										value="<%=bean.getShopName()%>">
										<%
											}
										%>
									
								</datalist>


							</div>
						</div>
						<div class="col-md-3s">
							<div class="input-group">
								<input type="button" id="btn" name="save"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right"style="margin: 0 21px;"
									onclick="saleReportAsPerShopNameWise()" value="Search" />
							</div>
						</div>
					</div>

					

					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleRepShp" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill No</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Outward Challan No</th>
									<th>Inward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total </th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="9" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>

				</fieldset>
			</form>
		</div>
		
		<!-- Show Wise With InWord -->
		
		<div id="ShopWiseInward" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="SaleReportShopNameForm">
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
									shopDetailsDao daoIW = new shopDetailsDao();
									List ShopList1 = daoIW.getAllShop();
								%>
								<input list="ShopName_drop" id="ShopNameIW" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop">
									<%
										for (int i = 0; i < ShopList1.size(); i++) {
											shopDetailsBean bean = (shopDetailsBean) ShopList1.get(i);
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
						<div class="input-group">
								<input type="button" id="btn" name="save" style="margin: 0 21px;" class="btn btn-lg btn-success btn-md button_hw button_margin_right" onclick="saleReportAsPerShopNameWiseInward()" value="Search">
							</div>
					</div>
					</div>

					

					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleRepShp1" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill No</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>Inward Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total </th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="8" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									
								</tr>
							</tfoot>
						</table>
					</div>

				</fieldset>
			</form>
		</div>


		<!-- ShopWise With OutWard -->
			<div id="ShopWiseOutWard" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="SaleReportShopNameForm">
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
									shopDetailsDao daoOW = new shopDetailsDao();
									List ShopList2 = daoOW.getAllShop();
								%>
								<input list="ShopName_drop" id="ShopNameOW" class="form-control"
									style="text-transform: uppercase">
								<datalist id="ShopName_drop">
									<%
										for (int i = 0; i < ShopList1.size(); i++) {
											shopDetailsBean bean = (shopDetailsBean) ShopList2.get(i);
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
								<input type="button" id="btn" name="save"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right" style="margin: 0 21px;"
									onclick="saleReportAsPerShopNameWiseOutward()" value="Search" />
							</div>
						</div>
					</div>
						
					</div>

					

					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="saleow" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill No</th>
									<th>Customer Name</th>
									<th>Product Name</th>
									<th>OutWard Challan No</th>
									<th>OK Quantity</th>
									<th>Rate</th>
									<th>GST %</th>
									<th>IGST %</th>
									<th>Discount</th>
									<th>Discount Amount</th>
									<th>Tax Amount</th>
									<th>Total Amount</th>
									<th>Gross Total </th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="8" style="text-align: right">Total Rs:</th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>

				</fieldset>
			</form>
		</div>
		
		<!-- Bill Wise Sale Report -->
		<div id="BillWiseSaleReport" class="tab-pane fade">

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>


			<form class="form-horizontal" method="post" action=""
				name="saleReportFormRange">
				<fieldset>
					
					<div class="row form-group">

						<label class="col-md-2 control-label" for="customerName">
							Start Date:<sup>*</sup>
						</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input type="date" id="fisDatebill" placeholder="Start Date"
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
								</span> <input type="date" id="endDatebill" placeholder="End Date"
									class="form-control input-md ac_district" type="text">
							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-3">
								<div class="input-group">
									<div align="center">
										<input type="button" id="btn" name="save"
											class="btn btn-lg btn-success btn-md button_hw button_margin_right"
											 style="margin: 0 21px;" onclick="saleReportAsBillNoWise()" value="Search" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table
							class="table table-bordered table-striped table-condensed cf"
							id="billReport" class="display"
							style="border: 2px solid black; border-collapse: collapse;">
							<thead>
								<tr>
									<th>Bill No</th>
									<th>Customer Name</th>
									<th>Contact No</th>
									<th>Total Amount</th>
								</tr>

							</thead>

							<tfoot>
								<tr>
									<th colspan="3" style="text-align: right">Total Rs:</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</fieldset>
			</form>
		</div>
		
		
		
	</div>

</div>




</div>
</div>
<%@include file="commons/newFooter.jsp"%>
