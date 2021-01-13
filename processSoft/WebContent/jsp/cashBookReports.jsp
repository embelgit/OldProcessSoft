<%@page import="com.Fertilizer.hibernate.FertilizerBillBean"%>
<%@page import="com.Fertilizer.dao.FertilizerBillDao"%>
<%@page import="com.Fertilizer.hibernate.EmployeeDetailsBean"%>
<%@page import="com.Fertilizer.dao.EmployeeDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.Fertilizer.dao.ExpenditureDetailsDao"%>
<%@page import="com.Fertilizer.bean.CreditCustPaymentDetail"%>
<%@page import="com.Fertilizer.dao.CustomerPaymentDao"%>
<%@page import="com.Fertilizer.dao.SupplierPaymentDao"%>
<%@page import="com.Fertilizer.bean.SupplierPaymentDetail"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.CustomerDetailsBean"%>
<%@page import="com.Fertilizer.dao.CustomerDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.List"%>

<!-- 	 <link href="/Fertilizer/WebContent/staticContent/css/dataTa.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Fertilizer/staticContent/css/dataTables.jqueryui.min.css"  rel="stylesheet" type="text/css" media="all">
	<link rel="stylesheet" href="/Fertilizer/staticContent/css/tabDemo.css">
 	<link rel="stylesheet" href="/Fertilizer/staticContent/css/jquery-ui.min.css">
    <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.min.css">
    
    <script src="/Fertilizer/staticContent/js/jquery.min.js"></script>
    <script src="/Fertilizer/staticContent/js/jquery.jqgrid.min.js"></script>
	<script src="/Fertilizer/staticContent/js/jquery.dataTables.js" type="text/javascript"></script>
	<script type="text/javascript" src="/Fertilizer/staticContent/js/jqueryUi.js"></script>  -->
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
<script src="/processSoft/staticContent/js/cashbankbook.js"></script>

</head>

<div class="row" style="min-height: 300px;">
	<div class="col-md-12">
		<h3>Left Tabs</h3>
		<hr />
		<div class="col-md-2">
			<ul class="nav nav-tabs tabs-left">
				<li class="active"><a href="#home" data-toggle="tab">Vendor
						Payment Reports</a></li>
				<!--  <li><a href="#profile" data-toggle="tab">Customer Payment Reports</a></li> -->
				<li><a href="#messages" data-toggle="tab">Employee Payment
						Reports</a></li>
				<li><a href="#settings" data-toggle="tab">Expenditure
						Payment Reports</a></li>
				<!-- <li><a href="#Rk" data-toggle="tab">VillageWise Payment Reports</a></li>   -->
			</ul>
		</div>
		<div class="col-xs-9">
			<!-- Tab panes -->
			<div class="tab-content">

				<!---------- 	supplier Payment reports -------------->

				<div class="tab-pane active" id="home">
					<div class="row">
						<div align="center">
							<h2 class="form-name style_heading">Vendor Payment Reports</h2>
						</div>

						<div class="row">
							<div class="col-sm-offset-1 col-md-10">
								<hr style="border-top-color: #c1b1b1;">
							</div>
						</div>
					</div>

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab" href="#AllSupplier"><h4
									style="color: blue">All Vendor's</h4></a></li>	
						<li><a data-toggle="tab" href="#supplierNAme"><h4
									style="color: blue">Vendor Name Wise</h4></a></li>
						<li><a data-toggle="tab" href="#supplierBillWise"><h4
									style="color: blue">Bill Number Wise</h4></a></li>
						<li><a data-toggle="tab" href="#supplierSingleDate"><h4
									style="color: blue">Datewise</h4></a></li>
						<li><a data-toggle="tab" href="#supplierBetweenTwoDate"><h4
									style="color: blue">Range</h4></a></li>
						<li><a data-toggle="tab" href="#VendorWiseTwoDate"><h4
									style="color: blue">Vendor Wise</h4></a></li>

					</ul>

					<div class="tab-content" style="float: left">
						<!--   ALL -->
						<div id="AllSupplier" class="tab-pane fade in active">
							<div id="report" style="text-align: center">
								<label id="demo"></label>
								<script>
									var date = new Date();
									document.getElementById("demo").innerHTML = date
											.toDateString();
								</script>
							</div>

							<script type="text/javascript">
								$(document)
										.ready(
												function() {
													var table = $("#list")
															.dataTable(
																	{

																		fnRowCallback : function(
																				nRow,
																				aData,
																				iDisplayIndex) {
																			$(
																					"th:first",
																					nRow)
																					.html(
																							iDisplayIndex + 1);
																			return nRow;
																		},

																		"footerCallback" : function(
																				row,
																				data,
																				start,
																				end,
																				display) {
																			var api = this
																					.api(), data;

																			// Remove the formatting to get integer data for summation
																			var intVal = function(
																					i) {
																				return typeof i === 'string' ? i
																						.replace(
																								/[\$,]/g,
																								'') * 1
																						: typeof i === 'number' ? i
																								: 0;
																			};

																			// Total over all pages
																			total = api
																					.column(
																							4)
																					.data()
																					.reduce(
																							function(
																									a,
																									b) {
																								return intVal(a)
																										+ intVal(b);
																							},
																							0);
																			console
																					.log(total);

																		/* 	// Update footer
																			$(
																					api
																							.column(
																									4)
																							.footer())
																					.html(
																							'Rs'
																									+ ' '
																									+ total);
																			console
																					.log(total); */

																			total = api
																					.column(
																							5)
																					.data()
																					.reduce(
																							function(
																									a,
																									b) {
																								return intVal(a)
																										+ intVal(b);
																							},
																							0);
																			console
																					.log(total);

																			// Update footer
																			$(
																					api
																							.column(
																									5)
																							.footer())
																					.html(
																							'Rs'
																									+ ' '
																									+ total);
																			console
																					.log(total);

																			total = api
																					.column(
																							6)
																					.data()
																					.reduce(
																							function(
																									a,
																									b) {
																								return intVal(a)
																										+ intVal(b);
																							},
																							0);
																			console
																					.log(total);

																			// Update footer
																			$(
																					api
																							.column(
																									6)
																							.footer())
																					.html(
																							'Rs'
																									+ ' '
																									+ total);
																			console
																					.log(total);

																			total = api
																					.column(
																							7)
																					.data()
																					.reduce(
																							function(
																									a,
																									b) {
																								return intVal(a)
																										+ intVal(b);
																							},
																							0);
																			console
																					.log(total);

																		/* 	// Update footer
																			$(
																					api
																							.column(
																									7)
																							.footer())
																					.html(
																							'Rs'
																									+ ' '
																									+ total);
																			console
																					.log(total); */
																		}

																	});

													/* 	 var tableTools = new $.fn.dataTable.TableTools(table, {
																'sSwfPath':'//cdn.datatables.net/tabletools/2.2.4/swf/copy_csv_xls_pdf.swf',
																	'aButtons':['copy','print','csv',{
																	'sExtends':'xls',
																	'sFileName':'Data.xls',
																	'sButtonText': 'Save to Excel'
																		}
																	]
													      			}); */

													/* 	$(tableTools.fnContainer()).insertBefore('#list_wrapper'); */
												});
							</script>


							<%
								SupplierPaymentDao dao = new SupplierPaymentDao();
								List Lis1 = dao.getSupplierPaymentDetailForReport();
							%>
							<div id="demo_jui" style="text-align: center">
								<table
									class="table table-bordered table-striped table-condensed cf"
									id="list" class="display" border="1">
									<thead>
										<tr>
											<th>Supplier Name</th>
											<th>Bill Number</th>
											<th>Payment Mode</th>
											<th>Accountant Name</th>
											<th>Total Amount</th>
											<th>Payment</th>
											<th>Credit Amount</th>
											<th>Debit Amount</th>
											<th>Balance Amount</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th colspan="5" style="text-align: right">Total:</th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</tfoot>

									<tbody>
										<%
											for (int i = 0; i < Lis1.size(); i++) {
												SupplierPaymentDetail pro = (SupplierPaymentDetail) Lis1.get(i);
										%>
										<tr>
											<td class="align"><%=pro.getSupplierName()%></td>
											<td class="align"><%=pro.getBillno1()%></td>
											<td class="align"><%=pro.getPaymentMode()%></td>
											<td class="align"><%=pro.getAccountantName()%></td>
											<td class="align"><%=pro.getTotalAmount()%></td>
											<td class="align"><%=pro.getCreditAmount()%></td>
											<td class="align"><%=pro.getTdsdetail()%></td>
											<td class="align"><%=pro.getDebitAmount()%></td>
											<td class="align"><%=pro.getBalanceAmount()%></td>
										</tr>
										<%
											}
										%>

									</tbody>
								</table>
							</div>
						</div>



						<!-- Supplier Name Wise -->
						<div id="supplierNAme" class="tab-pane ">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<form class="form-horizontal" method="post" action=""
								name="supReportBill">
								<fieldset>

									<div class="row form-group">
										<label class="col-md-3 control-label" for="supplier">Vendor Name
											</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="	glyphicon glyphicon-hand-right"></i>
												</span>



												<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
												<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->

												<%
													SupplierDetailsDao sdd = new SupplierDetailsDao();
													List sList = sdd.getAllSupplier1(request);
												%>

												<input list="sup_drop7" id="supplier7" class="form-control">
												<datalist id="sup_drop7">

													<%
														for (int i = 0; i < sList.size(); i++) {
															SupplierDetailsBean sup = (SupplierDetailsBean) sList.get(i);
													%>

													<option data-value="<%=sup.getSupId()%>"
														value="<%=sup.getDealerName()%>">
														<%
															}
														%>
													
												</datalist>
											</div>
										</div>

										<div class="col-md-3 ">
											<div class="input-group">
												<input type="button" id="btn" name="save"
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="getSupNameWiseReport()" value="Search" />
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table
											class="table table-bordered table-striped table-condensed cf"
											id="supplierNameWiseTable" class="display">
											<thead>
												<tr>
													<th>Supplier Name</th>
													<th>Bill Number</th>
													<th>Payment Mode</th>
													<th>Accountant Name</th>
													<th>Payment Date</th>
													<th>Total Amount</th>
													<th>Payment</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th colspan="6" style="text-align: right">Total:</th>
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
						<!-- Bill number wise -->
						<div id="supplierBillWise" class="tab-pane ">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<form class="form-horizontal" method="post" action=""
								name="supReportBill">
								<fieldset>

									<div class="row form-group">
										<label class="col-md-3 control-label" for="supplier">Vendor Name
											</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="	glyphicon glyphicon-hand-right"></i>
												</span>



												<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
												<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->


												<%
													SupplierDetailsDao sdd1 = new SupplierDetailsDao();
													List sList1 = sdd.getAllSupplier1(request);
												%>

												<input list="sup_drop" id="supplier"
													onchange="bill.getAllBills();" class="form-control">
												<datalist id="sup_drop">
													<%
														for (int i = 0; i < sList.size(); i++) {
															SupplierDetailsBean sup = (SupplierDetailsBean) sList1.get(i);
													%>

													<option data-value="<%=sup.getSupId()%>"
														value="<%=sup.getDealerName()%>">
														<%
															}
														%>
													
												</datalist>
											</div>
										</div>

										<label class="col-md-2 control-label" for="bill_no">
											Bill No </label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> No </span> <select
													class="form-control input-md" id='billNo1' name="billNo1">
												</select>
											</div>
										</div>
									</div>
									<div class="row form-group">
										<div class="col-md-3 col-md-offset-5" >
											<div class="input-group">
												<input type="button" id="btn" name="save"
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="getBillWiseReport()" value="Search" />
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table
											class="table table-bordered table-striped table-condensed cf"
											id="supplierBillWiseData" class="display">
											<thead>
												<tr>
													<th>Supplier Name</th>
													<th>Bill Number</th>
													<th>Payment Mode</th>
													<th>Accountant Name</th>
													<th>Payment Date</th>
													<th>Total Amount</th>
													<th>Payment</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th colspan="6" style="text-align: right">Total:</th>
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


						<!--    for single date -->
						<div id="supplierSingleDate" class="tab-pane">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<form class="form-horizontal" method="post" action=""
								name="supReport">
								<fieldset>

									<div class="row form-group">
										<label class="col-md-3 control-label" for=""> Enter
											Date:<sup>*</sup>
										</label>
										<div class="col-md-4">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fDate11" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>


										<div class="col-md-3 ">
											<div class="input-group">
												<input type="button" id="btn" name="save"
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="supplierReportForSingleDate()" value="Search" />
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table
											class="table table-bordered table-striped table-condensed cf"
											id="supplierSingleDatetable" class="display">
											<thead>
												<tr>
													<th>Supplier Name</th>
													<th>Bill Number</th>
													<th>Payment Mode</th>
													<th>Accountant Name</th>
													<th>Payment Date</th>
													<th>Total Amount</th>
													<th>Payment</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th colspan="6" style="text-align: right">Total:</th>
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
								name="supReport1">
								<fieldset>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="supplier">Vendor Name
											</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="	glyphicon glyphicon-hand-right"></i>
												</span>



												<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
												<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->

												<%
													SupplierDetailsDao sdd8 = new SupplierDetailsDao();
													List sList8 = sdd8.getAllSupplier1(request);
												%>

												<input list="sup_drop8" id="supplier8" class="form-control">
												<datalist id="sup_drop8">

													<%
														for (int i = 0; i < sList8.size(); i++) {
															SupplierDetailsBean sup88 = (SupplierDetailsBean) sList8.get(i);
													%>

													<option data-value="<%=sup88.getSupId()%>"
														value="<%=sup88.getDealerName()%>">
														<%
															}
														%>
													
												</datalist>
											</div>
										</div>
									</div>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="startDate">
											Start Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fisDate1" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<label class="col-md-2 control-label" for="endDate">End
											Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-map-marker"></i>
												</span> <input type="date" id="endDate1" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>

									<div class="row form-group buttons_margin_top ">
										<div align="center">

											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="getSupplierDetailsBetweenTwoDates()" value="Search" />

										</div>
									</div>

									<table
										class="table table-bordered table-striped table-condensed cf"
										id="supplierBetweenTwoDatestable" class="display">
										<thead>
											<tr>
												<th>Supplier Name</th>
												<th>Bill Number</th>
												<th>Payment Mode</th>
												<th>Accountant Name</th>
												<th>Payment Date</th>
												<th>Total Amount</th>
												<th>Payment</th>
												<th>Credit Amount</th>
												<th>Debit Amount</th>
												<th>Balance Amount</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="6" style="text-align: right">Total:</th>
												<th></th>
												<th></th>
												<th></th>


											</tr>
										</tfoot>
									</table>
								</fieldset>
							</form>


						</div>
						
						<!--Vendor Name Wise   -->
						
						<div id="VendorWiseTwoDate" class="tab-pane fade">

							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>


							<form class="form-horizontal" method="post" action=""
								name="supReport1">
								<fieldset>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="supplier">Vendor Name</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="	glyphicon glyphicon-hand-right"></i>
												</span>



												<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
												<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->

												<%
													SupplierDetailsDao sdd9 = new SupplierDetailsDao();
													List sList9 = sdd8.getAllSupplier1(request);
												%>

												<input list="sup_drop8" id="supplier9kb" class="form-control">
												<datalist id="sup_drop8">

													<%
														for (int i = 0; i < sList8.size(); i++) {
															SupplierDetailsBean sup88 = (SupplierDetailsBean) sList8.get(i);
													%>

													<option data-value="<%=sup88.getSupId()%>"
														value="<%=sup88.getDealerName()%>">
														<%
															}
														%>
													
												</datalist>
											</div>
										</div>
									</div>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="startDate">
											Start Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fisDate1kb" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<label class="col-md-2 control-label" for="endDate">End
											Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-map-marker"></i>
												</span> <input type="date" id="endDate1kb" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>

									<div class="row form-group buttons_margin_top ">
										<div align="center">

											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="getVendorDetailsBetweenTwoDates()" value="Search" />

										</div>
									</div>

									<table
										class="table table-bordered table-striped table-condensed cf"
										id="VendorBetweenTwoDatestable" class="display">
										<thead>
											<tr>
												
												<th>Bill Number</th>
												<th>Supplier Name</th>
												<th>Insert Date</th>
												<th>Total Amount</th>
												<th>Payment </th>
												<th>Balance Amount</th>
												<th>TDS Amount</th>
												<th>Debit Amount</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="4" style="text-align: right">Total:</th>
												<th></th>
												<th></th>
												<th></th>
												<th></th>
											
												


											</tr>
										</tfoot>
									</table>
								</fieldset>
							</form>


						</div>
						
						
						
						
					</div>

				</div>


				<!---------   Customer Payment Reports--------->

				<%--  <div class="tab-pane" id="profile">
	         	<div class="row">
				    <div align="center">
				  		<h2 class="form-name style_heading">Credit Customer Payment Reports</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
			    </div>
         	 
	  <ul class="nav nav-tabs">
	 <!--  <li class="active"><a data-toggle="tab" href="#AllCustomer"><h4 style="color:blue">All Customer's</h4></a></li> -->
	  		<li class="active"><a data-toggle="tab" href="#customerNameWise"><h4 style="color:blue">Customer ID wise</h4></a></li>
	  		<li ><a data-toggle="tab" href="#customerBillWise"><h4 style="color:blue">Between Two ID's</h4></a></li>
		    <li ><a data-toggle="tab" href="#customerSingleDate"><h4 style="color:blue">Datewise</h4></a></li>
		    <li><a data-toggle="tab" href="#customerBetweenTwoDate"><h4 style="color:blue">Range</h4></a></li>
		  
	  </ul>
         	 
   <div class="tab-content" style="float: left"> 

 


<!-- 	Customer Name wise -->    
    <div id="customerNameWise" class="tab-pane fade in active">
    		        <div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>
		<form class="form-horizontal" method="post" action="" name="supReportBill">
			<fieldset>
						<div class="row form-group">
							<label class="col-md-3 control-label" for="customerName">Customer ID</label>  
          					  <div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						
							<%
								CustomerDetailsDao custdao1 = new CustomerDetailsDao();
           						List custList2 =custdao1.getAllCustomer();
							
							%>
									<input list="cust_drop5" id="creditCustomer5" class="form-control">
				<datalist id="cust_drop5">
							
							<%
					           for(int i=0;i<custList2.size();i++){
					        	   CustomerDetailsBean cust2 =(CustomerDetailsBean)custList2.get(i);
							%>
		
						<option data-value="<%=cust2.getCustId()%>"> <%=cust2.getIdNo()%> </option>
							<%
				      			}
				    		%>
						</datalist> 
				</div>
       </div>
            	
							<div class="col-md-3 ">
								<div class="input-group">
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="getCreditCustomerReportNameWise()" value="Search" />
								</div>
							</div>
					</div>
						<div	class="table-responsive">
						<table class= "table table-bordered table-striped table-condensed cf" id="customerNameWiseData2" class="display">
							<thead>
								<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<!-- <th>Bill Number</th> -->
													<th>Payment Date</th>
													<th>Payment Mode</th>
													<th>Total Amount</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="4" style="text-align: right">Total:</th>
									<th></th><th></th><th></th><th></th>
				
				
								</tr>
							</tfoot>
						</table>
					</div>
					</fieldset>
				</form>
    </div>
    
    
    <!-- Customer Bill number wise -->
     <div id="customerBillWise" class="tab-pane">
		        <div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>
		<form class="form-horizontal" method="post" action="" name="supReportBill">
			<fieldset>

						<div class="row form-group">
							<label class="col-md-2 control-label" for="customerName">Customer ID</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						
							<%
								CustomerDetailsDao cdd = new CustomerDetailsDao();
           						List cList =cdd.getAllCustomer();
							
							%>
									<input list="cust_drop" id="creditCustomer"  class="form-control">
				<datalist id="cust_drop">
							
							<%
					           for(int i=0;i<cList.size();i++){
					        	   CustomerDetailsBean cust1 =(CustomerDetailsBean)cList.get(i);
							%>
		
						<option data-value="<%=cust1.getCustId()%>"><%=cust1.getIdNo() %> </option>
							<%
				      			}
				    		%>
						</datalist> 
					</div>
       		</div>
       
       						<label class="col-md-2 control-label" for="bill_no"> To </label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										No
									</span>
           		 					
           		 					<%
								CustomerDetailsDao cdd2 = new CustomerDetailsDao();
           						List cList1 =cdd2.getAllCustomer();
							
							%>
									<input list="cust_drop1" id="creditCustomer1"  class="form-control">
				<datalist id="cust_drop1">
							
							<%
					           for(int i=0;i<cList1.size();i++){
					        	   CustomerDetailsBean cust =(CustomerDetailsBean)cList1.get(i);
							%>
		
						<option data-value="<%=cust.getCustId()%>"><%=cust.getIdNo() %> </option>
							<%
				      			}
				    		%>
						</datalist> 
           						 </div>
							</div>
       
       	  
            </div>
           				<div class="row form-group">  
           				  <label class="col-md-2 control-label" for="fk_cat_id0"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Category<%}%><sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   CategoryDetailsDao cdd0 = new CategoryDetailsDao();
           						List cList0 =cdd0.getAllMainCat();
							
							%>
							<input list="cat_drop0" id="fk_cat_id0"  class="form-control" onchange="getBillByCustomerForReport()">
				<datalist id="cat_drop0">
							<%
					           for(int i=0;i<cList0.size();i++){
					        	   CategoryDetailsBean cat0=(CategoryDetailsBean)cList0.get(i);
							%>
		
							<option data-value="<%=cat0.getCatId()%>" value="<%=cat0.getCategoryName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
				</div>
				
				       <div class="row form-group buttons_margin_top ">
												<div align="center">
												
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="getBillWiseCreditReport()" value="Search" />
								
							</div>
					</div>	
						<div	class="table-responsive">
						<table class= "table table-bordered table-striped table-condensed cf" id="customerNameWiseData" class="display">
							<thead>
								<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<!-- <th>Bill Number</th> -->
													<th>Payment Date</th>
													<th>Payment Mode</th>
													<th>Total Amount</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="4" style="text-align: right">Total:</th>
									<th></th><th></th><th></th><th></th>
				
				
								</tr>
							</tfoot>
						</table>
					</div>
					</fieldset>
				</form>
         
       </div>
    
    
    <!--    for single date -->
	<div id="customerSingleDate" class="tab-pane">
		        <div class="row">
					<div class="col-sm-offset-1 col-md-10">
						<hr style="border-top-color: #c1b1b1;">
					</div>
				</div>
		<form class="form-horizontal" method="post" action="" name="custReport">
			<fieldset>

						<div class="row form-group">
							<label class="col-md-3 control-label" for="">
								Enter Date:<sup>*</sup>
							</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="glyphicon glyphicon-user"></i>
									</span> <input type="date" id="fDate1" placeholder="Start Date"
										class="form-control input-md" type="text">
								</div>
							</div>
				
				
							<div class="col-md-3">
								<div class="input-group">
									<input type="button" id="btn" name="save"
										class="btn btn-lg btn-success btn-md button_hw button_margin_right"
										onclick="creditCustReportForSingleDate()" value="Search" />
								</div>
							</div>
						</div>
						<div	class="table-responsive">
						<table class= "table table-bordered table-striped table-condensed cf" id="customerSingleDatetable" class="display">
							<thead>
								<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<!-- <th>Bill Number</th> -->
													<th>Payment Date</th>
													<th>Payment Mode</th>
													<th>Total Amount</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th colspan="4" style="text-align: right">Total:</th>
									<th></th><th></th><th></th><th></th>
				
				
								</tr>
							</tfoot>
						</table>
					</div>
					</fieldset>
				</form>
         
       </div>
        	
        <!------ 	Between Two Dates  ----->
        	  <div id="customerBetweenTwoDate" class="tab-pane fade">
				
				     <div class="row">
						     <div class="col-sm-offset-1 col-md-10">
								  		<hr style="border-top-color:#c1b1b1;">
						     </div>	
				    </div>
				
				
				<form class="form-horizontal" method="post" action="" name="custReport1">
					<fieldset>
					<div class="row form-group">
							<label class="col-md-2 control-label" for="customerName">Customer ID</label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						
							<%
								CustomerDetailsDao custdao2 = new CustomerDetailsDao();
           						List custList3 =custdao2.getAllCustomer();
							
							%>
									<input list="cust_drop6" id="creditCustomer6" class="form-control">
				<datalist id="cust_drop6">
							
							<%
					           for(int i=0;i<custList3.size();i++){
					        	   CustomerDetailsBean cust2 =(CustomerDetailsBean)custList3.get(i);
							%>
		
						<option data-value="<%=cust2.getCustId()%>"><%=cust2.getIdNo() %>  </option>
							<%
				      			}
				    		%>
						</datalist> 
				</div>
       </div>
       </div>
				         <div class="row form-group">
							<label class="col-md-2 control-label" for="startDate"> Start Date:<sup>*</sup></label>  
				           			 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
				           		 			  <input type="date" id="fisDate" placeholder="Start Date" class="form-control input-md" type="text" >
				           		 		</div>
									</div>
				
				           	 <label class="col-md-2 control-label" for="village">End Date:<sup>*</sup></label>
				           	 	<div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-map-marker"></i>
										</span>
				         	   			  <input type="date" id="endDate" placeholder="End Date" class="form-control input-md ac_district"  type="text">
				          		  	</div>
								</div>
				          </div>
					  
				       <div class="row form-group buttons_margin_top ">
												<div align="center">
												  
												    <input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"onclick="getCreditCustomerDetailsBetweenTwoDates()" value="Search"/>
												     									
												</div>
									</div>	
						
						<table class= "table table-bordered table-striped table-condensed cf" id="customerBetweenTwoDates" class="display">
						<thead>
							<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<!-- <th>Bill Number</th> -->
													<th>Payment Date</th>
													<th>Payment Mode</th>
													<th>Total Amount</th>
													<th>Credit Amount</th>
													<th>Debit Amount</th>
													<th>Balance Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="4" style="text-align: right">Total:</th>
								<th></th><th></th><th></th><th></th>
				
				
							</tr>
						</tfoot>
					</table>
				</fieldset>
				</form>
        	  	
        	  
        	  </div>
        </div>	 
         	 
	</div>
 --%>
				<!----- 	Employee Payment reports ------>
				<div class="tab-pane" id="messages">
					<div class="row">
						<div align="center">
							<h2 class="form-name style_heading">Employee Payment Reports</h2>
						</div>

						<div class="row">
							<div class="col-sm-offset-1 col-md-10">
								<hr style="border-top-color: #c1b1b1;">
							</div>
						</div>
					</div>

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="#employeeSingleDate"><h4 style="color: blue">Datewise</h4></a></li>
						<li><a data-toggle="tab" href="#empBetweenTwoDate"><h4
									style="color: blue">Range</h4></a></li>

					</ul>

					<div class="tab-content" style="float: left">

						<!--    for single date -->
						<div id="employeeSingleDate" class="tab-pane fade in active">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<form class="form-horizontal" method="post" action=""
								name="empReport">
								<fieldset>

									<div class="row form-group">
										<label class="col-md-3 control-label" for=""> Enter
											Date:<sup>*</sup>
										</label>
										<div class="col-md-4">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fDate2" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>


										<div class="col-md-3">
											<div class="input-group">
												<input type="button" id="btn" name="save"
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="employeePaymentReportForSingleDate()"
													value="Search" />
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table
											class="table table-bordered table-striped table-condensed cf"
											id="employeeSingleDatetable" class="display">
											<thead>
												<tr>
													<th>First Name</th>
													<th>Last Name</th>
													<th>Payment Date</th>
													<th>Payment Mode</th>
													<th>Accountant Name</th>
													<th>Reason</th>
													<th>Credit Amount</th>
													<th>Dedit Amount</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th colspan="6" style="text-align: right">Total:</th>
													<th></th>
													<th></th>


												</tr>
											</tfoot>
										</table>
									</div>
								</fieldset>
							</form>
						</div>


						<!-------- 	Between Two Days	 -------->
						<div id="empBetweenTwoDate" class="tab-pane">

							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>


							<form class="form-horizontal" method="post" action=""
								name="empReport1">
								<fieldset>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="customerName">Customer
											Name</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span>

												<%
													EmployeeDetailsDao emp = new EmployeeDetailsDao();
													List emp1 = emp.getAllMainEmployee1(request);
												%>
												<input list="emp_drop" id="emp" class="form-control">
												<datalist id="emp_drop">

													<%
														for (int i = 0; i < emp1.size(); i++) {
															EmployeeDetailsBean emp2 = (EmployeeDetailsBean) emp1.get(i);
													%>

													<option data-value="<%=emp2.getEmpId()%>"><%=emp2.getFirstName()%>
														<%=emp2.getLastName()%>
													</option>
													<%
														}
													%>
												</datalist>
											</div>
										</div>
									</div>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="startDate">
											Start Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fisDate2" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<label class="col-md-2 control-label" for="village">End
											Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-map-marker"></i>
												</span> <input type="date" id="endDate2" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>

									<div class="row form-group buttons_margin_top ">
										<div align="center">

											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="getEmpPaymentDetailsBetTwoDays()" value="Search" />

										</div>
									</div>

									<table
										class="table table-bordered table-striped table-condensed cf"
										id="empBetweenTwoDates" class="display">
										<thead>
											<tr>
												<th>First Name</th>
												<th>Last Name</th>
												<th>Payment Date</th>
												<th>Payment Mode</th>
												<th>Accountant Name</th>
												<th>Reason</th>
												<th>Credit Amount</th>
												<th>Dedit Amount</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="6" style="text-align: right">Total:</th>
												<th></th>
												<th></th>


											</tr>
										</tfoot>
									</table>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
				<!---------- Expenditure Payment Reports ------->

				<div class="tab-pane" id="settings">
					<div class="row">
						<div align="center">
							<h2 class="form-name style_heading">Expenditure Payment
								Reports</h2>
						</div>

						<div class="row">
							<div class="col-sm-offset-1 col-md-10">
								<hr style="border-top-color: #c1b1b1;">
							</div>
						</div>
					</div>

					<ul class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="#expenseSingleDate"><h4 style="color: blue">Date Wise</h4></a></li>
						<li><a data-toggle="tab" href="#expenseBetweenTwoDate"><h4
									style="color: blue">Range Wise</h4></a></li>
						<li><a data-toggle="tab"
							href="#expenseBetweenTwoDateAsPerExpense"><h4
									style="color: blue">Expenditure Name Wise</h4></a></li>
					</ul>

					<div class="tab-content" style="float: left">

						<!--    for single date -->

						<div id="expenseSingleDate" class="tab-pane fade in active">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>
							<form class="form-horizontal" method="post" action=""
								name="expnsReport">
								<fieldset>

									<div class="row form-group">
										<label class="col-md-3 control-label" for=""> Enter
											Date:<sup>*</sup>
										</label>
										<div class="col-md-4">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fDate4" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>


										<div class="col-md-3">
											<div class="input-group">
												<input type="button" id="btn" name="save"
													class="btn btn-lg btn-success btn-md button_hw button_margin_right"
													onclick="expensePaymentReportForSingleDate()"
													value="Search" />
											</div>
										</div>
									</div>
									<div class="table-responsive">
										<table
											class="table table-bordered table-striped table-condensed cf"
											id="expenseSingleDatetable" class="display">
											<thead>
												<tr>
													<th>Expense Name</th>
													<!-- <th>Service Provider</th> -->
													<th>Payment Date</th>
													<th>Accountant Name</th>
													<th>Credit Amount</th>
													<th>debit Amount</th>
													<th>Total Amount</th>
												</tr>
											</thead>
											<tfoot>
												<tr>
													<th colspan="3" style="text-align: right">Total:</th>
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

						<!------- between Two dates ------->

						<div id="expenseBetweenTwoDate" class="tab-pane">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>


							<form class="form-horizontal" method="post" action=""
								name="expReport1">
								<fieldset>
									<div class="row form-group">
										<label class="col-md-2 control-label" for="startDate">
											Start Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="fisDate4" placeholder="Start Date"
													class="form-control input-md" type="text">
											</div>
										</div>

										<label class="col-md-2 control-label" for="endDate">End
											Date:<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-map-marker"></i>
												</span> <input type="date" id="endDate4" placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>

									<div class="row form-group buttons_margin_top ">
										<div align="center">

											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="getExpensePaymentDetailsBetTwoDays()"
												value="Search" />

										</div>
									</div>

									<table
										class="table table-bordered table-striped table-condensed cf"
										id="expenseBetweenTwoDates" class="display">
										<thead>
											<tr>
												<th>Expense Name</th>
												<!-- <th>Service Provider</th> -->
												<th>Payment Date</th>
												<th>Accountant Name</th>
												<th>Credit Amount</th>
												<th>debit Amount</th>
												<th>Total Amount</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="3" style="text-align: right">Total:</th>
												<th></th>
												<th></th>
												<th></th>


											</tr>
										</tfoot>
									</table>
								</fieldset>
							</form>
						</div>


						<!-------Expenditure Name between Two dates ------->

						<div id="expenseBetweenTwoDateAsPerExpense" class="tab-pane">
							<div class="row">
								<div class="col-sm-offset-1 col-md-10">
									<hr style="border-top-color: #c1b1b1;">
								</div>
							</div>


							<form class="form-horizontal" method="post" action=""
								name="expReport1">
								<fieldset>
									<div class="row form-group">
										<label class="col-md-2 control-label"
											for="firstDateForExpenseName"> Start Date:<sup>*</sup></label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> <input type="date" id="firstDateForExpenseName"
													placeholder="Start Date" class="form-control input-md"
													type="text">
											</div>
										</div>

										<label class="col-md-2 control-label"
											for="endDateForExpenseName">End Date:<sup>*</sup></label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-map-marker"></i>
												</span> <input type="date" id="endDateForExpenseName"
													placeholder="End Date"
													class="form-control input-md ac_district" type="text">
											</div>
										</div>
									</div>

									<div class="row form-group">
										<label class="col-md-2 control-label" for="expenditureName">Expenditure
											Name<sup>*</sup>
										</label>
										<div class="col-md-3">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="	glyphicon glyphicon-hand-right"></i>
												</span>

												<!-- Following code is to get expense name from "expenditure_details" table of "fertilizer" DB -->
												<!-- getAllExpenseName() is implemented in  SupplierDetailsDao with return type List-->

												<%
													ExpenditureDetailsDao exdd = new ExpenditureDetailsDao();
													List exList = exdd.getAllExpenseName();
												%>

												<input list="exp_drop" id="expenseName" class="form-control">
												<datalist id="exp_drop">

													<%
														for (int i = 0; i < exList.size(); i++) {
															ExpenditureDetailsBean expbean = (ExpenditureDetailsBean) exList.get(i);
													%>

													<option data-value="<%=expbean.getPkExpenseDetailsId()%>"
														value="<%=expbean.getExpenseName()%>">
														<%
															}
														%>
													
												</datalist>
											</div>
										</div>
										<div class="col-md-offset-1">
											<input type="button" id="btn" name="save"
												class="btn btn-lg btn-success btn-md button_hw button_margin_right"
												onclick="expenseReportAsPerExpenditureName()" value="Search" />
										</div>
									</div>

									<table
										class="table table-bordered table-striped table-condensed cf"
										id="expenseBetweenTwoDatesAsPerSelectedName" class="display">
										<thead>
											<tr>
												<th>Expense Name</th>
												<!-- <th>Service Provider</th> -->
												<th>Payment Date</th>
												<th>Accountant Name</th>
												<th>Credit Amount</th>
												<th>debit Amount</th>
												<th>Total Amount</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th colspan="3" style="text-align: right">Total:</th>
												<th></th>
												<th></th>
												<th></th>


											</tr>
										</tfoot>
									</table>
								</fieldset>
							</form>
						</div>
					</div>
				</div>

				<!-------VillageWise Balance Report------->

				<%-- <div class="tab-pane" id="Rk">
					<div class="row">
				    <div align="center">
				  		<h2 class="form-name style_heading">Village Wise Balance Reports</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
			    </div>
	
				<div id="villageWiseBalanceReport" class="tab-pane">
						<div class="row">
						     <div class="col-sm-offset-1 col-md-10">
								  		<hr style="border-top-color:#c1b1b1;">
						     </div>	
				    </div>
				
				
				<form class="form-horizontal" method="post" action="" name="villageReport1">
					<fieldset>
				         <!-- <div class="row form-group">
							<label class="col-md-2 control-label" for="firstDateForExpenseName"> Start Date:<sup>*</sup></label>  
				           			 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="glyphicon glyphicon-user"></i>
											</span>
				           		 			  <input type="date" id="firstDateForExpenseName" placeholder="Start Date" class="form-control input-md" type="text" >
				           		 		</div>
									</div>
				
				           	 <label class="col-md-2 control-label" for="endDateForExpenseName">End Date:<sup>*</sup></label>
				           	 	<div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-map-marker"></i>
										</span>
				         	   			  <input type="date" id="endDateForExpenseName" placeholder="End Date" class="form-control input-md ac_district"  type="text">
				          		  	</div>
								</div>
				          </div> -->
					  
				       <div class="row form-group">
				       		<label class="col-md-2 control-label" for="expenditureName">Village Name<sup>*</sup></label>  
           	 	      		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
										
							<!-- Following code is to get expense name from "expenditure_details" table of "fertilizer" DB -->
							<!-- getAllExpenseName() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
							FertilizerBillDao vfd = new FertilizerBillDao();
           						List vList =vfd.getAllVillageForBalanceReport();
							
							%>
							
							<input list="village_drop" id="villageName" class="form-control">
				<datalist id="village_drop">
							
							<%
					           for(int i=0;i<vList.size();i++){
					        	   FertilizerBillBean fbbean =(FertilizerBillBean)vList.get(i);
							%>
		
							<option data-value="<%=fbbean.getFkCreditCustomerId()%>" value="<%=fbbean.getVillage()%>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
					 <div class="col-md-offset-1">					  
					<input type="button"  id="btn" name="save" class="btn btn-lg btn-success btn-md button_hw button_margin_right"onclick="balanceReportPerVillageName()" value="Search"/>
					</div>							     									
				</div>
						
						<table class= "table table-bordered table-striped table-condensed cf"  id="balanceReportPerVillageName" class="display">
						<thead>
							<tr>
													<!-- <th>Bill No</th> -->
													<!-- <th>Service Provider</th> -->
													<th>Customer Name</th>
													<th>Total Amount</th>
													<th>Balance Amount</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th colspan="1" style="text-align: right">Total:</th>
								<th></th><th></th>
				
				
							</tr>
						</tfoot>
					</table>
				</fieldset>
				</form>
				</div>
				</div> --%>



			</div>
		</div>
	</div>
</div>
</div>
</div>

<%@include file="commons/newFooter.jsp"%>

<%-- <%@include file="commons/footer.jsp" %> --%>




