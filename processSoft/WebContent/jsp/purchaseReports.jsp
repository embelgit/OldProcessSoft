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

<script src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/selectjj.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/buttom.js"></script>
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
	href="/processSoft/staticContent/css/ui.jqgrid.min.css">

<script type="text/javascript"
	src="/processSoft/staticContent/js/inwardreport.js"></script>

</head>
<body style="height: 863px;">
	<div class="container-fluid">
		<div class="row">
			<div align="center" style="margin-top: 75px">
				<h2 class="form-name style_heading">Gst Wise Purchase Reports</h2>
			</div>
			<div class="row">
				<div class="col-sm-offset-1 col-md-10">
					<hr style="border-top-color: #c1b1b1;">
				</div>
			</div>
		</div>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home"><h4
						style="color: blue">Single Date</h4></a></li>
			<li><a data-toggle="tab" href="#twoDates"><h4
						style="color: blue">Between Two Dates</h4></a></li>
			<li><a data-toggle="tab" href="#caReports"><h4
						style="color: blue">CA Report</h4></a></li>
		</ul>

		<div class="tab-content" style="float: left">
			<!-------- Single Date ---------->
			<div id="home" class="tab-pane fade in active">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action="" name="abc">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">
							<label class="col-md-3 control-label" for=""> Enter Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="fDate" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>
							<div class="col-md-3">
								<div class="input-group">
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="return singleDatePurchase();" value="Search" />
								</div>
							</div>
						</div>

						<div class="table-responsive">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="example" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>GSTTIN No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Amount</th>
										<th>GST& SGST 5% Amount</th>
										<th>GST& SGST 12% Amount</th>
										<th>GST& SGST 18% Amount</th>
										<th>GST& SGST 28% Amount</th>
										<th>IGST 5% Amount</th>
										<th>IGST 12% Amount</th>
										<th>IGST 18% Amount</th>
										<th>IGST 28% Amount</th>
										<th>Total Tax Amount</th>
										<th>Total Bill Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
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

			<!-- ---	Between Two Dates	---- -->
			<div id="twoDates" class="tab-pane ">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action=""
					name="fertiBill">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">
							<label class="col-md-2 control-label" for=""> Start
								Purchase Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="fisDate" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>

							<label class="col-md-2 control-label" for="">End Purchase
								Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="endDate" placeholder="End Date"
										class="form-control input-md ac_district" type="text">
								</div>
							</div>
							
							<div align="center">

								<input type="button" id="btn" name="save" style="margin-right: 206px;"
									class="btn btn-lg btn-success btn-md button_hw"
									onclick="purchaseReportBetweenTwoDates()" value="Search" />

							</div>
						</div>

						
						<div class="table-responsive">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="example1" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Date</th>
										<th>Supplier Name</th>
										<th>Bill No</th>
										<th>GSTTIN No</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Item Rate</th>
										<th>Quantity</th>
										<th>Amount</th>
										<th>GST& SGST 5% Amount</th>
										<th>GST& SGST 12% Amount</th>
										<th>GST& SGST 18% Amount</th>
										<th>GST& SGST 28% Amount</th>
										<th>IGST 5% Amount</th>
										<th>IGST 12% Amount</th>
										<th>IGST 18% Amount</th>
										<th>IGST 28% Amount</th>
										<th>Total Tax Amount</th>
										<th>Total Bill Amount</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th colspan="7" style="text-align: right">Total:</th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
										<th></th>
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
			<!-- ---	CA Reports	---- -->
			<div id="caReports" class="tab-pane ">
				<div class="row"></div>
				<form class="form-horizontal" method="post" action=""
					name="fertiBill">
					<fieldset>
						<div class="row form-group" style="margin-top: 20px">
							<label class="col-md-2 control-label" for=""> Start
								Purchase Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="fisDate1" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>

							<label class="col-md-2 control-label" for="">End Purchase
								Date:<sup>*</sup>
							</label>
							<div class="col-md-2">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-calendar"></i>
									</span> <input type="date" id="endDate1" placeholder="End Date"
										class="form-control input-md ac_district" type="text">
								</div>
							</div>
							<div align="center">
								<input type="button" id="btn" name="save" style="margin-right: 206px;"
									class="btn btn-lg btn-success btn-md button_hw button_margin_right"
									onclick="caReportBetweenTwoDates()" value="Search" />
							</div>
						</div>
						
						<p id="demo12"></p>
						<div class="table-responsive">
							<table
								class="table table-bordered table-striped table-condensed cf"
								id="careport" class="display"
								style="border: 2px solid black; border-collapse: collapse;">
								<thead>
									<tr>
										<th>Sr No</th>
										<th>Category Name</th>
										<th>Item Name</th>
										<th>Hsn/Sac No</th>
										<th>Quantity</th>
										<th>Gst</th>
										<th>Igst</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th></th>
										<th></th>
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
		</div>
		<div class="row footer_margin_top" align="center">
			<%@include file="y_commons/footer.jsp"%>
		</div>
	</div>
</body>
</html>