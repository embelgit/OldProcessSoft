function StockDetailsReportAsPerCompanyName(){
	var params= {};
	
	companyName = $('#company_name').val();
	params["companyName"]= companyName;
	
	params["companyName"]= companyName;
	
	params["methodName"] = "StockDetailsReportAsPerCompanyName";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
		$('#companyWiseTable').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if (catmap == "") {
			//alert("there is no data available for selected field.");
			alert("Stock Is Not Available...!!!");
			return true;
		}
		
		$(document).ready(function() {
		 var total =   $('#companyWiseTable').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
	            "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		         
		            pageTotal = api
		                .column( 4 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 4 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },
    	
	            destroy: true,
		        searching: false,
		      
		columns: [
			{"data": "StrproductName", "width": "5%"},
			{"data": "StrcompanyName", "width": "5%"},
			{"data": "dInwardChallanNo", "width": "5%"},
			{"data": "dOutwardChallanNo" , "width": "5%"},
			{"data": "dInwardQty", "width": "5%"},
			{"data": "dOutwardQty", "width": "5%"},
			{"data": "Unproquantity", "width": "5%"},
			{"data": "rejquantity", "width": "5%"},
			{"data": "AvaInwQuantity1" , "width": "5%"},
		/*	{"data": "RejectedQty" , "width": "5%"},*/
			/*{"data": "dbalanceQty" , "width": "5%"},*/
			{"data": "NewTOtal" , "width": "5%"},
		        
		        ],
		      
		    } );
		} );
		
	var mydata = catmap;
	$('#companyWiseTable').dataTable().fnAddData(mydata);
	
		}
	
	);
}






function StockDetailsReportAsPerCat(){
	var params= {};
	
	var input1 = document.getElementById('fk_cat_id'),
	list = document.getElementById('cat_drop'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}
	
	params["cat"]= fk_cat_id;
	
	params["methodName"] = "getStockReportAsPerCategory";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#stockByCat').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#stockByCat').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
		   		 "footerCallback": function ( row, data, start, end, display ) {
			            var api = this.api(), data;
			 
			            // Remove the formatting to get integer data for summation
			            var intVal = function ( i ) {
			                return typeof i === 'string' ?
			                    i.replace(/[\$,]/g, '')*1 :
			                    typeof i === 'number' ?
			                        i : 0;
			            };
			 
			         
			            pageTotal = api
			                .column( 3 )
			                .data()
			                .reduce( function (a, b) {
			                    return intVal(a) + intVal(b);
			                }, 0 );
			 
			            // Update footer
			            $( api.column( 3 ).footer() ).html(
			            		
			              parseFloat(pageTotal).toFixed(2)
			               
			            );
			            console.log( pageTotal);
		            
		        },
	    	
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		            {"data": "productName", "width": "5%"},
		            {"data": "companyName", "width": "5%"},
		            {"data": "weight", "width": "5%"},
		            {"data": "quantity" , "width": "5%"},
		        
		        ],
		      
		        
		    } );
		} );
		
	var mydata = catmap;
	$('#stockByCat').dataTable().fnAddData(mydata);
	
		}
	

	);

}


function StockDetailsOfcontainer(){


	
	var params= {};
	
	var input1 = document.getElementById('containerName'),
	list = document.getElementById('Container_drop'),
	i,containerName;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			containerName = list.options[i].getAttribute('data-value1');
		}
	}
	
	var input2 = document.getElementById('containerName'),
	list = document.getElementById('Container_drop'),
	i,capacity;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			capacity = list.options[i].getAttribute('data-value2');
		}
	}
	
	var input3 = document.getElementById('containerName'),
	list = document.getElementById('Container_drop'),
	i,unitId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			unitId = list.options[i].getAttribute('data-value3');
		}
	}
	
	
	
	params["containerName"]= containerName;
	params["capacity"]= capacity;
	params["unitId"]= unitId;
	
	params["methodName"] = "StockDetailsOfcontainer";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#stockByGodown').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#stockByGodown').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
			
	    	
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		          	{"data": "containerName" , "width": "5%"},
		            {"data": "packing_Type", "width": "5%"},
		            {"data": "unitName", "width": "5%"},
		            {"data": "Upadatedate", "width": "5%"},
		            {"data": "quantity", "width": "5%"},
		        
		        ],
		      
		        
		    } );
		} );
		
	var mydata = catmap;
	$('#stockByGodown').dataTable().fnAddData(mydata);
	
		}
	

	);


}

//packed and unpacked stock
function PackedAndUnpackedStock(){


	
	var params= {};
	
	var input1 = document.getElementById('productname'),
	list = document.getElementById('product_drop'),
	i,productname;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			productname = list.options[i].getAttribute('data-value1');
		}
	}
	
	var input2 = document.getElementById('productname'),
	list = document.getElementById('product_drop'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value2');
		}
	}
	
	var input3 = document.getElementById('productname'),
	list = document.getElementById('product_drop'),
	i,fk_subcat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_subcat_id = list.options[i].getAttribute('data-value3');
		}
	}
	
	
	
	params["productname"]= productname;
	params["fk_cat_id"]= fk_cat_id;
	params["fk_subcat_id"]= fk_subcat_id;
	
	params["methodName"] = "PackedAndUnpackedStock";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
		
		$('#packedUnpackedstock').dataTable().fnClearTable();
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		
		
		$(document).ready(function() {
		 var total =   $('#packedUnpackedstock').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
			
	    	
		    	destroy: true,
		        searching: false,
		        
		      
		columns: [
		          	{"data": "productName" , "width": "5%"},
		            {"data": "manufacturingCompany", "width": "5%"},
		            {"data": "updateDate", "width": "5%"},
		            {"data": "quantity", "width": "5%"},
		            {"data": "packedQuantity", "width": "5%"},
		            {"data": "unpackedQuantity", "width": "5%"},
		        
		        ],
		      
		        
		    } );
		} );
		
	var mydata = catmap;
	$('#packedUnpackedstock').dataTable().fnAddData(mydata);
	
		}
	

	);


}


/*** +++ Fetching product Name+++ *****/
function getProductName(){
		
		$("#proName").empty();
		$("#proName").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllProductByCategoriesForStockReport";
		
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{ var count = 1;
				
			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#proName").append($("<option></option>").attr("value",count).text(v.product)); 
					count++;
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	
}


function StockDetailsReportAsPerProductName(){
	var params= {};
	
	$("#proName option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var proName = splitText[0];
	var company = splitText[1];
	/*var weight = splitText[2];*/
	
	params["proName"]= proName;
	params["company"]= company;
	/*params["weight"]= weight;*/
	
	params["methodName"] = "StockDetailsReportAsPerProductName";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
		$('#productTable').dataTable().fnClearTable();
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		
		if (catmap == "") {
			//alert("there is no data available for selected field");
			alert("Stock Is Not Available...!!!");
			return true;
		}
		
		$(document).ready(function() {
		 var total =   $('#productTable').DataTable( {
			 
			 fnRowCallback : function(nRow, aData, iDisplayIndex){
	                $("th:first", nRow).html(iDisplayIndex +1);
	               return nRow;
	            },
	            "footerCallback": function ( row, data, start, end, display ) {
		            var api = this.api(), data;
		 
		            // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		                return typeof i === 'string' ?
		                    i.replace(/[\$,]/g, '')*1 :
		                    typeof i === 'number' ?
		                        i : 0;
		            };
		 
		         
		            pageTotal = api
		                .column( 4 )
		                .data()
		                .reduce( function (a, b) {
		                    return intVal(a) + intVal(b);
		                }, 0 );
		 
		            // Update footer
		            $( api.column( 4 ).footer() ).html(
		            		
		              parseFloat(pageTotal).toFixed(2)
		               
		            );
		            console.log( pageTotal);
	            
	        },
    	
	            destroy: true,
		        searching: false,
		      
		columns: [
					{"data": "StrproductName", "width": "5%"},
					{"data": "StrcompanyName", "width": "5%"},
					{"data": "dInwardChallanNo", "width": "5%"},
					{"data": "dOutwardChallanNo" , "width": "5%"},
					{"data": "dInwardQty", "width": "5%"},
					{"data": "dOutwardQty", "width": "5%"},
					{"data": "Unproquantity", "width": "5%"},
					{"data": "rejquantity", "width": "5%"},
					{"data": "AvaInwQuantity1" , "width": "5%"},
					/*{"data": "RejectedQty" , "width": "5%"},*/
					/*{"data": "dbalanceQty" , "width": "5%"},*/
					{"data": "NewTOtal" , "width": "5%"},
					
					
		        
		        ],
		      
		    } );
		} );
		
	var mydata = catmap;
	$('#productTable').dataTable().fnAddData(mydata);
	
		}
	
	);
}



/*** +++ Fetching product Name+++ *****/
function getProductNameForStockReport(){
		
		$("#proName").empty();
		$("#proName").append($("<option></option>").attr("value","").text("Select product"));
		var params= {};
		
		params["methodName"] = "getAllProductByCategoriesForStockReport";
		
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{ var count = 1;
				
			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#proName").append($("<option></option>").attr("value",count).text(v.product + ","+v.manufacturer+","+v.weight+","+v.unitName)); 
					count++;
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	
}