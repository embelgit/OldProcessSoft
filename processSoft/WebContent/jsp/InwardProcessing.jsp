<%@page import="com.Fertilizer.helper.ProductDetailsHelper"%>
<%@page import="com.Fertilizer.hibernate.InwardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.bean.BillBean"%>
<%@page import="com.Fertilizer.dao.InwardProcess1Dao"%>
<%@page import="com.Fertilizer.hibernate.OperationDetailsBean"%>
<%@page
	import="com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean"%>
<%@page
	import="com.Fertilizer.dao.ExpenseDetailForBillingAndGoodsReceiveDao"%>
<%@page import="com.Fertilizer.hibernate.GodownEntry"%>
<%@page import="com.Fertilizer.dao.GodownEntryDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<% boolean isHome=false;%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="java.util.List"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="com.Fertilizer.dao.PoDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.PoDetailsBean"%>
<%@include file="commons/header.jsp"%>
<%@page import="java.util.* "%>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>


<link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css"> -->

<link rel="stylesheet" href="/processSoft/staticContent/y_css/jquery-ui.css">
<!--  -->
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.css">
<!--  -->
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/goodsreceiveFetchProduct.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/goodsReceive.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/containerPurschase.js"></script>
	
<script type="text/javascript" src="/processSoft/staticContent/js/poDetails.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/productDetail.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/supplierDetails.js"></script>


<script type="text/javascript">
function refreshIP() {   
    //Refresh page implementation here
    //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
	window.location.href="InwardProcessing.jsp";
    window.close();
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

<!-- <script type="text/javascript">
function myOnLoadFunction()
{
	$("#CreditCustDetail").hide();
	
}

function ShowAdvanceBookingDetails(){
	$("#CreditCustDetail").show();
	$("#ShowCashCustDetail").hide();
	}

function ShowWithoutBookingDeatils() {
	$("#ShowCashCustDetail").show();
	$("#CreditCustDetail").hide();
	location.reload(true)
	}
</script> -->
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
          		 function supplierlist()
          		 {
          			document.getElementById('supplierListBtn').disabled = true;
          		 	window.location = "supplierList.jsp";
          		 }
          		function editSupplier() {
          			document.getElementById('supplierEditBtn').disabled = true;
          			window.location = "editSupplierDetails.jsp";
				}
          		 
          		function checkForDuplicateSupplierIdEntry(){
          			<%
          			SupplierDetailsDao dao_4 = new SupplierDetailsDao();
          			List list1 = dao_4.getAllSupplier();
          			%>
          			
          			<%
          			int z1 = 0;
          			for(z1=0;z1<list1.size();z1++){
          		    SupplierDetailsBean bean = (SupplierDetailsBean)list1.get(z1);
          			
          			%>
          			var supName = "<%=bean.getDealerName()%>";          	
          			if(document.getElementById("dealerName").value ==supName ){
          				alert("Vendor Name already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			} 
          		</script>
<script>

function GrossTotalWithoutExpense(){
	var transExpence = document.getElementById("transExpence3").value;
	var hamaliExpence = document.getElementById("hamaliExpence3").value;
	var totalWithExpense = document.getElementById("total").value;

	if(hamaliExpence == "0" && transExpence == "0"){
		document.getElementById("grossTotal").value = totalWithExpense;
		}

	}	  
	
function transExpenseAddingToGrossTotal(){
	var transExpence = document.getElementById("transExpence3").value;
	var hamaliExpence = document.getElementById("hamaliExpence3").value;
	var trans = document.getElementById("transExpence").value;
	var discamnt = document.getElementById("discountAmount").value;
	var discount = $('#discount').val();
	
	/* if(discount == ""){ */
		if(transExpence != "0"){
		var total = document.getElementById("grossTotal").value;
		var perc = document.getElementById("gstForExpense2").value;
		var teg=(transExpence*(perc/100));
		document.getElementById("transExpence").value = parseFloat(teg).toFixed(2);
		var totalWithExpense = Number(total) + Number(teg)+Number(transExpence);
		document.getElementById("grossTotal").value = totalWithExpense;
		}	
		
		if(transExpence == ""){
			var total = document.getElementById("total").value;
			var hamali = document.getElementById("hamaliExpence").value;
			var trans = document.getElementById("transExpence").value;
			var hamaliTotal = Number(total) - Number(discamnt);
			var totalWithExpense =Number(hamaliTotal) + Number(hamali) + Number(hamaliExpence) ;
			document.getElementById("grossTotal").value = totalWithExpense;
		}	
	}
	
	
	/* if(discount != ""){
		if(hamaliExpence != "0"){
			var total = document.getElementById("total").value;
			var perc = document.getElementById("gstForExpense").value;
			var teg=(hamaliExp*(perc/100));
			document.getElementById("hamaliExpence").value = teg;
			var totalWithExpense = Number(total) + Number(teg);
			document.getElementById("grossTotal").value = totalWithExpense;
		}	
		if(hamaliExpence == "0"){
			var total = document.getElementById("total").value;
			var totalWithExpense = Number(total) + Number(hamaliExp);
			var totalWithExpense1 = Number(transExpence) + Number(totalWithExpense);
			document.getElementById("grossTotal").value = totalWithExpense1;
		}
	
	} */
	



function discountCalculation(){
	var total = document.getElementById("total").value;
	var discountAmount = document.getElementById("discountAmount").value;
	var discount = $('#discount').val();
	
	if(discount == ""){
		var totalminusDiscount = Number(total) - discountAmount;
		document.getElementById("grossTotal").value = totalminusDiscount;
		}
	if(discount != ""){		
	var discountAmount = ((discount/100)*Number(total));
	var totalminusDiscount = Number(total) - discountAmount;
	document.getElementById("discountAmount").value = discountAmount;
	document.getElementById("grossTotal").value = totalminusDiscount;
	}
}

function hamaliExpenseAddingToGross(){
	
	var hamaliExpence = document.getElementById("hamaliExpence3").value;
	var hamali = document.getElementById("hamaliExpence").value;
	//Gross total calculation
	var discount = $('#discount').val();
	var discamnt = document.getElementById("discountAmount").value;
	var transExpence = document.getElementById("transExpence3").value;
	
	/* if(discount == ""){ */
		
		if(hamaliExpence != "0"){
			var total = document.getElementById("grossTotal").value;
			var perc = document.getElementById("gstForExpense2").value;
			var teg=(hamaliExpence*(perc/100));
			document.getElementById("hamaliExpence").value = parseFloat(teg).toFixed(2);
			var totalWithExpense = Number(total) + Number(teg)+Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}	
		if(hamaliExpence == ""){
			var total = document.getElementById("total").value;
			var trans = document.getElementById("transExpence").value;
			var hamali = document.getElementById("hamaliExpence").value;
			var totalWithExpense = Number(total) - Number(discamnt);
			var totalWithExpense1 = Number(totalWithExpense)+Number(trans) + Number(transExpence);
			document.getElementById("grossTotal").value = totalWithExpense1;
		}
	}
	
	/* if(discount != ""){
		var transExpence = document.getElementById("transExpence").value;
		if(transExpence == ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - Number(discountAmount);
			var totalWithExpense = Number(totalminusDiscount) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		}
		if(transExpence != ""){
			var total = document.getElementById("total").value;
			var discountAmount = ((discount/100)*Number(total));
			var totalminusDiscount = Number(total) - discountAmount;
			var totalwithTrans = Number(totalminusDiscount) + Number(transExpence);
			var totalWithExpense = Number(totalwithTrans) + Number(hamaliExpence);
			document.getElementById("grossTotal").value = totalWithExpense;
		} */
	
	


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
    function inwardprocessing(){
    	$("#oilPurchase").show();
    	$("#PoDetails").hide();
    }
    
    function podetails(){
    	$("#PoDetails").show();
    	$("#oilPurchase").hide();
    }
    	
    
    
</script>
 <script type="text/javascript">
          	function checkForDuplicateProductEntry(){
          					<%
          					PoDetailsDao dao1 = new PoDetailsDao();
                  			List list = dao1.getAllPODetails();
          					%>
          					
          					<%
          					int z = 0;
                  			for(z=0;z<list.size();z++){
                  				PoDetailsBean bean = (PoDetailsBean)list.get(z);
          					%>
          					var idNo = "<%=bean.getPk_poDetails_id()%>";
          					var pro = "<%=bean.getIdno()%>";
          					
          					
          					
          					proId = $('#IdNo').val();
          				
          				$("#IdNo").each(function() {
          					   selectedVal = $(this).text();
          					});
          				
          				/*  var splitText = selectedVal.split(",");  
          				
          				var supId = splitText[0];*/
          					
          					if(document.getElementById("IdNo").value ==pro && idNo != pro){
          						alert("ID No already exist...Duplicate Not allowed");
          						location.reload();
          						return false;
          					}
          					<%
          					}
          					%>
          					}
          	
          	
          			 
          		</script>
 <script type="text/javascript">
 function checkForDuplicateProductEntryOut(){
          					<%
          					GoodsReceiveDao dao4 = new GoodsReceiveDao();
                  			List list4 = dao4.getAllOutwardsChallan();
          					%>
          					
          					<%
          					int b = 0;
                  			for(b=0;b<list4.size();b++){
                  				InwardBean bean = (InwardBean)list4.get(b);
          					%>
          					var idNo1 = "<%=bean.getPk_inward_id()%>";
          					var pro1 = "<%=bean.getChallanno()%>";
          					
          					
          					
          					
          					proId1 = $('#challanno').val();
          				
          				$("#challanno").each(function() {
          					   selectedVal = $(this).text();
          					});
          				
          				/*  var splitText = selectedVal.split(",");  
          				
          				var supId = splitText[0];*/
          					
          					if(document.getElementById("challanno").value ==pro1 && idNo1 != pro1){
          						alert("Challan Number already exist...Duplicate Not allowed");
          						location.reload();
          						return false;
          					}
          					<%
          					}
          					%>
          					}
          			 
          		</script>
          		
         <script type="text/javascript">
 function checkForDuplicateProductEntryOutWithOutPo(){
          					<%
          					GoodsReceiveDao dao5 = new GoodsReceiveDao();
                  			List list5 = dao4.getAllOutwards();
          					%>
          					
          					<%
          					int c = 0;
                  			for(c=0;c<list5.size();c++){
                  				InwardBean bean = (InwardBean)list5.get(c);
          					%>
          					var idNo1 = "<%=bean.getPk_inward_id()%>";
          					var pro1 = "<%=bean.getChallanno()%>";
          					
          					
          					
          					
          					proId1 = $('#challanno1').val();
          				
          				$("#challanno1").each(function() {
          					   selectedVal = $(this).text();
          					});
          				
          				/*  var splitText = selectedVal.split(",");  
          				
          				var supId = splitText[0];*/
          					
          					if(document.getElementById("challanno1").value ==pro1 && idNo1 != pro1){
          						alert("Challan Number already exist...Duplicate Not allowed");
          						location.reload();
          						return false;
          					}
          					<%
          					}
          					%>
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

<%
        Long BillNo = 1l;
	 %>
<%
	 GoodsReceiveDao data = new GoodsReceiveDao();
		List stkList  = data.getLastBillNo();
		
		for(int i=0;i<stkList.size();i++){
			
			BillBean st = (BillBean)stkList.get(i);
			BillNo = st.getBillNo();
			
			BillNo++;
			
		}      
	        
         %>

</head>
<body onload="inwardprocessing(),getContainerName();">

	<div class="d-none d-print-block" style=" padding-top: 65px;">
		<div class="bill-heading" align="center">
			<h2 class="form-name style_heading" >Inward Processing</h2>

			<%-- <h3 align="right" style="color: red; margin-right: 50px;">
				Bill No ::
				<%out.println(BillNo); %>
				
			</h3> --%>
			<div class="col-md-4 col-md-offset-4" style="padding-top: 15px;">
         		<div class="col-xs-6 col-md-ffset-1">
					<label class="radio-inline"  style="font-size: 15px;font-weight: 700;">
						<input type="radio" name="customertype" checked="checked"  onclick="inwardprocessing()" >With Po
					</label>
				</div>
         		<div class="col-xs-6  ">
         			<label class="radio-inline" style="font-size: 15px;font-weight: 700;">
						<input  type="radio" name="customertype"    onclick="podetails()" > Without Po
					</label>
				</div>
			</div> 
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	
		 <div class="tab-content">
		<div id="oilPurchase" class="tab-pane active ">
		<div class="col-sm-offset-1">
			<form class="form-horizontal" method="post" action=""
				name="goodsReceiveForm">
				
				
				<!-- Value of 'name' attribute is used in  supplierDetails.js  -->
				<fieldset>
					<div class="row form-group">
						<div class="col-md-6">
							<%@include file="commons/clock.jsp"%>
						</div>
					</div>
			


					<div class="row form-group">
						<label class="col-md-2 control-label" for="supplier">Vendor
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
							
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<!-- <input type="text" id="supplierName" name="supplierName" class="form-control" > -->
								<div  id="supplierDivId">
								<%
								SupplierDetailsDao sdd = new SupplierDetailsDao();
           						List sList =sdd.getAllSupplier1(request);
							
							%>

								<input list="sup_drop" id="supplier" autofocus="supplier" class="form-control">
								<!-- onchange="getSupName()" -->
								<datalist id="sup_drop">

									<%
					           for(int i=0;i<sList.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>

									<option data-value="<%=sup.getSupId()%>"
										value="<%=sup.getDealerName() %>">
										<%
				      			}
				    		%>
									
								</datalist>
								</div>
								<span class="input-group-addon">
									<button type="button" id="popup" onclick="suppDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
							
								
							</div>
						</div>

						<label class="col-md-2 control-label" for="billNum"><b>Challan
								Number<sup>*</sup>
						</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> No </span> <input
									id="challanno" name="billNum" placeholder="Enter Challan Number" onchange="checkForDuplicateProductEntryOut()"
									class="form-control input-md" type="text">
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
								<div  id="productDivId">
								<%
								ProductDetailsDao productdao = new ProductDetailsDao();
           						List productList =productdao.getAllItemName(request);
							
							%>
								<input list="productName_drop" id="productName" 
									class="form-control" onchange="getPoByProduct()"
									style="text-transform: uppercase">
								<datalist id="productName_drop">
									<%
					           for(int i=0;i<productList.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)productList.get(i);
							%>
									<option data-value="<%=productbean.getProdctId()%>"
										value="<%=productbean.getProductName()%>">
										<%
				      			}
				    		%>
									
								</datalist>
								</div>
								<span class="input-group-addon">
									<button type="button" id="popup1" onclick="prodDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
							
								
							</div>
						</div>

						<label class="col-md-2 control-label" for="purchaseDate">Challan
							Date<sup>*</sup>
						</label>
						<div  class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <input type="date" id="Challandate" name="purchaseDate"
									placeholder="Challan Date" class="form-control input-md"    value="<%=todayDate%>" 
									onchange="getAllShopName()">

							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2 control-label" for="purchaseDate">Po No<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <select class="form-control input-md" id="pono" autofocus="pono" name="billNo"
									onchange="productDetailInGridWithPO()">
								</select>

							</div>
						</div>

						<label class="col-md-2 control-label" for="operationName">Operation Name<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
							<%
								InwardProcess1Dao dao = new InwardProcess1Dao();
           						List operaionList =dao.getAllOperaion();
							%>
								<input list="operationName_drop" id="operationName" class="form-control"
									style="text-transform: uppercase" placeholder="Select opetration name">
								<datalist id="operationName_drop">
								<%
					           for(int i=0;i<operaionList.size();i++){
					        	   OperationDetailsBean operaionBean =(OperationDetailsBean)operaionList.get(i);
								%>
								<option data-value="<%=operaionBean.getPkOperationDetailsId()%>" value="<%=operaionBean.getOperationName()%>">
								<%
				      			}
				    			%>
								</datalist>
							</div>
						</div>
					</div> 

					<div class="row form-group"></div>


					<!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
					<div class="row" align="center">
						<div class="table-responsive">
							<table id="jqGrid"></table>
							<div id="jqGridPager"></div>
						</div>
						<!-- dont delet following row -->
						<div class="row row form-group"></div>
					</div>

					<div class="row form-group">

						<label class="col-md-2 col-md-offset-5 control-label" for="total"><b>Total</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="total" name="total"
									class="form-control input-md" type="text"> <input
									readonly="readonly" id="duptotal" name="total"
									class="form-control input-md" type="hidden">
							</div>
						</div>
					</div>

					<div class="row form-group">

						<label class=" col-md-2 col-md-offset-5 control-label"
							for="grossTotal"><h4>
								<b>Gross Total</b>
							</h4></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="grossTotal" name="grossTotal"
									placeholder="Gross Total" class="form-control input-md"
									type="text" style="font-size: 25px; height: 55px;">
							</div>
						</div>
					</div>
                    <br>
					<div class="form-group row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<input type="button" id="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;"
								class="btn btn-large btn-success button-height-width" name="btn"
								onclick="addValGoodsRecieve()" value="Submit"> <input
								type="reset" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;"
								class="btn btn-large btn-danger  button-height-width" id="save"
								name="btn" value="Cancel" onclick="location.reload()">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		</div>
	
		
	<!------------  PoDetails ----------------->
	<%-- <div id="PoDetails">
	<div class="container col-sm-offset-1">
		<form class="form-horizontal" method="post" action="" name="spld">
			<!-- Value of 'name' attribute is used in  supplierDetails.js  -->
			<fieldset>
				<div class="row form-group">
					<div class="col-md-6">
						<%@include file="commons/clock.jsp"%>
					</div>
				</div>

				<div class="row form-group">
				
				<label class="col-md-2 control-label" for="emailId">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %>
						<%}%> <%if(abc.equals("english")){%>PO No<%}%>
					</label>
					<div class="col-md-3 ">
						<div class="input-group">
							<span class="input-group-addon">
							<i
								class="	glyphicon glyphicon-hand-right"></i>
							 </span>
							 		<%
							 		PoDetailsDao productdao123 = new PoDetailsDao();
           						List productList123 =productdao123.getAllPoDetails();
							
							%>
							<input list="PoName_drop" id="PoNo"
								class="form-control" placeholder="PoNo" >
							<datalist id="PoName_drop">
								<%
					           for(int i=0;i<productList123.size();i++){
					        	   PoDetailsBean podetails =(PoDetailsBean)productList123.get(i);
							%>

								<option data-value="<%=podetails.getPk_poDetails_id()%>"
									value="<%=podetails.getIdno()%>">
									<%
				      			}
				    		%>
								
							</datalist>
							 <!--  <input id="PoNo"
								name="PoNo " placeholder="Po Number"  
								class="form-control input-md" type="text"> -->
						</div>
					</div>
					<label class="col-md-2 control-label" for="emailId">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %>
						<%}%> <%if(abc.equals("english")){%>ID No<%}%><sup>*</sup>
					</label>
					<div class="col-md-3 ">
						<div class="input-group">
							<span class="input-group-addon">
							<i
								class="	glyphicon glyphicon-hand-right"></i>
							 </span>
							 
							  <input id="IdNo"
								name="IdNo " placeholder="ID Number"  onchange="checkForDuplicateProductEntry()"
								class="form-control input-md" type="text">
						</div>
					</div>
						
					<!-- 
					<label class="col-md-2 control-label" for="proName">Shop
						Name<sup>*</sup>
					</label> -->
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<%
							shopDetailsDao dao = new shopDetailsDao();
           						List ShopList =dao.getAllShop();
							
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
					</div>

				</div>
				<div class="row form-group">
					<label class="col-md-2 control-label" for="dealerName">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("dealerName") %>
						<%}%> <%if(abc.equals("english")){%>Vendor Name<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-user"></i>
							</span>

							<%
							SupplierDetailsDao productdao1 = new SupplierDetailsDao();
           						List productList1 =productdao1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="suppliername"
								class="form-control" onchange="getvenderDataForPDdetails()">
							<datalist id="dealerName_drop">
								<%
					           for(int i=0;i<productList1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList1.get(i);
							%>

								<option data-value="<%=productbean1.getSupId()%>"
									value="<%=productbean1.getDealerName()%>">
									<%
				      			}
				    		%>
								
							</datalist>
							<span class="input-group-addon">
									<button type="button" onclick="mypopup('PopUpSupplierdetails.jsp')">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
						</div>
					</div>

					<label class="col-md-2 control-label" for="purchaseDate">Date<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="date" id="purchaseDate" name="purchaseDate"
								placeholder=" Date" class="form-control input-md" value="<%=todayDate%>" >

						</div>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="contactNo">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("contactNumber") %>
						<%}%> <%if(abc.equals("english")){%>Contact Number<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-phone"></i>
							</span> <input id="contactNo" maxlength="10" name="contactNo"
								placeholder="Contact Number" class="form-control input-md "
								onkeypress="phoneno()" type="text">
						</div>
					</div>

					<label class="col-md-2 control-label" for="city">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("city") %>
						<%}%> <%if(abc.equals("english")){%>City<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-map-marker"></i>
							</span> <input id="city" name="city" placeholder="city"
								class="form-control input-md" onkeypress="characters()"
								type="text">
						</div>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="tinNo">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %>
						<%}%> <%if(abc.equals("english")){%>GST No<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-font"></i>
							</span> <input id="tinNo" name="tinNo" placeholder="GST No"
								class="form-control input-md " onblur="btnShow()" type="text">
						</div>
					</div>
					<label class="col-md-2 control-label" for="address">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("address") %>
						<%}%> <%if(abc.equals("english")){%>Address<%}%>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-map-marker"></i>
							</span> <input id="address" name="address" placeholder="Address"
								class="form-control input-md " type="text">
						</div>
					</div>
				</div>

				<div class="row form-group"> 
				
				<!-- for operation field -->

				<label class="col-md-2 control-label" for="operationName">Operation Details<sup>*</sup></label>  
           	 	<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							OperationDetailsDao cdd = new OperationDetailsDao();
           						List cList =cdd.getAllOperationNames();
							
							%>
							<input list="cat_drop" id="operationName"  class="form-control">
				<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        		OperationDetailsBean cat=(OperationDetailsBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getPkOperationDetailsId()%>" value="<%=cat.getOperationName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
           		 	</div> 
				
				
					<label class="col-md-2 control-label" for="proName">Product
						Name<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<%
							ProductDetailsDao productdao12 = new ProductDetailsDao();
           						List productList12 =productdao12.getAllProductDetails();
							
							%>
							<input list="productName_drop" id="productName1"
								class="form-control" onchange="productDetailInGrid1()"
								style="text-transform: uppercase">
							<datalist id="productName_drop">
								<%
					           for(int i=0;i<productList.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)productList.get(i);
							%>

								<option data-value="<%=productbean.getProdctId()%>"
									value="<%=productbean.getProductName()%>">
									<%
				      			}
				    		%>
							</datalist>
							<span class="input-group-addon">
									<button type="button" onclick="mypopup('PopUpProductdetails.jsp')">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
							
						</div>
					</div>


				</div>
				
		

				<div class="row" align="center">
					<div class="table-responsive">
						<table id="jqGrid1"></table>
						<div id="jqGridPager1"></div>
					</div>
					<!-- dont delet following row -->
					<div class="row row form-group"></div>
				</div>

				<div class="row form-group">

					<label class="col-md-2 col-md-offset-5 control-label" for="total"><b>Total</b></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> Rs </span> <input
								readonly="readonly" id="total1" name="total"
								class="form-control input-md" type="text"> <input
								readonly="readonly" id="duptotal" name="total"
								class="form-control input-md" type="hidden">
						</div>
					</div>
				</div>

				<div class="row form-group">

					<label class=" col-md-2 col-md-offset-5 control-label"
						for="grossTotal"><h4>
							<b>Gross Total</b>
						</h4></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> Rs </span> <input
								readonly="readonly" id="grossTotal1" name="grossTotal"
								placeholder="Gross Total" class="form-control input-md"
								type="text" style="font-size: 25px; height: 55px;">
						</div>
					</div>
				</div>

				<div class="form-group row">
					<div class="col-md-11 text-center">
						<input style="height: 65px; width: 180; font-size: 25"
							type="button" value="Submit" id="save" name="btn"
							class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"
							onclick="valforPoDetails()" /> <input
							style="height: 65px; width: 180; font-size: 25" type="button"
							value="Cancel" id="cancel" name="btn"
							class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"
							onclick="location.reload()" />
						<!-- <input style=" height: 65px; width: 180; font-size: 25" type="button" value="PO List" id="listBtn" class="btn btn-primary" onclick="supplierlist()" /> -->
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	</div>
 --%>
 <!-- With Out Po Details Form  -->
 <div id="PoDetails">
 <div  class="tab-pane  ">
 <div class="col-sm-offset-1">
			<form class="form-horizontal" method="post" action=""
				name="goodsReceiveFormWithoutPO">
				
				
				<!-- Value of 'name' attribute is used in  supplierDetails.js  -->
				<fieldset>
					<div class="row form-group">
						<div class="col-md-6">
							<%@include file="commons/clock.jsp"%>
						</div>
					</div>
					
					<div class="row form-group">
						<label class="col-md-2 control-label" for="supplier">Vendor
							Name<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
							
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span>
								<!-- <input type="text" id="supplierName" name="supplierName" class="form-control" > -->

								<%
								SupplierDetailsDao sddt = new SupplierDetailsDao();
           						List sLists =sddt.getAllSupplier1(request);
							
							%>

								<input list="sup_drop" id="supplier1" autofocus="supplier1" class="form-control">
								<!-- onchange="getSupName()" -->
								<datalist id="sup_drop">

									<%
					           for(int i=0;i<sLists.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>
									<option data-value="<%=sup.getSupId()%>"
										value="<%=sup.getDealerName() %>">
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

						<label class="col-md-2 control-label" for="billNum"><b>Challan
								Number<sup>*</sup>
						</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> No </span> <input
									id="challanno1" name="billNum" placeholder="Enter Challan Number" onchange="checkForDuplicateProductEntryOutWithOutPo()"
									class="form-control input-md" type="text">
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
							 	ProductDetailsDao productdao2 = new ProductDetailsDao();
           						List productList2 =productdao2.getAllItemName(request); 
								
								/*  ProductDetailsHelper productdao2 = new ProductDetailsHelper();
		     						List productList2 =productdao2.getAllProductDetails3(); */
							
							%>
								<input list="productName_drop" id="productName1" autofocus="productName1"
									class="form-control" onchange="getPoByProduct(),productDetailInGridWithoutPo()"
									style="text-transform: uppercase">
								<datalist id="productName_drop">
									<%
					           for(int i=0;i<productList2.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)productList.get(i);
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

						<label class="col-md-2 control-label" for="purchaseDate">Challan Date<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <input type="date" id="Challandate1" name="purchaseDate"
									placeholder="Challan Date" class="form-control input-md"    value="<%=todayDate%>" 
									onchange="getAllShopName()">

							</div>
						</div>
					</div>
					
					<div class="row form-group">
						<!-- <label class="col-md-2 control-label" for="purchaseDate">Po No<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <select class="form-control input-md" id="pono" autofocus="pono" name="billNo"
									onchange="productDetailInGridWithPO()">
								</select>
							</div>
						</div> -->

						<label class="col-md-2 control-label" for="operationName">Operation Name<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i class="	glyphicon glyphicon-hand-right"></i></span>
							<%
								InwardProcess1Dao dao2 = new InwardProcess1Dao();
           						List operaionList2 =dao2.getAllOperaion();
							%>
								<input list="operationName_drop1" id="operationName1" class="form-control"
									style="text-transform: uppercase" placeholder="Select opetration name">
								<datalist id="operationName_drop1">
								<%
					           for(int i=0;i<operaionList.size();i++){
					        	   OperationDetailsBean operaionBean =(OperationDetailsBean)operaionList2.get(i);
								%>
								<option data-value="<%=operaionBean.getPkOperationDetailsId()%>" value="<%=operaionBean.getOperationName()%>">
								<%
				      			}
				    			%>
								</datalist>
							</div>
						</div>
					</div> 
					
					
					<div class="row form-group"></div>


					<!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
					<div class="row" align="center">
						<div class="table-responsive">
							<table id="jqGrid1"></table>
							<div id="jqGridPager1"></div>
						</div>
						<!-- dont delet following row -->
						<div class="row row form-group"></div>
					</div>

<%-- 					<div class="row form-group">
						<label class="col-md-2 control-label" for="purchaseDate">Po
							No<sup>*</sup>
						</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <select class="form-control input-md" id='pono' name="billNo"
									onchange="productDetailInGrid()">
								</select>

							</div>
						</div>

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
						</div>


					</div> --%> 



					<div class="row form-group">

						<label class="col-md-2 col-md-offset-5 control-label" for="total"><b>Total</b></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="total1" name="total"
									class="form-control input-md" type="text"> <input
									readonly="readonly" id="duptotal" name="total"
									class="form-control input-md" type="hidden">
							</div>
						</div>
					</div>

					<div class="row form-group">

						<label class=" col-md-2 col-md-offset-5 control-label"
							for="grossTotal"><h4>
								<b>Gross Total</b>
							</h4></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="grossTotal1" name="grossTotal"
									placeholder="Gross Total" class="form-control input-md"
									type="text" style="font-size: 25px; height: 55px;">
							</div>
						</div>
					</div>
                    <br>
					<div class="form-group row">
						<div class="col-md-8 col-md-offset-2 text-center">
							<input type="button" id="saveGoodsRecieveWithoutPOBtn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;"
								class="btn btn-large btn-success button-height-width" name="btn"
								onclick="addValGoodsRecieveWithoutPO()" value="Submit"> <input
								type="reset" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;"
								class="btn btn-large btn-danger  button-height-width" id="save"
								name="btn" value="Cancel" onclick="location.reload()">
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		</div>
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
							SupplierDetailsDao productdao1 = new SupplierDetailsDao();
           						List productList1 =productdao1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="dealerName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" >
				<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList1.get(i);
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
        <input style=" font-size: 25" type="button" value="Cancel" id="save" name="btn" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" onclick="refreshIP()" /> 
       
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
							ProductDetailsDao productdao_1 = new ProductDetailsDao();
           						List productList_1 =productdao_1.getAllProductDetails();
							
							%>
							<input list="manufacturingCompany_drop" id="manufacturingCompany" style="text-transform: uppercase" class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="manufacturingCompany_drop">
							<%
					           for(int i=0;i<productList_1.size();i++){
					        	   ProductDetailsBean productbean1 =(ProductDetailsBean)productList_1.get(i);
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
             	<input style="  font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="refreshIP()" /> 
            	<input style="  font-size: 25" type="button" value="Product List" id="productListBtn" class="btn btn-primary btn-large button-height-width" onclick="productDetailslist()" /> 
              	<input style="  font-size: 25" type="button" id="EditProductDtlBtn" value="Edit"  class="btn btn-primary btn-large button-height-width " onclick="editProductDetails()" /> 
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


	<%@include file="commons/newFooter.jsp"%>

</body>
