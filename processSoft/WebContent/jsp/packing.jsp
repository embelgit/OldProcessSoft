<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="com.Fertilizer.dao.shopDetailsDao"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="com.Fertilizer.dao.PackingDao"%>
<%@page import="com.Fertilizer.bean.BillBean"%>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="com.Fertilizer.hibernate.MeasuringUnitsBean"%>
<%@page import="com.Fertilizer.dao.MeasuringUnitsDao"%>
<%@page import="com.Fertilizer.hibernate.Packing_InfoBean"%>
<%@page import="com.Fertilizer.dao.Packing_InfoDao"%>
<%@page import="com.Fertilizer.dao.GoodsReceiveDao"%>
<%@page import="com.Fertilizer.hibernate.GoodsReceiveBean"%>
<%@page import="com.Fertilizer.hibernate.InwardBean"%>
<%@page import="java.util.* "%>
<%boolean isHome = false;
%>
<%@include file="commons/header.jsp"%>

<head>
<meta charset="utf-8">
<script type="text/javascript"
	src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>


<link rel="stylesheet"
	href="/processSoft/staticContent/css/jquery-ui.min.css"> 
<link rel="stylesheet"
	href="/processSoft/staticContent/css/ui.jqgrid.min.css">
<!-- <link rel="stylesheet" href="/Fertilizer/staticContent/css/ui.jqgrid.css"> -->

<link rel="stylesheet"
	href="/processSoft/staticContent/y_css/jquery-ui.css">
<!--  -->
<link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.css">
<!--  -->
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui-min.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>


<script type="text/javascript" src="/processSoft/staticContent/js/packing.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/supplierDetails.js"></script>	


<script type="text/javascript">
function refreshOP() {   
    //Refresh page implementation here
    //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
	window.location.href="packing.jsp";
    window.close();
}
</script>
<script type="text/javascript">
function supplierlist() {
	document.getElementById('supplierListBtn').disabled = true;
	window.location = "supplierList.jsp";
}
	function editSupplier() {
		document.getElementById('supplierEditBtn').disabled = true;
		window.location = "editSupplierDetails.jsp";
}
</script>
<script type="text/javascript">
function checkForDuplipackingEntry(){
	
		$("#proName option:selected").each(function() {
		   selectedVal = $(this).text();
			});
		var splitText = selectedVal.split(",");
	
		var Quantity = splitText[2];
		
		$("#capacity option:selected").each(function() {
			   selectedVal = $(this).text();
			});
		
		var splitText = selectedVal.split(",");
		
		var typeId = splitText[0];
          			
		var packingQnty=document.getElementById("packingQuantity").value;
          			
          			if(Number(packingQnty) > Number(Quantity)){
          				alert("Stock Not allowed");
          				location.reload();
          				return false;
          			}
          			
          			
          			}
          			
function checkQuantityEntry(){

	var packingQnty=document.getElementById("packingQuantity").value;
      			
      			if(packingQnty == "" ){
      				alert("Please Enter Quantity!!!!!!");
      				location.reload();
      				return false;
      			}
      			
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
<%-- 
<%
        Long BillNo = 1l;
	 %>
<%
	 PackingDao data = new PackingDao();
		List stkList  = data.getLastBillNo();
		
		for(int i=0;i<stkList.size();i++){
			
			BillBean st = (BillBean)stkList.get(i);
			BillNo = st.getBillNo();
			System.out.println("hi this is vikas ++++++"+BillNo);
			
			BillNo++;
			System.out.println( BillNo);
			
		}      
	        
         %> --%>
</head>

<body>
	<!-- onload="getProductName(); -->
	<div class="row header_margin_top">
		<div align="center">
			<br>
			<h2 class="form-name style_heading">Outward Processing</h2>
			<%--  <h3 align="right" style="color: red; margin-right: 50px;">Bill No :: <%out.println(BillNo); %></h3> --%>
		</div>

	</div>
	<div class="row">
		<div class="col-sm-offset-1 col-md-10">
			<hr style="border-top-color: #c1b1b1;">
		</div>
	</div>
	<div class="container col-sm-offset-2" style="padding-right: 128px">
		<form class="form-horizontal" method="post" action="" name="pk">
			<fieldset>
				<div class="row form-group">
					<div class="col-md-6">
						<%@include file="commons/clock.jsp"%>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="supplier">Vendor
						Name<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<!-- <input type="text" id="supplierName" name="supplierName" class="form-control" > -->

							<%
							GoodsReceiveDao grd = new GoodsReceiveDao();
           						List sList =grd.getAllCompanyName();
							
        	        		//getSupWiseProduct()
							%>

							<input list="sup_drop" id="supplierName" class="form-control"
								onchange="getSupWiseChallanNo(),getvenderGST()">
							<datalist id="sup_drop">

								<%
					           for(int i=0;i<sList.size();i++){
					        	   InwardBean bean=(InwardBean)sList.get(i);
					        	   
					        	  //SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
					        	  //GoodsReceiveBean grb=(GoodsReceiveBean)sList.get(i);
							%>

								<option data-value="<%=bean.getPk_inward_id()%>"
									value="<%=bean.getSuppliername()%>">
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

					<label class="col-md-2 control-label" for="purchaseDate">Outward
						Date<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="date" id="outwardDate" name="outwardDate"
								placeholder="outward Date" class="form-control input-md" value="<%=todayDate%>">

						</div>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="tinNo">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("tin") %>
						<%}%> <%if(abc.equals("english")){%>GST No<%}%><sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="glyphicon glyphicon-font"></i>
							</span> <input id="tinNo" name="tinNo" placeholder="GST No"
								class="form-control input-md " onblur="btnShow()" type="text">
						</div>
					</div>

					<label class="col-md-2 control-label" for="emailId">
						<%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("email") %>
						<%}%> <%if(abc.equals("english")){%>Vendor Code<%}%>
					</label>
					<div class="col-md-3 ">
						<div class="input-group">
							<span class="input-group-addon"> 	<i class="	glyphicon glyphicon-hand-right"></i></span> <input id="IdNo"
								name="IdNo " placeholder="Vendor Code"
								class="form-control input-md" type="text">
						</div>
					</div>
				</div>
				<div class="row form-group">
					<label class="col-md-2 control-label" for="productName">Challan
						No<sup>*</sup>
					</label>

					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span>
							<%--  <%
											GoodsReceiveDao grd=new GoodsReceiveDao();
              								List glist=grd.getAllPurschaseEntry();
										
									%>  --%>

							<!-- <input list="die_quantity" id="die_quantity_good" class="form-control" onchange="productDetailInGrid()">
            						
            						 <datalist id="die_quantity"> 		productDetailInGrid()-->

							<select class="form-control" id='challanNo' name="challanNo" 
								onchange="getSupWiseProduct()">
							</select>
							<%--  <%
					          			 	 for(int i=0;i<glist.size();i++){
					          			 		GoodsReceiveBean bean=(GoodsReceiveBean)glist.get(i);
					        	  			 	
									%>
										<option data-value="<%=bean.getPkGoodsReceiveId() %>" value="<%=bean.getBillNum()%>">
									<%
				      					}
				    				%>  --%>

						</div>
					</div>

					<label class="col-md-2 control-label" for="purchaseDate">Inward
						Date<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="date" id="inwardDate" name="inwardDate"
								placeholder="Purchase Date" class="form-control input-md"
								readonly="readonly">

						</div>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="proName">Product
						Name<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <select class="form-control" id='productName' name="productName"
								onchange="productDetailInGrid123()">
							</select>




						</div>
					</div>

					<label class="col-md-2 control-label" for="purchaseDate">Outward
						Challan No<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id="outwardchallanno" name="outwardchallanno"
								placeholder="Outward Challan No" class="form-control input-md"
								>

						</div>
					</div>
				</div>

				<div class="row form-group">
					<label class="col-md-2 control-label" for="purchaseDate">Vehicle
						No<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id="vechicleNo" name="vechicleNo"
								placeholder="" class="form-control input-md">

						</div>
					</div>
					<label class="col-md-2 control-label" for="purchaseDate">Description<sup>*</sup></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input type="text" id="Description" name="Description"
								placeholder="" class="form-control input-md">

						</div>
					</div>
				</div>


				<div class="row form-group">
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
							<input list="ShopName_drop" id="ShopName" class="form-control"
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




				<!-- 	<div style='position:absolute; top:440px; left:108px; '> -->
				<div class="row" align="center">
					<div class="table-responsive">
						<table id="jqGrid"></table>
						<div id="jqGridPager"></div>
					</div>
					<!-- dont delet following row -->
					<div class="row row form-group"></div>
				</div>
				<div class="row form-group">

					<label class="col-md-2 col-md-offset-5 control-label" for="total"><b>Total</b></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> Rs </span> <input
								readonly="readonly" id="total" name="total"
								class="form-control input-md" type="text"> <input
								readonly="readonly" id="duptotal" name="total"
								class="form-control input-md" type="hidden">
						</div>
					</div>
				</div>

				<div class="row form-group">

					<label class=" col-md-2 col-md-offset-5 control-label"
						for="grossTotal"><h4>
							<b>Gross Total</b>
						</h4></label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> Rs </span> <input
								readonly="readonly" id="grossTotal" name="grossTotal"
								placeholder="Gross Total" class="form-control input-md"
								type="text" style="font-size: 25px; height: 55px;">
						</div>
					</div>
				</div>


				<div class="form-group row">
					<div class="col-md-10 text-center">
						<input type="button" id="save" name="btn" style="font-size: 25"
							class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"
							onclick="outwardRecieve()" value="Submit"> <input
							id="save" name="btn" style="font-size: 25"
							class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"
							type="reset" onclick="window.location.reload()" value="Cancel">
					</div>
				</div>
			</fieldset>
		</form>
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
						<span class="input-group-addon">
									<i class="	glyphicon glyphicon-hand-right"></i>
							
						</span>
             				 <input id="IdNo" name="IdNo " placeholder="Identity Number" class="form-control input-md" type="text">
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
           						List productList1 =productdao1.getAllSupplier();
							
							%>
							<input list="dealerName_drop" id="dealerName"  class="form-control" onchange="checkForDuplicateSupplierIdEntry()" >
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
             				 <input id="contactNo" maxlength="10" name="contactNo" placeholder="Contact Number" class="form-control input-md " onkeypress="phoneno()" type="text">
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
          	</div>
          	
          	

          <div class="form-group row">
            <div class="col-md-11 text-center">
       <!--  supplierDetail() function is implemented in  supplierDetails.js -->
       <input style="  font-size: 25" type="button" value="Submit" id="saveSupplierDetailsBtn" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="supplierDetail()" /> 
        <input style=" font-size: 25" type="button" value="Cancel" id="save" name="btn" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" onclick="refreshOP()" /> 
       
              	<%-- <button id="save" name="btn" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="supplierDetail()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("submit") %> <%}%> <%if(abc.equals("english")){%>Submit<%}%> </h4></button>
              	<button class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset"  onclick="reset()"><h4><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("cancel") %> <%}%> <%if(abc.equals("english")){%>Cancel<%}%> </h4> </button> --%>
            	<input style=" font-size: 25" type="button" value="Vendor List" id="supplierListBtn" class="btn btn-primary  btn-large  button-height-width " onclick="supplierlist()" /> 
              	<input style=" font-size: 25" type="button" value="Edit" id="supplierEditBtn" class="btn btn-primary  btn-large  button-height-width" onclick="editSupplier()" /> 
            </div>
          </div>
         </fieldset>
       </form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>



 
 <!-- --------------End Popup for Add Supplier------------------ -->
 
<script type="text/javascript">
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
</script>

 
</body>



<%@include file="commons/newFooter.jsp"%>

<%-- <%@include file="commons/footer.jsp" %> --%>


