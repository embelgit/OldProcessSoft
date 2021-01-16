<!-- InwardProcess1.jsp -->
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>

<%@page import="com.Fertilizer.hibernate.InwardProcessingInformation"%>
<%@page import="com.Fertilizer.dao.InwardProcess1Dao"%>
<%@page import="com.Fertilizer.hibernate.OperationDetailsBean"%>

<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta charset="utf-8">
<title>Inward Process 1</title>

<script type="text/javascript" src="/processSoft/staticContent/js/inwardProcess1.js"></script>


<script type="text/javascript">
function InwardProcess1List()
	 {
		document.getElementById('inwardProcess1ListBtn').disabled = true;
	 	window.location = "InwardProcess1List.jsp";
	 }
function editTax() {
		 document.getElementById('editBtn').disabled = true;
		 window.location = "TaxEdit.jsp";
}
function goToInward()
{
	document.getElementById('inwardBtn').disabled = true;
	window.location = "InwardProcessing.jsp";
}
function goToOoutward() {
	 document.getElementById('outwardBtn').disabled = true;
	 window.location = "packing.jsp";
}


	 function checkForDuplicateTAXEntry(){
			<%
			TaxCreationDao dao4 = new TaxCreationDao();
			List list = dao4.getAllMainTax1(request);
			%>
			
			<%
			int z = 0;
			for(z=0;z<list.size();z++){
				TaxCreationBean bean = (TaxCreationBean)list.get(z);
			%>
			var taxName = "<%=bean.getTaxType()%>";          	
			if(document.getElementById("taxType").value ==taxName ){
				alert("Tax Name already exist...Duplicate Not allowed");
				location.reload();
				return false;
			}
			<%
			}
			%>
			}
</script>
</head>
<body>
<div class="row header_margin_top">
	<div class="bill-heading" align="center">
		<%
			InwardProcess1Dao dao2 = new InwardProcess1Dao();
   			List operaionNameList =dao2.getInwardProcess1Operaion();
   			
   			Long pkOperationDetailsId = 0l;
   			String operationName = "";
   			
   			for(int i=0;i<operaionNameList.size();i++){
	    		 OperationDetailsBean operaionBean =(OperationDetailsBean)operaionNameList.get(i);
	    		 
	    		 pkOperationDetailsId = operaionBean.getPkOperationDetailsId();
	    		 operationName = operaionBean.getOperationName();
	    		 //System.out.println("operaionBean.getPkOperationDetailsId() :-"+operaionBean.getPkOperationDetailsId());
	    		 //System.out.println("operaionBean.getOperationName() :-"+operaionBean.getOperationName());
   			}
		%>
		<h2 class="form-name style_heading">Inward Process 1 <%=operationName%></h2>
	</div>
</div>
<div class="row">
	<div class="col-sm-offset-1 col-md-10">
		<hr style="border-top-color:#c1b1b1;">
	</div>
</div>
<div class="container">
<div class="col-sm-offset-1 ">
	<form class="form-horizontal" method="post" action="" name="txc"><!-- Value of 'name' attribute is used in  taxCreation.js  -->
		<fieldset>
 			<div class="row form-group">
 				<div class="col-md-6">
 					<%@include file="commons/clock.jsp" %>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-md-2 control-label" for="purchaseOrderNo">PO No</label>
				<div class="col-md-3">
 				<div class="input-group">
					<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i></span>
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
						<%
							InwardProcess1Dao cdd = new InwardProcess1Dao();
							List<InwardProcessingInformation> IPList=null;
           					IPList =cdd.getAllPurchaseOrderNo();
						%>
<!-- 						<input list="cat_drop" id="taxType"  class="form-control" onchange="checkForDuplicateTAXEntry()"> -->
						<input list="purchaseOrderNo_drop" id="purchaseOrderNo"  class="form-control" onchange="getChallanNo()" placeholder="Select purchase order no">
						<datalist id="purchaseOrderNo_drop">
						<%
					    	for(int i=0;i<IPList.size();i++){
					    		InwardProcessingInformation inwardBean = (InwardProcessingInformation)IPList.get(i);
						%>
						<option data-value="<%=inwardBean.getInwardProcessingInfoPk()%>" value="<%=inwardBean.getPurchaseOrderNo()%>">
						<%
				      		}
				    	%>
            			</datalist>
            	</div>
            	</div>
            	<label class="col-md-2 control-label" for="challanNo">Challan No<sup>*</sup></label>  
            	<div class="col-md-3">
            	<div class="input-group">
					<span class="input-group-addon"><i class="	glyphicon glyphicon-hand-right"></i></span>
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
					<%
					InwardProcess1Dao cdd1 = new InwardProcess1Dao();
					List<InwardProcessingInformation> ChallanNoIPList=null;
            			ChallanNoIPList =cdd1.getAllChallanNumber();
					%>
<!-- 					<input type="text" id="challanNo" name="challanNo" class="form-control"> -->
					<input list="challanNo_drop" id="challanNo"  class="form-control" placeholder="Challan number">
						<datalist id="challanNo_drop">
						<%
					    	for(int i=0;i<ChallanNoIPList.size();i++){
					    		InwardProcessingInformation inwardBean = (InwardProcessingInformation)ChallanNoIPList.get(i);
						%>
						<option data-value="<%=inwardBean.getInwardProcessingInfoPk()%>" value="<%=inwardBean.getChallanNo()%>">
						<%
				      		}
				    	%>
            			</datalist>
            	</div>
				</div>
			</div>
			<div class="row form-group">
				<label class="col-md-2 control-label" for="sendToOperationName">Send To Operation</label>  
				<div class="col-md-3">
 				<div class="input-group">
					<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i></span>
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
						<%
						InwardProcess1Dao dao1 = new InwardProcess1Dao();
   						List operaionList =dao1.getAllOperaion();
						%>
						<input type="hidden" id="pkOperationDetailsId" name="pkOperationDetailsId" value="<%=pkOperationDetailsId%>" />
						<input type="hidden" id="operationName" name="operationName" value="<%=operationName%>" />
						<input list="sendToOperationName_drop" id="sendToOperationName"  class="form-control" onchange="checkForDuplicateTAXEntry()" placeholder="Select operation name">
						<datalist id="sendToOperationName_drop">
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
            	<label class="col-md-2 control-label" for="taxPercentage">Comment</label>
            	<div class="col-md-3">
            	<div class="input-group">
					<span class="input-group-addon"><i class="	glyphicon glyphicon-hand-right"></i></span>
					<textarea rows = "5" cols = "50" id="comment" name = "comment" class="form-control" placeholder="Enter your comment"></textarea>
            	</div>
				</div>
			</div>
			</br>
			<div class="form-group row">
           		<div class="col-md-12 text-center">
           			 <!--  txCreation() function is implemented in  taxCreation.js -->
					<input type="button" id="saveInwardProcess1DetailsBtn" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-success   button-height-width" onclick="validationInwardProcess1Details()" value="Submit">
					<input id="reset" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
					
					<input style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" type="button" value="List" id="inwardProcess1ListBtn" class="btn btn-primary btn-large  button-height-width " onclick="InwardProcess1List()" /> 
<!--               		<input style="  font-size: 25" type="button" value="Edit" id="editBtn" class="btn btn-primary  btn-large  button-height-width" onclick="editTax()" /> -->
              		<input style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" type="button" value="Inward" id="inwardBtn" class="btn btn-primary  btn-large  button-height-width" onclick="goToInward()" />              		
              		<input style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" type="button" value="Outward" id="outwardBtn" class="btn btn-primary  btn-large  button-height-width" onclick="goToOoutward()" />
<!--              	 <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addTax()"><h4> Submit</h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
            	</div>
          	</div>
		</fieldset>
	</form>
</div>
</div>
</body>
	
	<%@include file="commons/newFooter.jsp" %>
	
