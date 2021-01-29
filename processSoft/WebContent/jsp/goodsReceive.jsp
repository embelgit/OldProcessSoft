<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.GrDetailsBean"%>
<%@page import="com.Fertilizer.helper.ProductDetailsHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="java.util.* "%>
<% boolean isHome=false;%>
<%@include file="commons/header.jsp"%>
<head>
 <meta charset="utf-8">
  <script type="text/javascript" src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
     
  
	 <link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
     <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
     <!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css"> -->
     
     <link rel="stylesheet" href="/processSoft/staticContent/y_css/jquery-ui.css">
  <!--  -->   <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.css">
  <!--  -->    <script type="text/javascript" src="/processSoft/staticContent/js/jquery.min.js"></script>
    <script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui-min.js"></script>
    <script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui.js"></script>
    <script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
    <script type="text/javascript" src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
 
 <script type="text/javascript" src="/processSoft/staticContent/js/poDetails.js"></script>
 <script type="text/javascript" src="/processSoft/staticContent/js/productDetail.js"></script>
 <script type="text/javascript" src="/processSoft/staticContent/js/supplierDetails.js"></script>	


<script type="text/javascript">
function refreshGR() {                         
    //Refresh page implementation here
    //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
	window.location.href="goodsReceive.jsp";
    window.close();
}
</script>
<script type="text/javascript">
function productDetailslist(){
	document.getElementById('productListBtn').disabled = true;
	window.location = "productList.jsp";
}
function editProductDetails() {
	document.getElementById('editProductDtlBtn').disabled = true;
	window.location = "editProductDetails.jsp";
} 
</script>
<script type="text/javascript">
function supplierlist(){
	window.location = "supplierList.jsp";
}
function editSupplier(){
	window.location = "editSupplierDetails.jsp";
}
          		 
          		 
          		 function checkForDuplicateSupplierIdEntry(){
          			<%
          			GoodsReceiveDao dao4 = new GoodsReceiveDao();
          			List list = dao4.getAllSupplier1();
          			%>
          			
          			<%
          			int z = 0;
          			for(z=0;z<list.size();z++){
          				GrDetailsBean bean = (GrDetailsBean)list.get(z);
          			%>
          			var supId = "<%=bean.getIdno()%>";
          			var pkid ="<%=bean.getPk_GRDetails_id()%>"
          			var bill = "<%=bean.getBillno()%>"
          	
          			if(document.getElementById("BillNo").value == bill ){
          				alert("Bill No already exist...Duplicate Not allowed");
          				location.reload();
          				return false;
          			}
          			<%
          			}
          			%>
          			
          			} 
</script>
<script type="text/javascript">
    function mypopup(url)
    {
        /* width = window.screen.width;
        height = window.screen.height; */
        width ='1050px';
        height = '600px';
        mywindow = window.open(url, "Title",
            "location=0,status=1,scrollbars=1,resizable=1,menubar=0,toolbar=no,width="
                        + width + ",height=" + height);
        mywindow.moveTo(140, 50);
        mywindow.focus();
    }
</script>
<script type="text/javascript">
     		<%   		
     		String pattern = "yyyy-MM-dd";
     		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
     		String todayDate = simpleDateFormat.format(new Date());
     		
     		System.out.println(todayDate);
    %> 	
</script>

<script type="text/javascript">
	function suppDetailsDivAction(a)
	{	
		if(a==1)
	    {
	       	document.getElementById("myModal").style.display="block";
	    }
	    else
	    {
	       	document.getElementById("myModal").style.display="none";
	    }
		
		$('#supplierDivId').load(document.URL +  ' #supplierDivId');
	}
</script>
	<script type="text/javascript">
	function prodDetailsDivAction(a)
	{	
		if(a==1)
	    {
	       	document.getElementById("myModal1").style.display="block";
	    }
	    else
	    {
	       	document.getElementById("myModal1").style.display="none";
	    }
		
		$('#productDivId').load(document.URL +  ' #productDivId');
	}
	</script>     		
</head>
<body >
   <div class="row header_margin_top">
			    <div class="bill-heading"align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("poDetails") %> <%}%> <%if(abc.equals("english")){%>Goods Receive<%}%></h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
      <div class="container" >
      <div class="col-sm-offset-1">
        <form class="form-horizontal" method="post" action="" name="spld1" ><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
       			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				
				<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>ID No<%}%> </label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon">
						</span>
             				 <input id="IdNo" name="IdNo "  autofocus="IdNo"  onclick="checkForDuplicateSupplierIdEntry()"    placeholder="ID Number" class="form-control input-md" type="text" >
            		</div>
				</div> 
				
				<label class="col-md-2 control-label" for="BillNo">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("BillNo") %>
						<%}%> <%if(abc.equals("english")){%>BillNo<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-map-marker"></i>
							</span> <input id="BillNo" name="BillNo" onchange="checkForDuplicateSupplierIdEntry()" placeholder="BillNo"
								class="form-control input-md " type="text">
						</div>
					</div>
					
			</div> 
        	<div class="row form-group">
            	<label class="col-md-2 control-label" for="dealerName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("dealerName") %> <%}%> <%if(abc.equals("english")){%>Vendor Name<%}%><sup>*</sup></label>  
            		<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao1 = new SupplierDetailsDao();
           						List productList1 =productdao1.getAllSupplier1(request);
							
							%>
							<input list="dealerName_drop" id="suppliername"  class="form-control" onchange="getvenderDataForPDdetails()">
							<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList1.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            				<span class="input-group-addon">
									<button type="button" id="popup" onclick="suppDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
            			</div>
            		</div>
            		
            			<label class="col-md-2 control-label" for="purchaseDate">Date<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
	              					  <input type="date"  id="purchaseDate" name="purchaseDate" placeholder=" Date" class="form-control input-md" value="<%=todayDate %>">
								
								</div>
							</div>
					</div>	
            		
          <div class="row form-group">
          	<label class="col-md-2 control-label" for="contactNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("contactNumber") %> <%}%> <%if(abc.equals("english")){%>Contact Number<%}%><sup>*</sup></label>
            		<div class="col-md-3">
    					<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i>
							</span>
             				 <input id="contactNo" maxlength="10" name="contactNo" placeholder="Contact Number" class="form-control input-md " onkeypress="phoneno()" type="text">
           				</div>
					</div>

           <label class="col-md-2 control-label" for="city"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("city") %> <%}%> <%if(abc.equals("english")){%>City<%}%><sup>*</sup></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="city" name="city" placeholder="city" class="form-control input-md" onkeypress="characters()" type="text">
            		</div>
				</div>
          </div>

			<div class="row form-group">
            	<label class="col-md-2 control-label" for="tinNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %> <%}%> <%if(abc.equals("english")){%>GST No<%}%><sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="tinNo" name="tinNo" placeholder="GST No" class="form-control input-md " onblur="btnShow()" type="text">
           				</div>
           			 </div>
           			 
           			 			
				 <label class="col-md-2 control-label" for="address"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("address") %> <%}%> <%if(abc.equals("english")){%>Address<%}%></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="address" name="address" placeholder="Address" class="form-control input-md " type="text">
            		</div>
				</div>
           			
           				<!-- <label class="col-md-2 control-label" for="proName">Shop
						Name<sup>*</sup>
					</label> -->
					<%-- <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<%
							shopDetailsDao dao = new shopDetailsDao();
           						List ShopList =dao.getAllShop();
							
							%>
							<input list="ShopName_drop" id="ShopName"
								class="form-control" 
								style="text-transform: uppercase">
							<datalist id="ShopName_drop">
								<%
					           for(int i=0;i<ShopList.size();i++){
					        	   shopDetailsBean bean =(shopDetailsBean)ShopList.get(i);
							%>

								<option data-value="<%=bean.getShopId()%>"
									value="<%=bean.getShopName()%>">
									<%
				      			}
				    		%>
								
							</datalist>


						</div>
					</div> --%>
           			
          	</div>
          	
          	<div class="row form-group">
					<label class="col-md-2 control-label" for="proName">Product Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									<%
							    ProductDetailsDao productdao = new ProductDetailsDao();
           						List productList =productdao.getAllItemName2(request); 
							
							/*  ProductDetailsHelper productdao = new ProductDetailsHelper();
     						List productList =productdao.getAllProductDetails2(); */
							
							%>
							<input list="productName_drop" id="productName"  autofocus="productName" 
							class="form-control" onchange="productDetailInGridForGoodReceive()" 
							style="text-transform: uppercase">
				<datalist id="productName_drop">
							<%
					           for(int i=0;i<productList.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)productList.get(i);
							%>
		
							<option data-value="<%=productbean.getProdctId()%>" value="<%=productbean.getProductName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            				<span class="input-group-addon">
									<button type="button" id="popup1" onclick="prodDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
							</span>
									
										
								</div>
							</div>
							
				
				
							
          	        </div> 
          	     
          	        <div class="row" align="center">
		<div class="table-responsive">
				<table id="jqGrid" ></table>
				<div id="jqGridPager"></div>
			</div>
					<!-- dont delet following row --> 
			<div class="row row form-group">
			
			</div>
			</div>
          	        
          	      <div class="row form-group">
	            	
				<label class="col-md-2 col-md-offset-5 control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="total" name="total"  class="form-control input-md" type="text" >
	              				<input readonly="readonly" id="duptotal" name="total"  class="form-control input-md" type="hidden" >
	            			</div>
	            		</div>
					</div>
			
					<div class="row form-group" >
				
					<label class=" col-md-2 col-md-offset-5 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	</div>
            	<br>
            	<br>

          <div class="form-group row">
            <div class="col-md-11 text-center">
       			<input style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" type="button" value="Submit" id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="valforGrDetails()" /> 
        		<input style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" type="button" value="Cancel" id="cancel" name="btn" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" onclick="location.reload()" /> 
           		<!-- <input style=" height: 65px; width: 180; font-size: 25" type="button" value="PO List" id="listBtn" class="btn btn-primary" onclick="supplierlist()" /> --> 
            </div>
          </div>
         </fieldset>
       </form>
    </div>
    </div>
    
    
    <!-- -------------- popup window for Supplier  ------------------------------ -->
	<!-- The Modal -->
<div id="myModal" class="modal">
  <!--  <div class="modal-dialog modal-xl">  -->
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    
    <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("supplierdetails") %> <%}%> <%if(abc.equals("english")){%>Vendor Details<%}%></h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
      <div class="container col-sm-offset-1" >
        <form class="form-horizontal" method="post" action="" name="spld" ><!-- Value of 'name' attribute is used in  supplierDetails.js  -->
          <fieldset>
       			<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				
			<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>Vendor Code<%}%> </label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon"><i class="	glyphicon glyphicon-hand-right"></i></span>
             			<input id="IdNo1" name="IdNo1" placeholder="Identity Number" class="form-control input-md" type="text">
            		</div>
				</div> 
				
			</div>
        	<div class="row form-group">
            	<label class="col-md-2 control-label" for="dealerName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("dealerName") %> <%}%> <%if(abc.equals("english")){%>Vendor Name<%}%><sup>*</sup></label>  
            		<div class="col-md-3">
            				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao productdao_1 = new SupplierDetailsDao();
           						List productList_1 =productdao_1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="dealerName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" >
				<datalist id="dealerName_drop">
							<%
					           for(int i=0;i<productList_1.size();i++){
					        	   SupplierDetailsBean productbean1 =(SupplierDetailsBean)productList_1.get(i);
							%>
		
							<option data-value="<%=productbean1.getSupId()%>" value="<%=productbean1.getDealerName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>

            <label class="col-md-2 control-label" for="personName"> Person Name</label>  
            	<div class="col-md-3">
           		 	<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-user"></i>
							</span>
              				
							<%
							SupplierDetailsDao persondao1 = new SupplierDetailsDao();
           						List personList1 =persondao1.getAllSupplier();
							
							%>
							<input list="personName_drop" id="personName"  class="form-control">
				<datalist id="personName_drop">
							<%
					           for(int i=0;i<personList1.size();i++){
					        	   SupplierDetailsBean personBean =(SupplierDetailsBean)personList1.get(i);
							%>
		
							<option data-value="<%=personBean.getSupId()%>" value="<%=personBean.getPersonName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>
          </div>
         
          <div class="row form-group">
          
              
            	<label class="col-md-2 control-label" for="contactNo"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("contactNumber") %> <%}%> <%if(abc.equals("english")){%>Contact Number<%}%><sup>*</sup></label>
            		<div class="col-md-3">
    					<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-phone"></i>
							</span>
             				 <input id="contactNo1" maxlength="10" name="contactNo1" placeholder="Contact Number" class="form-control input-md " onkeypress="phoneno()" type="text">
           				</div>
					</div>
            
               <label class="col-md-2 control-label" for="landline"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("landlineNumber") %> <%}%> <%if(abc.equals("english")){%>LandLine Number<%}%></label>
            		<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-earphone"></i>
							</span>
              				<input id="landline" name="landline" placeholder="LandLine No" class="form-control input-md " onkeypress="lanlineNo()" type="text" >
            			</div> 
            		</div>
          	</div>

        
          <div class="row form-group">
            <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>E-mail Id<%}%></label>
            	<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-envelope"></i>
						</span>
              			<input id="emailId" name="emailId" placeholder="Email ID" class="form-control input-md " type="text">
            		</div>
            	</div>

           <label class="col-md-2 control-label" for="city1"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("city") %> <%}%> <%if(abc.equals("english")){%>City<%}%><sup>*</sup></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="city1" name="city1" placeholder="city" class="form-control input-md" onkeypress="characters()" type="text">
            		</div>
				</div>
          </div>

			<div class="row form-group">
            	<label class="col-md-2 control-label" for="tinNo1"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %> <%}%> <%if(abc.equals("english")){%>GST No<%}%><sup>*</sup></label>
            		<div class="col-md-3">
		  				<div class="input-group">
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-font"></i>
							</span>
              				<input id="tinNo1" name="tinNo1" placeholder="GST No" class="form-control input-md " onblur="btnShow()" type="text">
           				</div>
           			 </div>
           			 <label class="col-md-2 control-label" for="address1"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("address") %> <%}%> <%if(abc.equals("english")){%>Address<%}%></label>
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-map-marker"></i>
						</span>
 			            <input id="address1" name="address1" placeholder="Address" class="form-control input-md " type="text">
            		</div>
				</div>
          	</div>
          	
          	

          <div class="form-group row">
            <div class="col-md-11 text-center">
       <!--  supplierDetail() function is implemented in  supplierDetails.js -->
       <input style="  font-size: 25" type="button" value="Submit" id="saveSupplierDetailsBtn" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="supplierDetail()" />
        <input style=" font-size: 25" type="button" value="Cancel" id="save" name="btn" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" onclick="refreshGR()" />
       
              	<%-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="supplierDetail()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%> </h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("cancel") %> <%}%> <%if(abc.equals("english")){%>Cancel<%}%> </h4> </button> --%>
            	<input style=" font-size: 25" type="button" value="Vendor List" id="listBtn" class="btn btn-primary  btn-large  button-height-width " onclick="supplierlist()" /> 
              	<input style=" font-size: 25" type="button" value="Edit" id="listBtn" class="btn btn-primary  btn-large  button-height-width" onclick="editSupplier()" /> 
            </div>
          </div>
         </fieldset>
       </form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>



 
 <!-- --------------End Popup for Add Supplier------------------ -->
 
 
 	<!-- -------------- popup window for product  ------------------------------ -->
	<!-- The Modal -->
<div id="myModal1" class="modal">
  <!--  <div class="modal-dialog modal-xl">  -->
  <!-- Modal content -->
  <div class="modal-content">
    <span class="close1">&times;</span>
    
    <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("supplierdetails") %> <%}%> <%if(abc.equals("english")){%>Product Details<%}%></h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
      <div class="container col-sm-offset-1" >
        <form id="productDtl" class="form-horizontal" method="post" action="" name="prd"><!-- Value of 'name' attribute is used in  productDetail.js  -->
          <fieldset>
			 	<div class="row form-group">
           	 		<div class="col-md-6">
              			<%@include file="commons/clock.jsp" %>
           		 	</div>
				</div>
				<div class="row form-group">
				 <label class="col-md-2 control-label" for="emailId"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %> <%}%> <%if(abc.equals("english")){%>Product No<%}%></label>  
            	<div class="col-md-3 ">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
							
						</span>
             				 <input id="pidno" name="pidno"  placeholder="Identity Number" class="form-control input-md" type="text" >
            		</div>
				</div> 
				
			</div>
			<%--  <div class="row form-group">
           		<label class="col-md-2 control-label" for="fk_cat_id"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Category<%}%><sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							   CategoryDetailsDao cdd = new CategoryDetailsDao();
           						List cList =cdd.getAllMainCat();
							
							%>
							<input list="cat_drop" id="fk_cat_id"  class="form-control" onchange="getAllSubCat()">
				<datalist id="cat_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   CategoryDetailsBean cat=(CategoryDetailsBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getCatId()%>" value="<%=cat.getCategoryName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
           </div>
            		<label class="col-md-2 control-label" for="subCat"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productCat") %> <%}%> <%if(abc.equals("english")){%>Product Subcategory<%}%><sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
							
					<select class="form-control input-md" id='subCat'  name="subCat" onchange="getAllShopName()">
					</select>
               		</div>
              	</div>
              	</div> --%>
          <div class="row form-group">
            <label class="col-md-2 control-label" for="productName"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productName") %> <%}%> <%if(abc.equals("english")){%>Product Name<%}%> <sup>*</sup></label>  
            	<div class="col-md-3">
            		<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao product_dao = new ProductDetailsDao();
           						List product_List =product_dao.getAllProductDetails();
							
							%>
							<input list="productName_drop_1" id="productName_1"  class="form-control"  onchange="checkForDuplicateProductEntry()" style="text-transform: uppercase">
				<datalist id="productName_drop_1">
							<%
					           for(int i=0;i<product_List.size();i++){
					        	   ProductDetailsBean productbean =(ProductDetailsBean)product_List.get(i);
							%>
		
							<option data-value="<%=productbean.getProdctId()%>" value="<%=productbean.getProductName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>
			 
           	<label class="col-md-2 control-label" for="manufacturingCompany"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("company") %> <%}%> <%if(abc.equals("english")){%>Manufacturing Company<%}%></label>  
           	 <div class="col-md-3">
            	<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao productdao_2 = new ProductDetailsDao();
           						List productList_2 =productdao_2.getAllProductDetails();
							
							%>
							<input list="manufacturingCompany_drop" id="manufacturingCompany" style="text-transform: uppercase" class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="manufacturingCompany_drop">
							<%
					           for(int i=0;i<productList_2.size();i++){
					        	   ProductDetailsBean productbean1 =(ProductDetailsBean)productList_2.get(i);
							%>
		
							<option data-value="<%=productbean1.getProdctId()%>" value="<%=productbean1.getManufacturingCompany()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            </div>
		</div>
	
		<%-- <div class="row form-group">
            <label class="col-md-2 control-label" for="weight"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("weight") %> <%}%> <%if(abc.equals("english")){%>Packing<%}%><sup>*</sup></label>  
            	<div class="col-md-3">
            		<div class="input-group">
							<span class="input-group-addon">
								No
							</span>
              				
							<%
							ProductDetailsDao productdao2 = new ProductDetailsDao();
           						List productList2 =productdao2.getAllProductDetails();
							
							%>
							<input list="weight_drop" id="weight"  class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="weight_drop">
							<%
					           for(int i=0;i<productList2.size();i++){
					        	   ProductDetailsBean productbean2 =(ProductDetailsBean)productList2.get(i);
							%>
		
							<option data-value="<%=productbean2.getProdctId()%>" value="<%=productbean2.getWeight()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
				</div>

				<label class="col-md-2 control-label" for="Unit"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("unit") %> <%}%> <%if(abc.equals("english")){%>Unit<%}%><sup>*</sup></label>  
            				<div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							
										
							<!-- Following code is to get all measuring units from "sold_units" table of "fertilizer" DB -->
							<!-- getAllUnits() is implemented in  MeasuringUnitsDao with return type List-->
						
							<%
							MeasuringUnitsDao mdao = new MeasuringUnitsDao();
           						List uList = mdao.getAllUnits();
							%>
							
							<input list="unit_drop" id="fk_unit_id"  class="form-control">
				<datalist id="unit_drop">
							
							<%
					           for(int i=0;i<uList.size();i++){
					        	   MeasuringUnitsBean bean =(MeasuringUnitsBean)uList.get(i);
							%>
		
							<option data-value="<%=bean.getPkUnitId()%>" value="<%=bean.getUnitName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
				</div> --%>
				
		
			
			<!-- Following code is used to show tax percentage in % field with the help of  "myid" and "taxPercentage"-->
			<script type="text/javascript">
				function ChooseContact(data)
					{
						
						document.getElementById("taxPercentage").value=(data.options[data.selectedIndex].getAttribute("myid"));
					}
			</script> 
			
		
			
		<div class="row form-group">
         	<label class="col-md-2 control-label" for="fk_tax_id">GST Type<sup>*</sup></label>
         		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="	glyphicon glyphicon-hand-right"></i>
						</span>
						
						<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllMainTax() is implemented in  TaxCreationDao with return type List-->
					
					
						<%
							TaxCreationDao tcd = new TaxCreationDao();
							List tList = tcd.getAllMainTax();
		            	%>
              			<select class="form-control input-md" autofocus name="fk_tax_id" id="fk_tax_id" onChange="ChooseContact(this)" >
			              	<option value="selected">--Select Tax--</option>
							<%
					           for(int i=0;i<tList.size();i++){
					        	   TaxCreationBean tax=(TaxCreationBean)tList.get(i);
							%>
		
						<option value="<%=tax.getTxId()%>" myid="<%=tax.getTaxPercentage()%>"><%=tax.getTaxType() %> </option>
							<%
				      			}
				    		%>
			              	
            			</select> 
            		</div>
            	</div>   
         		
         	 <div class="col-md-offset-2 col-md-3" >
				<div class="input-group">
						<span class="input-group-addon" style="
    padding-left: 18px;
    padding-right: 20px;
">
							%
						</span>
           		 	<input id="taxPercentage" name="taxPercentage" placeholder="Tax Percentage" class="form-control input-md" type="text" >
           		</div>
			</div>
		</div> 
	
		<%-- <div class="row form-group">
			<label class="col-md-2 control-label" for="buyPrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("buyPrice") %> <%}%> <%if(abc.equals("english")){%>Buy Price<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						Rs
						</span>
              			<input id="buyPrice" name="buyPrice" placeholder="Buy Price" class="form-control input-md" type="text" >
            		</div>
				</div>
            	
            	<label class="col-md-2 control-label" for="mrp"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("") %> <%}%> <%if(abc.equals("english")){%>M.R.P<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						Rs
						</span>
              			<input id="mrp" name="mrp" placeholder="MRP" class="form-control input-md" type="text" >
            		</div>
				</div>
            	
		</div> --%>
		<div class="row form-group">
          <label class="col-md-2 control-label" for="hsn"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>HSN code<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						
						</span>
              			<input id="hsn" name="hsn" placeholder="HSN Number" class="form-control input-md" type="text">
            		</div>
				</div>
		 <label class="col-md-2 control-label" for="salePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>Rate<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						
						</span>
              			<input id="Rate" name="salePrice" placeholder="Rate" class="form-control input-md" type="text" onkeyup="salePriceCompaireWithMRP()">
            		</div>
				</div> 
				</div> 
				<%-- <label class="col-md-2 control-label" for="Unit"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("Unit") %> <%}%> <%if(abc.equals("english")){%>Unit<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
					
						</span>
									<%
							MeasuringUnitsDao dao1 = new MeasuringUnitsDao();
           						List taxPerList =dao1.getAllUnits();
							
							%>
							<input list="unitName_drop" id="unitName"  class="form-control">
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
				</div> --%>
				
				
			 	
				<%-- <%
				shopDetailsDao shopDao = new shopDetailsDao();
           					List shopDaoList = shopDao.getAllShop();
							
					%>
			<label class="col-md-2 control-label" for="creditSalePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("shopName") %> <%}%> <%if(abc.equals("english")){%>Shop Name<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						</span>
              			<select class="form-control input-md" autofocus name="shopName" id="shopName" >
			              	<option value="selected">--Select Shop--</option>
							<%
					           for(int i=0;i<shopDaoList.size();i++){
					        	   shopDetailsBean sp=(shopDetailsBean)shopDaoList.get(i);
							%>
		
						<option value="<%=sp.getShopId()%>"><%=sp.getShopName() %> </option>
							<%
				      			}
				    		%>
			              	
            			</select> 
            		</div>
				</div> 
			</div>--%>
		<!-- <div class="row form-group">
		
		</div> -->
		
		<div class="form-group row">
            <div class="col-md-11 text-center">
             	<input style="  font-size: 25" type="button" id="submitProductDtlBtn" name="btn" value="Submit" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="productDetails()" /> 
             	<input style="  font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="refreshGR()" /> 
            	<input style="  font-size: 25" type="button" value="Product List" id="productListBtn" class="btn btn-primary btn-large button-height-width" onclick="productDetailslist()" /> 
              	<input style="  font-size: 25" type="button" value="Edit" id="editProductDtlBtn" class="btn btn-primary btn-large button-height-width " onclick="editProductDetails()" /> 
            </div>
          </div>
		</fieldset>
       </form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>

<!-- -------------------------------------- -->


<script>
function test()
{
	alert("ok");	
}

</script>
	
	<script>

//Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("popup");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


//Get the modal
var modal1 = document.getElementById('myModal1');

// Get the button that opens the modal
var btn1 = document.getElementById("popup1");

// Get the <span> element that closes the modal
var span1 = document.getElementsByClassName("close1")[0];

// When the user clicks the button, open the modal 
btn1.onclick = function() {
    modal1.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span1.onclick = function() {
    modal1.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}



</script>

    </body>
    <%@include file="commons/newFooter.jsp" %>
    
<%-- <%@include file="commons/footer.jsp" %> --%>
