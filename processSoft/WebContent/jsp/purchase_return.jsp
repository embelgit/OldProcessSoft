 <%@page import="com.Fertilizer.dao.GoodsReceiveDao"%>
 <%@page import="com.Fertilizer.hibernate.GoodsReceiveBean"%>
 <%@page import="java.util.List" %>
<%@page import="com.Fertilizer.hibernate.SupplierDetailsBean"%>
<%@page import="com.Fertilizer.dao.SupplierDetailsDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%boolean isHome = false;%>
<%@include file="commons/header.jsp"%>
<head>
<meta charset="utf-8">

     <script type="text/javascript" src="/processSoft/staticContent/js/jquery-1.12.3.min.js"></script>
	 <link rel="stylesheet" href="/processSoft/staticContent/css/jquery-ui.min.css">
     <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.min.css">
    
     
     <link rel="stylesheet" href="/processSoft/staticContent/y_css/jquery-ui.css">
     <link rel="stylesheet" href="/processSoft/staticContent/css/ui.jqgrid.css">
     <script type="text/javascript" src="/processSoftstaticContent/js/jquery.min.js"></script>
     <script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui-min.js"></script>
     <script type="text/javascript" src="/processSoft/staticContent/js/jquery-ui.js"></script>
     <script type="text/javascript" src="/processSoft/staticContent/js/jqueryUi.js"></script>
     <script type="text/javascript" src="/processSoft/staticContent/js/jquery.jqgrid.min.js"></script>
    
     <script type="text/javascript" src="/processSoft/staticContent/js/purchaseReturn.js"></script>
     
     
     <script type="text/javascript">
     
     /* $(document).on('change', 'input', function(){
    	 getAllBills();
    	});
     
     $(document).on('change', 'select', function(){
    	 fetchDataForPurchase();
    	}); */
   /*   
     $( "#bill_no" ).change(function() {
    	 fetchDataForPurchase();
    	});
      */
     </script>
     <script type="text/javascript">
  <%   		
     		String pattern = "yyyy-MM-dd";
     		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
     		String todayDate = simpleDateFormat.format(new Date());
     		
     		System.out.println(todayDate);
    %> 		
     		
     		
     		
     		
     		</script>
    
</head>
<body>
 <div class="row header_margin_top">
			    <div class="bill-heading" align="center">
			  		<h2 class="form-name style_heading">Purchase Return</h2>
			  	</div>
			 
    </div>
     <div class="row">
		     <div class="col-sm-offset-1 col-md-10">
				  		<hr style="border-top-color:#c1b1b1;">
		     </div>	
    </div>
    <!-- <div class="col-sm-offset-1"> -->
    <form class="form-horizontal" method="post" action="" name="PurchaseReturn">
          <fieldset>
   <div class="container" >
			 	
				<div class="row form-group">
           				 <label class="col-md-3 control-label" for="supplier">Vendor Name<sup>*</sup></label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="	glyphicon glyphicon-hand-right"></i>
									</span>
									
							<!-- Following code is to get Supplier from "supplier_details" table of "fertilizer" DB -->
							<!-- getAllSupllier() is implemented in  SupplierDetailsDao with return type List-->
						
							<%
								SupplierDetailsDao sdd = new SupplierDetailsDao();
           						List sList =sdd.getAllSupplier1(request);
							
							%>
							
							<input list="sup_drop" id="supplier" class="form-control" onchange="GetallBIllNo()"  >
				            <datalist id="sup_drop">
							
							<%
					           for(int i=0;i<sList.size();i++){
					        	   SupplierDetailsBean sup =(SupplierDetailsBean)sList.get(i);
							%>
		
							<option data-value="<%=sup.getSupId()%>" value="<%=sup.getDealerName() %>">
							<%
				      			}
				    		%>
						</datalist>           	
					</div>
           		</div>
            
           				    <label class="col-md-2 control-label" for="bill_no"> Bill No<sup>*</sup> </label>  
          					  <div class="col-md-3">
								<div class="input-group">
									<span class="input-group-addon">
										No
									</span>         		 					
           		 					<select class="form-control input-md" id='bill_no'  name="bill_no" onchange="fetchDataForPurchase()">
									</select>
           						 </div>
							</div>
							
<%-- 							<label class="col-md-2 control-label" for="purchaseDate">Date<sup>*</sup>
					</label>
					<div class="col-md-3">
						<div class="input-group">
							<span class="input-group-addon"> <i
								class="	glyphicon glyphicon-hand-right"></i>
							</span> <input  type="date" id="purchaseDate" name="purchaseDate"
								placeholder=" Date" class="form-control input-md" value="<%=todayDate%>" >

						</div>
					</div> --%>
						  </div>
						    <div class="row form-group" hidden="true">
						  <label class="col-md-3 control-label" for="purchaseDate">Challan
							Date<sup>*</sup>
						</label>
						<div  class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon"> <i
									class="	glyphicon glyphicon-hand-right"></i>
								</span> <input type="date" id="Challandate" name="purchaseDate"
									placeholder="Challan Date" class="form-control input-md"    value="<%=todayDate%>" 
									onchange="getAllShopName()">

							</div>
						</div>
						  </div>
		<!--  <div class="row" align="center">
		<div class="table-responsive">
				<table id="jqGrid" ></table>
				<div id="jqGridPager"></div>
			</div>
					dont delet following row 
			<div class="row row form-group">
			
			</div> -->
			</div>
						 <!--     <div class="row form-group">
	            	
				<label class="col-md-2 col-md-offset-6 control-label"  for="total" ><b>Total</b></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="total" name="total"  class="form-control input-md" type="text" >
	              				<input readonly="readonly" id="duptotal" name="total"  class="form-control input-md" type="hidden" >
	            			</div>
	            		</div>
					</div> -->
			
					<!-- <div class="row form-group" >
				
					<label class=" col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grossTotal" name="grossTotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	</div> -->
	
        </div>
             <div class="row form-group " style="padding-left: 50px;">
           		<table id="jqGrid" ></table>
				<div id="jqGridPager"></div>
            </div>
            
            <!-- <div class="row form-group" >
				
					<label class=" col-md-2 col-md-offset-6 control-label"  for="grossTotal"><h4><b>Gross Total</b></h4></label>  
			           	 <div class="col-md-3">
							<div class="input-group">
								<span class="input-group-addon">
									Rs
								</span>
	              				<input readonly="readonly" id="grosstotal" name="grosstotal" placeholder="Gross Total" class="form-control input-md" type="text" style="font-size: 25px;  height: 55px;">
	            			</div>
	            		</div>
            	</div> -->
             
            <div class="form-group row">
            	<div class="col-md-8 col-md-offset-2 text-center">
            		<!-- <input type="button" id="btn" style="font-size: 25" class="btn btn-large btn-success button-height-width" name="btn" onclick=" returntPurchase(); returntMinusFromStockPurchase();" value="Submit"> -->
            		<input type="button" id="save" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-success button-height-width" name="btn" onclick="returntPurchaseValidation(); " value="Submit">
            		
		            <input type="reset" id="btn1" style="font-size: 20px;font-weight: 500;padding: 0 8px;width: 100px;height: 45px;" class="btn btn-large btn-danger   button-height-width" name="btn1" value="Cancel">
           		</div>
          	</div>
		</fieldset>
       </form>
    <!-- </div> -->
     </body>
     <%@include file="commons/newFooter.jsp" %>
     
     <%-- <%@include file="commons/footer.jsp" %> --%>