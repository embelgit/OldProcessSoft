
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.bean.GetTaxDetails"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/DelProduct.js"></script>


 <script type="text/javascript">
  			function Back()
  			{
  				window.location = "taxList.jsp" ;
  			}
  		</script>

</head>
		 	<div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownDetails") %> <%}%> <%if(abc.equals("english")){%>Delete Tax<%}%> </h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" name="deltax"> <!-- Value of 'name' attribute is used in categoryDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-offset-2  col-md-2  control-label" for="godown"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownName") %> <%}%> <%if(abc.equals("english")){%>Tax Name<%}%><sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							TaxCreationDao dao = new TaxCreationDao();
           						List unitList1 =dao.getAllMainTax1(request);
							
							%>
							<input list="Tax_drop1" id="delTax"  class="form-control">
				<datalist id="Tax_drop1">
							<%
					           for(int i=0;i<unitList1.size();i++){
					        	   TaxCreationBean bean =(TaxCreationBean)unitList1.get(i);
							%>
		
							<option data-value="<%=bean.getTxId()%>" value="<%=bean.getTaxType()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
           		 	</div>
				</div>
				<br>
				<div class="form-group row">
		            <div class="col-md-10 text-center">
		           <!--  "catDetails()" function is implemented in categoryDetails.js -->
       	<input type="button"  id="btn" name="btn" style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="deletetax()" value="Submit">
       	<input  id="save" name="btn" style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()" value="Cancel">
       	<input style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" type="button" value="Back" id="listBtn" class="btn btn-primary" onclick="Back()" /> 
              	
              	<%-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="GoDetails()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%> </h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4> Cancel</h4> </button> --%>


		            </div>
         </div>
		</fieldset>
       </form>
     </div>
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				