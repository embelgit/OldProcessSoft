<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="java.util.List"%>

<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta charset="utf-8">
<title>Tax Creation</title>
<script type="text/javascript" src="/processSoft/staticContent/js/taxCreation.js"></script>

<script type="text/javascript">
  			function Back()
  			{
  				window.location = "tax.jsp" ;
  			}
  		</script>

<script type="text/javascript">
				function ChooseContact(data)
					{
						
						document.getElementById("taxPercentage").value=(data.options[data.selectedIndex].getAttribute("myid"));
					}
</script> 

</head>
 <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading">Edit Tax Detail</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" name="txc"><!-- Value of 'name' attribute is used in  taxCreation.js  -->
          <fieldset>
          		<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				 <div class="row form-group">
           				<label class="col-md-2 control-label" for="taxType">Tax Type<sup>*</sup></label>  
		           	 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							<%
							TaxCreationDao cdd = new TaxCreationDao();
           						List cList =cdd.getAllMainTax1(request);
							
							%>
							<input list="tax_drop1" id="taxType1"  class="form-control">
				<datalist id="tax_drop1">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   TaxCreationBean cat=(TaxCreationBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getTxId()%>" value="<%=cat.getTaxType()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
					<label class="col-md-2 control-label" for="taxType">New Tax Name<sup>*</sup></label>  
		           	 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-hand-right"></i>
							</span>
							 <input id="taxName" name="taxName" placeholder="New Tax Name" class="form-control input-md" type="text" >
            			</div>
            		</div>
            	
				</div>
				 <div class="row form-group">
				 <label class="col-md-2 control-label" for="taxPercentage">New Tax Percentage<sup>*</sup></label>  
            		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								%
							</span>
              					 <input type="text"  name="taxPercentage" id="taxPercentage" class="form-control" placeholder="New Tax Percentage">	
            			</div>
					</div>
				 </div>
				<div class="form-group row">
           			<div class="col-md-10 text-center">

					<input type="button" id="save2" name="btn" style="font-size: 25" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="editTax()" value="Update">
					<input id="reset" name="btn1" style="font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="reset()" value="Cancel">
 					<input style=" height: 65px; width: 180; font-size: 25" type="button" value="Back" id="listBtn" class="btn btn-primary" onclick="Back()" /> 

            		</div>
          		</div>
			</fieldset>
		</form>
	</div>
	
	<%@include file="commons/newFooter.jsp" %>
	
<%-- <%@include file="commons/footer.jsp" %> --%>