
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
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

<script src="/processSoft/staticContent/js/billCopy.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div align="center" style="margin-top: 120px">
			<h2 class="form-name style_heading">Bill Copy</h2>
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
		<li class="active" ><a data-toggle="tab" href="#BillCopy"><h4
					style="color: blue;">Bill Copy</h4></a></li>
	</ul>
</div>



<!-- BillCopy  Pilling  -->

 <div class="col-sm-offset-2">
<form class="form-horizontal" method="post" action=""
	name="saleReportForm">
	<fieldset>
		<div class="row form-group" style="margin-top: 20px">

			<label class="col-md-2 control-label" for="fk_cat_id">Vendor
				Name<sup>*</sup>
			</label>
			<div class="col-md-2">
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="	glyphicon glyphicon-hand-right"></i>
					</span>
					<%
						SupplierDetailsDao dao = new SupplierDetailsDao();
						List supppp = dao.getAllSupplier1(request);
					%>
					<input type="text" id="VendorName" list="cust_drop1" class="form-control" onchange="getVendorWiseBillNO()">
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

			<label class="col-md-2 control-label" for="BillNum">Bill Number<sup>*</sup>
			</label>

			<div class="col-md-2">
				<div class="input-group">
					<span class="input-group-addon"> <i
						class="	glyphicon glyphicon-hand-right"></i>
					</span> 
					<select class="form-control selectpicker" id="billnumber" name="BillNum">
					</select>
				</div>
			</div>
</div>
<br>
<br>
			<div class="row form-group">
				<div class="col-md-6">
					<div class="input-group">
						<div class="print-btn" align="center">
							<input type="button" id="btn" name="save"
								class="btn btn-lg btn-success btn-md button_hw button_margin_right"
								onclick="BillCopy()" value="Print" />
						</div>
					</div>
				</div>
			</div>
		
	</fieldset>
</form>
</div>
</body>