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
function expenditureList(){
	window.location = "ExpenditureList.jsp";
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
			if(document.getElementById("expenseName").value ==expName ){
				alert("Expenditure Name already exist...Duplicate Not allowed");
				location.reload();
				return false;
			}
			<%
			}
			%>
			} 

</script>
<body>

<div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			  		<h2 class="form-name style_heading">Expenditure Detail</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container" >
	<div class="col-sm-offset-3">
	        <form id="expenseDetails" class="form-horizontal" method="post" action="" name="expenseDetails"><!-- Value of 'name' attribute is used in customerDetails.js  -->
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
							<input list="cat_drop" id="expenseName"  class="form-control" onchange="checkForDuplicateExpEntry()"  onkeypress="return isAlphabetsWithSpace(event)"/>
				<datalist id="cat_drop">
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
           		 <br>
           		 <br>
           		 <div class="form-group row">
		            <div class="col-md-9 text-center">
		            	<input type="button"  id="submitBtn" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addExpenseDetails()" value="Submit">
		            	<input id="save" name="btn" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
	           		 	<input type="button" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" value="List" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="expenditureList()" />
		            	<input type="button" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" value="Edit" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="editExpenditure()" />
		            	<!-- <button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
	           		 </div>
         		</div>
           	</fieldset>
          </form>
         </div>
         </div>
         </body>
         
         <%@include file="commons/newFooter.jsp" %>
         
       <%-- <%@include file="commons/footer.jsp" %> --%>