function getAllChallanNo()
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
		$("#Challanno").empty();
		$("#Challanno").append($("<option></option>").attr("value","").text("Select bill"));
		var params= {};
		
		params["methodName"] = "getAllChallanBySuppliers";
		
		params["supplier"]= supplier;
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{
			//var count = 1;
			var jsonData = $.parseJSON(data);
			//var jsonData = jsonData.list;
			$.each(jsonData,function(i,v)
					{
				$("#Challanno").append($("<option></option>").attr("value",v.outwardchallanno).text(v.outwardchallanno)); 
				//$("#billNo1").append($("<option></option>").attr("value",v.billNo).text(v.billNo)); 
				//count++;
				
					});
				})

	}



function fetchDataForPurchaseReturn(){
	
	var ChallanNo = $('#Challanno').val();
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
	
	params["methodName"] = "getAllIetmByChallanNo";
	
	params["Challanno"]= ChallanNo;
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

				colNames: ["Product ID","IdNo","Supplier Name","Date","ItemName","Hsn","Operation","ChallanNo","Description","Rate","Ok(Qty)","Rej(Qty)","Unprocess(Qty)","ReturnQty","Total","vehicleName","InwardDate","OutwardDate","ShopName","boxDescription"],

				colModel: [
				           { 	
				        	   name: "pkoutwardid",
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
				        	   name: "hsn",
				        	   width:70,
				        	   hidden : true
				           },
				           {
				        	   name: "ProductName",
				        	   width: 70
				        	   
				           },
				           {
				        	   name: "hsn",
				        	   width: 70,
				        	   //editable:true
				           },	
				           {
				        	   name:  "Operaation",
				        	   width: 70
				        	   
				           },
				           {
				        	   name: "ChallanNo",
				        	   width: 70,
				        	   //editable:true
				           },
				           {
				        	   name: "description",
				        	   width: 50,
				        	   //editable:true
				           },
				           {
				        	   name: "Rate",
				        	   width: 50,
				        	   //editable:true
				        	   
				           },
				           {
				        	   name: "OkQuantity",
				        	   width: 50,
				        	   //editable:true
				           },
				           {
				        	   name: "UnprocesQty",
				        	   width: 50,
				        	   //editable:true
				           },
				           {
				        	   name: "RejQty",
				        	   width: 50,
				        	   //editable:true
				           },
				          
				           {
				        	   name: "Quantity1",
				        	   width: 80,
				        	   editable:true
				        	   
				           },
				           {
				        	   name: "TotalValue",
				        	   width: 80,
				        	   editable:true
				        	   
				           },
				           {
				        	   name: "vehicleName",
				        	   width: 80,
				        	   //editable:true
				        	  hidden : true
				        	   
				           },
				           {
				        	   name: "InwardDate",
				        	   width: 80,
				        	  // editable:true
				        	   hidden : true
				        	   
				           },
				           {
				        	   name: "OutwardDate",
				        	   width: 80,
				        	  // editable:true
				        	   hidden : true
				        	   
				           },
				           {
				        	   name: "ShopName",
				        	   width: 80,
				        	  // editable:true
				        	   hidden : true
				        	   
				           },
				           {
				        	   name: "boxDescription",
				        	   width: 80,
				        	  // editable:true
				        	   hidden : true
				        	   
				           },
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
				         
							/*
							rowheight : 300,
							hoverrows : true,*/
							
				           afterSaveCell : function() {
								// $(this).trigger('reloadGrid');
								var rowId = $("#jqGrid").jqGrid('getGridParam',
										'selrow');
								var rowData = jQuery("#jqGrid").getRowData(rowId);
								var count1 = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
								var quantity = rowData['OkQuantity'];
								var buyPrice = rowData['Rate'];
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
								if(Number(Quantity1) > Number(quantity) )
									{
									alert("The Total Of Ok (Qty) is greter than  "+quantity+"  Return  Quantity");
									$("#jqGrid").jqGrid("reloadGrid");
									return false;
									}
								
								/*if(Number(Quantity1)>Number(dupQuantity))
								{
									alert("The Total Of Ok (Qty) and Rejected (Qty) and unprocessed(Qty) is greter than "+dupQuantity+" Inword Quantity ");
									$("#jqGrid").jqGrid("reloadGrid");
									return false;
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
							/*	if(discount !="")
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
									}*/
							/*	if(gst !="")
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
									}*/
								/*if(igst !="")
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
									}*/
								/*if(igst >0 && gst > 0 )
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
								}*/
								
								
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
								$("#jqGrid").jqGrid("setCell", rowId, "TotalValue",tota);

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

								//document.getElementById("tValue").value =(tota).toFixed(2); 
								//document.getElementById("grosstotal").value =totAmt;
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

function OutWardReturn(){

if(document.OutwardReturn.supplier.value == ""){
	alert("Please Select Vendor Name");
	return false;
}	
if(document.OutwardReturn.Challanno.value == ""){
	alert("Please Select Outward Challan No");
	return false;
}	
	
	OutWardReturn1();
}

function OutWardReturn1(){
	
	document.getElementById('save').disabled = true;
var params={};

 	var supplier = $('#supplier').val();
 	var Challanno = $('#Challanno').val();
 	var Challandate =$('#Challandate').val();
	
	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');//to get all rows of grid
	var AllRows=JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var pkoutwardid = allRowsInGrid[i].pkoutwardid;
		params["pkoutwardid"+i] = pkoutwardid;
		
		var ProductName = allRowsInGrid[i].ProductName;
		params["ProductName"+i] = ProductName;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn"+i] = hsn;
		
		var Operaation = allRowsInGrid[i].Operaation;
		params["Operaation"+i] = Operaation;
		
		var ChallanNo = allRowsInGrid[i].ChallanNo;
		params["ChallanNo"+i] = ChallanNo;
		
		var description = allRowsInGrid[i].description;
		params["description"+i] = description;
		
		var Rate = allRowsInGrid[i].Rate;
		/*if( gst == undefined || gst == null){
			alert("Please Enter Gst in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}*/
		params["Rate"+i] = Rate;
		
		var OkQuantity = allRowsInGrid[i].OkQuantity;
		params["OkQuantity"+i] = OkQuantity;
		
		var UnprocesQty = allRowsInGrid[i].UnprocesQty;
		params["UnprocesQty"+i] = UnprocesQty;

		var RejQty = allRowsInGrid[i].RejQty;
		params["RejQty"+i] = RejQty;

		var Quantity1 = allRowsInGrid[i].Quantity1;
		if(Quantity1 == "" || Quantity1 == undefined || Quantity1 == null){
			alert("Please Enter Return Quantity In Grid");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["Quantity1"+i] = Quantity1;
		
		var TotalValue = allRowsInGrid[i].TotalValue;
		params["TotalValue"+i] = TotalValue;
		
		
		var idno = allRowsInGrid[i].idno;
		params["idno"+i] = idno;
		
		var vehicleName = allRowsInGrid[i].vehicleName;
		params["vehicleName"+i] = vehicleName;
		
		var InwardDate = allRowsInGrid[i].InwardDate;
		params["InwardDate"+i] = InwardDate;
		
		var OutwardDate = allRowsInGrid[i].OutwardDate;
		params["OutwardDate"+i] = OutwardDate;
		
		var ShopName = allRowsInGrid[i].ShopName;
		params["ShopName"+i] = ShopName;
		    
		var boxDescription = allRowsInGrid[i].boxDescription;
		params["boxDescription"+i] = boxDescription;
		
	}
	params["supplier"] = supplier;
	params["Challanno"] = Challanno;
	params['Challandate'] = Challandate;
	params["count"] = count;
    params["methodName"] = "returntOutward";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);/*PackingBillPDF.jsp*/
 				//location.reload();
 				window.open("OutwardRuturnPDF.jsp");
 				window.location.reload();
 				//returntMinusFromStockPurchase();
 				
 				
 	    	}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
}
function OutwardReturnVendorNameWise(){
	var params= {};
	var VendorName = $("#VendorName").val(); 
    var challanno = $("#challanno").val(); 
	
	params["challanno"]= challanno;
	params["VendorName"]= VendorName;
	
	params["methodName"] = "OutwardReturnVendorNameWise";
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
           {"data": "pkGRDetailsid", "width": "5%"},
           {"data": "SupplierName", "width": "5%"},
           {"data": "ProductName" , "width": "5%"},
           {"data": "ChallanNo" , "width": "5%"},
           {"data": "outwardChallanno", "width": "5%"},
           {"data": "Rate", "width": "5%"},
           {"data": "OkQuantity", "width": "5%"},
           {"data": "UnprocesQty" , "width": "5%"},
           {"data": "RejQty" , "width": "5%"},
           {"data": "ReturnQty", "width": "5%"},
           {"data": "TotalValue", "width": "5%"},
       ],
       
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Outward Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Outward Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Outward Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTbl').dataTable().fnAddData(mydata);

}


);
}
function OutwardReturnReportAsPerRangeWise(){

	var params= {};
	
	var VendorName = $("#VendorName1").val(); 
    var fisDate = $("#fisDate").val(); 
    var endDate = $("#endDate").val(); 
    
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	params["VendorName1"]= VendorName;
	
	params["methodName"] = "OutwardReturnReportAsPerRangeWise";
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
       /*
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
	            console.log( pageTotal);*/
	            
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
    	   {"data": "pkGRDetailsid", "width": "5%"},
           {"data": "SupplierName", "width": "5%"},
           {"data": "ProductName" , "width": "5%"},
           {"data": "ChallanNo" , "width": "5%"},
           {"data": "outwardChallanno", "width": "5%"},
           {"data": "Rate", "width": "5%"},
           {"data": "OkQuantity", "width": "5%"},
           {"data": "UnprocesQty" , "width": "5%"},
           {"data": "RejQty" , "width": "5%"},
           {"data": "ReturnQty", "width": "5%"},
           {"data": "TotalValue", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Outward Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Outward Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Outward Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTblRange').dataTable().fnAddData(mydata);

}


);
}
function OutwardReturnReportAsPerVendorNameWise(){
var params= {};
	
	var VendorName = $("#VendorName2").val(); 
   // var fisDate = $("#fisDate").val(); 
    //var endDate = $("#endDate").val(); 
    
	//params["fisDate"]= fisDate;
	//params["endDate"]= endDate;
	params["VendorName2"]= VendorName;
	
	params["methodName"] = "OutwardReturnReportAsPerVendorNameWise";
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
       
              /* // Total over this page
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
	            */
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
    	   {"data": "pkGRDetailsid", "width": "5%"},
           {"data": "SupplierName", "width": "5%"},
           {"data": "ProductName" , "width": "5%"},
           {"data": "ChallanNo" , "width": "5%"},
           {"data": "outwardChallanno", "width": "5%"},
           {"data": "Rate", "width": "5%"},
           {"data": "OkQuantity", "width": "5%"},
           {"data": "UnprocesQty" , "width": "5%"},
           {"data": "RejQty" , "width": "5%"},
           {"data": "ReturnQty", "width": "5%"},
           {"data": "TotalValue", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Outward Return Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Outward Return Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Outward Return Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Outward Return Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#ShopTbl').dataTable().fnAddData(mydata);

}


);
}