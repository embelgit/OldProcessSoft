<%@page import="com.Fertilizer.hibernate.OperationDetailsBean"%>
<%@page import="com.Fertilizer.dao.OperationDetailsDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/operationDetails.js"></script>


<script type="text/javascript">
function operationDetailsList(){
	window.location = "operationDetailsList.jsp";
}
function editExpenditure() {
	window.location = "editExpenditureDetails.jsp";
} 
</script>
</head>
<body>
<div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			  		<h2 class="form-name style_heading">Operation Details</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container" >
	<div class=col-sm-offset-1>
        <form  id="operationDetails" class="form-horizontal" method="post" action="" name="operationDetails"><!-- Value of 'name' attribute is used in customerDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-4 control-label" for="operationName">Operation Details<sup>*</sup></label>  
           	 		<div class="col-md-4">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
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
           		 </div>
           		 <br>
           		 <div class="form-group row">
		            <div class="col-md-11 text-center">
		            <input type="button"  id="submitBtn" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addOperationDetails()" value="Submit">
		            <input   id="save" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
	           		<input type="button" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" value="List" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="operationDetailsList()" />
		            <!-- <input type="button" style=" font-size: 25" value="Edit" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="editOperation()" /> -->
		            
	           		 	<!-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addExpense()"><h4> Submit</h4></button>
              			<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
	           		 </div>
         		</div>
           	</fieldset>
          </form>
          </div>
         </div>
         </body>
         
        <%--  <%@include file="commons/newFooter.jsp" %> --%>
         
       <%-- <%@include file="commons/footer.jsp" %> --%>