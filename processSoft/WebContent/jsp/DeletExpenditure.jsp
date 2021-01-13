<!-- DeletExpenditure.jsp -->

<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="com.Fertilizer.hibernate.ExpenditureDetailsBean"%>
<%@page import="com.Fertilizer.dao.ExpenditureDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.GodownEntry"%>
<%@page import="com.Fertilizer.dao.GodownEntryDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/DeletExpenditure.js"></script>


 <script type="text/javascript">
  			function Back()
  			{
  				window.location = "ExpenditureList.jsp";
  			}
  		</script>

</head>
		 	<div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownDetails") %> <%}%> <%if(abc.equals("english")){%>Delete Expenditure Name<%}%> </h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
	<div class="container col-sm-offset-2" >
        <form class="form-horizontal" method="post" action="" name="delPro"> <!-- Value of 'name' attribute is used in categoryDetails.js  -->
          <fieldset>
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div>
			 <div class="row form-group">
           		<label class="col-md-offset-2  col-md-2  control-label" for="godown"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("godownName") %> <%}%> <%if(abc.equals("english")){%>Expenditure Name<%}%><sup>*</sup></label>  
           	 		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ExpenditureDetailsDao dao = new ExpenditureDetailsDao();
           						List unitList =dao.getAllExpenseNames(request);
							
							%>
							<input list="delExpenditureName_drop" id="delExpenditureName"  class="form-control">
				<datalist id="delExpenditureName_drop">
							<%
					           for(int i=0;i<unitList.size();i++){
					        	   ExpenditureDetailsBean bean =(ExpenditureDetailsBean)unitList.get(i);
					        	   System.out.println("getPkExpenseDetailsId :-"+bean.getPkExpenseDetailsId());
					        	   System.out.println("getExpenseName :-"+bean.getExpenseName());					        	  
							%>
							<option data-value="<%=bean.getPkExpenseDetailsId()%>" value="<%=bean.getExpenseName()%>">
							<%
				      			}
				    		%>
            			</datalist>
            			</div>
           		 	</div>
				</div>
				
		<div class="form-group row">
		<div class="col-md-10 text-center">
		           <!--  "catDetails()" function is implemented in categoryDetails.js -->
       		<input type="button"  id="btn" name="btn" style="font-size: 25" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="deleteExpenditureValidation()" value="Submit">
       		<input  id="save" name="btn" style="font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()" value="Cancel">
       		<input style="  font-size: 25" type="button" value="Back" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="Back()" />
		</div>
        </div>
		</fieldset>
       </form>
     </div>
     
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
				