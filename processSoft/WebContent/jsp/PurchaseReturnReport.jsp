
<%@page import="com.Fertilizer.hibernate.PurchaseReturn"%>
<%@page import="com.Fertilizer.dao.PurchaseReturnDao"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.PoDetailsBean"%>
<%@page import="com.Fertilizer.dao.PoDetailsDao"%>
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

<script src="/processSoft/staticContent/js/PoReport.js"></script>
 <script type="text/javascript" src="/processSoft/staticContent/js/purchaseReturn.js"></script>
</head>
<body>

	<div class="container ">
		<div class="row">
			<div align="center" style="margin-top: 120px">
				<h2 class="form-name style_heading">Purchase Return Report</h2>
			</div>

			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>
	</div>

	<div class="tab-pane active" id="home">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#VendorNameWise">
					<h4 style="color: blue">Vendor name wise</h4>
			</a></li>

			<li><a data-toggle="tab" href="#RangeWise">
					<h4 style="color: blue">Range Wise</h4>
			</a></li>

			<li><a data-toggle="tab" href="#ShopWise">
					<h4 style="color: blue">Vendor Name Wise</h4>
			</a></li>

		</ul>
		<div class="tab-content" style="float: left">

			<!---------- Vendor name wise reports -------------->

			<div id="VendorNameWise" class="tab-pane active">
				<div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>
				<form class="form-horizontal" method="post" action=""
					name="PoReportvendorwiseForm">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">

							


							<label class="col-md-2 control-label" for="fk_cat_id">Vendor
								Name<sup>*</sup>
							</label>
							<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<%
										PoDetailsDao DEO = new PoDetailsDao();
										List Pod = DEO.getAllPoDetails();
									%>
									<input type="text" id="vendorName" list="Vendor_drop1"
										class="form-control">
									<datalist id="Vendor_drop1">
										<%
											for (int i = 0; i < Pod.size(); i++) {
												PoDetailsBean bean = (PoDetailsBean) Pod.get(i);
										%>
										<option data-value="<%=bean.getPk_poDetails_id()%>"
											value="<%=bean.getSuppliername()%> "></option>
										<%
											}
										%>

									</datalist>
								</div>
							</div>
							
							<label class="col-md-2 control-label" for="ShopName1">Bill
								No<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<%
										PurchaseReturnDao dao2 = new PurchaseReturnDao();
										List ShopList2 = dao2.getAllBillNo();
									%>
									<input list="ShopName_drop1" id="billNo"
										class="form-control" style="text-transform: uppercase">
									<datalist id="ShopName_drop1">
										<%
											for (int i = 0; i < ShopList2.size(); i++) {
												PurchaseReturn bean2 = (PurchaseReturn) ShopList2.get(i);
										%>

										<option data-value="<%=bean2.getPk_GRDetails_id()%>"
											value="<%=bean2.getBillno()%>">
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
												onclick="PurchaseReturnVendorNameWise()" value="Search" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
						<div class="table-list">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="VendorTbl" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>SrNo</th>
										<th>ProductName</th>
										<th>Bill NO</th>
										<th>Quantity</th>
										<th>Return Quantity</th>
										<th>Discount</th>
										<th>GST</th>
										<!-- <th>Igst</th> -->
										<th>Tax Amount</th>
										<th>Gross Total</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total Rs:</th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
							</table>
							</div>
						</div>

					</fieldset>
				</form>
			</div>

			<!---------- Range wise reports -------------->

			<div id="RangeWise" class="tab-pane fade">

				<div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>


				<form class="form-horizontal" method="post" action=""
					name="PoReportFormRange">
					<fieldset>

						<div class="row form-group">
							<label class="col-md-2 control-label" for="ShopName2">Vendor
								Name<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<%
										PoDetailsDao DEO1 = new PoDetailsDao();
										List Pod1 = DEO1.getAllPoDetails();
									%>
									<input type="text" id="VendorName1" list="Vendor_drop1"
										class="form-control">
									<datalist id="Vendor_drop1">
										<%
											for (int i = 0; i < Pod1.size(); i++) {
												PoDetailsBean bean = (PoDetailsBean) Pod1.get(i);
										%>
										<option data-value="<%=bean.getPk_poDetails_id()%>"
											value="<%=bean.getSuppliername()%> "></option>
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
											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="PoReturnReportAsPerRangeWise()" value="Search" />
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="table-responsive">
						<div class="table-list">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="VendorTblRange" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>SrNo</th>
										<th>ProductName</th>
										<th>Bill NO</th>
										<th>Quantity</th>
										<th>Discount</th>
										<th>GSt</th>
										<th>Igst</th>
										<th>Return Quantity</th>
										<th>Tax Amount</th>
										<th>Grid Total</th>
										<th>Gross Total</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="09" style="text-align: right">Total Rs:</th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
							</table>
							</div>
						</div>

					</fieldset>
				</form>
			</div>


			<!---------- ShopName wise reports -------------->

			<div id="ShopWise" class="tab-pane fade">

				<div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>


				<form class="form-horizontal" method="post" action=""
					name="PoReportShopNameForm">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">
							<label class="col-md-2 control-label" for="proName">Vendor
								Name<sup>*</sup>
							</label>
							<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<%-- <%
										shopDetailsDao dao = new shopDetailsDao();
										List ShopList = dao.getAllShop();
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
										
									</datalist> --%>
									<%
										PoDetailsDao DEO2 = new PoDetailsDao();
										List Pod2 = DEO2.getAllPoDetails();
									%>
									<input type="text" id="VendorName2" list="Vendor_drop1"
										class="form-control">
									<datalist id="Vendor_drop1">
										<%
											for (int i = 0; i < Pod2.size(); i++) {
												PoDetailsBean bean = (PoDetailsBean) Pod2.get(i);
										%>
										<option data-value="<%=bean.getPk_poDetails_id()%>"
											value="<%=bean.getSuppliername()%> "></option>
										<%
											}
										%>

									</datalist>


								</div>
							</div>
							
						<div class="row form-group">
							<div class="col-md-3 ">
								<div class="input-group">
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="PoReturnReportAsPerVendorNameWise()" value="Search" />
								</div>
							</div>
						</div>
						</div>


						<div class="table-responsive">
						<div class="table-list">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="ShopTbl" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>SrNo</th>
										<th>ProductName</th>
										<th>Bill NO</th>
										<th>Quantity</th>
										<th>Discount</th>
										<th>GSt</th>
										<th>Igst</th>
										<th>Return Quantity</th>
										<th>Tax Amount</th>
										<th>Grid Total</th>
										<th>Gross Total</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="09" style="text-align: right">Total Rs:</th>
										<th></th>
										<th></th>
									</tr>
								</tfoot>
							</table>
							</div>
						</div>

					</fieldset>
				</form>
			</div>

		</div>
	</div>
</body>
