<%@page import="com.Fertilizer.hibernate.ExpenditurePaymentBean"%>
<%@page import="com.Fertilizer.dao.ExpenditurePaymentDao"%>
<%@page import="com.Fertilizer.hibernate.EmployeePaymentBean"%>
<%@page import="com.Fertilizer.dao.EmployeePaymentDao"%>
<%@page import="com.Fertilizer.hibernate.VendorPaymentBean"%>
<%@page import="com.Fertilizer.dao.SupplierPaymentDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="com.Fertilizer.dao.CustomerDetailsDao" %>
 <%@page import="com.Fertilizer.hibernate.CustomerDetailsBean" %>
  <%@page import="com.Fertilizer.dao.EmployeeDetailsDao" %>
 <%@page import="com.Fertilizer.hibernate.EmployeeDetailsBean" %>
<%@page import="com.Fertilizer.dao.ExpenditureDetailsDao" %>
 <%@page import="com.Fertilizer.hibernate.ExpenditureDetailsBean" %>
 <%@page import="com.Fertilizer.dao.PackingDao" %>
 <%@page import="com.Fertilizer.bean.BillBean" %>
 
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>

<head>

	    <link rel="stylesheet" href="/processSoft/staticContent/css/tabDemo.css">
	    <script src="/processSoft/staticContent/js/cashbankbook.js"></script>
	    
	    <!-- LABLE STYLE START -->
<style>
.name{
    font-size: 18px;
    color: black;
    text-align: right;
}
</style>
<script type="text/javascript">
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
       
        return false;
    }
    return true;
}
function isNumberWithFloat(evt)
{
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
	{
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">

 function Billwise() {
	$("#home").show();
	$("#vendorhome").hide();

	/* $( "#customertype" ).prop( "checked", true );
	$( "#customertype" ).prop( "checked", false ); 
	 */
}
function Vendorwise() {
	$("#vendorhome").show();
	$("#home").hide();
	
	
	/*  $( "#customertype" ).prop( "checked", false );
	$( "#customertype" ).prop( "checked", true );  */
	
}
function Customer() {
	$("#profile").show();
	$("#home").hide();
	$("#vendorhome").hide();
	$("#messages").hide();
	$("#settings").hide();
	$("#heading").hide();
	/*  $( "#customertype" ).prop( "checked", false );
	$( "#customertype" ).prop( "checked", true );  */
	
}

function Employee() {
	$("#messages").show();
	$("#home").hide();
	$("#vendorhome").hide();
	$("#profile").hide();
	$("#settings").hide();
	$("#heading").hide();
	/*  $( "#customertype" ).prop( "checked", false );
	$( "#customertype" ).prop( "checked", true );  */
	
}
function Expenditure() {
	$("#settings").show();
	$("#home").hide();
	$("#vendorhome").hide();
	$("#profile").hide();
	$("#messages").hide();
	$("#heading").hide();
	/*  $( "#customertype" ).prop( "checked", false );
	$( "#customertype" ).prop( "checked", true );  */
	
}
function home1() {
	$("#settings").hide();
	$("#home").show();
	$("#vendorhome").hide();
	$("#profile").hide();
	$("#messages").hide();
	$("#heading").hide();
	$("#heading").show();
	/*  $( "#customertype" ).prop( "checked", false );
	$( "#customertype" ).prop( "checked", true );  */
	
}
</script> 
  <!-- LABLE STYLE END -->
 <%--  <%
        Long BillNo = 1l;

/*  String billNo2 =String.valueOf(BillNo);
 Long BillNo3 = Long.valueOf(BillNo3); */
	 %>
<%
SupplierPaymentDao data = new SupplierPaymentDao();
		List stkList  = data.getLastBillNo();
		
		for(int i=0;i<stkList.size();i++){
			
			VendorPaymentBean st = (VendorPaymentBean)stkList.get(i);
			BillNo = st.getPkVenPaymentId();
			
			System.out.println("hi this is Kishor  billno is ++++++"+BillNo);
			
			BillNo++;
			System.out.println( BillNo);
			
		}      
	        
         %> --%> 
 
  
 </head>
 <body >
<div class="row" style="min-height:300px;">
    <div  class="col-md-12">
        <h3>Left Tabs</h3>
        <hr/>
        <div class="col-md-2">
            <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs tabs-left">
                <li class="active"><a href="#home" data-toggle="tab"   onclick="home1()" >Vendor Payment</a></li>
                 
               
                
             <!--    <li><a href="#profile" data-toggle="tab" onclick="Customer()" >Customer Payment</a></li> -->
                <li><a href="#messages" data-toggle="tab" onclick="Employee()"  >Employee Payment</a></li>
                <li><a href="#settings" data-toggle="tab" onclick="Expenditure()"  >Expenditure Payment</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
        
          <div class="row form-group">
		      <div id="heading">
		      <div align="center">
			  			<h2 class="form-name style_heading">Vendor  Payment</h2><br><br>
			  			
			  			  <div align="right" style="margin-right: 100px;">
			  			  
			<%
								Long Txid = 1l;
						%>
						<%
								SupplierPaymentDao dao=new SupplierPaymentDao();
								List listtxid=dao.getSupplierPaymentTxid();
								

								for (int i = 0; i < listtxid.size(); i++) {
									
								VendorPaymentBean bean=(VendorPaymentBean) listtxid.get(i);
								Txid=bean.getTxId();
								Txid++;
							
							}
						%>
						
						<div>
						
						<div align="right">
								<h3 style="color: red;">
								Transaction ID ::
								<%
									out.println(Txid);
								%>
								</h3>
						</div>
				
					</div>  			  
			<%-- <h3 style="color: red;">
				Transaction Id ::
				<%
				out.println(BillNo);
			%>
			</h3> --%>
		</div>
			  		</div>
			  	<div class="row">
			  	 &nbsp &nbsp
			  	</div>	
			  	<div class="row">
			  	 &nbsp &nbsp
			  	</div>
			  	
			
		   
        	 <!-- <div class="col-md-12">
         		 <div class="col-md-3 control-label">
         		<label  for="Billwise" style="float:right">Vendor Type<sup>*</sup></label>
         		</div>	
         			<div class="col-md-4">
         			<div class="col-xs-3">	
						<label class="radio-inline">
							<input type="radio" name="customertype" checked="checked" onclick="Billwise()">Bill Wise
						</label>
					</div>	
					<div class="col-xs-4 col-md-ffset-1">
								<label class="radio-inline">
								<input type="radio" name="customertype" onclick="Vendorwise()">Vendor Wise
								</label>
					</div>
              		</div> 
              	</div> -->
              
              <div class="col-md-4 col-md-offset-4" style="padding-top: 15px;">
         		<div class="col-xs-6 col-md-ffset-1">
					<label class="radio-inline"  style="font-size: 15px;font-weight: 700;">
						<input type="radio" name="customertype" checked="checked" onclick="Billwise()">Bill Wise
					</label>
				</div>
         		<div class="col-xs-6">
         			<label class="radio-inline" style="font-size: 15px;font-weight: 700;">
						<input type="radio" name="customertype" onclick="Vendorwise()">Vendor Wise
					</label>
				</div>
			</div>   	
        </div>
            
            
            
            
			
	
	
	
              		
              		
            <!-- Tab panes -->
    <div class="tab-content">
       
    	<div class="tab-pane active" id="home" >
  	<form  method="post" action="" name="spmt">
  	
  		
    	
         		 <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
              		
              		 
       
         		
       	       <div class="row form-group">
           				 <label class="col-md-3 name" for="supplier">Vendor Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								
								SupplierDetailsDao sdd = new SupplierDetailsDao();
           						List sList =sdd.getAllSupplier1(request);
							
							%>
							
							<input list="sup_drop" id="supplier" onchange="bill.getAllBills()" class="form-control">
				<datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
            
           			 	    <label class="col-md-2 name" for="bill_no"> Bill No<sup>*</sup> </label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										No
									</span>
           		 					
           		 					<select class="form-control input-md" id='billNo1'  name="billNo1" onchange="bill.getTotalAmtByBills()">
									</select>
								<!-- 					
								<select class="selectpicker" multiple>
								<option>Mustard</option>
							  <option>Ketchup</option>
							  <option>Relish</option>
								</select> -->
									
           						 </div>
							</div> 
						  </div> 
					
					<div class="row form-group">
					
					 <label class="col-md-3 name" for="personname">Accountant Name<sup>*</sup> </label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="personname" name="personname" placeholder="Accountant Name" class="form-control input-md" type="text" >
			           		 </div>
						</div> 
					
					
           				<label class="col-md-2  name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmount" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
            					
            					
           				 	 
							  </div>
						  
				<!-- <div class="row form-group">
						
				
			
          					 <label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmount" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
									  						
	</div>
      	   -->
						  
	 <div class="row form-group">
				
				<label class="col-md-3 name" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class=" glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
						
						 <label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmount" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
	
	<script>
		
		$(document).ready(function(){
	  		 $("#paymentMode").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	
	           	$("#cheque_no").show(); 
	           	
	           	$("#neft_acc_no").hide(); 
	           	$("#card_no").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_no").show(); 	
	          		
	          		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	                	
	           		$("#neft_acc_no").show(); 	
	           		
	           		$("#card_no").hide(); 
	        		$("#cheque_no").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	             	
	            		$("#neft_acc_no").hide(); 
	            		$("#cheque_no").hide();
	            		$("#card_no").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_no").hide(); 
	        		$("#cheque_no").hide();
	        		$("#card_no").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
				
							<!-- <label class="col-md-3 name" for="credit">Credit<sup>*</sup></label>  
           						 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									   <input id="credit" name="credit" placeholder="Credit Amount" class="form-control input-md" type="text" onchange="" >
           							 </div>
								</div>	 -->
								
								
								
          					<!--  <label class="col-md-2 name" for="remainAmt"> Remaining  Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="remainAmt" name="remainAmt" class="form-control" placeholder="Remain Amount">
           							 </div>
								</div> -->
						
			          </div>  
		 	          
			 		<div class="row form-group">
						 <label class="col-md-3 name" for="tdsdetails">TDS Amount</label>  
			           		 <div class="col-md-3">
								<div class="input-group">
								<!-- 	<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span> -->
										<span class="input-group-addon">
												Rs
											</span>
			           		   <input id="tdsdetails" name="tdsdetails" placeholder="TDS Amount" class="form-control input-md" type="text" >
			           		 </div>
						</div>
						
				
			
          					 <label class="col-md-2 name" for="DebitAmt">Debit  Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="debitAmount" name="debitAmount" class="form-control" placeholder="Debit Amount" type="text">
           							 </div>
								</div>
									  						
	</div>
	
      	   
		
			     <div class="row form-group">
				
				  <label class="col-md-3 name" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon   glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentType">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						 <label class="col-md-2 name" for="paymentMode">Payment Amount <sup>*</sup></label>  
						<div class="col-md-3 ">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="supPay" name="supPay" class="form-control" placeholder="Enter Amount">
           							 </div>
						</div>
		  						
			     
			     </div>
			     
			     
			          
		    	<div class="row form-group" >

            					<div id="cheque_no" >
            						<!-- <div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum" placeholder="Cheque No." />  
									</div>
								
									<!-- <div class="col-md-1">
										<label class="name">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
									<!-- <div class="col-md-2">
										<label class="name">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck" placeholder="Name On cheque" />  
									</div>
								</div>
											
											<div id="card_no" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_no" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
			          
			<div class="form-group row">
			  <div class="col-md-12 text-center">
			   		<!-- <button id="btn1" name="btn1" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="supplierPayment(); return false;"><h4> Submit</h4></button>
              		<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
			  
			  		<input type="button" id="btn1" name="btn1" style="font-size: 25" class="btn btn-large btn-success button-height-width"  onclick="supplierPayment(); return false;" value="Submit">
		            <input type="reset" id="btn1" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn1" value="Cancel">
			  
			   </div>
	 		</div>       	    
	</form>
  </div>
 
  <!-- ----------vendor wise payment----------------------- -->
  
  
    	 <div class="tab-pane" id="vendorhome">
    	
    	
       		<form  method="post" action="" name="spmtvendor">
       	
       			<div class="row">
         		  <div class="row form-group">
		      
		      <div align="center">
			  			<!-- <h2 class="form-name style_heading">Vendor  Payment</h2> -->
			  		</div>
			  	<div class="row">
			  	 &nbsp &nbsp
			  	</div>	
			  	<div class="row">
			  	 &nbsp &nbsp
			  	</div>
			  	
			  

			  	 	
         		 
			 <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		  
              		
              		 
           </div> 
       		</div>
       		
	 
       	       <div class="row form-group">
           				 <label class="col-md-3 name" for="supplier">Vendor Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								
								SupplierDetailsDao sdd1 = new SupplierDetailsDao();
           						List sList1 =sdd1.getAllSupplier();
							
							%>
							
							<input list="sup_drop" id="supplierv" class="form-control" onchange="bill.getTotalAmtByBillsv()"  >
				<datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList1.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList1.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
            				
           			 	    
			
					
           				<label class="col-md-2  name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmountv" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
            					
            					
           				 	 
							  </div>
					<!-- 	<div class="row" align="center">
					<div class="table-responsive">
						<table id="jqGrid"></table>
						<div id="jqGridPager"></div>
					</div>
					dont delet following row
					<div class="row row form-group"></div>
				</div> -->
						  
				<div class="row form-group">
						 <label class="col-md-3 name" for="personname">Accountant Name<sup>*</sup> </label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="personnamev" name="personname" placeholder="Accountant Name" class="form-control input-md" type="text" >
			           		 </div>
						</div>
				
			
          					 <label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmountv" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
									  						
	</div>
      	  
						  
	 <div class="row form-group">
				
				<label class="col-md-3 name" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon   glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentModev">
										<option value="cash">Cash</option>
										<option value="cheque">Cheque</option>
										<option value="card">Card</option>
										<option value="neft">NEFT</option>
								</select>	
	           				</div>
						</div>
	
	<script>
		
		$(document).ready(function(){
	  		 $("#paymentModev").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque"){
	           	
	           	$("#cheque_nov").show(); 
	           	
	           	$("#neft_acc_nov").hide(); 
	           	$("#card_nov").hide();
	           	}
	          	 else if($(this).attr("value")=="card"){
	           	
	          		$("#card_nov").show(); 	
	          		
	          		$("#neft_acc_nov").hide(); 
	        		$("#cheque_nov").hide();
	           }
	          	 else if($(this).attr("value")=="neft"){
	                	
	           		$("#neft_acc_nov").show(); 	
	           		
	           		$("#card_nov").hide(); 
	        		$("#cheque_nov").hide();
	            }
	          	 else if($(this).attr("value")=="cash"){
	             	
	            		$("#neft_acc_nov").hide(); 
	            		$("#cheque_nov").hide();
	            		$("#card_nov").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected"){
	             	
	        		$("#neft_acc_nov").hide(); 
	        		$("#cheque_nov").hide();
	        		$("#card_nov").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
				
							<!-- <label class="col-md-3 name" for="credit">Credit<sup>*</sup></label>  
           						 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									   <input id="credit" name="credit" placeholder="Credit Amount" class="form-control input-md" type="text" onchange="" >
           							 </div>
								</div>	 -->
										
          					  <%-- <label class="col-md-2 name" for="remainAmt"> Bill No </label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="billnov1" name="billno" class="form-control" placeholder="billno" value="<%out.println(BillNo);%>"">
           							 </div>
								</div>   --%>
						
			          </div>  
		 	          
			 		<div class="row form-group">
						 <label class="col-md-3 name" for="tdsdetails">TDS Amount</label>  
			           		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
			           		   <input id="tdsdetailsv" name="tdsdetailsv" placeholder="TDS Amount" class="form-control input-md" type="text" >
			           		 </div>
						</div>
						
				
			
          					 <label class="col-md-2 name" for="DebitAmt">Debit  Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="debitAmountv" name="debitAmount" class="form-control" placeholder="Debit Amount" type="text">
           							 </div>
								</div>
									  						
	</div>
	
      	   
		
			     <div class="row form-group">
				
				  <label class="col-md-3 name" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon  glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentTypev">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
							  <label class="col-md-2 name" for="paymentMode">Payment Amount <sup>*</sup></label>  
						<div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="supPayv" name="supPay" class="form-control" placeholder="Enter Amount">
           							 </div>
						</div>
		  						
			     
			     </div>
			     
			     
			          
		    	<div class="row form-group" >

            					<div id="cheque_nov" >
            						<!-- <div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNumv" placeholder="Cheque No." />  
									</div>
								
									<!-- <div class="col-md-1">
										<label class="name">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
									<!-- <div class="col-md-2">
										<label class="name">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheckv" placeholder="Name On cheque" />  
									</div>
								</div>
											
											<div id="card_nov" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNumv" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_nov" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNumv" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankNamev" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
			          
			<div class="form-group row">
			  <div class="col-md-12 text-center">
			   		<!-- <button id="btn1" name="btn1" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="supplierPayment(); return false;"><h4> Submit</h4></button>
              		<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
			  
			  		<input type="button" id="btn2" name="btn1" style="font-size: 25" class="btn btn-large btn-success button-height-width"  onclick="supplierPaymentv(); return false;" value="Submit">
		            <input type="reset" id="btn1" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn1" value="Cancel">
			  
			   </div>
	 		</div>       	    
	</form>
  </div> 

 
  
  
  
  
         
         <!---------Customer Payment --------->
        
     <div class="tab-pane" id="profile">
			<form class="form-horizontal" method="post" action="" name="cust">
	         	<div class="row">
				    <div align="center">
				  		<h2 class="form-name style_heading">Credit Customer Payment</h2>
				  	</div>
				 	
			     <div class="row">
					     <div class="col-sm-offset-1 col-md-10">
							  		<hr style="border-top-color:#c1b1b1;">
					     </div>	
			   		 </div>
			    </div>
         	       <div class="row form-group">
           				 <label class="col-md-3 name" for="customerName">Customer Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
						
							<%
								CustomerDetailsDao cdd = new CustomerDetailsDao();
           						List cList =cdd.getAllCustomer();
							
							%>
									<input list="cust_drop" id="creditCustomer"  class="form-control" onchange="getTotalAmountByBill()">
				<datalist id="cust_drop">
							
							<%
					           for(int i=0;i<cList.size();i++){
					        	   CustomerDetailsBean cust =(CustomerDetailsBean)cList.get(i);
							%>
		
						<option data-value="<%=cust.getCustId()%>"><%=cust.getFirstName() %> <%=cust.getLastName() %> </option>
							<%
				      			}
				    		%>
						</datalist> 
				</div>
       </div>
            
           				  <label class="col-md-2 name" for="fk_cat_id0"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Category<%}%><sup>*</sup></label>  
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
							<input list="cat_drop0" id="fk_cat_id0"  class="form-control" onchange="balaceAmountbyBillNoForCreditPayment()">
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
						  
					 <div class="row form-group">
					<!--  <label class="col-md-3 name" for="bill_no"> Bill No<sup>*</sup> </label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										No
									</span>
           		 					
           		 					<select class="form-control input-md" id='billNo1'  name="billNo" >
									</select>
           						 </div>
							</div> -->
           				<label class="col-md-2 col-md-offset-6 name" for="totalAmt"> Total Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="totalAmount1" name="totalAmount" class="form-control" placeholder="Total Amount">
           							 </div>
								</div>
            					
					 </div>
						  
		<div class="row form-group">
						<label class="col-md-3 name" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-usd"></i>
								</span>
	           					<select class="form-control" id="paymentMode1">
										<option value="cash1">Cash</option>
										<option value="cheque1">Cheque</option>
										<option value="card1">Card</option>
										<option value="neft1">NEFT</option>
								</select>	
	           				</div>
						</div>
		

          	
          			<label class="col-md-2 name" for="balanceAmt"> Balance Amount</label>  
           							 <div class="col-md-3">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input readonly="readonly" id="balanceAmount1" name="balanceAmount" class="form-control" placeholder="Balance Amount">
           							 </div>
								</div>
          	
					
	
				
				
	 <script>
		
		$(document).ready(function(){
	  		 $("#paymentMode1").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque1"){
	           	
	           	$("#cheque_no1").show(); 
	           	
	           	$("#neft_acc_no1").hide(); 
	           	$("#card_no1").hide();
	           	}
	          	 else if($(this).attr("value")=="card1"){
	           	
	          		$("#card_no1").show(); 	
	          		
	          		$("#neft_acc_no1").hide(); 
	        		$("#cheque_no1").hide();
	           }
	          	 else if($(this).attr("value")=="neft1"){
	                	
	           		$("#neft_acc_no1").show(); 	
	           		
	           		$("#card_no1").hide(); 
	        		$("#cheque_no1").hide();
	            }
	          	 else if($(this).attr("value")=="cash1"){
	             	
	            		$("#neft_acc_no1").hide(); 
	            		$("#cheque_no1").hide();
	            		$("#card_no1").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected1"){
	             	
	        		$("#neft_acc_no1").hide(); 
	        		$("#cheque_no1").hide();
	        		$("#card_no1").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
						
		</div>	          
			   <div class="row form-group">
				
				  <label class="col-md-3 name" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-usd"></i>
								</span>
	           					<select class="form-control" id="paymentType1">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						
						<div class="col-md-5">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="custPay" name="custPay" class="form-control" placeholder="Enter Amount">
           							 </div>
						</div>
			     </div> 
			 <div class="row form-group" >

            					<div id="cheque_no1" >
            						<!-- <div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum1" placeholder="Cheque No." />  
									</div>
								
									
									<!-- <div class="col-md-2">
										<label class="name">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck1" placeholder="Name On cheque" />  
									</div>
								</div>
											<div id="card_no1" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum1" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_no1" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum1" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName1" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
			          
			          
			     <div class="form-group row">
			            <div class="col-md-10 text-center">
			           	 	<!-- <button id="btn2" name="btn2" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="customerPaymentValidation(); return false;"><h4> Submit</h4></button>
              				<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
			            
			            <input type="button" id="btn2" name="btn2" style="font-size: 25" class="btn btn-large btn-success button-height-width"  onclick="customerPaymentValidation(); return false;" value="Submit">
		            	<input type="reset" id="btn2" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn2" value="Cancel">
			            </div>
			      </div>       	    
			 </form>
	</div>
	
	<!------------ Employee Payment ---------->
	
           <div class="tab-pane" id="messages">
           		<form class="form-horizontal" method="post" action="" name="emp">
   	    	 <div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Employee Payment</h2><br>
			  	</div>
			 
			 <%
								Long Txid3 = 1l;
						%>
						<%
								EmployeePaymentDao dao3=new EmployeePaymentDao();
								List listtxid3=dao3.getEmployeePaymentTxid();
								

								for (int i = 0; i < listtxid3.size(); i++) {
									
								EmployeePaymentBean bean=(EmployeePaymentBean) listtxid3.get(i);
								Txid3=bean.getTxid();
								Txid3++;
							
							}
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: red; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid3);
								%>
								</h3>
						</div><br>
				
					</div>
			 	
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
    	     	 <div class="row form-group">
    	     	
           				 <label class="col-md-3 name" for="employeename">Employee Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</span>
							
							 <%
								EmployeeDetailsDao eedd = new EmployeeDetailsDao();
           						List mList =eedd.getAllMainEmployee();
							
							%>
						<input list="emp_drop" id="employee"  class="form-control">
				<datalist id="emp_drop">
							
							<%
					           for(int i=0;i<mList.size();i++){
					        	   EmployeeDetailsBean detailsBean =(EmployeeDetailsBean)mList.get(i);
							%>
		
						<option data-value="<%=detailsBean.getEmpId()%>" ><%=detailsBean.getFirstName()%> <%=detailsBean.getLastName()%></option>
							<%
				      			}
				    		%>
						</datalist> 
								</div>
           					 </div>
            
           				 <label class="col-md-2 name" for="personName">Accountant Name <sup>*</sup></label>  
	          					  <div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i>
										</span>
	           		 						  <input id="personName2" name="personName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           						 </div>
								</div>
           				 
				 </div>
         	 
         	  	<div class="row form-group">
	           				  
								
								<label class="col-md-3 name" for="reason2">Reason<sup>*</sup></label>  
	          					  <div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-user"></i>
										</span>
	           		 						  <input id="reason2" name="reason2" placeholder="Reason" class="form-control input-md" type="text">
	           						 </div>
								</div>
								
								
					<label class="col-md-2 name" for="paymentMode"> Payment Mode<sup>*</sup></label>  
	           		       <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentMode2">
										<option value="cash2">Cash</option>
										<option value="cheque2">Cheque</option>
										<option value="card2">Card</option>
										<option value="neft2">NEFT</option>
								</select>	
	           				</div>
						</div>
				
			 	</div>
         
        
         
         
            	
	 <script>
		
		$(document).ready(function(){
	  		 $("#paymentMode2").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="cheque2"){
	           	
	           	$("#cheque_no2").show(); 
	           	
	           	$("#neft_acc_no2").hide(); 
	           	$("#card_no2").hide();
	           	}
	          	 else if($(this).attr("value")=="card2"){
	           	
	          		$("#card_no2").show(); 	
	          		
	          		$("#neft_acc_no2").hide(); 
	        		$("#cheque_no2").hide();
	           }
	          	 else if($(this).attr("value")=="neft2"){
	                	
	           		$("#neft_acc_no2").show(); 	
	           		
	           		$("#card_no2").hide(); 
	        		$("#cheque_no2").hide();
	            }
	          	 else if($(this).attr("value")=="cash2"){
	             	
	            		$("#neft_acc_no2").hide(); 
	            		$("#cheque_no2").hide();
	            		$("#card_no2").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected2"){
	             	
	        		$("#neft_acc_no2").hide(); 
	        		$("#cheque_no2").hide();
	        		$("#card_no2").hide(); 
	         }
	          
	       });
	   }).change();
		});	
		</script>
          	
					
	
           					
	  
		<div class="row form-group">
				
				  <label class="col-md-3 name" for="paymentMode"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-hand-right"></i>
								</span>
	           					<select class="form-control" id="paymentType2">
										<!-- <option value="selected">-Select Type--</option> -->
										<option value="credit">Credit</option>
										<option value="debit">Debit</option>
										
								</select>	
	           				</div>
						</div>
						
						  <label class="col-md-2 name" for="paymentMode">Payment Amount <sup>*</sup></label> 
						<div class="col-md-3 ">
										<div class="input-group">
											<span class="input-group-addon">
												Rs
											</span>
           									  <input  id="empPay" name="empPay" class="form-control" placeholder="Enter Amount">
           							 </div>
						</div>
		  						
			     
			     </div> 				  

          
          	<div class="row form-group" >

            					<div id="cheque_no2" >
            						<!-- <div class="col-md-2">										
										<label class="name" style="align:">Cheque No.:</label>
									</div> -->
										
									<div class="col-md-3 col-md-offset-3 first">	
										<input class="form-control" type="text" name="chequeNum" id="chequeNum2" placeholder="Cheque No." />  
									</div>
								
									<!-- <div class="col-md-1">
										<label class="name">Date:</label>
									</div>
									<div class="col-md-3 first">	
										<input class="form-control" type="text" name="cdate" id="chequedate" placeholder="yyyy-mm-dd" />  
									</div> -->
									<!-- <div class="col-md-2">
										<label class="name">Name:</label>
									</div> -->
									<div class="col-md-3 col-md-offset-2 first">	
										<input class="form-control" type="text" name="nameOnCheck" id="nameOnCheck2" placeholder="Name On cheque" />  
									</div>
								</div>
											
											<div id="card_no2" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Card No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="cardNum" id="cardNum2" placeholder="Card No." />  
												</div>
												
											</div>
											
											<div id="neft_acc_no2" class="form-group">
												<!-- <div class="col-md-2 ">
													<label class="name">Account No:</label>
												</div> -->
												<div class="col-md-3 col-md-offset-3 first">	
													<input class="form-control" type="text" name="accNum" id="accNum2" placeholder="Account No." />  
												</div>
												<!-- <div class="col-md-2 ">
													<label class="name">Bank Name</label>
												</div> -->
												<div class="col-md-3 col-md-offset-2 first">	
													<input class="form-control" type="text" name="bankName" id="bankName2" placeholder="Name Of Bank" />  
												</div>
												</div>
								</div>
         
        
         
         <div class="form-group row">
            <div class="col-md-12 text-center">
              	<!-- <button id="btn3" name="btn3" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="EmployeeValidation(); return false;"><h4> Submit</h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
            
            <input type="button" id="btn3" name="btn3" style="font-size: 25" class="btn btn-large btn-success button-height-width"  onclick="EmployeeValidation(); return false;" value="Submit">
		    <input type="reset" id="btn2" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn2" value="Cancel">
            </div>
          </div>       	    
 	 </form> 
 </div>
           
           
         <!------------------   Expenditure Payment ------------>
                
       <div class="tab-pane" id="settings">
		<form method="post" action="" name="expensePaymentForm">
			<div class="row">
			    <div align="center">
			  		<h2 class="form-name style_heading">Expenditure Payment</h2><br>
			  	</div>
			 
			 <%
								Long Txid4 = 1l;
						%>
						<%
						
						
								ExpenditurePaymentDao dao4=new ExpenditurePaymentDao();
								List listtxid4=dao4.getExpenditurePaymentTxid();
								

								for (int i = 0; i < listtxid4.size(); i++) {
									
									ExpenditurePaymentBean bean=(ExpenditurePaymentBean) listtxid4.get(i);
									Txid4=bean.getTxId();
									Txid4++;
							
							}
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: red; padding-right: 100px;">
								Transaction ID ::
								<%
									out.println(Txid4);
								%>
								</h3>
						</div>
				
					</div><br>
						
		     <div class="row">
				     <div class="col-sm-offset-1 col-md-10">
						  		<hr style="border-top-color:#c1b1b1;">
				     </div>	
		   		 </div>
		    </div>
			 <div class="row form-group">
           		<label class="col-md-3 name" for="expenditureName">Expenditure Name<sup>*</sup></label>  
           	 	      		 <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
										
							<!-- Following code is to get expense name from "expenditure_details" table of "fertilizer" DB -->
							<!-- getAllExpenseName() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
							ExpenditureDetailsDao exdd = new ExpenditureDetailsDao();
           						List exList =exdd.getAllExpenseName();
							
							%>
							
							<input list="exp_drop" id="expenseName" class="form-control">
				<datalist id="exp_drop">
							
							<%
					           for(int i=0;i<exList.size();i++){
					        	   ExpenditureDetailsBean expbean =(ExpenditureDetailsBean)exList.get(i);
							%>
		
							<option data-value="<%=expbean.getPkExpenseDetailsId()%>" value="<%=expbean.getExpenseName()%>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
           	 	<label class="col-md-3 name" for="contactNumber">Contact Number<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
             					 <input type="text" id="contactNumber" name="contactNumber" placeholder="Contact Number" class="form-control input-md" onkeypress="return isNumber(event)" maxlength="10" >
           				 </div>
					</div>
			</div>
			
			<div class="row form-group">
					<label class="col-md-3 name" for="personName">Accountant Name<sup>*</sup> </label>  
	          		 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
	           		 			<input id="accountantName" name="personName" placeholder="Accountant Name" class="form-control input-md" type="text">
	           			</div>
					</div>
					
					
					 <label class="col-md-3 name" for="paymentMode4"> Payment Type<sup>*</sup></label>  
	           		<div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
										<i class="glyphicon glyphicon-usd"></i>
								</span>
	           					<select class="form-control" id="paymentType3">
									<!-- 	<option value="selected4">-Select Type--</option> -->
										<option value="credit4">Credit</option>
										<option value="debit4">Debit</option>
										
								</select>	
	           				</div>
						</div>
					</div>
				
				
				<script>
		
		$(document).ready(function(){
	  		 $("#paymentType3").change(function(){
	       	$(this).find("option:selected").each(function(){
	           	if($(this).attr("value")=="credit4"){
	           	
	           	$("#credit").show(); 
	           	
	           	$("#debit").hide(); 
	           	}
	          	 else if($(this).attr("value")=="debit4"){
	           	
	          		$("#credit").hide(); 
		           	
		           	$("#debit").show();
	           }
	          	 else if($(this).attr("value")=="selected4"){
	          		$("#credit").hide(); 
		           	
		           	$("#debit").hide();
	            }
	          	/*  else if($(this).attr("value")=="cash3"){
	             	
	            		$("#neft_acc_no3").hide(); 
	            		$("#cheque_no3").hide();
	            		$("#card_no3").hide(); 
	             }
	           	
	          	else if($(this).attr("value")=="selected3"){
	             	
	        		$("#neft_acc_no3").hide(); 
	        		$("#cheque_no3").hide();
	        		$("#card_no3").hide(); 
	         } */
	          
	       });
	   }).change();
		});	
		</script>	
					
					
				<div id="credit" class="row form-group">	
				<label class="col-md-3 name" for="expCredit">Credit Amount<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								Rs
							</span>
             					 <input id="expCredit" name="expCredit" placeholder="Credit Amount" class="form-control input-md" type="text" >
           				 </div>
					</div>
				</div>
				
				<div id="debit" class="row form-group">	
					<label class="col-md-3 name" for="expDebit">Debit Amount<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								Rs
							</span>
             					 <input id="expDebit" name="expDebit" placeholder="Debit Amount" class="form-control input-md" type="text" >
           				 </div>
					</div>
			
			</div>	
					
				
		<div class="form-group row">
            <div class="col-md-12 text-center">
             	<!-- <button id="save" name="btn4" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="expensePaymentValidation(); return false;"><h4> Submit</h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
            
            <input type="button" id="save" name="expensePaymentBtn" style="font-size: 25" class="btn btn-large btn-success button-height-width"  onclick="expensePaymentValidation(); return false;" value="Submit">
		    <input type="reset" id="btn2" style="font-size: 25" class="btn btn-large btn-danger   button-height-width" name="btn4" value="Cancel">
            </div>
        </div> 
			
     </form>
	</div>
           
   </div>
  </div>
 </div>
</div>
</body>	

<%@include file="commons/newFooter.jsp" %>
 