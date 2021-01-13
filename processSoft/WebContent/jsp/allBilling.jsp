<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Fertilizer.dao.FertilizerBillDao1"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page
	import="com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean"%>
<%@page
	import="com.Fertilizer.dao.ExpenseDetailForBillingAndGoodsReceiveDao"%>
<%
	boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
<%@page import="com.Fertilizer.dao.CustomerDetailsDao"%>
<%@page import="com.Fertilizer.dao.FertilizerBillDao"%>
<%@page import="com.Fertilizer.hibernate.CustomerDetailsBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Fertilizer.dao.ProductDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.ProductDetailsBean"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="com.Fertilizer.hibernate.CustomerBillBean1"%>
<%@page import="java.util.* "%>

<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
<link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/processSoft/staticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.css">
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>


<script type="text/javascript" src="/processSoft/staticContent/js/fertilizerBill.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/productDetail.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/supplierDetails.js"></script>	

<script type="text/javascript">
function refreshPage() {                         
    //Refresh page implementation here
    //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
	window.location.href="allBilling.jsp";
    window.close();
}
</script><script type="text/javascript">
function supplierlist(){
	document.getElementById('supplierListBtn').disabled = true;
	window.location = "supplierList.jsp";
}
	function editSupplier() {
		document.getElementById('supplierEditBtn').disabled = true;
		window.location = "editSupplierDetails.jsp";
} 
</script>
<script type="text/javascript">
function productDetailslist(){
	document.getElementById('productListBtn').disabled = true;
	window.location = "productList.jsp";
}
function editProductDetails() {
	document.getElementById('EditProductDtlBtn').disabled = true;
	window.location = "editProductDetails.jsp";
} 
</script>
<script type="text/javascript">
	function openStockReport() {
		window.location = '/processSoft/jsp/stockReport.jsp';
	}	
</script>
 <script type="text/javascript">
    function mypopup(url)
    {
        /* width = window.screen.width;
        height = window.screen.height; */
        width ='1050px';
        height = '600px';
        mywindow = window.open(url, "Title",
            "location=0,status=1,scrollbars=1,resizable=1,menubar=0,toolbar=no,width="
                        + width + ",height=" + height);
        mywindow.moveTo(140, 50);
        mywindow.focus();
    }
</script>
<script type="text/javascript">
<% 
	String pattern = "yyyy-MM-dd";
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
	String todayDate = simpleDateFormat.format(new Date());
	
	System.out.println(todayDate);
	%>

</script>
<script>
	/*  	Calculations for cash */

	function GrossTotalWithoutExpense() {
		/* var transExpence = document.getElementById("transExpence2").value; */
		var hamaliExpence = document.getElementById("hamaliExpence2").value;
		var totalWithExpense = document.getElementById("totalWithExpense").value;

		if (hamaliExpence == "0") {
			document.getElementById("grossTotal").value = totalWithExpense;
		}

	}
	function discountCalculation() {
		var total = document.getElementById("totalWithExpense").value;
		var discountAmount = document.getElementById("discountAmount").value;
		var discount = $('#discount').val();

		if (discount == "") {
			var totalminusDiscount = Number(total) - discountAmount;
			document.getElementById("grossTotal").value = totalminusDiscount;
		}
		if (discount != "") {
			var discountAmount = ((discount / 100) * Number(total));
			var totalminusDiscount = Number(total) - discountAmount;
			document.getElementById("discountAmount").value = discountAmount;
			document.getElementById("grossTotal").value = totalminusDiscount;
		}
	}

	function transExpenseAddingToGrossTotal() {

		var transExpence = document.getElementById("transExpence2").value;
		var hamaliExpence = document.getElementById("hamaliExpence2").value;

		if (transExpence != "0") {
			var total = document.getElementById("totalWithExpense").value;
			var perc = document.getElementById("gstForExpense").value;
			var teg = (transExpence * (perc / 100));
			document.getElementById("transExpence").value = teg;
			var totalWithExpense = Number(total) + Number(teg)
					+ Number(transExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}

		if (transExpence == "0") {
			var total = document.getElementById("totalWithExpense").value;
			var hamaliTotal = Number(total) + Number(hamaliExpence);
			var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
			document.getElementById("grossTotal").value = totalWithExpense;
		}

	}

	function hamaliExpenseAddingToGross() {

		var hamaliExpence = document.getElementById("hamaliExpence2").value;
		var hamali = document.getElementById("hamaliExpence").value;
		//Gross total calculation
		var discount = $('#discount').val();
		var discamnt = document.getElementById("discountAmount").value;

		/* if(discount == ""){ */

		if (hamaliExpence != "0") {
			var total = document.getElementById("grossTotal").value;
			var perc = document.getElementById("gstForExpense").value;
			var teg = (hamaliExpence * (perc / 100));
			document.getElementById("hamaliExpence").value = teg;
			var totalWithExpense = Number(total) + Number(teg)
					+ Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
		if (hamaliExpence == "") {
			var total = document.getElementById("totalWithExpense").value;
			var hamali = document.getElementById("hamaliExpence").value;
			var totalWithExpense = Number(total) - Number(discamnt);
			var totalWithExpense1 = Number(totalWithExpense) + Number(hamali);
			document.getElementById("grossTotal").value = totalWithExpense1;
		}
	}

	/* 	Calculations for Credit */
	function GrossTotalWithoutExpenseForCredit() {
		/* var transExpence1 = document.getElementById("transExpence3").value; */
		var hamaliExpence1 = document.getElementById("hamaliExpence3").value;
		var totalWithExpense1 = document.getElementById("totalWithExpense1").value;

		if (hamaliExpence1 == "0") {
			document.getElementById("grossTotal1").value = (totalWithExpense1).toFixed(2);
		}

	}

	function discountCalculationForCredit() {
		var total = document.getElementById("totalWithExpense1").value;
		var discountAmount = document.getElementById("discountAmount1").value;

		var discount = $('#discount1').val();
		
		if(discount >= 100)
		{
			alert("Please Enter Discount less than 100");
			document.getElementById("discount1").value = 0; 
			return false;
		}

		if (discount == "" )
		{
			

			
			
			
			document.getElementById("discountAmount1").value = 0; 
			 document.getElementById("hamaliExpence3").value = 0;
		
			var totalnew = document.getElementById("totalWithExpense1").value;
	 		var hamaliExpence = document.getElementById("hamaliExpence3").value;
			var hamali = document.getElementById("hamaliExpence1").value;
			document.getElementById("discountAmount1").value = 0; 
			document.getElementById("hamaliExpence3").value = 0;
			 
			if(hamaliExpence == "0" || hamaliExpence == "")
			{	
				document.getElementById("grossTotal1").value = totalnew;	
			}
			else
			{
				var Dis= hamaliExpence + hamali; 
				
				var totalminusDiscount = Number(total + Dis) - discountAmount;
				
				document.getElementById("grossTotal1").value = (totalminusDiscount).toFixed(2);			
			}			
			
		}
		if (discount != "") {
			 
			
			
			
			var hamaliExpence = document.getElementById("hamaliExpence3").value;
			var hamali = document.getElementById("hamaliExpence1").value;
			 
				 var Dis= hamaliExpence +  hamali;
				 
			var discountAmount = ((discount / 100) * Number(total));
			var totalminusDiscount = Number(total + Dis  ) - discountAmount;
			var FinalTotal = +totalminusDiscount + +hamaliExpence;
			document.getElementById("discountAmount1").value = (discountAmount).toFixed(2);;
			document.getElementById("grossTotal1").value = (FinalTotal).toFixed(2);
		}
	}

	function transExpenseAddingToGrossTotalForCredit() {

		var transExpence = document.getElementById("transExpence3").value;
		var hamaliExpence = document.getElementById("hamaliExpence3").value;

		if (transExpence != "0") {
			var total = document.getElementById("totalWithExpense1").value;
			var perc = document.getElementById("gstForExpense1").value;
			var teg = (transExpence * (perc / 100));
			document.getElementById("transExpence1").value = teg;
			var totalWithExpense = Number(total) + Number(teg)
					+ Number(transExpence);
			document.getElementById("grossTotal1").value = (totalWithExpense).toFixed(2);
		}

		if (transExpence == "0") {
			var total = document.getElementById("totalWithExpense1").value;
			var hamaliTotal = Number(total) + Number(hamaliExpence);
			var totalWithExpense = Number(transExpence) + Number(hamaliTotal);
			document.getElementById("grossTotal1").value = (totalWithExpense).toFixed(2);
		}

	}

	/* 	function hamaliExpenseAddingToGrossForCredit(){
			var hamaliExpence = document.getElementById("hamaliExpence3").value;
			/* var transExpence = document.getElementById("transExpence3").value; */

	/* if(hamaliExpence !="0"){
		var total = document.getElementById("totalWithExpense1").value;
		var perc = document.getElementById("gstForExpense1").value;
		var teg=(hamaliExpence*(perc/100));
		document.getElementById("hamaliExpence1").value = teg;
		var totalWithExpense = Number(total) + Number(teg) + Number(hamaliExpence);
		document.getElementById("grossTotal1").value = totalWithExpense;
	}
	if(hamaliExpence == "0"){
		var total = document.getElementById("totalWithExpense1").value;
		var totalWithExpense = Number(total) + Number(hamaliExpence);
		var totalWithExpense1 = Number(transExpence) + Number(totalWithExpense);
		document.getElementById("grossTotal1").value = totalWithExpense1;
	}
	
	} */

	function hamaliExpenseAddingToGrossForCredit() {
		var hamaliExpence = document.getElementById("hamaliExpence3").value;
		var hamali = document.getElementById("hamaliExpence1").value;
		//Gross total calculation
		var discount = $('#discount1').val();
		var discamnt = document.getElementById("discountAmount1").value;

		/* if(discount == ""){ */

		if (hamaliExpence != "0") {
			var total = document.getElementById("grossTotal1").value;
			var perc = document.getElementById("gstForExpense1").value;
			var teg = (hamaliExpence * (perc / 100));
			document.getElementById("hamaliExpence1").value = teg;
			var totalWithExpense = Number(total) + Number(teg)
					+ Number(hamaliExpence);
			//var FinalTotal = +totalminusDiscount + +hamaliExpence;
			document.getElementById("grossTotal1").value = (totalWithExpense).toFixed(2);
			//document.getElementById("grossTotal1").value = (FinalTotal).toFixed(2);
			
			
		}

	/* 	if (hamaliExpence == "0") {
			
			//var hamaliExpence = $('#hamaliExpence3').val();
			var total = document.getElementById("grossTotal1").value;
			var perc = document.getElementById("gstForExpense1").value;
			var teg = (hamaliExpence * (perc / 100));
			document.getElementById("hamaliExpence1").value = teg;
			var totalWithExpense1 = Number(total) + Number(teg)
					+ Number(hamaliExpence);
			//var FinalTotal = +totalminusDiscount + +hamaliExpence;
			document.getElementById("grossTotal1").value = (totalWithExpense1).toFixed(2);
			//document.getElementById("grossTotal1").value = (FinalTotal).toFixed(2);
			
			
		} */
		if (hamaliExpence == "" || hamaliExpence =="0" ) {
			var total = document.getElementById("totalWithExpense1").value;
			var hamali = document.getElementById("hamaliExpence1").value;
			var totalWithExpense = Number(total) - Number(discamnt);
			var totalWithExpense1 = Number(totalWithExpense) + Number(hamali);
			document.getElementById("grossTotal1").value = (totalWithExpense1).toFixed(2);
		}
	}
</script>

<script type="text/javascript">
	function suppDetailsDivAction(a)
	{	
		if(a==1)
	    {
	       	document.getElementById("myModal").style.display="block";
	    }
	    else
	    {
	       	document.getElementById("myModal").style.display="none";
	    }
		
		$('#supplierDivId').load(document.URL +  ' #supplierDivId');
	}
	</script>
	<script type="text/javascript">
	function prodDetailsDivAction(a)
	{	
		if(a==1)
	    {
	       	document.getElementById("myModal1").style.display="block";
	    }
	    else
	    {
	       	document.getElementById("myModal1").style.display="none";
	    }
		
		$('#productDivId').load(document.URL +  ' #productDivId');
	}
	</script>
</head>
<%--  <%
	Long customerBill = 101l;
%>
<%
	FertilizerBillDao1 dao1 = new FertilizerBillDao1();

	List bill = dao1.getCustomerBill();

	for (int i = 0; i < bill.size(); i++) {
		CustomerBillBean1 sa = (CustomerBillBean1) bill.get(i);
		customerBill = sa.getBillNo();
		System.out.println("hi this is bill no"+customerBill);

		customerBill++;
		System.out.println(customerBill);
	}
%>  --%>

<body onload="getProductName();getProductNameForCredit();">
	<div class="row header_margin_top">
		<div align="center">
			<h2 class="form-name style_heading">Billing</h2>
		</div>

		<%-- <div align="right" style="margin-right: 150px;">
			<h3 style="color: red;">
				Bill No ::
				<%
				out.println(customerBill);
			%>
			</h3>
		</div> --%>



	</div>

	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>


	<div class="container">


		<!--         For credit Customer   -->

		<div id="CreditCustDetail">
			<form class="form-horizontal" method="post" action="" name="creditFertiBill1">
				<fieldset>
					<div class="row form-group">
						<label class="col-md-2 control-label" for="creditCustomerName">
							Vendor Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span>


								<!-- Following code is to get customers from "customer_details" table of "fertilizer" DB -->
								<!-- getAllCustomer() is implemented in  CustomerDetailsDao with return type List-->

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
								<span class="input-group-addon">
									<button type="button" id="popup" onclick="suppDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
							</div>
						</div>
							<label class="col-md-3 control-label" for="village1">Bill No <sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <input  type="text" id="billNo" name="billNo" placeholder="Bill No" 
									class="form-control input-md "  >
							</div>
						</div>

						
					</div>
					<div class="row form-group">
						<label class="col-md-2 control-label" for="proName">Product
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<%
									ProductDetailsDao productdao = new ProductDetailsDao();
									List productList = productdao.getAllItemName(request);
								%>
								<input list="productName_drop" id="productName"
									class="form-control"
									onchange="getOutwardDetails(),getInwordChallanNo()"
									style="text-transform: uppercase">
								<datalist id="productName_drop">
									<%
										for (int i = 0; i < productList.size(); i++) {
											ProductDetailsBean productbean = (ProductDetailsBean) productList.get(i);
									%>

									<option data-value="<%=productbean.getProdctId()%>"
										value="<%=productbean.getProductName()%>">
										<%
											}
										%>
									
								</datalist>
								<span class="input-group-addon">
									<button type="button" id="popup1" onclick="prodDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
							</div>
						</div>
						<label class="col-md-3 control-label" for="creditCustomerName">
							Vendor Code<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> 
								<input type="text" id="custName" name="custName"
									class="form-control input-md" placeholder="VendorCode" >

							</div>
						</div>

						
					</div>

					<div class="row form-group">

						<label class="col-md-2 control-label" for="contactNo1">Contact
							No.</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-earphone"></i>
								</span> <input id="contactNo1" name="contactNo1"
									class="form-control input-md" type="text">
							</div>
						</div>
						<label class="col-md-3 control-label" for="village1">Address
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-map-marker"></i>
								</span> <input id="address" name="village1"
									class="form-control input-md ac_district" type="text">
							</div>
						</div>

						
					</div>


					<div class="row form-group">
						<div class="col-md-2 control-label">
							<label for="paymentMode2"> Outward Challan No</label>
						</div>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span> <select type="text" id="outwardchallanno"
									name="outwardchallanno" class="form-control"
									onchange="productDetailInGrid123()"></select>
							</div>
						</div>
						<label class="col-md-3 control-label" for="village1">GST
							No</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span> <input id="gstNo2" name="gstNo2" placeholder="GST No"
									class="form-control input-md ac_district" type="text">
							</div>
						</div>

				
						<!--  -->

					</div>
					<div class="row form-group">
						<label class="col-md-2 control-label" for="inworchallanNo">Inward
							Challan No
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-hand-right"></i>
								</span> <select type="text" id="inwordchallanNo" name="inwordchallanNo"
									class="form-control" onchange="productDetailInGrid1234()"></select>
								<!-- <input id="inwordchallanNo" name="inwordchallanNo" placeholder="Aadhar No." class="form-control input-md" type="text" > -->
							</div>
						</div>
								<label class="col-md-3 control-label" for="saleDate">Sale
							Date<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-calendar"></i>
								</span> <input type="date" id="saleDate2" name="saleDate"
									placeholder="sale Date" class="form-control input-md"" value="<%=todayDate %>">

							</div>
						</div>
                    <!-- DropDown According to Shop Name  -->

						<!-- <label class="col-md-3 control-label" for="proName">Shop
						Name<sup>*</sup>
					</label> -->
					<%-- <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<%
							shopDetailsDao Shopdao = new shopDetailsDao();
           						List ShopList =Shopdao.getAllShop();
							
							%>
							<input list="ShopName_drop" id="ShopName"
								class="form-control" 
								style="text-transform: uppercase">
							<datalist id="ShopName_drop">
								<%
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
					</div> --%>
						
						
					</div>


					<!-- this is grid div for outword challan no start -->

					<!-- 	<div style='position:absolute; top:440px; left:108px; '> -->

					<div class="table-responsive	row">
						<table id="credit"></table>
						<div id="jqGridPager1"></div>
						<!-- </div> -->
					</div>
					<!-- outword challan grid close -->

					<!-- this is grid div for outword challan no start -->

					<div class="table-responsive	row">
						<table id="credit"></table>
						<div id="jqGridPager1"></div>
						<!-- </div> -->
					</div>
					
					
					
					
					<!-- outword challan grid close -->


					<div class="row" align="center">
						<div class="table-responsive">
							<table id="jqGrid"></table>
							<div id="jqGridPager"></div>
						</div>
						<!-- dont delet following row -->
						<div class="row row form-group"></div>
					</div>
					<div class="row form-group">
       		   <label class="col-md-2 control-label" for="hsn"><%if(abc.equals("marathi"))%> <%if(abc.equals("english")){%>Vehicle  No<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i
									class="	glyphicon glyphicon-hand-right"></i>
						
						</span>
              			<input id="vehicle" name="vehicle" placeholder="Vehicle No" class="form-control input-md" type="text">
            		</div>
				</div>
		
				</div> 
				

					<div class="row form-group">
						<div class="col-md-2 control-label">
							<label for="paymentMode2"> Payment Mode</label>
						</div>

						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-usd"></i>
								</span> <select class="form-control" id="paymentMode2">
									<option value="cash2">Cash</option>
									<option value="cheque2">Cheque</option>
									<option value="card2">Card</option>
									<option value="neft2">NEFT</option>
								</select>
							</div>
						</div>

						<label class="col-md-3 control-label" for="contactNo1">Initial
							Payment</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									id="initialPayment" name="initialPayment"
									class="form-control input-md" readonly="readonly">
							</div>
						</div>

						<script>
							$(document)
									.ready(
											function() {
												$("#paymentMode2")
														.change(
																function() {
																	$(this)
																			.find(
																					"option:selected")
																			.each(
																					function() {
																						if ($(
																								this)
																								.attr(
																										"value") == "cheque2") {

																							$(
																									"#cheque_no2")
																									.show();

																							$(
																									"#neft_acc_no2")
																									.hide();
																							$(
																									"#card_no2")
																									.hide();
																						} else if ($(
																								this)
																								.attr(
																										"value") == "card2") {

																							$(
																									"#card_no2")
																									.show();

																							$(
																									"#neft_acc_no2")
																									.hide();
																							$(
																									"#cheque_no2")
																									.hide();
																						} else if ($(
																								this)
																								.attr(
																										"value") == "neft2") {

																							$(
																									"#neft_acc_no2")
																									.show();

																							$(
																									"#card_no2")
																									.hide();
																							$(
																									"#cheque_no2")
																									.hide();
																						} else if ($(
																								this)
																								.attr(
																										"value") == "cash2") {

																							$(
																									"#neft_acc_no2")
																									.hide();
																							$(
																									"#cheque_no2")
																									.hide();
																							$(
																									"#card_no2")
																									.hide();
																						}

																						else if ($(
																								this)
																								.attr(
																										"value") == "selected2") {

																							$(
																									"#neft_acc_no2")
																									.hide();
																							$(
																									"#cheque_no2")
																									.hide();
																							$(
																									"#card_no2")
																									.hide();
																						}

																					});
																}).change();
											});
						</script>


					</div>

					<div class="row form-group">

						<div id="cheque_no2">
							<!-- <div class="col-md-1">										
										<label class="control-label">Cheque No.:</label>
									</div> -->

							<div class="col-md-3 col-md-offset-3 first">
								<input class="form-control" type="text" name="chequeNum"
									id="chequeNum2" placeholder="Cheque No." />
							</div>

							<!-- <div class="col-md-1">
										<label class="control-label">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
							<!-- <div class="col-md-1">
										<label class="control-label">Name:</label>
									</div> -->
							<div class="col-md-3 col-md-offset-3 first">
								<input class="form-control" type="text" name="nameOnCheck"
									id="nameOnCheck2" placeholder="Name On cheque" />
							</div>
						</div>

						<div id="card_no2" class="form-group">
							<!-- <div class="col-md-2">
													<label class="control-label">Card No:</label>
												</div> -->
							<div class="col-md-3 col-md-offset-3 first">
								<input class="form-control" type="text" name="cardNum"
									id="cardNum2" placeholder="Card No." />
							</div>

						</div>

						<div id="neft_acc_no2" class="form-group">
							<!-- <div class="col-md-2 ">
													<label class="control-label">Account No:</label>
												</div> -->
							<div class="col-md-3 col-md-offset-3 first">
								<input class="form-control" type="text" name="accNum"
									id="accNum2" placeholder="Account No." />
							</div>
							<!-- <div class="col-md-1 ">
													<label class="control-label">Bank Name</label>
												</div> -->
							<div class="col-md-3 col-md-offset-3 first">
								<input class="form-control" type="text" name="bankName"
									id="bankName2" placeholder="Name Of Bank" />
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2  control-label" for="gstForExpence"><b>GST
								For Expense :</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> % </span> <select
									class="form-control" id="gstForExpense1">
									<option value="0">-Select Type--</option>
									<option value="5">5 %</option>
									<option value="12">12 %</option>
									<option value="18">18 %</option>
									<option value="28">28 %</option>
								</select>
							</div>
						</div>
						<!-- 
         	     	Customer first name is hidden	 -->

						<label class="col-md-3 control-label" style="display: none"
							for="customerNameHidden">Customer Name</label>
						<div class="col-md-3" style="display: none">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input id="customerNameHidden" name="customerNameHidden"
									class="form-control input-md" type="text">
							</div>
						</div>

						<label class="col-md-3  control-label" for="total"><b>Total</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									id="totalWithExpense1" class="form-control input-md"
									type="text" readonly="readonly"
									ondragover="GrossTotalWithoutExpenseForCredit()">
							</div>
						</div>
					</div>


					<div class="row form-group">
						<label class="col-md-1 col-md-offset-7 control-label"
							for="discount"><b>Discount</b></label>
						<div class="col-sm-1">
							<div class="input-group">
								<span class="input-group-addon"> % </span> <input id="discount1"
									name="discount" placeholder="Discount" style="width: 80;"
									class="form-control input-md" type="text"
									onchange="discountCalculationForCredit()">
							</div>
						</div>

						<label class="col-md-1 control-label" for="discount"><b></b></label>
						<div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon"> Rs </span> <input
									id="discountAmount1" name="discountAmount"
									placeholder="Discount Amt" class="form-control input-md"
									 readonly="readonly"  onchange="discountCalculationForCredit()">
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-1 col-md-offset-7 control-label"
							for="hamaliExpence"><b>Other Expenses </b></label>
						<div class="col-sm-1">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									id="hamaliExpence3" name="hamaliExpence" value="0"
									placeholder="Hamali Expenses" style="width: 80;"
									class="form-control input-md" type="text"
									onchange="hamaliExpenseAddingToGrossForCredit()">
							</div>
						</div>
						<label class="col-md-1  control-label" for="hamaliExpence"><b></b></label>
						<div class="col-sm-1">
							<div class="input-group" style="margin-left: -70;">
								<span class="input-group-addon"> Rs </span> <input
									id="hamaliExpence1" name="hamaliExpence" placeholder="With GST"
									class="form-control input-md"  readonly="readonly">
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-offset-5 col-md-3 control-label"
							for="grossTotal1"><h4>
								<b>Gross Total</b>
							</h4></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="grossTotal1" name="grossTotal1"
									placeholder="Gross Total" class="form-control input-md"
									type="text" style="font-size: 25px; height: 55px;">
							</div>
						</div>
					</div>

					<div class="row form-group buttons_margin_top ">
					<div align="center">
						<input type="button" id="printBillBtn" style="font-size: 25"
							class="btn btn-large btn-success button-height-width" name="printBillBtn" onclick="fertilizerBillForCreditCustomer()" value="Print Bill">
						<input type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save"
								name="btn" value="Cancel" onclick="window.location.reload()">
						<input type="button" id="btn" style="font-size: 25"
								class="btn btn-large btn-success button-height-width" name="btn" onclick="openStockReport()" value="Stock Report">
							<!-- <button id="btn" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="creditCustFertilizerBill()"><h4> Submit</h4></button>
              		<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button>
								   -->
					</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	
	<!-- -------------- popup window for Supplier  ------------------------------ -->
	<!-- The Modal -->
<div id="myModal" class="modal">
  <!--  <div class="modal-dialog modal-xl">  -->
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    
    <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("supplierdetails") %> <%}%> <%if(abc.equals("english")){%>Vendor Details<%}%></h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
      <div class="container col-sm-offset-1" >
        <form class="form-horizontal" method="post" action="" name="spld" ><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
       			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				
			<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>Vendor Code<%}%> </label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon">
									<i class="	glyphicon glyphicon-hand-right"></i>
							
						</span>
             				 <input id="IdNo" name="IdNo " placeholder="Identity Number" class="form-control input-md" type="text">
            		</div>
				</div> 
				
			</div>
        	<div class="row form-group">
            	<label class="col-md-2 control-label" for="dealerName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("dealerName") %> <%}%> <%if(abc.equals("english")){%>Vendor Name<%}%><sup>*</sup></label>  
            		<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao_1 = new SupplierDetailsDao();
           						List productList_1 =productdao_1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="dealerName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" >
				<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList_1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList_1.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>

            <label class="col-md-2 control-label" for="personName"> Person Name</label>  
            	<div class="col-md-3">
           		 	<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao persondao1 = new SupplierDetailsDao();
           						List personList1 =persondao1.getAllSupplier();
							
							%>
							<input list="personName_drop" id="personName"  class="form-control">
				<datalist id="personName_drop">
							<%
					           for(int i=0;i<personList1.size();i++){
					        	   SupplierDetailsBean personBean =(SupplierDetailsBean)personList1.get(i);
							%>
		
							<option data-value="<%=personBean.getSupId()%>" value="<%=personBean.getPersonName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>
          </div>
         
          <div class="row form-group">
          
              
            	<label class="col-md-2 control-label" for="contactNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("contactNumber") %> <%}%> <%if(abc.equals("english")){%>Contact Number<%}%><sup>*</sup></label>
            		<div class="col-md-3">
    					<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i>
							</span>
             				 <input id="contactNo" maxlength="10" name="contactNo" placeholder="Contact Number" class="form-control input-md " onkeypress="phoneno()" type="text">
           				</div>
					</div>
            
               <label class="col-md-2 control-label" for="landline"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("landlineNumber") %> <%}%> <%if(abc.equals("english")){%>LandLine Number<%}%></label>
            		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="landline" name="landline" placeholder="LandLine No" class="form-control input-md " onkeypress="lanlineNo()" type="text" >
            			</div> 
            		</div>
          	</div>

        
          <div class="row form-group">
            <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>E-mail Id<%}%></label>
            	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i>
						</span>
              			<input id="emailId" name="emailId" placeholder="Email ID" class="form-control input-md " type="text">
            		</div>
            	</div>

           <label class="col-md-2 control-label" for="city"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("city") %> <%}%> <%if(abc.equals("english")){%>City<%}%><sup>*</sup></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="city" name="city" placeholder="city" class="form-control input-md" onkeypress="characters()" type="text">
            		</div>
				</div>
          </div>

			<div class="row form-group">
            	<label class="col-md-2 control-label" for="tinNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %> <%}%> <%if(abc.equals("english")){%>GST No<%}%><sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="tinNo" name="tinNo" placeholder="GST No" class="form-control input-md " onblur="btnShow()" type="text">
           				</div>
           			 </div>
           			 <label class="col-md-2 control-label" for="address"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("address") %> <%}%> <%if(abc.equals("english")){%>Address<%}%></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="address" name="address" placeholder="Address" class="form-control input-md " type="text">
            		</div>
				</div>
          	</div>
          	
          	

          <div class="form-group row">
            <div class="col-md-11 text-center">
       <!--  supplierDetail() function is implemented in  supplierDetails.js -->
       <input style="  font-size: 25" type="button" value="Submit" id="saveSupplierDetailsBtn" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="supplierDetail()" /> 
        <input style=" font-size: 25" type="button" value="Cancel" id="save" name="btn" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" onclick="refreshPage()" /> 
       
              	<%-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="supplierDetail()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%> </h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("cancel") %> <%}%> <%if(abc.equals("english")){%>Cancel<%}%> </h4> </button> --%>
            	<input style=" font-size: 25" type="button" value="Vendor List" id="supplierListBtn" class="btn btn-primary  btn-large  button-height-width " onclick="supplierlist()" /> 
              	<input style=" font-size: 25" type="button" value="Edit" id="supplierEditBtn" class="btn btn-primary  btn-large  button-height-width" onclick="editSupplier()" /> 
            </div>
          </div>
         </fieldset>
       </form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>



 
 <!-- --------------End Popup for Add Supplier------------------ -->
 
 
 	<!-- -------------- popup window for Supplier  ------------------------------ -->
	<!-- The Modal -->
<div id="myModal1" class="modal">
  <!--  <div class="modal-dialog modal-xl">  -->
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close1">&times;</span>
    
    <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("supplierdetails") %> <%}%> <%if(abc.equals("english")){%>Product Details<%}%></h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
      <div class="container col-sm-offset-1" >
        <form class="form-horizontal" method="post" action="" name="prd"><!-- Value of 'name' attribute is used in  productDetail.js  -->
          <fieldset>
			 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>Product No<%}%></label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
							
						</span>
             				 <input id="pidno" name="pidno"  placeholder="Identity Number" class="form-control input-md" type="text" >
            		</div>
				</div> 
				
			</div>
			<%--  <div class="row form-group">
           		<label class="col-md-2 control-label" for="fk_cat_id"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Category<%}%><sup>*</sup></label>  
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
							<input list="cat_drop" id="fk_cat_id"  class="form-control" onchange="getAllSubCat()">
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
            		<label class="col-md-2 control-label" for="subCat"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Subcategory<%}%><sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
							
					<select class="form-control input-md" id='subCat'  name="subCat" onchange="getAllShopName()">
					</select>
               		</div>
              	</div>
              	</div> --%>
          <div class="row form-group">
            <label class="col-md-2 control-label" for="productName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productName") %> <%}%> <%if(abc.equals("english")){%>Product Name<%}%> <sup>*</sup></label>  
            	<div class="col-md-3">
            		<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao product_dao = new ProductDetailsDao();
           						List product_List =product_dao.getAllProductDetails();
							
							%>
							<input list="productName_drop_1" id="productName_1"  class="form-control"  onchange="checkForDuplicateProductEntry()" style="text-transform: uppercase">
				<datalist id="productName_drop_1">
							<%
					           for(int i=0;i<product_List.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)product_List.get(i);
							%>
		
							<option data-value="<%=productbean.getProdctId()%>" value="<%=productbean.getProductName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>
			 
           	<label class="col-md-2 control-label" for="manufacturingCompany"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("company") %> <%}%> <%if(abc.equals("english")){%>Manufacturing Company<%}%></label>  
           	 <div class="col-md-3">
            	<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao productdao_2 = new ProductDetailsDao();
           						List productList_2 =productdao_2.getAllProductDetails();
							
							%>
							<input list="manufacturingCompany_drop" id="manufacturingCompany" style="text-transform: uppercase" class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="manufacturingCompany_drop">
							<%
					           for(int i=0;i<productList_2.size();i++){
					        	   ProductDetailsBean productbean1 =(ProductDetailsBean)productList_2.get(i);
							%>
		
							<option data-value="<%=productbean1.getProdctId()%>" value="<%=productbean1.getManufacturingCompany()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            </div>
		</div>
	
		<%-- <div class="row form-group">
            <label class="col-md-2 control-label" for="weight"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("weight") %> <%}%> <%if(abc.equals("english")){%>Packing<%}%><sup>*</sup></label>  
            	<div class="col-md-3">
            		<div class="input-group">
							<span class="input-group-addon">
								No
							</span>
              				
							<%
							ProductDetailsDao productdao2 = new ProductDetailsDao();
           						List productList2 =productdao2.getAllProductDetails();
							
							%>
							<input list="weight_drop" id="weight"  class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="weight_drop">
							<%
					           for(int i=0;i<productList2.size();i++){
					        	   ProductDetailsBean productbean2 =(ProductDetailsBean)productList2.get(i);
							%>
		
							<option data-value="<%=productbean2.getProdctId()%>" value="<%=productbean2.getWeight()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>

				<label class="col-md-2 control-label" for="Unit"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("unit") %> <%}%> <%if(abc.equals("english")){%>Unit<%}%><sup>*</sup></label>  
            				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get all measuring units from "sold_units" table of "fertilizer" DB -->
							<!-- getAllUnits() is implemented in  MeasuringUnitsDao with return type List-->
						
							<%
							MeasuringUnitsDao mdao = new MeasuringUnitsDao();
           						List uList = mdao.getAllUnits();
							%>
							
							<input list="unit_drop" id="fk_unit_id"  class="form-control">
				<datalist id="unit_drop">
							
							<%
					           for(int i=0;i<uList.size();i++){
					        	   MeasuringUnitsBean bean =(MeasuringUnitsBean)uList.get(i);
							%>
		
							<option data-value="<%=bean.getPkUnitId()%>" value="<%=bean.getUnitName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
				</div> --%>
				
		
			
			<!-- Following code is used to show tax percentage in % field with the help of  "myid" and "taxPercentage"-->
			<script type="text/javascript">
				function ChooseContact(data)
					{
						
						document.getElementById("taxPercentage").value=(data.options[data.selectedIndex].getAttribute("myid"));
					}
			</script> 
			
		
			
		<div class="row form-group">
         	<label class="col-md-2 control-label" for="fk_tax_id">GST Type<sup>*</sup></label>
         		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="	glyphicon glyphicon-hand-right"></i>
						</span>
						
						<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllMainTax() is implemented in  TaxCreationDao with return type List-->
					
					
						<%
							TaxCreationDao tcd = new TaxCreationDao();
							List tList = tcd.getAllMainTax();
		            	%>
              			<select class="form-control input-md" autofocus name="fk_tax_id" id="fk_tax_id" onChange="ChooseContact(this)" >
			              	<option value="selected">--Select Tax--</option>
							<%
					           for(int i=0;i<tList.size();i++){
					        	   TaxCreationBean tax=(TaxCreationBean)tList.get(i);
							%>
		
						<option value="<%=tax.getTxId()%>" myid="<%=tax.getTaxPercentage()%>"><%=tax.getTaxType() %> </option>
							<%
				      			}
				    		%>
			              	
            			</select> 
            		</div>
            	</div>   
         		
         	 <div class="col-md-offset-2 col-md-3" >
				<div class="input-group">
						<span class="input-group-addon" style="
    padding-left: 18px;
    padding-right: 20px;
">
							%
						</span>
           		 	<input id="taxPercentage" name="taxPercentage" placeholder="Tax Percentage" class="form-control input-md" type="text" >
           		</div>
			</div>
		</div> 
	
		<%-- <div class="row form-group">
			<label class="col-md-2 control-label" for="buyPrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("buyPrice") %> <%}%> <%if(abc.equals("english")){%>Buy Price<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						Rs
						</span>
              			<input id="buyPrice" name="buyPrice" placeholder="Buy Price" class="form-control input-md" type="text" >
            		</div>
				</div>
            	
            	<label class="col-md-2 control-label" for="mrp"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("") %> <%}%> <%if(abc.equals("english")){%>M.R.P<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						Rs
						</span>
              			<input id="mrp" name="mrp" placeholder="MRP" class="form-control input-md" type="text" >
            		</div>
				</div>
            	
		</div> --%>
		<div class="row form-group">
          <label class="col-md-2 control-label" for="hsn"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>HSN code<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						
						</span>
              			<input id="hsn" name="hsn" placeholder="HSN Number" class="form-control input-md" type="text">
            		</div>
				</div>
		 <label class="col-md-2 control-label" for="salePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>Rate<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						
						</span>
              			<input id="Rate" name="salePrice" placeholder="Rate" class="form-control input-md" type="text" onkeyup="salePriceCompaireWithMRP()">
            		</div>
				</div> 
				</div> 
				<%-- <label class="col-md-2 control-label" for="Unit"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("Unit") %> <%}%> <%if(abc.equals("english")){%>Unit<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
					
						</span>
									<%
							MeasuringUnitsDao dao1 = new MeasuringUnitsDao();
           						List taxPerList =dao1.getAllUnits();
							
							%>
							<input list="unitName_drop" id="unitName"  class="form-control">
				<datalist id="unitName_drop">
							<%
					           for(int i=0;i<taxPerList.size();i++){
					        	   MeasuringUnitsBean bean =(MeasuringUnitsBean)taxPerList.get(i);
							%>
		
							<option data-value="<%=bean.getPkUnitId()%>" value="<%=bean.getUnitName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
              			
            		</div>
				</div> --%>
				
				
			 	
				<%-- <%
				shopDetailsDao shopDao = new shopDetailsDao();
           					List shopDaoList = shopDao.getAllShop();
							
					%>
			<label class="col-md-2 control-label" for="creditSalePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("shopName") %> <%}%> <%if(abc.equals("english")){%>Shop Name<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						</span>
              			<select class="form-control input-md" autofocus name="shopName" id="shopName" >
			              	<option value="selected">--Select Shop--</option>
							<%
					           for(int i=0;i<shopDaoList.size();i++){
					        	   shopDetailsBean sp=(shopDetailsBean)shopDaoList.get(i);
							%>
		
						<option value="<%=sp.getShopId()%>"><%=sp.getShopName() %> </option>
							<%
				      			}
				    		%>
			              	
            			</select> 
            		</div>
				</div> 
			</div>--%>
		<!-- <div class="row form-group">
		
		</div> -->
		
		<div class="form-group row">
            <div class="col-md-11 text-center">
             	<input style="  font-size: 25" type="button" id="submitProductDtlBtn" name="btn" value="Submit" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="productDetails()" /> 
             	<input style="  font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="refreshPage()" /> 
            	<input style="  font-size: 25" type="button" value="Product List" id="productListBtn" class="btn btn-primary btn-large button-height-width" onclick="productDetailslist()" /> 
              	<input style="  font-size: 25" type="button" value="Edit" id="EditProductDtlBtn" class="btn btn-primary btn-large button-height-width " onclick="editProductDetails()" /> 
            </div>
          </div>
		</fieldset>
       </form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>

<!-- -------------------------------------- -->

<script>
function test()
{
	alert("ok");	
}

</script>
	
	<script>

//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("popup");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


//Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("popup1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}



</script>
</body>

<%@include file="commons/newFooter.jsp"%>

