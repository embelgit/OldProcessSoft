
function getAllBills()
	{
		
		/* var input = document.getElementById('supplier'),
	     list = document.getElementById('sup_drop'),
	     i,supplier;
	
		for (i = 0; i < list.options.length; ++i) {
	     if (list.options[i].value === input.value) {
	    	 supplier = list.options[i].getAttribute('data-value');
	     }
	 }*/
		
	 var supplier =$('#supplier').val();
		$("#bill_no").empty();
		$("#bill_no").append($("<option></option>").attr("value","").text("Select bill"));
		var params= {};
		
		params["methodName"] = "getAllBillBySuppliers";
		
		params["supplier"]= supplier;
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				$("#bill_no").append($("<option></option>").attr("value",i).text(v.billno)); 
				
					});
				})

	}


function GetallBIllNo(){
	
	
	
	 var supplier =$('#supplier').val();
		$("#bill_no").empty();
		$("#bill_no").append($("<option></option>").attr("value","").text("Select bill"));
		var params= {};
		
		params["methodName"] = "getAllBillBySuppliers_new";
		
		params["supplier"]= supplier;
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				$("#bill_no").append($("<option></option>").attr("value",v.billno).text(v.billno)); 
				//$("#Challanno").append($("<option></option>").attr("value",v.outwardchallanno).text(v.outwardchallanno)); 
				
					});
				})
}




function fetchDataForPurchase(){
	
	var bill_no = $('#bill_no').val();
	var supplier = $('#supplier').val();
	//var supplier =$('#supplier').val();
	/*var input = document.getElementById('supplier'),
    list = document.getElementById('sup_drop'),
    i,supplier;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
   	 supplier = list.options[i].getAttribute('data-value');
    }
    }*/
	
	var params= {};
	
	params["methodName"] = "getAllIetmByBillNo";
	
	params["bill_no"]= bill_no;
	params["supplier"]= supplier;
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ 

		 
		var jsonData = $.parseJSON(data);
		//$("#jqGrid1").jqGrid("clearGridData", true);
		
		
		$("#jqGrid").jqGrid("clearGridData", true).trigger("reloadGrid");

		/* function sumFmatter (cellvalue, options, rowObject)
	        {
			 
			
			 
	        	var jam=0;
	        	var jam1="";
	        	var tot= (options.rowData.quantity * options.rowData.buyPrice);
	        	//var shree = document.poferti.grossTotal.value;// to get gross total
	     
	        	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	        	var allRowsInGrid1 = $('#jqGrid').getGridParam('data');
	        	var AllRows=JSON.stringify(allRowsInGrid1);
	        	for (var i = 0; i < count; i++) {
	        		
	            	var quantity = allRowsInGrid1[i].quantity;
	             	params["quantity"+i] = quantity;
	             	
	             	var buyPrice = allRowsInGrid1[i].buyPrice;
	            	params["buyPrice"+i] = buyPrice;
	            	
	            	
	            	var totals1=((buyPrice)*(quantity));
	            
	            	jam = jam + totals1;
	            	
	            
        	    }
	        	if(count == 0){
	        		document.getElementById("total").value = tot;
	        		document.getElementById("duptotal").value = tot;
	        	}else{
	        	document.getElementById("total").value = jam;
	        	document.getElementById("duptotal").value = jam;
	        	}
	        	
 	
	           return tot;
	 		   }
	       
	          	
	      
	        
		*/
	
		 
		$.each(jsonData,function(i,v)
				{
			$("#jqGrid").jqGrid({
			
				datatype:"local",

				colNames: ["Product ID","IdNo","Supplier Name","Date","ProductName","Operation","Rate","discount","gst"/*,"igst"*/,"TaxAmount","Unit","Quantity","ReturnQty","Total","grosstotal","Billno"],

				colModel: [
				           { 	
				        	   name: "pk_GRDetails_id",
				        	   hidden:true
				        	   //resizable: true,
				           },
				           { 	
				        	   name: "idno",
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
				        	   name: "Date1",
				        	   width:70,
				        	   //hidden : true
				           },
				           {
				        	   name: "productname",
				        	   width: 70
				           },
				           {
				        	   name: "operation",
				        	   width: 70,
				        	   //editable:true
				           },	
				          
				           {
				        	   name: "rate",
				        	   width: 70,
				        	   //editable:true
				           },
				           {
				        	   name: "discount",
				        	   width: 50,
				        	   //editable:true
				           },
				           {
				        	   name: "gst",
				        	   width: 70,
				        	  // editable:true
				        	   
				           },
				           /*{
				        	   name: "igst",
				        	   width: 70,
				        	   editable:true
				           },*/
				           {
				        	   name: "TaxAmount",
				        	   width: 80,
				        	   //editable:true
				           },
				           {
				        	   name: "unit",
				        	   width: 80,
				        	   //editable:true
				           },
				           {
				        	   name:  "quantity",
				        	   width: 70
				        	   
				           },
				           {
				        	   name: "Quantity1",
				        	   width: 70,
				        	   editable:true
				        	   
				           },
				           {
				        	   name: "GridTotal",
				        	   width: 70,
				        	   hidden : true
				        	   //editable:true
				           },
				           {
				        	   name : 'grosstotal',
				        	   //formatter: sumFmatter,
				        	   width: 70,
				        	   hidden : true
				           },
				           {
				        	   name: "billno",
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
				           width: 1240,
				          shrinkToFit:true,
				           rowNum: 10,
				           pager: "#jqGridPager",
				           sortorder: "desc",
							/*
							rowheight : 300,
							hoverrows : true,*/
							
				           afterSaveCell : function() {
								// $(this).trigger('reloadGrid');
								var rowId = $("#jqGrid").jqGrid('getGridParam',
										'selrow');
								var rowData = jQuery("#jqGrid").getRowData(rowId);
								var count1 = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
								var quantity = rowData['quantity'];
								//var Quantity1 = rowData['Quantity1'];
								var buyPrice = rowData['rate'];
								var discount = rowData['discount'];
								var TaxAmount = rowData['TaxAmount'];
								var operation =rowData['operation'];
								var gst = rowData['gst'];
								var igst = rowData['igst'];
								
 								var unit =rowData['unit'];
								// new calculation value for Discount and GST
								var GridTotal = rowData['GridTotal'];
								var grosstotal = rowData['grosstotal'];
								 var Quantity1 = rowData['Quantity1'];
								
								if(gst == "")
								{
									gst = 0;
								}
								if(igst == "")
								{
									igst = 0;
								}
								
								var discount = rowData['discount'];
								var unit = rowData['unit'];

								var vatAmt = 0;
								/* var discount = 0; */
								var tota = 0;
								var totAmt = 0;
								var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

								var gst1 = 0;
								var iGst1 = 0;

								// for calculation of gst and total after change in
								// quantity and buy price in resp to itemname
								// to display gst total and igst total

								/*
								 * var TotalGst =
								 * document.getElementById("totalGst").value; var
								 * TotalIgst =
								 * document.getElementById("totalIgst").value;
								 */

								var TotalGst = 0;
								var TotalIgst = 0;
								var sGstAmt = 0;
								var cGstAmt = 0;

								// for(var r = 0;r < count1;r++){
								// var rowId = ids[r];
								var rowData = jQuery("#jqGrid").getRowData(rowId);
								
								/*if(Operation !=""){
									var oper =/^[a-zA-Z, ]+$/;
									if(Operation.match(oper))
										{
										
										}
									else
										{
										alert("Please Enter Alphabates In Operation");
										//$('#jqGrid').trigger( 'reloadGrid' );
										return false;
										
										}
								}*/
								
								if(Quantity1 !=""){
									//	var quan =/^[0-9 ]+$/;
						              var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
										if(Quantity1.match(quan))
											{	
											
											}
										else
											{
											var quant ="0";
											alert("Please Enter Quantity In Numbers");
											$("#jqGrid").jqGrid("setCell",rowId, "Quantity1", quant);
											return false;
											
											}
									}

								/*if(quantity > Quantity1){
									alert("The Total Of  (Qty) is greter than  "+quantity+"  Return  Quantity");
									
									var abc = 0 ;
									$("#jqGrid").jqGrid("setCell",rowId, "Quantity1", abc);
									location.reload();
									return false;
									
								}*/
								if(buyPrice !=""){
									var price =  /^\d{0,10}(?:\.\d{0,2})?$/;
									if(buyPrice.match(price))
										{
										
										}
									else {
										var prices ="0";
										alert("Please Enter Rate In Numbers");
										$("#jqGrid").jqGrid("setCell",rowId, "buyPrice", prices);
											location.reload();
										return false;
										
										
									}
								}
								if(discount !="")
									{
									var dis =/^[0-9 ]+$/;
									if(discount.match(dis))
										{
										
										}
									else{
										var dis ="0";
										alert("Please Enter Discount In Number");
										$("#jqGrid").jqGrid("setCell",rowId, "discount", dis);
									return false;	
									}
									}
								if(gst !="")
									{
									var gs = /^[0-9 ]+$/;
									if(gst.match(gs))
										{
										
										}
									else
										{
										var gs ="0";
										alert("Please Enter GST In Numbers");
										$("#jqGrid").jqGrid("setCell",rowId, "gst", gs);
										
										return false;
										
										}
									}
								if(igst !="")
									{
									var igs =  /^[0-9 ]+$/;
									if(igst.match(igs))
										{
										
										}
									else {
										var igs ="0";
										alert("Please Enter IGST In Numbers");
										$("#jqGrid").jqGrid("setCell",rowId, "igst", igs);
										return false;
									}
									}
								if(igst >0 && gst > 0 )
								{
								var abc ="0";
								alert(" Please Enter GST Number OR IGST Number");
								$("#jqGrid").jqGrid("setCell",rowId, "igst", abc);

								$("#jqGrid").jqGrid("setCell",rowId, "gst", abc);
							
								return false;
								}
								if(unit != ""){
									var uni   =/^[a-zA-Z, ]+$/;
									if(unit.match(uni)){
										
									}
									else {
										alert("Please Enter Alphabates In Unit");
										//$('#jqGrid').trigger( 'reloadGrid' );
										return false;
									}
								}
								
								
								// var buyPrice = rowData['buyPrice'];
								
								tota = Quantity1 * buyPrice;
								disAmt = (tota/100)*discount;// this is discount
																// AMOUNT
								idisAmt = tota - disAmt; // total amount minus
														// discount amount
								
								
								
								
								
								
								
								
								if(gst!="0")
									{
									
									gstAmt = (idisAmt*gst)/100;
									totAmt = (idisAmt + gstAmt).toFixed(2);
									//$("#jqGrid").jqGrid("setCell", rowId, "gst",gst);
									$("#jqGrid").jqGrid("setCell", rowId, "TaxAmount",gstAmt);
									//$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);
									}
								else {
									
									igstAmt = (idisAmt*igst)/100;
									totAmt = (idisAmt + igstAmt).toFixed(2);
									$("#jqGrid").jqGrid("setCell", rowId, "TaxAmount",igstAmt);
									//$("#jqGrid").jqGrid("setCell", rowId, "gst",igst);
									//$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);
								}
								/*
								gstAmt = (idisAmt*gst)/100;
								totAmt = idisAmt + gstAmt;*/

								//$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);GridTotal
								$("#jqGrid").jqGrid("setCell", rowId, "GridTotal",totAmt);

								// }
								var Total = 0;
								var TotalQuantity = 0;
								var TotalGst = 0;
								var TotalIgst = 0;
								var TotalGross = 0;

								var count2 = jQuery("#jqGrid").jqGrid(
										'getGridParam', 'records');
								var allRowsInGrid1 = $('#jqGrid').getGridParam(
										'data');
								var AllRows = JSON.stringify(allRowsInGrid1);
								for (var k = 0; k < count2; k++) {
									var Total1 = allRowsInGrid1[k].Total;
									if (Total1 != undefined) {
										Total = +Total + +Total1
										
									}
								}

								for (var n = 0; n < count2; n++) {
									var grossTotal1 = allRowsInGrid1[n].Total;
									var taxAmt1 = allRowsInGrid1[n].taxAmt;
									if (taxAmt1 != undefined) {
										TotalGross = +TotalGross + +grossTotal1
												+ +taxAmt1;
									}
								}

								//document.getElementById("GridTotal").value =(Total).toFixed(2); 
								document.getElementById("grosstotal").value =totAmt;
								/*document.getElementById("total").value =Math.round(Total);*/
								
								// document.getElementById("resolution1").value =
								// Math.round(Total);
								// document.getElementById("totalQuantity").value =
								// TotalQuantity;

							},

				           
				           pager: "#jqGridPager",
				           sortorder: "desc",
				           
				           
			});

			$("#jqGrid").addRowData(i,jsonData[i]);
			
			$('#jqGrid').navGrid('#jqGridPager',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					{
						afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},
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
						afterSubmit: function () {
							  $(this).trigger('reloadGrid');
						},
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
       
			}); 
			
}

function  returntPurchaseValidation(){
	
if(document.PurchaseReturn.supplier.value == ""){
	alert("Please Select Vendor Name ");
	return false;
}
if(document.PurchaseReturn.bill_no.value == ""){
	alert("Please Select Bill No ");
	return false;
}
	
	returntPurchase()
}


function returntPurchase(){
	
	document.getElementById('save').disabled = true;
	var params={};
	var supplier = $('#supplier').val();
 	var bill_no = $('#bill_no').val();
 	var Challandate =$('#Challandate').val();
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pk_GRDetails_id = allRowsInGrid[i].pk_GRDetails_id;
		params["pk_GRDetails_id"+i] = pk_GRDetails_id;
		
		var productname = allRowsInGrid[i].productname;
		params["productname"+i] = productname;
		
		var operation = allRowsInGrid[i].operation;
		if(operation =="" || operation == undefined || operation == null){
			alert("Please Enter Operation in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["operation"+i] = operation;
		
		var quantity = allRowsInGrid[i].quantity;
		params["quantity"+i] = quantity;
		
		var rate = allRowsInGrid[i].rate;
		if(rate =="" || rate == undefined || rate == null){
			alert("Please Enter Rate in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["rate"+i] = rate;
		
		var discount = allRowsInGrid[i].discount;
		/*if(discount =="" || discount == undefined || discount == null){
			alert("Please Enter Discount in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}*/
		params["discount"+i] = discount;
		
		var gst = allRowsInGrid[i].gst;
		if( gst == undefined || gst == null){
			alert("Please Enter Gst in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["gst"+i] = gst;
		
		var igst = 0;
		igst = allRowsInGrid[i].igst;
		/*if( igst == undefined || igst == null){
			alert("Please Enter IGst in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}*/
		params["igst"+i] = igst;
		
		var TaxAmount = allRowsInGrid[i].TaxAmount;
		params["TaxAmount"+i] = TaxAmount;

		var unit = allRowsInGrid[i].unit;
		if(unit =="" || unit == undefined || unit == null){
			alert("Please Enter Gst in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["unit"+i] = unit;

		var GridTotal = allRowsInGrid[i].GridTotal;
		params["GridTotal"+i] = GridTotal;
		
		var Quantity1 = allRowsInGrid[i].Quantity1;
		params["Quantity1"+i] = Quantity1;
		
		var grosstotal = allRowsInGrid[i].grosstotal;
		params["grosstotal"+i] = grosstotal;
		
		var idno = allRowsInGrid[i].idno;
		params["idno"+i] = idno;


		/*var suppliername = allRowsInGrid[i].suppliername;
		params["suppliername"+i] = suppliername;*/

		/*var billno = allRowsInGrid[i].billno;
		params["billno"+i] = billno;*/
		
	}
	
	params["count"] = count;
	params["supplier"] = supplier;
	params["bill_no"] = bill_no;
	params["Challandate"] = Challandate;
    params["methodName"] = "returntPurchase1";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				location.reload();
 				//returntMinusFromStockPurchase();
 				
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}

function returntMinusFromStockPurchase(){
	var params={};
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pk_goods_receive_id = allRowsInGrid[i].pk_goods_receive_id;
		params["pk_goods_receive_id"+i] = pk_goods_receive_id;
		
		var dupQuantity1 = allRowsInGrid[i].dupQuantity1;
		params["dupQuantity1"+i] = dupQuantity1;
		
		var product_name = allRowsInGrid[i].product_name;
		params["product_name"+i] = product_name;
		
		var company_Name = allRowsInGrid[i].company_Name;
		params["company_Name"+i] = company_Name;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var QuantityToReturn = allRowsInGrid[i].QuantityToReturn;
		params["QuantityToReturn"+i] = QuantityToReturn;
	}
	
	params["count"] = count;
    params["methodName"] = "returntMinusFromStockPurchase";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				location.reload();
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}

function registerPurchaseReturn(){
	
var params={};
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pk_goods_receive_id = allRowsInGrid[i].pk_goods_receive_id;
		params["pk_goods_receive_id"+i] = pk_goods_receive_id;
		
		var dupQuantity = allRowsInGrid[i].dupQuantity;
		params["dupQuantity"+i] = dupQuantity;
		
		var product_name = allRowsInGrid[i].product_name;
		params["product_name"+i] = product_name;
		
		var company_Name = allRowsInGrid[i].company_Name;
		params["company_Name"+i] = company_Name;
		
		var weight = allRowsInGrid[i].weight;
		params["weight"+i] = weight;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
		
		var duplicateQuantity = allRowsInGrid[i].dupQuantity1;
		params["duplicateQuantity"+i] = duplicateQuantity;
	
	}
	
	params["count"] = count;
    params["methodName"] = "returntMinusFromStockPurchase";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				location.reload();
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
	
	
	
	
	
}

/*Reports for PurchaseReturnVendorNameWise*/
function PurchaseReturnVendorNameWise(){
	
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
	
/*	if(document.PoReportvendorwiseForm.ShopName1.value == "")
	{
		alert("Please select Shop Name");
		return false;
	}
	
	if(document.PoReportvendorwiseForm.VendorName.value == "")
	{
		alert("Please select Vendor Name");
		return false;
	}*/
	
	PurchaseReturnVendorNameWise1();
}
function PurchaseReturnVendorNameWise1()
{
	var params= {};
	var vendorName = $("#vendorName").val(); 
    var billNo = $("#billNo").val(); 
	
	params["billNo"]= billNo;
	params["vendorName"]= vendorName;
	
	params["methodName"] = "PurchaseReturnVendorNameWise";
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
	                .column( 7 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 7 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
		           pageTotal = api
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
		            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "pk_GRDetails_id", "width": "5%"},
           {"data": "productname", "width": "5%"},
           {"data": "billno" , "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "Quantity1" , "width": "5%"},
           {"data": "discount", "width": "5%"},
           {"data": "gst", "width": "5%"},
           //{"data": "igst", "width": "5%"},
           {"data": "TaxAmount" , "width": "5%"},
           {"data": "grosstotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Purchase Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Purchase Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTbl').dataTable().fnAddData(mydata);

}


);

}
function PoReturnReportAsPerRangeWise(){
	var params= {};
	
	var VendorName = $("#VendorName1").val(); 
    var fisDate = $("#fisDate").val(); 
    var endDate = $("#endDate").val(); 
    
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	params["VendorName1"]= VendorName;
	
	params["methodName"] = "PoReturnReportAsPerRangeWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#VendorTblRange').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#VendorTblRange').DataTable( {
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
	                .column( 9 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 9 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
		           pageTotal = api
		                .column( 10 )
		                .data()
		                .reduce( function (a, b) 
		                		{
		                          return intVal(a) + intVal(b);
		                        }, 0 );
		 
		            // Update footer
		            $( api.column( 10 ).footer() ).html(
		              parseFloat(pageTotal).toFixed(2)
		            );
		            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "pk_GRDetails_id", "width": "5%"},
           {"data": "productname", "width": "5%"},
           {"data": "billno" , "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "discount", "width": "5%"},
           {"data": "gst", "width": "5%"},
           {"data": "igst", "width": "5%"},
           {"data": "Quantity1" , "width": "5%"},
           {"data": "TaxAmount" , "width": "5%"},
           {"data": "GridTotal", "width": "5%"},
           {"data": "grosstotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Purchase Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Purchase Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTblRange').dataTable().fnAddData(mydata);

}


);
	
}
function PoReturnReportAsPerVendorNameWise(){

	
	
var params= {};
	
	var VendorName = $("#VendorName2").val(); 
   // var fisDate = $("#fisDate").val(); 
    //var endDate = $("#endDate").val(); 
    
	//params["fisDate"]= fisDate;
	//params["endDate"]= endDate;
	params["VendorName2"]= VendorName;
	
	params["methodName"] = "PoReturnReportAsPerVendorNameWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#ShopTbl').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#ShopTbl').DataTable( {
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
	                .column( 9 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 9 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
		           pageTotal = api
		                .column( 10 )
		                .data()
		                .reduce( function (a, b) 
		                		{
		                          return intVal(a) + intVal(b);
		                        }, 0 );
		 
		            // Update footer
		            $( api.column( 10 ).footer() ).html(
		              parseFloat(pageTotal).toFixed(2)
		            );
		            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "pk_GRDetails_id", "width": "5%"},
           {"data": "productname", "width": "5%"},
           {"data": "billno" , "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "discount", "width": "5%"},
           {"data": "gst", "width": "5%"},
           {"data": "igst", "width": "5%"},
           {"data": "Quantity1" , "width": "5%"},
           {"data": "TaxAmount" , "width": "5%"},
           {"data": "GridTotal", "width": "5%"},
           {"data": "grosstotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Purchase Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Purchase Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Purchase Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#ShopTbl').dataTable().fnAddData(mydata);

}


);

}
