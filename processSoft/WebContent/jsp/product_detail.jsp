 <%@page import="com.Fertilizer.bean.GetProductDetails"%>
<%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
 <%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
  <%@page import="com.Fertilizer.dao.ProductDetailsDao"%>
 <%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
 <%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
 <%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
 <%@page import="com.Fertilizer.dao.MeasuringUnitsDao"%>
 <%@page import="com.Fertilizer.hibernate.MeasuringUnitsBean"%>
  <%@page import="com.Fertilizer.dao.shopDetailsDao"%>
 <%@page import="com.Fertilizer.hibernate.shopDetailsBean"%>
<%@page import="java.util.List"%>

<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<script src="/processSoft/staticContent/js/vatpercentage.js" type="text/javascript"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/productDetail.js"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/taxCreation.js"></script>

<script type="text/javascript">
function refreshPage() {         
    //Refresh page implementation here
    //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
	window.location.href="product_detail.jsp";
    window.close();
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
function isNumberWithFloat(evt)
{
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57 ) && (charCode < 46 || charCode > 46))
	{
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
    function blockSpecialChar(e){
        var k;
        document.all ? k = e.keyCode : k = e.which;
        return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57));
        }
</script>
<script type="text/javascript">
function checkForDuplicateProductEntry(){
		<%
		ProductDetailsDao dao1 = new ProductDetailsDao();
		List list = dao1.getAllProduct1(request);
		%>
		
		<%
		int z = 0;
		for(z=0;z<list.size();z++){
			ProductDetailsBean bean = (ProductDetailsBean)list.get(z);
		%>
		var idNo = "<%=bean.getIdNo()%>";
		var pro = "<%=bean.getProductName()%>";
		
		
		
		proId = $('#pidno').val();
	
	$("#pidno option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	/*  var splitText = selectedVal.split(",");  
	
	var supId = splitText[0];*/
		
		if(document.getElementById("productName").value ==pro && idNo != pro){
			alert("Tax name already exist...Duplicate Not allowed");
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
          		 function productlist()
          		 {
          		 window.location = "productList.jsp";
          		 }
          		 function editProduct() {
          			 window.location = "editProductDetails.jsp";
				}
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
function taxlist()
	 {
	 window.location = "taxList.jsp";
	 }
	 function editTax() {
		 window.location = "TaxEdit.jsp";
}
</script>
</head>
 <div class="row header_margin_top">
			    <div align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productDetails") %> <%}%> <%if(abc.equals("english")){%>Product Details<%}%></h2>
			  	</div>
			 
    </div>
 
 	 <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
 	<div class="container">
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
             				 <input type="text" id="pidno" name="pidno"  placeholder="Identity Number" onkeypress="return isNumber(event)" class="form-control input-md" >
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
							ProductDetailsDao productdao = new ProductDetailsDao();
           						List productList =productdao.getAllProductDetails();
							
							%>
							<input list="productName_drop" id="productName_1"  class="form-control"  onchange="checkForDuplicateProductEntry()" style="text-transform: uppercase">
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
            			</div>
				</div>
			 
           	<label class="col-md-2 control-label" for="manufacturingCompany"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("company") %> <%}%> <%if(abc.equals("english")){%>Manufacturing Company<%}%></label>  
           	 <div class="col-md-3">
            	<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<%
							ProductDetailsDao productdao1 = new ProductDetailsDao();
           						List productList1 =productdao1.getAllProductDetails();
							
							%>
							<input list="manufacturingCompany_drop" id="manufacturingCompany" style="text-transform: uppercase" class="form-control" onblur="checkForDuplicateProductEntry()">
				<datalist id="manufacturingCompany_drop">
							<%
					           for(int i=0;i<productList1.size();i++){
					        	   ProductDetailsBean productbean1 =(ProductDetailsBean)productList1.get(i);
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
							List tList = tcd.getAllMainTax1(request);
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
            			<span class="input-group-addon">
									<!-- <button type="button" onclick="mypopup('PopUpTax.jsp')"> -->
									<button type="button" onclick="suppDetailsDivAction(1);">
										 <span class="glyphicon glyphicon-plus"  style="color: #0078ae;"></span>
									</button>
						</span>
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
           		 	<input id="taxPercentage" name="taxPercentage" placeholder="Tax Percentage" class="form-control input-md" type="text" readonly="readonly" >
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
          <label class="col-md-2 control-label" for="hsn"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>HSN Code<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>
						</span>
              			<input type="text" id="hsn" name="hsn" placeholder="HSN Number" class="form-control input-md" onkeypress="return blockSpecialChar(event)" />
            		</div>
				</div>
		 <label class="col-md-2 control-label" for="salePrice"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("salePrice") %> <%}%> <%if(abc.equals("english")){%>Rate<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="	glyphicon glyphicon-hand-right"></i>			
						</span>
              			<input type="text" id="Rate" name="salePrice" placeholder="Rate" class="form-control input-md" onkeypress="return isNumberWithFloat(event)" onkeyup="salePriceCompaireWithMRP()">
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
		<br>
		<br>
		
		<div class="form-group row">
            <div class="col-md-11 text-center">
             	<input style="  font-size: 25;width: 156px;" type="button" id="submitProductDtlBtn" name="btn" value="Submit" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width" onclick="productDetails()" /> 
             	<input style="  font-size: 25;width: 156px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel" onclick="reset()" /> 
            	<input style="  font-size: 25;width: 156px;" type="button" value="Product List" id="listBtn" class="btn btn-primary btn-large button-height-width" onclick="productlist()" /> 
              	<input style="  font-size: 25;width: 156px;" type="button" value="Edit" id="listBtn" class="btn btn-primary btn-large button-height-width " onclick="editProduct()" /> 
            </div>
          </div>
		</fieldset>
       </form>
</div>

<!-- -------------- popup window for Tax Details  ------------------------------ -->
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
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							TaxCreationDao cdd = new TaxCreationDao();
           						List cList =cdd.getAllTax();
							
							%>
							<input list="cat_drop" id="taxType"  class="form-control" onchange="checkForDuplicateTAXEntry()">
				<datalist id="cat_drop">
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

            	<label class="col-md-2 control-label" for="taxPercentage">Tax Percentage<sup>*</sup></label>  
            		<div class="col-md-3">
            			<div class="input-group">
							<span class="input-group-addon">
								%
							</span>
              				
							<!-- Following code is to get categories from "categories" table of "fertilizer" DB -->
							<!-- getAllMainCat() is implemented in  CategoryDetailsDao with return type List-->
							<%
							TaxCreationDao dao = new TaxCreationDao();
           						List taxPerList =dao.getAllTax();
							
							%>
							<input list="tax_per_drop" id="taxPercentage"  class="form-control">
				<datalist id="tax_per_drop">
							<%
					           for(int i=0;i<taxPerList.size();i++){
					        	   TaxCreationBean bean =(TaxCreationBean)taxPerList.get(i);
							%>
		
							<option data-value="<%=bean.getTxId()%>" value="<%=bean.getTaxPercentage()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
					</div>
				</div>
				<div class="form-group row">
           			<div class="col-md-10 text-center">
           			 <!--  txCreation() function is implemented in  taxCreation.js -->
					<input type="button" id="saveTaxDetails" name="btn" style="font-size: 25" class="btn btn-large btn-success   button-height-width"  onclick="addtax() " value="Submit">
					<input id="reset" name="btn" style="font-size: 25" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width"  type="reset"  onclick="refreshPage()" value="Cancel">
					
					<input style="  font-size: 25" type="button" value="Tax List" id="listBtn" class="btn btn-primary btn-large  button-height-width " onclick="taxlist()" /> 
              		<input style="  font-size: 25" type="button" value="Edit" id="listBtn" class="btn btn-primary  btn-large  button-height-width" onclick="editTax()" />
            		</div>
          		</div>
			</fieldset>
		</form>
                           <!-- <center><MARQUEE BEHAVIOR=ALTERNATE width=700> <font color="red" size=4> Note : If you Enter Proper Data then & then only you can see <font color="green">Submit Button </font></font> </MARQUEE></center>   -->
    </div>

</div>
</div>
 
 <%@include file="commons/newFooter.jsp" %>
 
 <%-- <%@include file="commons/footer.jsp" %> --%>