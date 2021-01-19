 <%@page import="com.Fertilizer.dao.TaxCreationDao"%>
<%@page import="com.Fertilizer.hibernate.TaxCreationBean"%>
 <%@page import="com.Fertilizer.dao.CategoryDetailsDao"%>
 <%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
 <%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
 <%@page import="com.Fertilizer.hibernate.CategoryDetailsBean"%>
 <%@page import="com.Fertilizer.dao.MeasuringUnitsDao"%>
 <%@page import="com.Fertilizer.hibernate.MeasuringUnitsBean"%>
<%@page import="java.util.List"%>

 

<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<script src="/processSoft/staticContent/js/vatpercentage.js" type="text/javascript"></script>
<script type="text/javascript" src="/processSoft/staticContent/js/productDetail.js"></script>
  <script type="text/javascript">
  			function Back()
  			{
  				window.location = "product_detail.jsp" ;
  			}
  		</script>
</head>
 <div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			  		<h2 class="form-name style_heading"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("productDetails") %> <%}%> <%if(abc.equals("english")){%>Product Details<%}%></h2>
			  	</div>
			 
    </div>
 
 	 <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
 	<div class="container">
 	<div class=" col-sm-offset-1">
        <form class="form-horizontal" method="post" action="" name="prd1"><!-- Value of 'name' attribute is used in  productDetail.js  -->
          <fieldset>
			 	<div class="row form-group">
			   <label class="col-md-2 control-label" for="fk_product_id">Product Name<sup>*</sup></label>  
           			 <div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="	glyphicon glyphicon-hand-right"></i>
							</span>
              				
							
							<%
							ProductDetailsDao cdd = new ProductDetailsDao();
           						List cList =cdd.getAllProductForEdit(request);
							
							%>
							<input list="pro_drop" id="fk_product_id"  class="form-control" onchange="getAllProductDetails()">
						<datalist id="pro_drop">
							<%
					           for(int i=0;i<cList.size();i++){
					        	   ProductDetailsBean cat=(ProductDetailsBean)cList.get(i);
							%>
		
							<option data-value="<%=cat.getProdctId()%>" value="<%=cat.getProductName()%>">
							<%
				      			}
				    		%>
			              	
            			</datalist>
            			</div>
            		</div>
            		            		</div>
						 	<div class="row form-group">
						 	 
			            		<label class="col-md-2 control-label" for="productName">product Name <sup>*</sup></label>  
				            	<div class="col-md-3">
									<div class="input-group">
										<span class="input-group-addon">
											No
										</span>
				             			 <input id="productName" name="productName"  class="form-control input-md" type="text" >
				            		</div>
								</div>
						 	
						 <label class="col-md-2 control-label" for="manufacturingCompany"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("company") %> <%}%> <%if(abc.equals("english")){%>Manufacturing company<%}%></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									<i class="	glyphicon glyphicon-font"></i>
								</span>
			              		<input id="manufacturingCompany" name="manufacturingCompany" placeholder="Manufacturing company" class="form-control input-md" type="text" >
			            	</div>
			            </div>
                        </div>
			 		
			
			<div class="row form-group">
				 <label class="col-md-2 control-label" for="existedTax">Existing Tax Type</label>  
	            	<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								No
							</span>
	             			 <input readonly="readonly" id="existedTax" name="existedTax"  class="form-control input-md" type="text" >
	            		</div>
					</div>
					
					<label class="col-md-2 control-label" for="existedTaxPercentage">Existing Tax Percentage</label>
						<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon">
								%
							</span>
	             			 <input readonly="readonly" id="existedTaxPercentage" name="existedTaxPercentage"  class="form-control input-md" type="text" >
	            		</div>
	            		</div>
			</div>
			
		
			
			<!-- Following code is used to show tax percentage in % field with the help of  "myid" and "taxPercentage"-->
			<script type="text/javascript">
				function ChooseContact(data)
					{
						
						document.getElementById("taxPercentage").value=(data.options[data.selectedIndex].getAttribute("myid"));
					}
			</script> 
			
		
			
		<div class="row form-group">
         	<label class="col-md-2 control-label" for="fk_tax_id">New Tax Type<sup>*</sup></label>
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
            		</div>
            	</div>   
         		
         	 	<label class="col-md-2 control-label" for="fk_tax_id">New Tax Percentage</label>
         		<div class="col-md-3">
					<div class="input-group">
						
						<span class="input-group-addon">
							%
						</span>
           		 	<input id="taxPercentage" name="taxPercentage" placeholder="Tax Percentage" class="form-control input-md" type="text" >
           		</div>
			</div>
		</div> 
		
		
	
		 <div class="row form-group">
		<label class="col-md-2 control-label" for="Rate"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("Rate") %> <%}%> <%if(abc.equals("english")){%>Rate<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						</span>
              			<input id="rate" name="rate" placeholder="rate" class="form-control input-md" type="text">
            		</div>
				</div>
			
			
			
			 
			<label class="col-md-2 control-label" for="Rate"><%if(abc.equals("marathi")){%><%=PropertiesHelper.marathiProperties.getProperty("Rate") %> <%}%> <%if(abc.equals("english")){%>HSN code<%}%><sup>*</sup></label>  
           		<div class="col-md-3">
					<div class="input-group">
						<span class="input-group-addon">
						</span>
              			<input id="hsncode" name="hsncode" placeholder="HSN Code" class="form-control input-md" type="text">
            		</div>
				</div>
			
			</div>
	
	<br>
		
		<div class="form-group row">
            <div class="col-md-10 text-center">
            
           		<input style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" type="button" id="UpdateProductDtlBtn" name="btn" value="Update" class="btn btn-large btn-success glyphicon glyphicon-save  button-height-width"  onclick="updateProductDetails()" /> 
             	<input style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" class="btn btn-large btn-danger glyphicon glyphicon-remove-circle  button-height-width" type="reset" id="save" name="btn" value="Cancel"  onclick="reset()" /> 
           		<input style="font-size: 20px;width: 110px;height: 40px;padding: 0 9px;" type="button" value="Back" id="listBtn" class="btn btn-primary" onclick="Back()" /> 
            </div>
          </div>
		</fieldset>
       </form>
       </div>
     </div>
 
 	<%@include file="commons/newFooter.jsp" %>
 
 <%-- <%@include file="commons/footer.jsp" %> --%>