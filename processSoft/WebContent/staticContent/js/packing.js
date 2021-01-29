

function outwardRecieve() {
	if (document.pk.supplierName.value == "") {
		alert("Please select Company Name");
		return false;
	}
	if (document.pk.outwardDate.value == "") {
		alert("Please Select OutWord Date.");
		return false;
	}

	if (document.pk.challanNo.value == "") {
		alert("Please Select Challan No.");
		return false;
	}
	/* var letterNumber = /^[a-zA-Z0-9\\.;,:()' ]{0,100}$/; */
	if (document.pk.productName.value == ("")) {
		alert("Please Select Product Name.");
		return false;
	}
	if (document.pk.outwardchallanno.value == ("")) {
		alert("Please Enter Outward Challan No.");
		return false;
	}
	if (document.pk.vechicleNo.value == ("")) {
		alert(" Please Enter Vechicle No.");
		return false;
	}
	if (document.pk.Description.value == ("")) {
		alert("Please Enter Description.");
		return false;
	} else {
		outwardRecieve1();
	}

}

function outwardRecieve1() {

	document.getElementById("saveBtn").disabled = true;
	var params = {};

	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');// to get all rows
	// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productName = allRowsInGrid[i].productName;
		params["productName" + i] = productName;

		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var operation = allRowsInGrid[i].operationName;
     /*   if(operation == undefined)
		{
        	alert("Please Enter operation in grid.");
        	document.getElementById('save').disabled = false;
			return false;
		}*/
        params["operation" + i] = operation;

		var okquantity = allRowsInGrid[i].okquantity;
		 if(okquantity == undefined || okquantity == 0 )
			{
	        	alert("Please Enter okquantity in grid.");
	        	document.getElementById('saveBtn').disabled = false;
				return false;
			}
		params["okquantity" + i] = okquantity;

		var rejectedquantity = allRowsInGrid[i].rejectedquantity;
		 /*if(rejectedquantity == "")
			{
	        	alert("Please Enter rejectedquantity in grid.If there is no Rejected Quantity then Enter 0");
	        	document.getElementById('save').disabled = false;
				return false;
			}*/
		params["rejectedquantity" + i] = rejectedquantity;

		var unprocessquantity = allRowsInGrid[i].unprocessquantity;
		 /*if(unprocessquantity == "")
			{
	        	alert("Please Enter unprocessquantity in grid.If there is no unprocess Quantity then Enter 0");
	        	document.getElementById('save').disabled = false;
				return false;
			}*/
		params["unprocessquantity" + i] = unprocessquantity;

		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice" + i] = buyPrice;

		var description = allRowsInGrid[i].description;
		if(description == "" || description ==undefined || description == null){
			alert("Please Enter Description in Grid");
			document.getElementById('saveBtn').disabled = false;
			return false;
		}
		params["description" + i] = description;
		
		var dupQuantity = allRowsInGrid[i].dupQuantity;
		params["dupQuantity" + i] = dupQuantity;

		var Total = allRowsInGrid[i].Total;
		params["Total" + i] = Total;

	}

	var supplierName = $('#supplierName').val();
	var outwardDate = $('#outwardDate').val();
	var challanNo = $('#challanNo').val();
	var inwardDate = $('#inwardDate').val();
	var outwardchallanno = $('#outwardchallanno').val();
	var productName = $('#productName').val();
	var total = $('#total').val();
	var grossTotal = $('#grossTotal').val();
	var vechicleNo = $('#vechicleNo').val();
	var Description = $('#Description').val();
	var tinNo = $('#tinNo').val();
	var IdNo = $('#IdNo').val();
	//var ShopName = $('#ShopName').val();

	params["supplierName"] = supplierName;
	params["outwardDate"] = outwardDate;
	params["challanNo"] = challanNo;
	params["inwardDate"] = inwardDate;
	params["outwardchallanno"] = outwardchallanno;
	params["productName"] = productName;
	params["total"] = total;
	params["grossTotal"] = grossTotal;
	params["count"] = count;
	params["vechicleNo"] = vechicleNo;
	params["Description"] = Description;
	params["tinNo"] = tinNo;
	params["IdNo"] = IdNo;
	//params["ShopName"] = ShopName;

	params["methodName"] = "addingOutwardDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		document.getElementById('saveBtn').disabled = false;
		window.open("PackingBillPDF.jsp");
		window.location.reload();

	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

/** * +++ Fetching product Name FOR **** */
function getProductName() {

	var params = {};
	var proName = 1;
	productId = $('#proName').val();
	$("#proName").empty();
	$("#proName").append(
			$("<option></option>").attr("value", "").text("Select product"));

	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});
	var splitText = selectedVal.split(",");

	var proName = splitText[0];
	var Quantity = splitText[1];

	params["proName"] = proName;
	params["Quantity"] = Quantity;

	var newrow;
	var rowId;

	params["methodName"] = "getAllProductBypacking";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data)

			{
				var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData, function(i, v) {
					$("#proName").append(
							$("<option></option>").attr("value", count).text(
									v.product + ",Unpacked Stock =,"
											+ v.quantityDouble + ", cat =,"
											+ v.catid + ", SubCat =,"
											+ v.subCatid + ", Shop =,"
											+ v.shopid));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

function getCapacity() {

	var fk_cat_id = 1;
	$("#capacity").empty();
	$("#capacity").append(
			$("<option></option>").attr("value", "").text("Select capacity"));
	var params = {};
	var containerName = $('#containerName').val();

	params["containerName"] = containerName;
	params["methodName"] = "getCapacity";

	// params["fk_cat_id"]= fk_cat_id;

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;
				var jsonData = $.parseJSON(data);
				$.each(jsonData, function(i, v) {
					$("#capacity").append(
							$("<option></option>").attr("value", count).text(
									v.packing_Type + ",Ltr," + v.packing_Id));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}

function getContainerByPacking() {

	// productId = $('#proName').val();
	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split("=");

	var quantity = splitText[1];

	$("#capacity option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var capacity = splitText[0];

	var packingQuantity = $('#packingQuantity').val();

	if (Number(packingQuantity) < Number(capacity)) {
		alert("Container Capacity Should Be Equal Or Less Than Packing Quantity");
		location.reload();
		return false;
	} else {
		var quantityDividePacking = Number(packingQuantity) / Number(capacity)

		document.getElementById("container").value = quantityDividePacking;
	}
}

function reset() {
	document.catd.reset();
}

function productDetailInGrid123() {

	// this.sumFmatter000 = sumFmatter000 ;
	$("#productName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var itemName = splitText[0];
	var qty = splitText[1];
	//for chalan nO
	var challanNo = $('#challanNo').val();
	
	params = {};

	params["itemName"] = itemName;
	params["challanNo"] = challanNo;
	

	params["methodName"] = "getProductInGridOnSupplierPurchase2";

	var count = 0;
	var newrow;
	var rowId;

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data) {
						var jsonData = $.parseJSON(data);
						
						$.each(jsonData,function(i, v) {
											count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
											var rowdata = $("#jqGrid").jqGrid('getGridParam', 'data');
											var ids = jQuery("#jqGrid").jqGrid('getDataIDs');
											//document.getElementById("challanNo").readOnly = true;
											
											var Challanno;
											var prodName;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].productName;
												Challanno =rowdata[j].challanno;
											
												var rowId = ids[j];
												var rowData = jQuery('#jqGrid').jqGrid('getRowData',rowId);
												
												if(Challanno !=jsonData.offer[0].challanno){
													newrow = false;
													alert("Please check challan no challan no is different !!!");
													var grid = jQuery("#jqGrid");
													grid.trigger("reloadGrid");
													break;
												}

												if (prodName == jsonData.offer[0].productName) {
													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#jqGrid");
													grid.trigger("reloadGrid");
													break;
												} else  {
													newrow = true;
												}
											}

											if (newrow == true) {
												$("#jqGrid").addRowData(count,
														jsonData.offer);
											}

											$("#jqGrid")
													.jqGrid(
															{
																datatype : "local",
																colNames : [
																		"Product Name",
																		"HSN",
																		"Operation",
																		"Ok (Qty)",
																		"Rejected (Qty)",
																		"Unprocess (Qty)",
																		"Rate",
																		"Description",
																		"Total",
																		"Available quantity",
																		"Challanno"],
																colModel : [
																		{
																			name : "productName",// PARTICULARS
																			width : 150,
																		},
																		{
																			name : "hsn",
																			width : 150,
																			editable : false
																		},
																		{
																			name : "operationName",
																			width : 150,
																			editable : false
																		},
																		{
																			name : "okquantity",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "rejectedquantity",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "unprocessquantity",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "buyPrice",
																			width : 150,
																			editable : false
																		},

																		{
																			name : "description",
																			width : 150,
																			editable : true
																		},

																		{
																			name : 'Total',
																			// formatter:
																			// sumFmatter,
																			width : 170,
																		},
																		{
																			name : "dupQuantity",
																			width : 150,
																			hidden :true,
																			
																		},
																		{
																			name : "challanno",
																			width : 150,
																			hidden :true,
																			
																		},


																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 950,
																shrinktofit : true,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																afterSaveCell : function() {
																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#jqGrid")
																			.getRowData(
																					rowId);
																	var count1 = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var okquantity = rowData['okquantity'];
																	var quantity = rowData['quantity'];
																	var dupQuantity = rowData['dupQuantity'];
																	var rejectedquantity = rowData['rejectedquantity'];
																	var unprocessquantity = rowData['unprocessquantity'];
																	var buyPrice = rowData['buyPrice'];
																	var description = rowData['description'];
																	var vatAmt = 0;
																	var discount = 0;
																	var tota = 0;
																	var totAmt = 0;
																	var ids = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getDataIDs');

																	var gst1 = 0;
																	var iGst1 = 0;

																	// for
																	// calculation
																	// of gst
																	// and total
																	// after
																	// change in
																	// quantity
																	// and buy
																	// price in
																	// resp to
																	// itemname
																	// to
																	// display
																	// gst total
																	// and igst
																	// total

																	/*
																	 * var
																	 * TotalGst =
																	 * document.getElementById("totalGst").value;
																	 * var
																	 * TotalIgst =
																	 * document.getElementById("totalIgst").value;
																	 */

																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var sGstAmt = 0;
																	var cGstAmt = 0;

																	// for(var r
																	// = 0;r <
																	// count1;r++){
																	// var rowId
																	// = ids[r];
																	var rowData = jQuery(
																			"#jqGrid")
																			.getRowData(
																					rowId);

																	// var
																	// buyPrice
																	// =
																	// rowData['buyPrice'];

																	/*var quant = qty;s	
																	var Count1 = Number(okquantity)
																			+ Number(rejectedquantity);
																	var Count2 = Number(Count1)
																			+ Number(unprocessquantity);

																	if (Number(Count1) > Number(quant)) {
																		alert("The Total Of Ok (Qty) and Rejected (Qty) is greter than Inword Quantity ");
																		$("#jqGrid").jqGrid("reloadGrid");
																		return false;
																	}*/
																	
																	if(Number(okquantity)>Number(dupQuantity))
																	{
																		alert("The Total Of Ok (Qty) and Rejected (Qty) and unprocessed(Qty) is greter than "+dupQuantity+" Inword Quantity ");
																		$("#jqGrid").jqGrid("reloadGrid");
																		return false;
																	}
																	
																	if(Number(rejectedquantity)>Number(dupQuantity))
																	{
																		alert("The Total Of Ok (Qty) and Rejected (Qty) and unprocessed(Qty) is greter than "+dupQuantity+" Inword Quantity ");
																		$("#jqGrid").jqGrid("reloadGrid");
																		return false;
																	}
																	if(Number(unprocessquantity)>Number(dupQuantity))
																	{
																		alert("The Total Of Ok (Qty) and Rejected (Qty) and unprocessed(Qty) is greter than "+dupQuantity+" Inword Quantity ");
																		$("#jqGrid").jqGrid("reloadGrid");
																		return false;
																	}
																	
																/*	if(okquantity !=""){
																		var quan = /^d[0-9 ]+$/;
																		if(okquantity.match(quan))
																			{
																			
																			}
																		else {
																			alert ("Please Enter Ok Quantity In Grid");
																			return false;
																		}
 																	}*/
																/*	if(description !="")
																	{
																	var Decs = /^[a-zA-Z, ]+$/;
																	if(description.match(Decs))
																	{}
																	else
																	{
																		//var setDesc="abc";
																		alert("Please Enter  Alphabates In Description");
																		//location.reload();
																		//$("#jqGrid").jqGrid("setCell",rowId, "description", setDesc);	
																		return false;
																	}
																}*/
																		
																	/*if (Number(Count2) > Number(quant)) {
																		alert("The Total Of Ok (Qty), Rejected (Qty) & Unprocess (Qty) is greter than Inword Quantity ");
																		$(
																				"#jqGrid")
																				.jqGrid(
																						"reloadGrid");
																		return false;
																	}

																	if (Number(okquantity) > Number(quant)) {
																		alert("Out Word Quantity is greter than Inword Quantity ");
																		$(
																				"#jqGrid")
																				.jqGrid(
																						"reloadGrid");
																		return false;
																	}*/ else {
																		tota = okquantity
																				* buyPrice;
																		totAmt = (okquantity * buyPrice).toFixed(2);
																		$("#jqGrid").jqGrid("setCell",rowId,"Total",totAmt);
																	}

																	// }
																	var Total = 0;
																	var TotalQuantity = 0;
																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var TotalGross = 0;

																	var count2 = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var allRowsInGrid1 = $(
																			'#jqGrid')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	for (var k = 0; k < count2; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		if (Total1 != undefined) {
																			Total = +Total
																					+ +Total1;
																		}
																	}

																	/*
																	 * for (var
																	 * n = 0; n <
																	 * count2;
																	 * n++) {
																	 * var
																	 * grossTotal1 =
																	 * allRowsInGrid1[n].Total;
																	 * var
																	 * taxAmt1 =
																	 * allRowsInGrid1[n].taxAmt;
																	 * if(taxAmt1 !=
																	 * undefined){
																	 * TotalGross =
																	 * +TotalGross +
																	 * +grossTotal1 +
																	 * +taxAmt1; } }
																	 */

																	document.getElementById("total").value = (Total).toFixed(2);
																	document.getElementById("grossTotal").value = (Total).toFixed(2);
																	// document.getElementById("resolution1").value
																	// =
																	// Math.round(Total);
																	// document.getElementById("totalQuantity").value
																	// =
																	// TotalQuantity;

																},

																pager : "#jqGridPager",

															});

											// $("#list4").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#list4").addRowData(i,jsonData[i]);
												$("#jqGrid").addRowData(0,
														jsonData.offer);
											}

											$('#jqGrid')
													.navGrid(
															'#jqGridPager',

															{
																edit : true,
																add : false,
																del : true,
																search : true,
																refresh : true,
																view : true,
																position : "left",
																cloneToTop : false
															},

															{
																editCaption : "The Edit Dialog",

																afterSubmit : function() {

																	var grid = $("#jqGrid"), intervalId = setInterval(
																			function() {
																				grid
																						.trigger(
																								"reloadGrid",
																								[ {
																									current : true
																								} ]);
																			},
																			500);

																},

																recreateForm : true,
																checkOnUpdate : true,
																checkOnSubmit : true,
																closeAfterEdit : true,

																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}
															},

															{
																closeAfterAdd : true,
																recreateForm : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}
															},

															{
																closeAfterdel : true,
																recreateForm : true,
																afterSubmit : function() {
																	$('#list4')
																			.trigger(
																					'reloadGrid');
																},
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																},
																afterSubmit : function() {
																	$('#jqGrid')
																			.trigger(
																					'reloadGrid');

																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#jqGrid")
																			.getRowData(
																					rowId);
																	var count1 = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var itemName = rowData['productName'];
																	var bundel = rowData['bundel'];
																	var quantity = rowData['quantity'];
																	var buyPrice = rowData['buyPrice'];
																	var length = rowData['length'];
																	var sGst = rowData['sGst'];
																	var cGst = rowData['cGst'];
																	var iGst = rowData['iGst'];
																	var taxAmt = rowData['taxAmt']
																	var vatAmt = 0;
																	var discount = 0;
																	var tota = 0;
																	var totAmt = 0;
																	var ids = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getDataIDs');

																	var gst1 = 0;
																	var iGst1 = 0;

																	// for
																	// calculation
																	// of gst
																	// and total
																	// after
																	// change in
																	// quantity
																	// and buy
																	// price in
																	// resp to
																	// itemname
																	// to
																	// display
																	// gst total
																	// and igst
																	// total

																	/*
																	 * var
																	 * TotalGst =
																	 * document.getElementById("totalGst").value;
																	 * var
																	 * TotalIgst =
																	 * document.getElementById("totalIgst").value;
																	 */

																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var sGstAmt = 0;
																	var cGstAmt = 0;
																	var count = count1 - 1;
																	for (var r = 0; r < count; r++) {
																		var rowId = ids[r];
																		var rowData = jQuery(
																				"#jqGrid")
																				.getRowData(
																						rowId);

																		var buyPrice = rowData['buyPrice'];
																		tota = quantity
																				* buyPrice;
																		totAmt = quantity
																				* buyPrice;

																		/*
																		 * if(sGst !=
																		 * "0" &&
																		 * cGst !=
																		 * "0"){
																		 * sGstAmt =
																		 * ((tota*(sGst))/100);
																		 * cGstAmt =
																		 * ((tota*(cGst))/100);
																		 * 
																		 * vatAmt =
																		 * +sGstAmt +
																		 * +cGstAmt; }
																		 * else{
																		 * 
																		 * vatAmt =
																		 * ((tota*iGst)/100);
																		 * totAmt =
																		 * +tota +
																		 * +vatAmt;
																		 * TotalIgst =
																		 * +TotalIgst +
																		 * +vatAmt; }
																		 * $("#jqGrid").jqGrid("setCell",
																		 * rowId,
																		 * "taxAmt",
																		 * vatAmt);
																		 * $("#jqGrid").jqGrid("setCell",
																		 * rowId,
																		 * "Total",
																		 * totAmt);
																		 * 
																		 */
																	}
																	var Total = 0;
																	var TotalQuantity = 0;
																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var TotalGross = 0;

																	var count2 = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var allRowsInGrid1 = $(
																			'#jqGrid')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	var count3 = count2 - 1;
																	for (var k = 0; k < count3; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		if (Total1 != undefined) {
																			Total = +Total
																					+ +Total1;
																		}
																	}
																	var count5 = jQuery(
																			"#jqGrid")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var allRowsInGrid1 = $(
																			'#jqGrid')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	count4 = count5 - 1;
																	for (var n = 0; n < count4; n++) {
																		var grossTotal1 = allRowsInGrid1[n].Total;
																		var taxAmt1 = allRowsInGrid1[n].taxAmt;
																		if (taxAmt1 != undefined) {
																			TotalGross = +TotalGross
																					+ +grossTotal1
																					+ +taxAmt1;
																		}
																	}

																	document.getElementById("total").value = (Total).toFixed(2);
																	document.getElementById("grossTotal").value = (Total).toFixed(2);
																	// document.getElementById("resolution1").value
																	// =
																	// Math.round(Total);
																	// document.getElementById("totalQuantity").value
																	// =
																	// TotalQuantity;

																},

																onSelectRow : function(
																		id) {
																	if (id
																			&& id !== lastSel) {
																		jQuery(
																				"#jqGrid")
																				.saveRow(
																						lastSel,
																						true,
																						'clientArray');
																		jQuery(
																				"#jqGrid")
																				.editRow(
																						id,
																						true);
																		lastSel = id;
																		console
																				.log(id);
																	}
																}

															});

										});

					})

}



function getSupWiseProduct() {

	// var challanNo=$('#challanNo').val();
	var challanNo = $('#challanNo').val();

	$("#productName").empty();
	$("#productName").append($("<option></option>").attr("value", "").text("Select Product"));
	$("#inwardDate").append($("<input/>").attr("value", "").text());

	var params = {};

	params["challanNo"] = challanNo;
	params["methodName"] = "getAllBillBySuppliersUser";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		var count = 1;
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			$("#productName").append($("<option></option>").attr("value", count).text(v.productname + "," + v.quantity));
			//$("#Challanno").append($("<option></option>").attr("value",v.outwardchallanno).text(v.outwardchallanno)); 
			document.getElementById("inwardDate").value = v.inwardDate;
			
			count++;
		});
	})

}

function getSupWiseChallanNo() {

	/*
	 * var input = document.getElementById('supplier'), list =
	 * document.getElementById('sup_drop'), i,supplier;
	 * 
	 * for (i = 0; i < list.options.length; ++i) { if (list.options[i].value ===
	 * input.value) { supplier = list.options[i].getAttribute('data-value'); } }
	 */
	var supplier = $('#supplierName').val();

	$("#challanNo").empty();
	$("#challanNo").append(
			$("<option></option>").attr("value", "").text("Select Challan No"));
	var params = {};
	//$("#inwardDate").append($("<input/>").attr("value", "").text());

	params["supplier"] = supplier;
	params["methodName"] = "getAllChallanNo";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data)

	{
		var count = 1;
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			$("#challanNo").append(
					$("<option></option>").attr("value", v.challanno).text(
							v.challanno));
			// $("#inwardDate").append($("<option></option>").attr("value",v.inwardDate).text(v.inwardDate));
			//document.getElementById("inwardDate").value = v.inwardDate;
			// count++;
		});
	})

}

//this finction for get vendor details on slecting vender name

function getvenderGST() {
	var params = {};
	/*var input1 = document.getElementById('suppliername'), list = document.getElementById('dealerName_drop'), i, suppliername;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			suppliername = list.options[i].getAttribute('data-value');
		}
	}*/
	var supplierName = $('#supplierName').val();

	/*$("#city").append($("<input/>").attr("value", "").text());*/
	$("#tinNo").append($("<input/>").attr("value", "").text());
	$("#IdNo").append($("<input/>").attr("value", "").text());

	params["supplierName"] = supplierName;

	params["methodName"] = "getvenderGSTforOW";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			/*document.getElementById("city").value = v.city;*/
			document.getElementById("tinNo").value = v.tin;
			document.getElementById("IdNo").value = v.IdNo;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}
