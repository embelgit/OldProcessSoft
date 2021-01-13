<% boolean isHome = false;
%>



<head>

<meta name="viewport" content="width=device-width , initial-scale=1">

<script type="text/javascript">
	function pageLoad() {
		$("#GST").show();
		$("#NONGST").hide();
		document.getElementById("sgst").value = 1.5;
		document.getElementById("cgst").value = 1.5;
		document.getElementById("labourChargesPer").value = 5;
	}
	function openGST() {
		$("#GST").show();
		$("#NONGST").hide();
		document.getElementById("sgst").value = 1.5;
		document.getElementById("cgst").value = 1.5;
		document.getElementById("labourChargesPer").value = 5;

	}
	function openNONGST() {
		$("#NONGST").show();
		$("#GST").hide();
	}
</script>

<script type="text/javascript">
	function calculateAmt() {
		
		var GrossTotal =0;
        var labourAmt = 0;
        
        var count = jQuery('#jqGrid').jqGrid('getGridParam', 'records');
		var allRowsInGrid1 = $('#jqGrid').getGridParam('data');
		var AllRows=JSON.stringify(allRowsInGrid1);
		for (var k = 0; k < count; k++) 
		    {
			var GrossTotal1 =allRowsInGrid1[k].Total;
			GrossTotal = GrossTotal + GrossTotal1;
			
			var makingChargesAmt1 =allRowsInGrid1[k].makingChargesAmt;
			labourAmt = labourAmt + makingChargesAmt1;
		    }
    	
    	var sgstPer = document.getElementById("sgst").value;
    	var cgstPer = document.getElementById("cgst").value;
    	
    	var sgstAmt = (sgstPer/100) * GrossTotal;
    	var cgstAmt = (cgstPer/100) * GrossTotal;
    	
    	var labourChargesPer = document.getElementById("labourChargesPer").value;
    	
    	var labourChargesAmt = (labourChargesPer/100) * labourAmt;
    	
    	var grossAmount = +GrossTotal + +sgstAmt + +cgstAmt + +labourChargesAmt;
    	
    	document.getElementById("sgstAmt").value = parseFloat(sgstAmt).toFixed(2);
    	document.getElementById("cgstAmt").value = parseFloat(cgstAmt).toFixed(2);
    	document.getElementById("labourChargesAmount").value = parseFloat(labourChargesAmt).toFixed(2);
    	document.getElementById("totalAmount").value = parseFloat(GrossTotal).toFixed(2);
    	document.getElementById("grossAmount").value = parseFloat(grossAmount).toFixed(2);
		
    	var cashAmt = document.getElementById("cashAmount").value;
    	var cardAmt = document.getElementById("cardAmount").value;

    	var grossCashAmt = (+grossAmount) - (+cardAmt);
    	document.getElementById("cashAmount").value = parseFloat(grossCashAmt).toFixed(2);
	}
	
	
</script>

<script type="text/javascript">
	function calculateAmt1() {
		
		var GrossTotal =0;
        var labourAmt = 0;
        
        var count = jQuery('#jqGrid1').jqGrid('getGridParam', 'records');
		var allRowsInGrid1 = $('#jqGrid1').getGridParam('data');
		var AllRows=JSON.stringify(allRowsInGrid1);
		for (var k = 0; k < count; k++) 
		    {
			var GrossTotal1 =allRowsInGrid1[k].Total;
			GrossTotal = GrossTotal + GrossTotal1;
			
		    }
    	var grossAmount = +GrossTotal;
    	
    	var cashAmt = document.getElementById("cashAmount1").value;
    	var cardAmt = document.getElementById("cardAmount1").value;

    	var grossCashAmt = (+grossAmount) - (+cardAmt);
    	document.getElementById("cashAmount1").value = parseFloat(grossCashAmt).toFixed(2);
	}
	
	
</script>






<%-- 
<%
        Long gstbillNo = 1l;
	 %>
	 <%
	 CustBillGstWiseDao data = new CustBillGstWiseDao();
		List stkList = data.getLastBillNo();

		for (int j = 0; j < stkList.size(); j++) {

			BarcodeNoBean st = (BarcodeNoBean) stkList.get(j);
			gstbillNo = st.getBillNo1();

			gstbillNo++;
		
		}      
	        
         %> 
         
      <%
        Long nongstbillNo = 1l;
	 %>
	  --%>


<script type="text/javascript" src="/DemoJWL/StaticContent/y_js/jquery-1.12.3.min.js"></script>

<link rel="stylesheet" href="/DemoJWL/StaticContent/y_css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/DemoJWL/StaticContent/y_css/jquery-ui.css">
<link rel="stylesheet" href="/DemoJWL/StaticContent/y_css/ui.jqgrid.css">
<script type="text/javascript" src="/DemoJWL/StaticContent/y_js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/DemoJWL/StaticContent/JS/jquery-ui.js"></script>
<script type="text/javascript" src="/DemoJWL/StaticContent/JS/jqueryUi.js"></script>
<script type="text/javascript" src="/DemoJWL/StaticContent/y_js/jquery.jqgrid.min.js"></script>

<link rel="stylesheet" href="/DemoJWL/StaticContent/css/sweetalert.css">

<script type="text/javascript"
	src="/DemoJWL/StaticContent/JS/custBill.js"></script>

</head>

<body onload="pageLoad()">
	<div class="row header_margin_top" style="margin-top: 0px;">
		<div align="center">
			<h2 class="form-name style_heading" style="margin-top: 15px">Credit Customer Bill</h2>
		</div>

		<<%-- div >
			 <h4 align="right" style="color: red; margin-right: 150px;">Bill No :: <%out.println(gstbillNo); %></h4>
		</div> --%>
		
		
	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div class="container col-sm-offset-1 ">

		<div class="row form-group">
			<div class="col-md-3 control-label">
				<label for="billtype" style="float: right">Bill Type</label>
			</div>
			<div class="col-md-3">
				<div class="col-xs-6 ">
					<label class="radio-inline"> <input type="radio"
						name="billtype" id="billtype"  value="GST" checked="checked"
						onclick="openGST()">GST
					</label>
				</div>
				<div class="col-xs-6 col-md-ffset-1 ">
					<label class="radio-inline"> <input type="radio"
						name="billtype" id="billtype" value="NONGST"
						onclick="openNONGST()">NONGST
					</label>
				</div>
			</div>


		</div>

		<!------------------			Code for Cash customers ------------------>

		<div id="GST">
           <div class="container ">
			<form class="form-horizontal" method="post" action=""
				name="fertiBill">
				<fieldset>
					
					<div class="row form-group">
						<label class="col-md-2 control-label" for="customerName">Customer
							Name<sup>*</sup>
						</label>
						
						<%-- <%
						    CustomerDetailsHelper custHelper = new CustomerDetailsHelper();
							List itemList2 = custHelper.getCustomerName();
						%>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input list="customerName_drop" id="customerName" name="customerName"
									placeholder="Customer Name" class="form-control input-md"
									type="text" onchange="getCreditCustomerData()">
									
							<datalist id="customerName_drop">
								<%
									for (int i = 0; i < itemList2.size(); i++) {
										CustomerDetailsBean item = (CustomerDetailsBean) itemList2.get(i);
								%>
								<option data-value="<%=item.getCustId()%>"
									value="<%=item.getFirstName()%> <%=item.getMiddleName()%> <%=item.getLastName()%>" myvalue="<%=item.getAddress()%>"></option>
								<%
									}
								%>
							</datalist>
						 --%>	
							
							</div>
							<!-- <div><input type="button" value="Click me" onclick="openRequestedPopup()"></div> -->
						</div>

						<label class="col-md-2 control-label" for="village">Contact No.<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-earphone"></i>
								</span> <input id="contactNo" name="contactNo"
									placeholder="Contact No." class="form-control input-md"
									type="text">
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2 control-label" for="contactNo">Barcode No./ Product Name
						</label>
						
						<%-- <%
							ProductDetailsDao dao=new ProductDetailsDao();
							List list12=dao.getProductList();
						%>
						
						
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input list="barcodeNo_drop" id="barcodeNo" name="barcodeNo"
									placeholder="Product Name" class="form-control input-md"
									type="text" onchange="return getItemData()">
									
							<datalist id="barcodeNo_drop">
								<%
									for (int j = 0; j < list12.size(); j++) {
										GetProductDetails item1 = (GetProductDetails) list12.get(j);
								%>
								<option data-value="<%=item1.getProductId()%>"
									value="<%=item1.getCat()%> >>> <%=item1.getSubCatName()%> >>> <%=item1.getProduct()%>" ></option>
								<%
									}
								%>
							</datalist> --%>
							</div>
						</div>
				    </div>
				    
				    <div class="row" align="center">
						<!--  style='position:absolute; top:300px; left:225px; ' -->
						<div class="table-responsive">
							<table id="jqGrid">
							</table>
							<div id="jqGridPager"></div>
						</div>
					</div>
					
					<div class="row form-group" style="margin-top: 10px;">
						<label class="col-md-2 col-md-offset-5 control-label"
							for="totalAmount">Total Amount</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="totalAmount" name="totalAmount"
									class="form-control" placeholder="Total Amount">
							</div>
						</div>
			        </div>
					
					<div class="row form-group" style="margin-top: 10px;">
						<label class="col-md-2 col-md-offset-3 control-label"
							for="sgst"> SGST %</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"> % </span> <input
									 id="sgst" name="sgst"
									class="form-control" placeholder="SGST %" onkeyup="calculateAmt()">
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span>
								<input type="text" id="sgstAmt" class="form-control" readonly="readonly">
							</div>
						</div>
						
			        </div>
			        
			        <div class="row form-group" style="margin-top: 10px;">
						<label class="col-md-2 col-md-offset-3 control-label"
							for="cgst"> CGST %</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"> % </span> <input
									 id="cgst" name="cgst"
									class="form-control" placeholder="CGST %" onkeyup="calculateAmt()">
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span>
								<input type="text" id="cgstAmt" class="form-control" readonly="readonly">
							</div>
						</div>
						
			        </div>
			        
			        <div class="row form-group" style="margin-top: 10px;">
						<label class="col-md-2 col-md-offset-3 control-label"
							for="labourCharges"> Labour Charges  %</label>
						<div class="col-md-2">
							<div class="input-group">
								<span class="input-group-addon"> % </span> <input
									 id="labourChargesPer" name="labourChargesPer"
									class="form-control" placeholder="Labour Charges  %" onkeyup="calculateAmt()">
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span>
								<input type="text" id="labourChargesAmount" class="form-control" readonly="readonly">
							</div>
						</div>
						
			        </div>
					
					<div class="row form-group" style="margin-top: 10px;">
					
					<label class="col-md-2 control-label" for="payMode"> Payment Mode
				        </label>
							<div class="col-md-3">
								<div class="input-group">
								
								            <span class="input-group-addon"> <i
										      class="	glyphicon glyphicon-hand-right"></i>
									        </span>
											
				           					<select class="form-control" id="paymentMode">
													<option value="Cash">Cash</option>
													<option value="Card">Card</option>
													<option value="Credit">Credit</option>
													<option value="Cash + Card">Cash + Card</option>
													<option value="Neft">Neft</option>
													<option value="Cheque">Cheque</option>
											</select>	
				           		</div>
				           		
							<script>
								
								$(document).ready(function(){
							  		 $("#paymentMode").change(function(){
							       	$(this).find("option:selected").each(function(){
							           	if($(this).attr("value")=="Cheque"){
							           	
							           	$("#cheque_no").show(); 
							           	$("#cash_no").hide(); 
							           	$("#neft_acc_no").hide(); 
							           	$("#card_no").hide();
							           	$("#credit_no").hide();
							           	$("#cardndcash_no").hide();
							           	}
							          	 else if($(this).attr("value")=="Card"){
							           	
							          		$("#card_no").show(); 	
							          		$("#cash_no").hide(); 
							          		$("#neft_acc_no").hide(); 
							        		$("#cheque_no").hide();
							        		$("#credit_no").hide();
							        		$("#cardndcash_no").hide();
							           }
							          	 else if($(this).attr("value")=="Neft"){
							                	
							           		$("#neft_acc_no").show(); 	
							           		$("#cash_no").hide(); 
							           		$("#card_no").hide(); 
							        		$("#cheque_no").hide();
							        		$("#credit_no").hide();
							        		$("#cardndcash_no").hide();
							            }
							          	 else if($(this).attr("value")=="Cash"){
							             	
							          		    $("#cash_no").show(); 
							            		$("#neft_acc_no").hide(); 
							            		$("#cheque_no").hide();
							            		$("#card_no").hide(); 
							            		$("#credit_no").hide();
							            		$("#cardndcash_no").hide();
							             }
							           	
							          	else if($(this).attr("value")=="Credit"){
							             	
							          		$("#credit_no").show();
						          		    $("#cash_no").hide(); 
						            		$("#neft_acc_no").hide(); 
						            		$("#cheque_no").hide();
						            		$("#card_no").hide(); 
						            		$("#cardndcash_no").hide();
						                }
							           	
                                         else if($(this).attr("value")=="Cash + Card"){
							             	
                                        	$("#cardndcash_no").show(); 
							          		$("#credit_no").hide();
						          		    $("#cash_no").hide(); 
						            		$("#neft_acc_no").hide(); 
						            		$("#cheque_no").hide();
						            		$("#card_no").hide(); 
						            		
						                 }
							           	
							          	else if($(this).attr("value")=="selected"){
							             	
							        		$("#neft_acc_no").hide(); 
							        		$("#cheque_no").hide();
							        		$("#card_no").hide(); 
							        		$("#cash_no").hide();
							        		$("#credit_no").hide();
							        		$("#cardndcash_no").hide();
							         }
							          
							       });
							   }).change();
								});	
								</script>
						</div>
					
					
						<label class="col-md-2 control-label"
							for="grossTotal1">
								Gross Total
							</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="grossAmount" name="grossAmount"
									placeholder="Gross Total" class="form-control input-md"
									type="text">
							</div>
						</div>
					</div>
					
					<div class="row form-group" >
					
					            <div id="cash_no" >
										
									<div class="col-md-3 col-md-offset-2">	
										<input class="form-control" type="text" name="cashAmt" id="cashAmt" placeholder="Cash Amount" />  
									</div>
									
								</div>
					

            					<div id="cheque_no" >
            						<!-- <div class="col-md-2">										
										<label class="control-label" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum" placeholder="Cheque No." />  
									</div>
								
									
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck" placeholder="Name On check" />  
									</div>
									
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="chequeAmt" id="chequeAmt" placeholder="Cheque Amount" />  
									</div>
									
								</div>
											
								<div id="card_no" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardNum" id="cardNum" placeholder="Card No." />  
									</div>
									
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardAmt" id="cardAmt" placeholder="Card Amount" />  
									</div>
												
								</div>
								
								<div id="cardndcash_no" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardAmount" id="cardAmount" placeholder="Card Amount" onkeyup="calculateAmt()"/>  
									</div>
									
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cashAmount" id="cashAmount" placeholder="Cash Amount" />  
									</div>
												
								</div>
								
								<div id="credit_no" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="creditAmt" id="creditAmt" placeholder="Credit Amount" />  
									</div>
												
								</div>
											
								<div id="neft_acc_no" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Account No:</label>
									</div> -->
								    <div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="accNum" id="accNum" placeholder="Account No." />  
									</div>
									<!-- <div class="col-md-2 ">
										<label class="control-label">Bank Name</label>
									</div> -->
									<div class="col-md-3  first">	
										<input class="form-control" type="text" name="bankName" id="bankName" placeholder="Name Of Bank" />  
									</div>
									
									<div class="col-md-3  first">	
										<input class="form-control" type="text" name="neftAmt" id="neftAmt" placeholder="Neft Amount" />  
									</div>
							    </div>
					</div>

					<div class="form-group row">
		               <div class="col-md-11 text-center">
			              <input style="height: 65px; width: 180; font-size: 25" type="button" id="btn" name="btn" value="Submit" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="validateResiterGstWiseBill()" />
			              <input style="height: 65px; width: 180; font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="window.location.reload()" />
			              <!-- <input style="height: 65px; width: 180; font-size: 25" type="button" value="Edit" id="listBtn" class="btn btn-primary" onclick="editProduct()" /> -->
		              </div>
	               </div>
				</fieldset>
			</form>
			</div>
		</div>
		
		
		
		<div id="NONGST">
			<form class="form-horizontal" method="post" action=""
				name="fertiBill">
				<fieldset>
					
					<div class="row form-group">
						<label class="col-md-2 control-label" for="customerName">Customer
							Name<sup>*</sup>
						</label>
						
						<div class="col-md-3">
						 <div class="input-group">
							<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
							</span> <input list="customerName_drop1" id="customerName1" name="customerName1"
									placeholder="Customer Name" class="form-control input-md"
									type="text" onchange="getCreditCustomerData1()">
						<%-- 			
							<datalist id="customerName_drop1">
								<%
									for (int i = 0; i < itemList2.size(); i++) {
										CustomerDetailsBean item = (CustomerDetailsBean) itemList2.get(i);
								%>
								<option data-value="<%=item.getCustId()%>"
									value="<%=item.getFirstName()%> <%=item.getMiddleName()%> <%=item.getLastName()%>"  myvalue="<%=item.getAddress()%>"></option>
								<%
									}
								%>
							</datalist> --%>
							</div>
						</div>

						<label class="col-md-2 control-label" for="village">Contact No.<sup>*</sup></label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-earphone"></i>
								</span> <input id="contactNo1" name="contactNo1"
									placeholder="Contact No." class="form-control input-md"
									type="text">
							</div>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-md-2 control-label" for="contactNo">Barcode No./ Product Name
						</label>
						
						<%-- <%
							ProductDetailsDao dao1=new ProductDetailsDao();
							List list123=dao1.getProductList();
						%>
						
						
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="glyphicon glyphicon-user"></i>
								</span> <input list="barcodeNo_drop1" id="barcodeNo1" name="barcodeNo1"
									placeholder="Product Name" class="form-control input-md"
									type="text" onchange="return getItemData1()">
									
							<datalist id="barcodeNo_drop1">
								<%
									for (int j = 0; j < list123.size(); j++) {
										GetProductDetails item1 = (GetProductDetails) list123.get(j);
								%>
								<option data-value="<%=item1.getProductId()%>"
									value="<%=item1.getCat()%> >>> <%=item1.getSubCatName()%> >>> <%=item1.getProduct()%>" ></option>
								<%
									}
								%>
							</datalist> --%>
							</div>
						</div>
				    </div>
					
					<div class="row" align="center">
						<!--  style='position:absolute; top:300px; left:225px; ' -->
						<div class="table-responsive">
							<table id="jqGrid1">
							</table>
							<div id="jqGridPager1"></div>
						</div>
					</div>
					
					<div class="row form-group" style="margin-top: 10px;">
						<label class="col-md-2 col-md-offset-5 control-label"
							for="grossAmount"> Gross Amount</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="grossAmount1" name="grossAmount1"
									class="form-control" placeholder="Gross Amount">
							</div>
						</div>
			        </div>
					
					<div class="row form-group" style="margin-top: 10px;">
					
					<label class="col-md-2 control-label" for="payMode"> Payment Mode
				        </label>
							<div class="col-md-3">
								<div class="input-group">
								
								            <span class="input-group-addon"> <i
										      class="	glyphicon glyphicon-hand-right"></i>
									        </span>
											
				           					<select class="form-control" id="paymentMode1">
													<option value="Cash">Cash</option>
													<option value="Card">Card</option>
													<option value="Credit">Credit</option>
													<option value="Cash + Card">Cash + Card</option>
													<option value="Neft">Neft</option>
													<option value="Cheque">Cheque</option>
											</select>	
				           		</div>
				           		
							<script>
								
								$(document).ready(function(){
							  		 $("#paymentMode1").change(function(){
							       	$(this).find("option:selected").each(function(){
							           	if($(this).attr("value")=="Cheque"){
							           	
							           	$("#cheque_no1").show(); 
							           	$("#cash_no1").hide(); 
							           	$("#neft_acc_no1").hide(); 
							           	$("#card_no1").hide();
							           	$("#credit_no1").hide();
							           	$("#cardndcash_no1").hide();
							           	}
							          	 else if($(this).attr("value")=="Card"){
							           	
							          		$("#card_no1").show(); 	
							          		$("#cash_no1").hide(); 
							          		$("#neft_acc_no1").hide(); 
							        		$("#cheque_no1").hide();
							        		$("#credit_no1").hide();
							        		$("#cardndcash_no1").hide();
							           }
							          	 else if($(this).attr("value")=="Neft"){
							                	
							           		$("#neft_acc_no1").show(); 	
							           		$("#cash_no1").hide(); 
							           		$("#card_no1").hide(); 
							        		$("#cheque_no1").hide();
							        		$("#credit_no1").hide();
							        		$("#cardndcash_no1").hide();
							            }
							          	 else if($(this).attr("value")=="Cash"){
							             	
							          		    $("#cash_no1").show(); 
							            		$("#neft_acc_no1").hide(); 
							            		$("#cheque_no1").hide();
							            		$("#card_no1").hide(); 
							            		$("#credit_no1").hide();
							            		$("#cardndcash_no1").hide();
							             }
							           	
							          	else if($(this).attr("value")=="Credit"){
							             	
							          		$("#credit_no1").show();
						          		    $("#cash_no1").hide(); 
						            		$("#neft_acc_no1").hide(); 
						            		$("#cheque_no1").hide();
						            		$("#card_no1").hide(); 
						            		$("#cardndcash_no1").hide();
						                }
							           	
                                         else if($(this).attr("value")=="Cash + Card"){
							             	
                                        	$("#cardndcash_no1").show(); 
							          		$("#credit_no1").hide();
						          		    $("#cash_no1").hide(); 
						            		$("#neft_acc_no1").hide(); 
						            		$("#cheque_no1").hide();
						            		$("#card_no1").hide(); 
						            		
						                 }
							           	
							          	else if($(this).attr("value")=="selected"){
							             	
							        		$("#neft_acc_no1").hide(); 
							        		$("#cheque_no1").hide();
							        		$("#card_no1").hide(); 
							        		$("#cash_no1").hide();
							        		$("#credit_no1").hide();
							        		$("#cardndcash_no1").hide();
							         }
							          
							       });
							   }).change();
								});	
								</script>
						</div>
					
					
					
						<label class="col-md-2 control-label"
							for="totalAmt"> Total Amount</label>
						<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> Rs </span> <input
									readonly="readonly" id="totalAmount1" name="totalAmount1"
									class="form-control" placeholder="Total Amount">
							</div>
						</div>
					</div>
					
					<div class="row form-group" >
					
					            <div id="cash_no1" >
										
									<div class="col-md-3 col-md-offset-2">	
										<input class="form-control" type="text" name="cashAmt1" id="cashAmt1" placeholder="Cash Amount" />  
									</div>
									
								</div>
					

            					<div id="cheque_no1" >
            						<!-- <div class="col-md-2">										
										<label class="control-label" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="chequeNum1" id="chequeNum1" placeholder="Cheque No." />  
									</div>
								
									
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="nameOnCheck1" id="nameOnCheck1" placeholder="Name On check" />  
									</div>
									
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="chequeAmt1" id="chequeAmt1" placeholder="Cheque Amount" />  
									</div>
									
								</div>
											
								<div id="card_no1" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardNum1" id="cardNum1" placeholder="Card No." />  
									</div>
									
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardAmt1" id="cardAmt1" placeholder="Card Amount" />  
									</div>
												
								</div>
								
								<div id="cardndcash_no1" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cardAmount1" id="cardAmount1" placeholder="Card Amount" onkeyup="calculateAmt1()" />  
									</div>
									
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="cashAmount1" id="cashAmount1" placeholder="Cash Amount" />  
									</div>
												
								</div>
								
								<div id="credit_no1" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Card No:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="creditAmt1" id="creditAmt1" placeholder="Credit Amount" />  
									</div>
												
								</div>
											
								<div id="neft_acc_no1" class="form-group">
									<!-- <div class="col-md-2 ">
										<label class="control-label">Account No:</label>
									</div> -->
								    <div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="accNum1" id="accNum1" placeholder="Account No." />  
									</div>
									<!-- <div class="col-md-2 ">
										<label class="control-label">Bank Name</label>
									</div> -->
									<div class="col-md-3  first">	
										<input class="form-control" type="text" name="bankName1" id="bankName1" placeholder="Name Of Bank" />  
									</div>
									
									<div class="col-md-3  first">	
										<input class="form-control" type="text" name="neftAmt1" id="neftAmt1" placeholder="Neft Amount" />  
									</div>
							    </div>
					</div>

					<div class="form-group row">
		               <div class="col-md-11 text-center">
			              <input style="height: 65px; width: 180; font-size: 25" type="button" id="btn1" name="btn1" value="Submit" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="validateResiterNoNGstWiseBill()" />
			              <input style="height: 65px; width: 180; font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="window.location.reload()" />
			            <!--   <input style="height: 65px; width: 180; font-size: 25" type="button" value="Edit" id="listBtn" class="btn btn-primary" onclick="editProduct()" /> -->
		              </div>
	               </div>
				</fieldset>
			</form>
		</div>
	</div>
	
</body>