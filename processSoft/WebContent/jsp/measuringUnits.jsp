
<%@page import="com.Fertilizer.hibernate.MeasuringUnitsBean"%>
<%@page import="com.Fertilizer.dao.MeasuringUnitsDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/units.js"></script>



<script type="text/javascript">
function measuringUnitsList(){
	window.location = "MeasuringUnitsList.jsp";
}
function editExpenditure() {
	window.location = "editExpenditureDetails.jsp";
} 
</script>
<script type="text/javascript">
function checkForDuplicateSupplierIdEntry(){
		<%
		MeasuringUnitsDao dao4 = new MeasuringUnitsDao();
		List list = dao4.getAllUnits();
		%>
		
		<%
		int z = 0;
		for(z=0;z<list.size();z++){
			MeasuringUnitsBean bean = (MeasuringUnitsBean)list.get(z);
		
		%>
		var unitName = "<%=bean.getUnitName()%>";          	
		if(document.getElementById("unitName").value ==unitName ){
			alert("unit Name already exist...Duplicate Not allowed");
			location.reload();
			return false;
		}
		<%
		}
		%>	
		} 
</script>
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
<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading">Measuring Units</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container" >
        <form class="form-horizontal" method="post" action="" name="munits"><!-- Value of 'name' attribute is used in customerDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-2 control-label" for="unitName">SI Unit<sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							MeasuringUnitsDao dao = new MeasuringUnitsDao();
           						List taxPerList =dao.getAllUnits();
							
							%>
							<input list="unitName_drop" id="unitName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" onkeypress="return isAlphabetsWithSpace(event)"/>
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
           		 	</div>
           		 	
           		 	<label class="col-md-2 control-label" for="unitDescription">SI Unit Description<sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							MeasuringUnitsDao dao1 = new MeasuringUnitsDao();
           						List unitList =dao1.getAllUnits();
							
							%>
							<input list="unitName_drop1" id="unitDescription"  class="form-control" onkeypress="return isAlphabetsWithSpace(event)"/>
				<datalist id="unitName_drop1">
							<%
					           for(int i=0;i<unitList.size();i++){
					        	   MeasuringUnitsBean bean1 =(MeasuringUnitsBean)unitList.get(i);
							%>
		
							<option data-value="<%=bean1.getPkUnitId()%>" value="<%=bean1.getUnitDescription()%>">
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
		            <div class="col-md-11 text-center">
		            <!--  "customerDetails()" function is implemented in customerDetails.js  -->
	           		 
	           		<input type="button" id="save" name="btn" style="font-size: 25;width: 130px;" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="AddMeasuringUnit()" value="Submit">
	           		<input id="save" name="btn" style="font-size: 25;width: 130px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
	           		<input type="button" style=" font-size: 25;width: 130px;" value="List" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="measuringUnitsList()" />
		            <!-- <input type="button" style=" font-size: 25" value="Edit" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="editExpenditure()" /> -->
		            	
	           		<!--  <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="addUnit()"><h4> Submit</h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> -->
	           		 
	           		 </div>
         		</div>
           	</fieldset>
          </form>
         </div>
       <%@include file="commons/newFooter.jsp" %>