<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
<%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>
 
<head>
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/bootstrap.min.css"> -->
<meta charset="utf-8">
<script type="text/javascript" src="/processSoft/staticContent/js/shopdetails.js"></script>
</head>
<script type="text/javascript">
function checkForDuplicateShopEntry(){
	<%
	shopDetailsDao dao4 = new shopDetailsDao();
	List list = dao4.getAllShops();
	%>
	
	<%
	int z = 0;
	for(z=0;z<list.size();z++){
		shopDetailsBean bean = (shopDetailsBean)list.get(z);
	%>
	var shopName = "<%=bean.getShopName()%>";          	
	if(document.getElementById("shopName").value ==shopName ){
		alert("Shop Name already exist...Duplicate Not allowed");
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
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("categoryDetails") %> <%}%> <%if(abc.equals("english")){%>Shop Details<%}%> </h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
    
	<%-- <div class="container col-sm-offset-2" >
         <!-- Value of 'name' attribute is used in categoryDetails.js  -->
			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
			</div> --%>
			<!-- -- tabs by RK  -->
		<!-- <ul class="nav nav-tabs" style="background-color: white;">
	    <li class="active"><a data-toggle="tab" href="#Category1"><h4 style="color:blue">Category</h4></a></li>
	     <li><a data-toggle="tab" href="#subCategory1"><h4 style="color:blue">Sub Category</h4></a></li>
	    
 	 </ul> -->
 	<!--  <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>
		     </div>
 	 <div class="tab-content" style="float: left"> -->
 	 
 	 <!-- ----- Shop by RK -->
 	 <div id="shopDetail">
 	 <form id="saveShopDetails" class="form-horizontal" method="post" action="" name="catd">
 	 
 	 		<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
		
							  <%
								Long shopid = 1l;
						%>
						<%
							shopDetailsDao dao=new shopDetailsDao();
							List listtxid=dao.getShopId();
								

								for (int i = 0; i < listtxid.size(); i++) {
									
									shopDetailsBean bean=(shopDetailsBean) listtxid.get(i);
									shopid=bean.getShopId();
									shopid++;
							 
							} 
						%>
						
					<div>
						
						<div align="right">
								<h3 style="color: red; padding-right: 150px">
								Shop ID ::
								<%
									out.println(shopid);
								%>
								</h3>
						</div>				
					</div>
			 <div class="row form-group" >
           		<label class="col-md-5  control-label" for="categoryName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("catName") %> <%}%> <%if(abc.equals("english")){%>Shop Name<%}%><sup>*</sup></label>  
           	 		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-list-alt"></i>
							</span>
              				<input id="shopName" name="shopName" placeholder="shop Name" class="form-control input-md" type="text" onchange="checkForDuplicateShopEntry()">
            			</div>
           		 	</div>
				</div>
				<br>
				<br>
				
				<div class="form-group row">
		            <div class="col-md-12 text-center">
		           <!--  "catDetails()" function is implemented in categoryDetails.js -->
		           	
		           	<input type="button" id="submitBtn" name="submit" style=" height: 65px; width: 130px; font-size: 25" style="font-size: 25" class="btn btn-large btn-success button-height-width" onclick="shopDetails()" value="Submit">
		            <input style=" height: 65px; width: 130px; font-size: 25" type="reset" style="font-size: 25" class="btn btn-large btn-danger  button-height-width" id="save" name="btn" value="Cancel" onclick="reset()">
		     
		       <%--  <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="catDetails()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%></h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("cancel") %> <%}%> <%if(abc.equals("english")){%>Cancel<%}%> </h4> </button>
 --%>

		 </div>
         </div>
         </form>
         </div>
       
     </div>
     </div>
     <%@include file="commons/newFooter.jsp" %>
     
<%-- <%@include file="commons/footer.jsp" %> --%>
	