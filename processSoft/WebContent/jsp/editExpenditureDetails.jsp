<%@page import="com.Fertilizer.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.Fertilizer.dao.ExpenditureDetailsDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/expenditureDetails.js"></script>
<script type="text/javascript">
			function isNumber(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        return false;
		    }
		    return true;
		}
	   </script>	
		<script type="text/javascript">
			function isAlphabets(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if ((charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122))) {
		        return false;
		    }
		    return true;
			}
		</script>
		<script type="text/javascript">
			function isAlphabetsWithSpace(evt) {
		    evt = (evt) ? evt : window.event;
		    var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (charCode!=32 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) {
		        return false;
		    }
		    return true;
			}
		</script>
</head>
<script type="text/javascript">
function Back(){
	window.location = "expenditureDetails.jsp";
}
function editExpenditure() {
	window.location = "editExpenditureDetails.jsp";
} 
</script>
<script type="text/javascript">
function taxlist()
	 {
	 window.location = "taxList.jsp";
	 }
	 function editTax() {
		window.location = "TaxEdit.jsp";
}


	 function checkForDuplicateExpEntry(){
			<%
			ExpenditureDetailsDao dao4 = new ExpenditureDetailsDao();
			List list = dao4.getAllExpenseNames(request);
			%>
			
			<%
			int z = 0;
			for(z=0;z<list.size();z++){
				ExpenditureDetailsBean bean = (ExpenditureDetailsBean)list.get(z);
			%>
			var expName = "<%=bean.getExpenseName()%>";          	
			if(document.getElementById("NewExpenseName").value ==expName ){
				alert("Expenditure Name already exist...Duplicate Not allowed");
				//document.getElementById("NewExpenseName").value = "";
				//document.getElementById('NewExpenseName').focus();
				location.reload();
				return false;
			}
			<%
			}
			%>
			}
</script>

<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading">Edit Expenditure Detail</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" id="updateExpenseDetails" name="updateExpenseDetails"><!-- Value of 'name' attribute is used in customerDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-3 control-label" for="expenseName">Expenditure Name<sup>*</sup></label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>            				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							ExpenditureDetailsDao cdd = new ExpenditureDetailsDao();
           						List cList =cdd.getAllExpenseName();
							%>
							<input list="expenseName_drop" id="expenseName"  class="form-control" onchange="getExpenditureDetails()"  onkeypress="return isAlphabetsWithSpace(event)"/>
							<datalist id="expenseName_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   ExpenditureDetailsBean cat=(ExpenditureDetailsBean)cList.get(i);
							%>
							<option data-value="<%=cat.getPkExpenseDetailsId()%>" value="<%=cat.getExpenseName()%>">
							<%
				      			}
				    		%>
            				</datalist>
            			</div>
           		 	</div>
           		 </div>
           		 <div class="row form-group">
           			<label class="col-md-3 control-label" for="expenseName">Expenditure Name<sup>*</sup></label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<input type="text" id="NewExpenseName" class="form-control"  onkeypress="return isAlphabetsWithSpace(event)"/>
            			</div>
           		 	</div>
           		 </div>
           		 <div class="form-group row">
		            <div class="col-md-10 text-center">
		            	<!-- <input type="button"  id="save" name="btn" style="font-size: 25" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addExpenseDetails()" value="Submit">
		            	<input id="save" name="btn" style="font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
	           		 	<input type="button" style=" font-size: 25" value="Expenditure List" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="expenditureList()" />
		            	<input type="button" style=" font-size: 25" value="Edit" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="editExpenditure()" /> -->
		            	
		            	<input style="font-size: 25" id="UpdateBtn" name="UpdateBtn" value="Update" style="font-size: 25" class="btn btn-large btn-success   button-height-width"  onclick="updateExpenseDtlValidation()"/>
              			<input  style="font-size: 25" class="btn btn-large btn-danger glyphicon  button-height-width"  type="reset"  onclick="reset()"/> 
           				<input style="font-size: 25" type="button" value="Back" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="Back()" />
		            </div>
         		</div>
           	</fieldset>
          </form>
         </div>
         
         <%@include file="commons/newFooter.jsp" %>
         
       <%-- <%@include file="commons/footer.jsp" %> --%>