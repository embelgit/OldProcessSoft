function saleReturn_new(){

	var params={};
	var input1 = document.getElementById('bill_no'),
	list = document.getElementById('bill_no_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}	
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pk_customer_id = allRowsInGrid[i].pk_customer_id;
		params["pk_customer_id"+i] = pk_customer_id;
		
		var okquantity = allRowsInGrid[i].okquantity;
		params["okquantity"+i] = okquantity;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var operation = allRowsInGrid[i].operation;
		params["operation"+i] = operation;
		
		var creditcustomer = allRowsInGrid[i].creditcustomer;
		params["creditcustomer"+i] = creditcustomer;
		
		var returnQuantity = allRowsInGrid[i].returnQuantity;
		params["returnQuantity"+i] = returnQuantity;
		
		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice"+i] = buyPrice;
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
		var quantity1 = allRowsInGrid[i].quantity1;
		params["quantity1"+i] = quantity1;
		
		var gst = allRowsInGrid[i].gst;
		params["gst"+i] = gst;
		
		var aadhar = allRowsInGrid[i].aadhar;
		params["aadhar"+i] = aadhar;
		
		var customerName = allRowsInGrid[i].customerName;
		params["customerName"+i] = customerName;
		
		var saleDate = allRowsInGrid[i].saleDate;
		params["saleDate"+i] = saleDate;
	}
	params["bill_no"] = bill_no;
	params["count"] = count;
    params["methodName"] = "returnSale_new";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				//returntMinusFromStockPurchase();
 				location.reload();	
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}



//sale return for Fetilizer
function saleReturn(){

	var params={};
	var input1 = document.getElementById('bill_no'),
	list = document.getElementById('bill_no_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}	
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkfertilizerBillId = allRowsInGrid[i].pkfertilizerBillId;
		params["pkfertilizerBillId"+i] = pkfertilizerBillId;
		
		var availbleQuantity = allRowsInGrid[i].availbleQuantity;
		params["availbleQuantity"+i] = availbleQuantity;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var company = allRowsInGrid[i].company;
		params["company"+i] = company;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var quantity1 = allRowsInGrid[i].quantity1;
		params["quantity1"+i] = quantity1;
		
		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice"+i] = salePrice;
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
		var quantity1 = allRowsInGrid[i].quantity1;
		params["quantity1"+i] = quantity1;
		
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage"+i] = taxPercentage;
		
		var aadhar = allRowsInGrid[i].aadhar;
		params["aadhar"+i] = aadhar;
		
		var customerName = allRowsInGrid[i].customerName;
		params["customerName"+i] = customerName;
		
		var insertDate = allRowsInGrid[i].insertDate;
		params["insertDate"+i] = insertDate;
	}
	params["bill_no"] = bill_no;
	params["count"] = count;
    params["methodName"] = "returnSale";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				//returntMinusFromStockPurchase();
 				location.reload();	
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}

//sale return for seed
function seedReturn(){
	var params={};
	var input1 = document.getElementById('seedBillNo'),
	list = document.getElementById('seedBillNo_drop'),
	i,seedBillNo;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			seedBillNo = list.options[i].getAttribute('data-value');
		}
	}	
	var count = jQuery("#jqGridSeed").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGridSeed').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkSeedBillingId = allRowsInGrid[i].pkSeedBillingId;
		params["pkSeedBillingId"+i] = pkSeedBillingId;
		
		var availbleQuantity = allRowsInGrid[i].availbleQuantity;
		params["availbleQuantity"+i] = availbleQuantity;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var company = allRowsInGrid[i].company;
		params["company"+i] = company;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var quantity1 = allRowsInGrid[i].quantity1;
		params["quantity1"+i] = quantity1;
		
		var batchNo = allRowsInGrid[i].batchNo;
		params["batchNo"+i] = batchNo;
		
		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice"+i] = salePrice;
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage"+i] = taxPercentage;
		
		var aadhar = allRowsInGrid[i].aadhar;
		params["aadhar"+i] = aadhar;
		
		var customerName = allRowsInGrid[i].customerName;
		params["customerName"+i] = customerName;
		
		var insertDate = allRowsInGrid[i].insertDate;
		params["insertDate"+i] = insertDate;
	}
	params["bill_no"] = seedBillNo;
	params["count"] = count;
    params["methodName"] = "seedSaleReturn";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				//returntMinusFromStockPurchase();
 				location.reload();	
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}

//Pesticide return for seed
function pesticideReturn(){
	var params={};
	var input1 = document.getElementById('pestiBillNo'),
	list = document.getElementById('pestiBillNo_drop'),
	i,pestiBillNo;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			pestiBillNo = list.options[i].getAttribute('data-value');
		}
	}	
	var count = jQuery("#jqGridPesti").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGridPesti').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkPesticideBillingId = allRowsInGrid[i].pkPesticideBillingId;
		params["pkPesticideBillingId"+i] = pkPesticideBillingId;
		
		var availbleQuantity = allRowsInGrid[i].availbleQuantity;
		params["availbleQuantity"+i] = availbleQuantity;
		
		var productName = allRowsInGrid[i].productName;
		params["productName"+i] = productName;
		
		var company = allRowsInGrid[i].company;
		params["company"+i] = company;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var quantity1 = allRowsInGrid[i].quantity1;
		params["quantity1"+i] = quantity1;
		
		var batchNo = allRowsInGrid[i].batchNo;
		params["batchNo"+i] = batchNo;
		
		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice"+i] = salePrice;
		
		var mrp = allRowsInGrid[i].mrp;
		params["mrp"+i] = mrp;
		
		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage"+i] = taxPercentage;
		
		var aadhar = allRowsInGrid[i].aadhar;
		params["aadhar"+i] = aadhar;
		
		var customerName = allRowsInGrid[i].customerName;
		params["customerName"+i] = customerName;
		
		var insertDate = allRowsInGrid[i].insertDate;
		params["insertDate"+i] = insertDate;
		
	}
	params["bill_no"] = pestiBillNo;
	params["count"] = count;
    params["methodName"] = "pesticideSaleReturn";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				//returntMinusFromStockPurchase();
 				location.reload();	
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}




//Fetch data for sale return fron bill table
function fetchDataForSaleReturn(){
	
	var input = document.getElementById('bill_no'),
	list = document.getElementById('bill_no_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};
	
	params["methodName"] = "getAllFertiIetmByBillNoSale";
	
	params["bill_no"]= bill_no;
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

		 
		var jsonData = $.parseJSON(data);
		//$("#jqGrid1").jqGrid("clearGridData", true);
		
		$("#jqGrid").jqGrid("clearGridData", true).trigger("reloadGrid");


		$.each(jsonData,function(i,v)
				{
			$("#jqGrid").jqGrid({
			
				datatype:"local",

				colNames: ["Customer ID","Customer Name","Supplier Name","ProductName","Operation","Supplier","Sale Date","Rate","discount","gst","igst","TaxAmount","Quantity","Return Qty","Grid Total","grosstotal","Billno"],

				colModel: [
				           { 	
				        	   name: "pk_customer_id",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "custname",
				        	   width:70,
				        	   hidden : true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "suppliername",
				        	   width:80,
				        	   hidden :true
				        	   //resizable: true,
				           },
				           
				           {
				        	   name: "productName",
				        	   width: 70
				           },
				           {
				        	   name: "operation",
				        	   width: 70,
				        	   
				           },	
				           {
				        	   name: "creditcustomer",
				        	   width: 70,
				        	   
				        	   
				           },
				           { 	 
				        	   name: "saleDate",
				        	   width:70,
				        	   
				           },
				           {
				        	   name: "buyPrice",
				        	   width: 70,
				        	   //editable:true
				           },
				           {
				        	   name: "discount1",
				        	   width: 50,
				        	   //editable:true
				           },
				           {
				        	   name: "gst",
				        	   width: 70,
				        	   //editable:true
				        	   
				           },
				           {
				        	   name: "igst",
				        	   width: 70,
				        	   //editable:true
				           },
				           {
				        	   name: "taxamount",
				        	   width: 80,
				        	   //editable:true
				           },
				           {
				        	   name:  "okquantity",
				        	   width: 70
				        	   
				           },
				           {
				        	   name:  "returnQuantity",
				        	   width: 70,
				        	   editable:true
				           },
				           			           
				           {
				        	   name: "gridTotal",
				        	   width: 70,
				        	   hidden : true
				        	   //editable:true
				           },
				           				          
				           {
				        	   name : 'grossTotal1',
				        	   //formatter: sumFmatter,
				        	   width: 70,
				        	   hidden : true
				        	  
				           },
				         
				           
				           {
				        	   name: "billNo",
				        	   width: 70,
				        	   hidden : true
				        	   //editable:true
				           }
				           
				           
				           
				           
				           ],


				           sortorder : 'desc',
				           //multiselect: false,	
				           loadonce: false,
				           rownumbers:true,
				           //forcePlaceholderSize: true ,
				           viewrecords: true,
				           width: 1400,
				           shrinkToFit:true,
				           rowheight : 300,
							hoverrows : true,
				           rowNum: 10,
				           'cellEdit':true,
				           viewrecords: true,
				           width: 1040,
				          shrinkToFit:true,
				           rowNum: 10,
				           pager: "#jqGridPager",
				           sortorder: "desc",
			});

			$("#jqGrid").addRowData(i,jsonData[i]);
			
			$('#jqGrid').navGrid('#jqGridPager',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					{
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					
					},
					{},
					// options for the Delete Dialogue
					{    
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid").saveRow(lastSel, true, 'clientArray');
								jQuery("#jqGrid").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
			
		// grid refresh code	
			
				});
		        function validatePositive(value, column) {
		        var rowId =$("#jqGrid").jqGrid('getGridParam','selrow');  
	            var rowData = jQuery("#jqGrid").getRowData(rowId);
	            var quan = rowData['availbleQuantity']; 	
		        	
                if (value > quan)
                return [false, "Return Quantity Must Be Less Than "+quan+ " !!!"];
                else
                return [true, ""];
                }   
       
			}); 
			
}



//Fetch data for sale return fron bill table
function fetchDataForSale(){
	
	var input = document.getElementById('bill_no'),
	list = document.getElementById('bill_no_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};
	
	params["methodName"] = "getAllFertiIetmByBillNo";
	
	params["bill_no"]= bill_no;
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

		 
		var jsonData = $.parseJSON(data);
		//$("#jqGrid1").jqGrid("clearGridData", true);
		
		$("#jqGrid").jqGrid("clearGridData", true).trigger("reloadGrid");


		$.each(jsonData,function(i,v)
				{
			$("#jqGrid").jqGrid({
			
				datatype:"local",

				colNames: ["pk fertilizerBill ID","fkGoodsReceive","catId","customerName","Adhar No","Product Name","Company","Packing","Sale Price","M.R.P","Available Quantity","Return Quantity","Sale Date","Tax %" ],

				colModel: [
				           { 	
				        	   name: "pkfertilizerBillId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "fkGoodsReceive",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "catId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "customerName",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           {
				        	   name: "aadhar",
				        	   width: 90
				           },
				           { 	
				        	   name: "productName",
				        	   width:100,
				        	   //resizable: true,
				           },
				         
				           {
				        	   name: "company",
				        	   width: 80
				           },
				           {
				        	   name: "weight",
				        	   width: 60
				           },
				        
				           {
				        	   name: "salePrice",
				        	   width: 60,
				           },
				       
				           {
				        	   name : 'mrp',
				        	   //formatter: sumFmatter,
				        	   width: 60
				           },
				           
				           {
				        	   name: "availbleQuantity",
				        	   width: 40,
				        	   
				           },
				           {
				        	   name: "quantity1",
				        	   width: 40,
				        	   editable:true,
				        	  /* editrules:{
		                            custom_func: validatePositive,
		                            custom: true,
		                            number:true,
		                            required: true
		                        }*/
				           },
				         
				           {
				        	   name: "insertDate",
				        	   width:60
				           },
				           {
				        	   name: "taxPercentage",
				        	   width:40
				           }
				           
				          
				           ],


				           sortorder : 'desc',
				           
				           multiselect: false,	
				           loadonce: false,
				           rownumbers:true,
				           forcePlaceholderSize: true ,
				           'cellEdit':true,
				           viewrecords: true,
				           width: 1040,
				          shrinkToFit:true,
				           rowNum: 10,
				           pager: "#jqGridPager",
				           sortorder: "desc",
			});

			$("#jqGrid").addRowData(i,jsonData[i]);
			
			$('#jqGrid').navGrid('#jqGridPager',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					{
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					
					},
					{},
					// options for the Delete Dialogue
					{    
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid").saveRow(lastSel, true, 'clientArray');
								jQuery("#jqGrid").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
			
		// grid refresh code	
			
				});
		        function validatePositive(value, column) {
		        var rowId =$("#jqGrid").jqGrid('getGridParam','selrow');  
	            var rowData = jQuery("#jqGrid").getRowData(rowId);
	            var quan = rowData['availbleQuantity']; 	
		        	
                if (value > quan)
                return [false, "Return Quantity Must Be Less Than "+quan+ " !!!"];
                else
                return [true, ""];
                }   
       
			}); 
			
}
	

//Seed billing details for sale return
function fetchSeedDataForSale(){
	
	var input = document.getElementById('seedBillNo'),
	list = document.getElementById('seedBillNo_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};
	
	params["methodName"] = "getAllSeedBillinfDetailsByBillNo";
	
	params["bill_no"]= bill_no;
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

		 
		var jsonData = $.parseJSON(data);
		//$("#jqGrid1").jqGrid("clearGridData", true);
		
		$("#jqGridSeed").jqGrid("clearGridData", true).trigger("reloadGrid");

	
		 
		$.each(jsonData,function(i,v)
				{
			$("#jqGridSeed").jqGrid({
			
				datatype:"local",

				colNames: ["pk SeedBill ID","catId","customerName","Adhar No","Product Name","Company","Packing","Batch Number","Sale Price","M.R.P","Available Quantity","Return Quantity","Sale Date","Tax %" ],

				colModel: [
				           { 	
				        	   name: "pkSeedBillingId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				          
				           { 	
				        	   name: "catId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "customerName",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           {
				        	   name: "aadhar",
				        	   width: 90
				           },
				           { 	
				        	   name: "productName",
				        	   width:100,
				        	   //resizable: true,
				           },
				         
				           {
				        	   name: "company",
				        	   width: 80
				           },
				           {
				        	   name: "weight",
				        	   width: 60
				           },
				           {
				        	   name: "batchNo",
				        	   width: 60
				           },
				        
				           {
				        	   name: "salePrice",
				        	   width: 60,
				           },
				       
				           {
				        	   name : 'mrp',
				        	   //formatter: sumFmatter,
				        	   width: 60
				           },
				           
				           {
				        	   name: "availbleQuantity",
				        	   width: 40,
				        	   
				           },
				           {
				        	   name: "quantity1",
				        	   width: 40,
				        	   editable:true,
				        	   /*editrules:{
		                            custom_func: validatePositive,
		                            custom: true,
		                            number:true,
		                            required: true
		                        }*/
				           },
				         
				           {
				        	   name: "insertDate",
				        	   width:60
				           },
				           {
				        	   name: "taxPercentage",
				        	   width:40
				           }
				          
				           ],


				           sortorder : 'desc',
				           
				           multiselect: false,	
				           loadonce: false,
				           rownumbers:true,
				           forcePlaceholderSize: true ,
				           'cellEdit':true,
				           viewrecords: true,
				           width: 1200,
				           height: 250,
				           rowNum: 10,
				           pager: "#jqGridPagerSeed",
				           sortorder: "desc",
			});

			$("#jqGridSeed").addRowData(i,jsonData[i]);
			
			$('#jqGridSeed').navGrid('#jqGridPagerSeed',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					{
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					
					},
					{},
					// options for the Delete Dialogue
					{    
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGridSeed").saveRow(lastSel, true, 'clientArray');
								jQuery("#jqGridSeed").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
			
		// grid refresh code	
			
				});
		        function validatePositive(value, column) {
		        var rowId =$("#jqGridSeed").jqGrid('getGridParam','selrow');  
	            var rowData = jQuery("#jqGridSeed").getRowData(rowId);
	            var quan = rowData['availbleQuantity']; 	
		        	
                if (value <= quan)
                return [true, ""];	
                else
                return [false, "Return Quantity Must Be Less Than "+quan+ " !!!"];
                }   
       
			}); 
			
}




//Pesticide billing details for sale return
function fetchPesticideDataForSale(){
	
	var input = document.getElementById('pestiBillNo'),
	list = document.getElementById('pestiBillNo_drop'),
	i,bill_no;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			bill_no = list.options[i].getAttribute('data-value');
		}
	}
	
	var params= {};
	
	params["methodName"] = "getAllPesticideBillingDetailsByBillNo";
	
	params["bill_no"]= bill_no;
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

		 
		var jsonData = $.parseJSON(data);
		//$("#jqGrid1").jqGrid("clearGridData", true);
		
		$("#jqGridPesti").jqGrid("clearGridData", true).trigger("reloadGrid");

	
		 
		$.each(jsonData,function(i,v)
				{
			$("#jqGridPesti").jqGrid({
			
				datatype:"local",

				colNames: ["pk PestiBill ID","catId","customerName","Adhar No","Product Name","Company","Packing","Batch Number","Sale Price","M.R.P","Available Quantity","Return Quantity","Sale Date","Tax %" ],

				colModel: [
				           { 	
				        	   name: "pkPesticideBillingId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				          
				           { 	
				        	   name: "catId",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "customerName",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           {
				        	   name: "aadhar",
				        	   width: 90
				           },
				           { 	
				        	   name: "productName",
				        	   width:100,
				        	   //resizable: true,
				           },
				         
				           {
				        	   name: "company",
				        	   width: 80
				           },
				           {
				        	   name: "weight",
				        	   width: 60
				           },
				           {
				        	   name: "batchNo",
				        	   width: 60
				           },
				        
				           {
				        	   name: "salePrice",
				        	   width: 60,
				           },
				       
				           {
				        	   name : 'mrp',
				        	   //formatter: sumFmatter,
				        	   width: 60
				           },
				           
				           {
				        	   name: "availbleQuantity",
				        	   width: 40,
				        	   
				           },
				           {
				        	   name: "quantity1",
				        	   width: 40,
				        	   editable:true,
				        	  /* editrules:{
		                            custom_func: validatePositive,
		                            custom: true,
		                            number:true,
		                            required: true
		                        }*/
				           },
				          
				           {
				        	   name: "insertDate",
				        	   width:60
				           },
				           {
				        	   name: "taxPercentage",
				        	   width:40
				           }
				          
				           ],


				           sortorder : 'desc',
				           
				           multiselect: false,	
				           loadonce: false,
				           rownumbers:true,
				           forcePlaceholderSize: true ,
				           'cellEdit':true,
				           viewrecords: true,
				           width: 1200,
				           height: 250,
				           rowNum: 10,
				           pager: "#jqGridPagerPesti",
				           sortorder: "desc",
			});

			$("#jqGridPesti").addRowData(i,jsonData[i]);
			
			$('#jqGridPesti').navGrid('#jqGridPagerPesti',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					{
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					
					},
					{},
					// options for the Delete Dialogue
					{    
						/*afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},*/
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGridPesti").saveRow(lastSel, true, 'clientArray');
								jQuery("#jqGridPesti").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						}
						
						
					});
			
		// grid refresh code	
			
				});
		        function validatePositive(value, column) {
		        var rowId =$("#jqGridPesti").jqGrid('getGridParam','selrow');  
	            var rowData = jQuery("#jqGridPesti").getRowData(rowId);
	            var quan = rowData['availbleQuantity']; 	
		        	
                if (value > quan)
                return [false, "Return Quantity Must Be Less Than "+quan+ " !!!"];
                else
                return [true, ""];
                }   
       
			}); 
			
}


function saleReturnVendorNameWiseValidation(){
	
	var vendorName = $('#vendorName').val();
 	var billNo = $('#billNo').val();


	if(vendorName == "" || vendorName == null)
	{
		alert("Please select vender name...!");
		document.getElementById("vendorName").focus();
		return false;
	}
	if(billNo == "" || billNo == null)
	{
		alert("Please select bill number...!");
		document.getElementById("billNo").focus();
		return false;
	}
	saleReturnVendorNameWise();
}
function saleReturnVendorNameWise()
{
	var params= {};
	var vendorName = $("#vendorName").val(); 
    var billNo = $("#billNo").val(); 
	
	params["billNo"]= billNo;
	params["vendorName"]= vendorName;
	
	params["methodName"] = "saleReturnVendorNameWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#VendorTbl').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#VendorTbl').DataTable( {
					 		fnRowCallback : function(nRow, aData, iDisplayIndex){
				            $("th:first", nRow).html(iDisplayIndex +1);
				            return nRow;
				        },
			   "footerCallback": function ( row, data, start, end, display ) 
			   {
		            var api = this.api(), data;
	                // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		            return typeof i === 'string' ?
		            i.replace(/[\$,]/g, '')*1 :
				    typeof i === 'number' ?
	                i : 0;
               };
       
               // Total over this page
	           pageTotal = api
	                .column( 5 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 5 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
		         /*  pageTotal = api
		                .column( 8 )
		                .data()
		                .reduce( function (a, b) 
		                		{
		                          return intVal(a) + intVal(b);
		                        }, 0 );
		 
		            // Update footer
		            $( api.column( 8 ).footer() ).html(
		              parseFloat(pageTotal).toFixed(2)
		            );
		            console.log( pageTotal);*/
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "pkSaleReturnId", "width": "5%"},
           {"data": "BillNo", "width": "5%"},
           {"data": "productName" , "width": "5%"},
           {"data": "company" , "width": "5%"},
           {"data": "customerName" , "width": "5%"},
           {"data": "salePrice", "width": "5%"},
           {"data": "taxPercentage", "width": "5%"},
           //{"data": "igst", "width": "5%"},
           {"data": "availableQuantity" , "width": "5%"},
           {"data": "returnQuantity", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Sale Return Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Sale Return Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Sale Return Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Sale Return Report'
           },
           {
           	 extend: 'print',
               title: 'Sale Return Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTbl').dataTable().fnAddData(mydata);

}


);

}









