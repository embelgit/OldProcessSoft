//get Product detail as Per barcode for cash customer
function getitemData() {
	var value = document.getElementById("key").value;

	var params = {};
	var count = 0;
	var newrow;
	var rowId;

	params["methodName"] = "fetchCust";
	params["key"] = value;

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						var jsonData = $.parseJSON(data);

						// $("#list4").jqGrid("clearGridData",
						// true).trigger("reloadGrid");

						$
								.each(
										jsonData,
										function(i, v) {

											function sumFmatter(cellvalue,
													options, rowObject) {

												var tax = options.rowData.vatPercentage;

												if (tax == 0) {
													var tot = (options.rowData.quantity * options.rowData.salePrice);
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												if (tax != 0) {

													var taxcalculation = (tax / 100)
															* Number(options.rowData.salePrice);
													var newSalePrice = Number(taxcalculation)
															+ Number(options.rowData.salePrice)
													var tot = (Number(options.rowData.quantity) * Number(newSalePrice));
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												var jam = 0;

												count = jQuery("#list4")
														.jqGrid('getGridParam',
																'records');
												var allRowsInGrid1 = $('#list4')
														.getGridParam('data');
												var AllRows = JSON
														.stringify(allRowsInGrid1);
												for (var i = 0; i < count; i++) {

													var quantity = allRowsInGrid1[i].quantity;
													params["quantity" + i] = quantity;

													var salePrice = allRowsInGrid1[i].salePrice;
													params["salePrice" + i] = salePrice;

													var vatPercentage = allRowsInGrid1[i].vatPercentage;
													params["vatPercentage" + i] = vatPercentage;

													if (vatPercentage == 0) {

														var totals1 = (salePrice)
																* (quantity);
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

													if (vatPercentage != 0) {

														var taxcal = (vatPercentage / 100)
																* salePrice;
														var newSalePrice = Number(salePrice)
																+ Number(taxcal);
														var totals1 = (Number(newSalePrice) * Number(quantity));
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

												}

												document
														.getElementById("totalWithExpense").value = jam;

												return tot;

											}

											count = jQuery("#list4").jqGrid(
													'getGridParam', 'records');
											var rowdata = $("#list4").jqGrid(
													'getGridParam', 'data');
											var ids = jQuery("#list4").jqGrid(
													'getDataIDs');

											var prodName, com, packing, unit;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].itemName;
												com = rowdata[j].companyName;
												packing = rowdata[j].weight;
												unit = rowdata[j].unitName;

												var rowId = ids[j];
												var rowData = jQuery('#list4')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.itemName
														&& com == jsonData.offer.companyName
														&& packing == jsonData.offer.weight
														&& unit == jsonData.offer.unitName) {
													/*
													 * ori_quantity =
													 * +rowdata[j].quantity+1;
													 * 
													 * $("#list4").jqGrid("setCell",
													 * rowId, "quantity",
													 * ori_quantity); var grid =
													 * jQuery("#list4");
													 * grid.trigger("reloadGrid");
													 */
													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#list4");
													grid.trigger("reloadGrid");
													break;
												} else {
													newrow = true;
												}
											}

											if (newrow == true) {

												// $("#list4").addRowData(i,jsonData[i]);
												$("#list4").addRowData(count,
														jsonData.offer);

											}

											$("#list4")
													.jqGrid(
															{
																datatype : "local",

																colNames : [
																		'cat_id',
																		'ItemName',
																		'CompanyName',
																		'Packing',
																		'Unit',
																		'Quantity',
																		'UnitPrice',
																		'MRP',
																		'TaxPercentage',
																		'Total' ],
																colModel : [
																		{
																			name : 'cat_id',
																			hidden : true,
																		},

																		{
																			name : 'itemName',
																			width : 150,

																		},

																		{
																			name : 'companyName',
																			width : 150,

																		},

																		{
																			name : 'weight',
																			width : 100,

																		},
																		{
																			name : 'unitName',
																			width : 100,

																		},
																		{
																			name : 'quantity',
																			width : 100,
																			editable : true

																		},

																		{
																			name : 'salePrice',
																			width : 150,
																			editable : true

																		},
																		{
																			name : 'mrp',
																			width : 140,
																			editable : true

																		},

																		{
																			name : 'vatPercentage',
																			width : 100,
																			editable : true

																		},
																		{
																			name : 'total',
																			width : 150,
																			formatter : sumFmatter
																		},

																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 1200,
																height : 350,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																afterSaveCell : function() {
																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#list4")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#list4")
																			.getRowData(
																					rowId);
																	var quantity = rowData['quantity'];
																	var salePrice = rowData['salePrice'];

																	var tota = quantity
																			* salePrice;

																	$("#list4")
																			.jqGrid(
																					"setCell",
																					rowId,
																					"total",
																					tota);
																},

																pager : "#jqGridPager",

															});

											// $("#list4").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#list4").addRowData(i,jsonData[i]);
												$("#list4").addRowData(0,
														jsonData.offer);
											}

											$('#list4')
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

																	var grid = $("#list4"), intervalId = setInterval(
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
																checkOnUpdate : true,
																checkOnSubmit : true,
																recreateForm : true,

																reloadAftersubmit : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}

															});

										});

					})

}

// get Product detail as per Barcode for credit customer
function getProDetailsAsPerBarcode() {

	var value = document.getElementById("barcode1").value;

	var params = {};
	var count = 0;
	var newrow;
	var rowId;

	params["methodName"] = "fetchCust";
	params["key"] = value;

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						var jsonData = $.parseJSON(data);

						// $("#list4").jqGrid("clearGridData",
						// true).trigger("reloadGrid");

						$
								.each(
										jsonData,
										function(i, v) {

											function sumFmatter(cellvalue,
													options, rowObject) {

												var tax = options.rowData.vatPercentage;

												if (tax == 0) {
													var tot = (options.rowData.quantity * options.rowData.salePrice);
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												if (tax != 0) {

													var taxcalculation = (tax / 100)
															* Number(options.rowData.salePrice);
													var newSalePrice = Number(taxcalculation)
															+ Number(options.rowData.salePrice);
													var tot = (Number(options.rowData.quantity) * Number(newSalePrice));
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												var jam = 0;

												var count = jQuery("#credit")
														.jqGrid('getGridParam',
																'records');
												var allRowsInGrid1 = $(
														'#credit')
														.getGridParam('data');
												var AllRows = JSON
														.stringify(allRowsInGrid1);
												for (var i = 0; i < count; i++) {

													var quantity = allRowsInGrid1[i].quantity;
													params["quantity" + i] = quantity;

													var salePrice = allRowsInGrid1[i].salePrice;
													params["salePrice" + i] = salePrice;

													var vatPercentage = allRowsInGrid1[i].vatPercentage;
													params["vatPercentage" + i] = vatPercentage;

													if (vatPercentage == 0) {

														var totals1 = (salePrice)
																* (quantity);
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

													if (vatPercentage != 0) {

														var taxcal = (vatPercentage / 100)
																* Number(salePrice);
														var newSalePrice = Number(salePrice)
																+ Number(taxcal);
														var totals1 = (Number(newSalePrice) * Number(quantity));
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

												}

												document
														.getElementById("totalWithExpense1").value = jam;

												return tot;

											}

											count = jQuery("#credit").jqGrid(
													'getGridParam', 'records');
											var rowdata = $("#credit").jqGrid(
													'getGridParam', 'data');
											var ids = jQuery("#credit").jqGrid(
													'getDataIDs');

											var prodName, com, packing, unit;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].itemName;
												com = rowdata[j].companyName;
												packing = rowdata[j].weight;
												unit = rowdata[j].unitName;

												var rowId = ids[j];
												var rowData = jQuery('#credit')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.itemName
														&& com == jsonData.offer.companyName
														&& packing == jsonData.offer.weight
														&& unit == jsonData.offer.unitName) {
													/*
													 * ori_quantity =
													 * +rowdata[j].quantity+1;
													 * 
													 * $("#list4").jqGrid("setCell",
													 * rowId, "quantity",
													 * ori_quantity); var grid =
													 * jQuery("#list4");
													 * grid.trigger("reloadGrid");
													 */
													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#list4");
													grid.trigger("reloadGrid");
													break;
												} else {
													newrow = true;
												}
											}

											if (newrow == true) {

												// $("#credit").addRowData(i,jsonData[i]);
												$("#credit").addRowData(count,
														jsonData.offer);

											}

											$("#credit")
													.jqGrid(
															{
																datatype : "local",

																colNames : [
																		'cat_id',
																		'ItemName',
																		'CompanyName',
																		'Packing',
																		'Unit',
																		'Quantity',
																		'UnitPrice',
																		'MRP',
																		'TaxPercentage',
																		'Total' ],
																colModel : [
																		{
																			name : 'cat_id',
																			hidden : true,
																		},

																		{
																			name : 'itemName',
																			width : 150,

																		},

																		{
																			name : 'companyName',
																			width : 150,

																		},

																		{
																			name : 'weight',
																			width : 100,

																		},
																		{
																			name : 'unitName',
																			width : 100,

																		},
																		{
																			name : 'quantity',
																			width : 100,
																			editable : true

																		},

																		{
																			name : 'salePrice',
																			width : 150,
																			editable : true

																		},
																		{
																			name : 'mrp',
																			width : 140,
																			editable : true

																		},

																		{
																			name : 'vatPercentage',
																			width : 100,
																			editable : true

																		},
																		{
																			name : 'total',
																			width : 150,
																			formatter : sumFmatter
																		},

																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 1200,
																height : 350,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																afterSaveCell : function() {
																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#credit")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#credit")
																			.getRowData(
																					rowId);
																	var quantity = rowData['quantity'];
																	var salePrice = rowData['salePrice'];

																	var tota = quantity
																			* salePrice;

																	$("#credit")
																			.jqGrid(
																					"setCell",
																					rowId,
																					"total",
																					tota);
																},

																pager : "#jqGridPager",

															});

											// $("#credit").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#credit").addRowData(i,jsonData[i]);
												$("#credit").addRowData(0,
														jsonData.offer);
											}

											$('#credit')
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

																	var grid = $("#credit"), intervalId = setInterval(
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
																checkOnUpdate : true,
																checkOnSubmit : true,
																recreateForm : true,

																reloadAftersubmit : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}

															});

										});

					})

}

function getCustName() {
	var params = {};

	var input = document.getElementById('creditCustomer'), list1 = document
			.getElementById('cust_drop1'), i, fk_sup_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_cust_id = list1.options[i].getAttribute('data-value');
		}
	}

	$("#custName").append($("<input/>").attr("value", "").text());
	params["fk_cust_id"] = fk_cust_id;
	params["methodName"] = "getCustName";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {

				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				$.each(jsonData, function(i, v) {
					document.getElementById("custName").value = v.firstName
							+ " " + v.lastName;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}

/*
 * +++++++++++++ Fetcing Data from goods receive by product name for cash
 * customer 20-5-17++++++++++++
 */
function fetchDataByProductName() {
	var params = {};
	// var itemparams={};
	productId = $('#proName').val();

	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var proName = splitText[0];
	var company = splitText[1];
	var weight = splitText[2];

	params["proName"] = proName;
	params["company"] = company;
	params["weight"] = weight;

	params["methodName"] = "fetchDetailsAsPerProductNameInFertiBill";
	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						var jsonData = $.parseJSON(data);

						// $("#list4").jqGrid("clearGridData",
						// true).trigger("reloadGrid");
						var grid = jQuery("#list4");
						grid.trigger("reloadGrid");

						$
								.each(
										jsonData,
										function(i, v) {

											function sumFmatter(cellvalue,
													options, rowObject) {

												var tax = options.rowData.vatPercentage;

												if (tax == 0) {
													var tot = (options.rowData.quantity * options.rowData.salePrice);
												}
												if (tax != 0) {

													var taxcalculation = (tax / 100)
															* options.rowData.salePrice;
													var tot = (options.rowData.quantity * options.rowData.salePrice)
															+ taxcalculation;
												}
												var jam = 0;

												var count = jQuery("#list4")
														.jqGrid('getGridParam',
																'records');
												var allRowsInGrid1 = $('#list4')
														.getGridParam('data');
												var AllRows = JSON
														.stringify(allRowsInGrid1);
												for (var i = 0; i < count; i++) {

													var quantity = allRowsInGrid1[i].quantity;
													params["quantity" + i] = quantity;

													var salePrice = allRowsInGrid1[i].salePrice;
													params["salePrice" + i] = salePrice;

													var vatPercentage = allRowsInGrid1[i].vatPercentage;
													params["vatPercentage" + i] = vatPercentage;

													if (vatPercentage == 0) {

														var totals1 = (salePrice)
																* (quantity);
														jam = jam + totals1;
													}

													if (vatPercentage != 0) {

														var taxcal = (vatPercentage / 100)
																* salePrice;
														var totals1 = ((salePrice) * (quantity))
																+ taxcal;
														jam = jam + totals1;
													}

												}

												document
														.getElementById("totalWithExpense").value = jam;

												return tot;

											}

											$("#list4")
													.jqGrid(
															{
																datatype : "local",

																colNames : [
																		'pk_goodre_id',
																		'supp_id',
																		'cat_id',
																		'BarcodeNO',
																		'ItemName',
																		'CompanyName',
																		'Packing',
																		'Quantity',
																		'UnitPrice',
																		'MRP',
																		'TaxPercentage',
																		'Total' ],
																colModel : [

																		{
																			name : 'PkGoodreceiveId',
																			hidden : true,

																		},
																		{
																			name : 'supplier_id',
																			hidden : true,
																		},
																		{
																			name : 'cat_id',
																			hidden : true,
																		},

																		{
																			name : 'barcodeNo',
																			width : 100,

																		},
																		{
																			name : 'itemName',
																			width : 150,

																		},

																		{
																			name : 'companyName',
																			width : 150,

																		},

																		{
																			name : 'weight',
																			width : 100,
																			editable : true

																		},

																		{
																			name : 'quantity',
																			width : 100,
																			editable : true

																		},

																		{
																			name : 'salePrice',
																			width : 150,
																			editable : true

																		},
																		{
																			name : 'mrp',
																			width : 140,
																			editable : true

																		},

																		{
																			name : 'vatPercentage',
																			width : 100,
																			editable : true

																		},
																		{
																			name : 'total',
																			width : 150,
																			formatter : sumFmatter
																		},

																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 1200,
																height : 350,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																afterSaveCell : function() {
																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#list4")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#list4")
																			.getRowData(
																					rowId);
																	var quantity = rowData['quantity'];
																	var salePrice = rowData['salePrice'];

																	var tota = quantity
																			* salePrice;

																	$("#list4")
																			.jqGrid(
																					"setCell",
																					rowId,
																					"total",
																					tota);
																},

																pager : "#jqGridPager",

															});

											$("#list4").addRowData(i + 1,
													jsonData[i]);

											$('#list4')
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

																	var grid = $("#list4"), intervalId = setInterval(
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
																checkOnUpdate : true,
																checkOnSubmit : true,
																recreateForm : true,

																reloadAftersubmit : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}

															});

										});

					})
}

/*
 * ++++++++++++++ Fetch product details by product name for CREDIT customer
 * 22-5-17 ++++++++++++++++++++++++++
 */
function getProductDetailsByProductNameForCredit() {

	var params = {};
	// var itemparams={};
	productId = $('#proName1').val();

	$("#proName1 option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var proName = splitText[0];
	var qty = splitText[1];

	params["proName"] = proName;
	params["qty"] = qty;

	var count = 0;
	var newrow;
	var rowId;

	params["methodName"] = "getProductDetails2";
	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						var jsonData = $.parseJSON(data);

						// $("#list4").jqGrid("clearGridData",
						// true).trigger("reloadGrid");

						$
								.each(
										jsonData,
										function(i, v) {

											function sumFmatter(cellvalue,
													options, rowObject) {

												var tax = options.rowData.vatPercentage;

												if (tax == 0) {
													var tot = (options.rowData.quantity * options.rowData.salePrice);
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												if (tax != 0) {

													var taxcalculation = (tax / 100)
															* Number(options.rowData.salePrice);
													var newSalePrice = Number(taxcalculation)
															+ Number(options.rowData.salePrice)
													var tot = (Number(options.rowData.quantity) * Number(newSalePrice));
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												var jam = 0;

												count = jQuery("#credit")
														.jqGrid('getGridParam',
																'records');
												var allRowsInGrid1 = $(
														'#credit')
														.getGridParam('data');
												var AllRows = JSON
														.stringify(allRowsInGrid1);
												for (var i = 0; i < count; i++) {

													var quantity = allRowsInGrid1[i].quantity;
													params["quantity" + i] = quantity;

													var salePrice = allRowsInGrid1[i].salePrice;
													params["salePrice" + i] = salePrice;

													var vatPercentage = allRowsInGrid1[i].vatPercentage;
													params["vatPercentage" + i] = vatPercentage;

													if (vatPercentage == 0) {

														var totals1 = (salePrice)
																* (quantity);
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

													if (vatPercentage != 0) {

														var taxcal = (vatPercentage / 100)
																* salePrice;
														var newSalePrice = Number(salePrice)
																+ Number(taxcal);
														var totals1 = (Number(newSalePrice) * Number(quantity));
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

												}

												document
														.getElementById("totalWithExpense").value = jam;

												return tot;

											}

											count = jQuery("#credit").jqGrid(
													'getGridParam', 'records');
											var rowdata = $("#credit").jqGrid(
													'getGridParam', 'data');
											var ids = jQuery("#credit").jqGrid(
													'getDataIDs');

											var prodName, com, packing, unit;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].itemName;
												com = rowdata[j].companyName;
												packing = rowdata[j].weight;
												unit = rowdata[j].unitName;

												var rowId = ids[j];
												var rowData = jQuery('#credit')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.itemName
														&& com == jsonData.offer.companyName
														&& packing == jsonData.offer.weight
														&& unit == jsonData.offer.unitName) {
													/*
													 * ori_quantity =
													 * +rowdata[j].quantity+1;
													 * 
													 * $("#list4").jqGrid("setCell",
													 * rowId, "quantity",
													 * ori_quantity); var grid =
													 * jQuery("#list4");
													 * grid.trigger("reloadGrid");
													 */
													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#credit");
													grid.trigger("reloadGrid");
													break;
												} else {
													newrow = true;
												}
											}

											if (newrow == true) {

												// $("#list4").addRowData(i,jsonData[i]);
												$("#credit").addRowData(count,
														jsonData.offer);

											}

											$("#credit")
													.jqGrid(
															{
																datatype : "local",

																colNames : [
																		'cat_id',
																		'sub_cat_id',
																		'DIE No',
																		'Length',
																		"Bundel",
																		'Qty (Kg)',
																		'Price',
																		'CGST%',
																		'SGST%',
																		'IGST%',
																		'Total' ],
																colModel : [
																		{
																			name : 'cat_id',
																			hidden : true,
																		},

																		{
																			name : 'sub_cat_id',
																			hidden : true,
																		},

																		{
																			name : 'itemName',
																			width : 150,

																		},

																		{
																			name : 'length',
																			width : 150,

																		},
																		{
																			name : 'bundel',
																			width : 80,

																		},

																		{
																			name : 'weight',
																			width : 70,

																		},

																		{
																			name : 'salePrice',
																			width : 120,
																			editable : true

																		},
																		/*
																		 * {
																		 * name:'mrp',
																		 * width:120,
																		 * editable:
																		 * true },
																		 */

																		{
																			name : 'cgst',
																			width : 80,
																			editable : true

																		},
																		{
																			name : 'sgst',
																			width : 80,
																			editable : true

																		},
																		{
																			name : 'igst',
																			width : 80,
																			editable : true

																		},

																		/*
																		 * {
																		 * name:'quantity',
																		 * width:100,
																		 * editable:
																		 * true },
																		 */
																		{
																			name : 'Total',
																			width : 150,
																		// formatter:
																		// sumFmatter
																		},

																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 1200,
																shrinkToFir : true,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																/*
																 * afterSaveCell:
																 * function () { //
																 * $(this).trigger('reloadGrid');
																 * var rowId
																 * =$("#list4").jqGrid('getGridParam','selrow');
																 * var rowData =
																 * jQuery("#list4").getRowData(rowId);
																 * var quantity =
																 * rowData['quantity'];
																 * var salePrice =
																 * rowData['salePrice'];
																 * 
																 * var tota =
																 * quantity *
																 * salePrice;
																 * 
																 * $("#list4").jqGrid("setCell",
																 * rowId,
																 * "total",
																 * tota); },
																 */

																afterSaveCell : function() {
																	/*
																	 * Calculation
																	 * of total
																	 * after
																	 * editing
																	 * quantity
																	 */

																	// $(this).trigger('reloadGrid');
																	var count = jQuery(
																			"#credit")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var rowId = $(
																			"#credit")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#credit")
																			.getRowData(
																					rowId);
																	var quantity = rowData['weight'];
																	var salePrice = rowData['salePrice'];
																	var igst = rowData['igst'];
																	var gst = rowData['cgst'];
																	var sGst = rowData['sgst'];

																	productId = $(
																			'#proName1')
																			.val();

																	$(
																			"#proName1 option:selected")
																			.each(
																					function() {
																						selectedVal = $(
																								this)
																								.text();
																					});

																	var splitText = selectedVal
																			.split(",");

																	var stock = splitText[4];

																	if (Number(quantity) > Number(stock)) {
																		alert("Available stock = "
																				+ stock);

																	}

																	/*
																	 * var tota =
																	 * quantity *
																	 * salePrice;
																	 * 
																	 * $("#credit").jqGrid("setCell",
																	 * rowId,
																	 * "total",
																	 * tota);
																	 */
																	/*
																	 * if (gst !=
																	 * 0 && sGst !=
																	 * 0){ var
																	 * taxPercentage =
																	 * gst; var
																	 * taxAmount =
																	 * ((taxPercentage/100)*salePrice);
																	 * var
																	 * BuyPriceWithTaxAmount =
																	 * Number(taxAmount) +
																	 * Number(salePrice);
																	 * var tota =
																	 * quantity *
																	 * salePrice;
																	 * $("#credit").jqGrid("setCell",
																	 * rowId,
																	 * "total",
																	 * tota); }
																	 * else {
																	 * var
																	 * taxPercentage =
																	 * Number(iGst);
																	 * var
																	 * taxAmount =
																	 * ((taxPercentage/100)*salePrice);
																	 * var
																	 * BuyPriceWithTaxAmount =
																	 * Number(taxAmount) +
																	 * Number(salePrice);
																	 * var tota =
																	 * quantity *
																	 * salePrice;
																	 * $("#credit").jqGrid("setCell",
																	 * rowId,
																	 * "total",
																	 * tota); }
																	 */

																	var vatAmt = 0;
																	var tota = 0;
																	var totAmt = 0;

																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var sGstAmt = 0;
																	var cGstAmt = 0;

																	for (var r = 0; r < count; r++) {

																		tota = quantity
																				* salePrice;
																		totAmt = quantity
																				* salePrice;

																		if (gst != "0"
																				&& sGst != "0") {
																			sGstAmt = ((tota * (sGst)) / 100);
																			cGstAmt = ((tota * (gst)) / 100);

																			vatAmt = +sGstAmt
																					+ +cGstAmt;
																			totAmt1 = +totAmt
																					+ +vatAmt;

																			$(
																					"#credit")
																					.jqGrid(
																							"setCell",
																							rowId,
																							"Total",
																							totAmt1);
																		} else {

																			vatAmt = ((tota * (igst)) / 100);
																			/*
																			 * totAmt =
																			 * +tota +
																			 * +vatAmt;
																			 * TotalIgst =
																			 * +TotalIgst +
																			 * +vatAmt;
																			 */
																			totAmt1 = +totAmt
																					+ +vatAmt;

																		}

																	}

																	var Total = 0;
																	var allRowsInGrid1 = $(
																			'#credit')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	for (var k = 0; k < count; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		Total = +Total
																				+ +Total1;
																	}
																	document
																			.getElementById("totalWithExpense1").value = Total;
																	document
																			.getElementById("grossTotal1").value = Total;
																	// document.getElementById("duptotal").value
																	// = Total;

																},

																pager : "#jqGridPager1",

															});

											// $("#list4").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#list4").addRowData(i,jsonData[i]);
												$("#credit").addRowData(0,
														jsonData.offer);
											}

											$('#credit')
													.navGrid(
															'#jqGridPager1',

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

																	var grid = $("#credit"), intervalId = setInterval(
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
																checkOnUpdate : true,
																checkOnSubmit : true,
																recreateForm : true,

																afterSubmit : function() {
																	$('#credit')
																			.trigger(
																					'reloadGrid');
																},
																reloadAftersubmit : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}

															});

										});

					})

}

/*
 * ++++++++++++++ Fetch product details by product name for cash customer
 * 22-5-17 ++++++++++++++++++++++++++
 */
function getProductDetailsByProductName() {

	var params = {};
	// var itemparams={};
	productId = $('#proName').val();

	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var proName = splitText[0];
	var company = splitText[1];
	var subCatId = splitText[2];
	var catId = splitText[7];

	params["proName"] = proName;
	params["company"] = company;
	params["catId"] = catId;
	params["subCatId"] = subCatId;

	var count = 0;
	var newrow;
	var rowId;

	params["methodName"] = "getProductDetails1";
	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						var jsonData = $.parseJSON(data);

						// $("#list4").jqGrid("clearGridData",
						// true).trigger("reloadGrid");

						$
								.each(
										jsonData,
										function(i, v) {

											function sumFmatter(cellvalue,
													options, rowObject) {

												var tax = options.rowData.vatPercentage;

												if (tax == 0) {
													var tot = (options.rowData.quantity * options.rowData.salePrice);
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												if (tax != 0) {

													var taxcalculation = (tax / 100)
															* Number(options.rowData.salePrice);
													var newSalePrice = Number(taxcalculation)
															+ Number(options.rowData.salePrice)
													var tot = (Number(options.rowData.quantity) * Number(newSalePrice));
													if (isNaN(tot)) {
														tot = 0;
													}
												}
												var jam = 0;

												count = jQuery("#list4")
														.jqGrid('getGridParam',
																'records');
												var allRowsInGrid1 = $('#list4')
														.getGridParam('data');
												var AllRows = JSON
														.stringify(allRowsInGrid1);
												for (var i = 0; i < count; i++) {

													var quantity = allRowsInGrid1[i].quantity;
													params["quantity" + i] = quantity;

													var salePrice = allRowsInGrid1[i].salePrice;
													params["salePrice" + i] = salePrice;

													var vatPercentage = allRowsInGrid1[i].vatPercentage;
													params["vatPercentage" + i] = vatPercentage;

													if (vatPercentage == 0) {

														var totals1 = (salePrice)
																* (quantity);
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

													if (vatPercentage != 0) {

														var taxcal = (vatPercentage / 100)
																* salePrice;
														var newSalePrice = Number(salePrice)
																+ Number(taxcal);
														var totals1 = (Number(newSalePrice) * Number(quantity));
														if (isNaN(totals1)) {
															totals1 = 0;
														}
														jam = jam + totals1;
													}

												}

												document
														.getElementById("totalWithExpense").value = jam;

												return tot;

											}

											count = jQuery("#list4").jqGrid(
													'getGridParam', 'records');
											var rowdata = $("#list4").jqGrid(
													'getGridParam', 'data');
											var ids = jQuery("#list4").jqGrid(
													'getDataIDs');

											var prodName, com, packing, unit;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].itemName;
												com = rowdata[j].companyName;
												packing = rowdata[j].weight;
												unit = rowdata[j].unitName;

												var rowId = ids[j];
												var rowData = jQuery('#list4')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.itemName
														&& com == jsonData.offer.companyName
														&& packing == jsonData.offer.weight
														&& unit == jsonData.offer.unitName) {
													/*
													 * ori_quantity =
													 * +rowdata[j].quantity+1;
													 * 
													 * $("#list4").jqGrid("setCell",
													 * rowId, "quantity",
													 * ori_quantity); var grid =
													 * jQuery("#list4");
													 * grid.trigger("reloadGrid");
													 */
													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#list4");
													grid.trigger("reloadGrid");
													break;
												} else {
													newrow = true;
												}
											}

											if (newrow == true) {

												// $("#list4").addRowData(i,jsonData[i]);
												$("#list4").addRowData(count,
														jsonData.offer);

											}

											$("#list4")
													.jqGrid(
															{
																datatype : "local",

																colNames : [
																		'cat_id',
																		'sub_cat_id',
																		'ItemName',
																		'CompanyName',
																		"HSN",
																		'Packing',
																		'Unit',
																		'UnitPrice',
																		'GST',
																		'Quantity',
																		'Total' ],
																colModel : [
																		{
																			name : 'cat_id',
																			hidden : true,
																		},

																		{
																			name : 'sub_cat_id',
																			hidden : true,
																		},

																		{
																			name : 'itemName',
																			width : 150,

																		},

																		{
																			name : 'companyName',
																			width : 150,

																		},
																		{
																			name : 'hsn',
																			width : 80,

																		},

																		{
																			name : 'weight',
																			width : 70,

																		},
																		{
																			name : 'unitName',
																			width : 70,

																		},

																		{
																			name : 'salePrice',
																			width : 120,
																			editable : true

																		},
																		/*
																		 * {
																		 * name:'mrp',
																		 * width:120,
																		 * editable:
																		 * true },
																		 */

																		{
																			name : 'gst',
																			width : 80,
																		// editable:
																		// true

																		},
																		/*
																		 * {
																		 * name:'sGst',
																		 * width:80,
																		 * editable:
																		 * true },
																		 */
																		/*
																		 * {
																		 * name:'igst',
																		 * width:80,
																		 * //editable:
																		 * true },
																		 */
																		{
																			name : 'quantity',
																			width : 100,
																			editable : true

																		},
																		{
																			name : 'total',
																			width : 150,
																		// formatter:
																		// sumFmatter
																		},

																],

																sortorder : 'desc',
																loadonce : false,
																viewrecords : true,
																width : 1200,
																shrinkToFit : true,
																rowheight : 300,
																hoverrows : true,
																rownumbers : true,
																rowNum : 10,
																'cellEdit' : true,
																/*
																 * afterSaveCell:
																 * function () { //
																 * $(this).trigger('reloadGrid');
																 * var rowId
																 * =$("#list4").jqGrid('getGridParam','selrow');
																 * var rowData =
																 * jQuery("#list4").getRowData(rowId);
																 * var quantity =
																 * rowData['quantity'];
																 * var salePrice =
																 * rowData['salePrice'];
																 * 
																 * var tota =
																 * quantity *
																 * salePrice;
																 * 
																 * $("#list4").jqGrid("setCell",
																 * rowId,
																 * "total",
																 * tota); },
																 */

																afterSaveCell : function grossTotal() {
																	/*
																	 * Calculation
																	 * of total
																	 * after
																	 * editing
																	 * quantity
																	 */

																	// $(this).trigger('reloadGrid');
																	var rowId = $(
																			"#list4")
																			.jqGrid(
																					'getGridParam',
																					'selrow');
																	var rowData = jQuery(
																			"#list4")
																			.getRowData(
																					rowId);
																	var quantity = rowData['quantity'];
																	var salePrice = rowData['salePrice'];
																	var iGst = rowData['igst'];
																	var Gst = rowData['gst'];

																	productId = $(
																			'#proName')
																			.val();

																	$(
																			"#proName option:selected")
																			.each(
																					function() {
																						selectedVal = $(
																								this)
																								.text();
																					});

																	var splitText = selectedVal
																			.split(",");

																	var stock = splitText[4];

																	if (Number(quantity) > Number(stock)) {

																		alert("Available stock = "
																				+ stock);

																	}

																	if (iGst != 0) {
																		/*
																		 * var
																		 * taxPercentage =
																		 * iGst;
																		 * var
																		 * taxAmount =
																		 * ((taxPercentage/100)*salePrice);
																		 * var
																		 * BuyPriceWithTaxAmount =
																		 * Number(taxAmount) +
																		 * Number(salePrice);
																		 */
																		var tota = quantity
																				* salePrice;
																		$(
																				"#list4")
																				.jqGrid(
																						"setCell",
																						rowId,
																						"total",
																						tota);
																	} else if (iGst == 0) {
																		/*
																		 * var
																		 * taxPercentage =
																		 * Number(Gst);
																		 * var
																		 * taxAmount =
																		 * ((taxPercentage/100)*salePrice);
																		 * var
																		 * BuyPriceWithTaxAmount =
																		 * Number(taxAmount) +
																		 * Number(salePrice);
																		 */
																		var tota = quantity
																				* salePrice;
																		$(
																				"#list4")
																				.jqGrid(
																						"setCell",
																						rowId,
																						"total",
																						tota);

																	}

																	var Total = 0;
																	var count = jQuery(
																			"#list4")
																			.jqGrid(
																					'getGridParam',
																					'records');
																	var allRowsInGrid1 = $(
																			'#list4')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	for (var k = 0; k < count; k++) {
																		var Total1 = allRowsInGrid1[k].total;
																		Total = +Total
																				+ +Total1;
																	}
																	document
																			.getElementById("totalWithExpense").value = Total;
																	document
																			.getElementById("grossTotal").value = Total;
																	// document.getElementById("duptotal").value
																	// = Total;

																},

																pager : "#jqGridPager",

															});

											// $("#list4").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#list4").addRowData(i,jsonData[i]);
												$("#list4").addRowData(0,
														jsonData.offer);
											}

											$('#list4')
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

																	var grid = $("#list4"), intervalId = setInterval(
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
																checkOnUpdate : true,
																checkOnSubmit : true,
																recreateForm : true,

																afterSubmit : function() {
																	$('#list4')
																			.trigger(
																					'reloadGrid');
																},
																reloadAftersubmit : true,
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																}

															});

										});

					})

}

/**
 * *********** Cash Customer Bill adding to fertilizerBilling table
 * ***********************
 */
function fertilizerBill() {

	if (document.fertiBill.customerName.value == "") {
		alert("Please Enter Customer Name");
		return false;
	}
	var letterNumber = /^[a-zA-Z, ]+$/;
	if (document.fertiBill.customerName.value.match(letterNumber)) {
		/*
		 * if ( document.fertiBill.village.value == "" ) { alert("Please Enter
		 * Village"); return false; } var letterNumber = /^[a-zA-Z, ]+$/;
		 * if(document.fertiBill.village.value.match(letterNumber)) {
		 * 
		 * if ( document.fertiBill.contactNo.value == "" ) { alert("Please Enter
		 * Contact Number"); return false; } var letterNumber = /^[0-9]{10}$/;
		 * if(document.fertiBill.contactNo.value.match(letterNumber)) {
		 */
		/*
		 * if ( document.fertiBill.aadharNo.value == "" ) { alert("Please Enter
		 * Aadhar Number"); return false; }
		 */
		var letterNumber = /^[0-9]{12}$/;
		/*
		 * if(document.fertiBill.aadharNo.value.match(letterNumber)) {
		 */if (document.fertiBill.proName.value == "") {
			alert("Please Select Product Name");
			return false;
		}
		if (document.fertiBill.paymentMode.value == "") {
			alert("Please Select Payment Mode");
			return false;
		}

		/*
		 * if ( document.fertiBill.transExpence.value == "" ) { alert("Please
		 * Enter Transportation Expense"); return false; } var letterNumber =
		 * /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/; var num = /^\d+$/;
		 * if(document.fertiBill.transExpence.value.match(letterNumber) ||
		 * document.fertiBill.transExpence.value.match(num) ) {
		 */
		/*
		 * if ( document.fertiBill.hamaliExpence.value == "" ) { alert("Please
		 * Enter Hamali Expense"); return false; }
		 */
		/*
		 * var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/; var num =
		 * /^\d+$/;
		 * if(document.fertiBill.hamaliExpence.value.match(letterNumber) ||
		 * document.fertiBill.hamaliExpence.value.match(num) ) {
		 */

		fertilizerBilling();
	}

	/*
	 * else { alert("Enter only Numbers upto 2 decimal in Hamali Expense
	 * field..!!"); return false; } }
	 */
	/*
	 * else { alert("Enter only Numbers upto 2 decimal in Transportation Expense
	 * field..!!"); return false; } }
	 */
	/*
	 * else { alert("Enter valid 12 digit Aadhar Number"); return false; } }
	 */
	/*
	 * else { alert("Enter valid 10 digit Contact Number"); return false; } }
	 * else { alert("Enter only Alphanumeric in Village field"); return false; } }
	 */
	else {
		alert("Enter only Alphanumeric in Customer Name field");
		return false;
	}
}

function fertilizerBilling() {

	document.fertiBill.btn.disabled = true;
	var params = {};

	var customerName = $('#customerName').val();
	var village = $('#village').val();
	var contactNo = $('#contactNo').val();
	// var aadhar = $('#aadharNo').val();
	/* var transExpense = $('#transExpence').val(); */
	var hamaliExpense = $('#hamaliExpence').val();
	/* var transExpenseWithoutGST = $('#transExpence2').val(); */
	var hamaliExpenseWithourGST = $('#hamaliExpence2').val();
	var grossTotal = $('#grossTotal').val();
	var total = $('#totalWithExpense').val();
	var paymentMode = $('#paymentMode').val();
	var chequeNum = $('#chequeNum').val();
	var saleDate = $('#saleDate').val();
	var input = document.getElementById('shopName'), list = document
			.getElementById('shop_drop1'), i, shopName;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			shopName = list.options[i].getAttribute('data-value');
		}
	}
	var gstNo = $('#gstNo').val();
	var nameOnCheck = $('#nameOnCheck').val();
	var cardNum = $('#cardNum').val();
	var accNum = $('#accNum').val();
	var bankName = $('#bankName').val();

	var discount = $('#discount').val();
	var discountAmount = $('#discountAmount').val();

	productId = $('#proName').val();

	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var fk_shop_id = splitText[12];
	var sub_cat_Id = splitText[2];

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows
	// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var cat_id = allRowsInGrid[i].cat_id;
		params["cat_id" + i] = cat_id;

		var sub_cat_id = allRowsInGrid[i].sub_cat_id;
		params["sub_cat_id" + i] = sub_cat_id;
		/* alert(sub_cat_id); */

		var itemName = allRowsInGrid[i].itemName;
		params["itemName" + i] = itemName;

		var companyName = allRowsInGrid[i].companyName;
		params["companyName" + i] = companyName;

		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var weight = allRowsInGrid[i].weight;
		params["weight" + i] = weight;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;

		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice" + i] = salePrice;

		var gst = allRowsInGrid[i].gst;
		params["gst" + i] = gst;

		/*
		 * var igst = allRowsInGrid[i].igst; params["igst"+i] = igst;
		 */

		var total = allRowsInGrid[i].total;
		params["total" + i] = total;
	}

	params["customerName"] = customerName;
	params["count"] = count;
	params["village"] = village;
	params["contactNo"] = contactNo;
	// params["aadhar"] = aadhar;
	/* params["transExpense"] = transExpense; */
	params["total"] = total;
	params["fk_shop_id"] = shopName;
	params["gstNo"] = gstNo;
	params["sub_cat_Id"] = sub_cat_Id;
	params["grossTotal"] = grossTotal;
	params["hamaliExpense"] = hamaliExpense;
	/* params["transExpenseWithoutGST"] = transExpenseWithoutGST; */
	params["hamaliExpenseWithourGST"] = hamaliExpenseWithourGST;
	params["paymentMode"] = paymentMode;
	params["chequeNum"] = chequeNum;
	params["saleDate"] = saleDate;
	params["nameOnCheck"] = nameOnCheck;
	params["cardNum"] = cardNum;
	params["accNum"] = accNum;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;
	params["bankName"] = bankName;

	params["methodName"] = "addingFertilizerBill";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		window.open("FertilizerBillPDF.jsp");
		location.reload();

	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

/**
 * *********** Cash Customer Bill adding to fertilizerBilling table 28-5-17
 * ***********************
 */
function fertilizerBill_28_5_17() {

	document.fertiBill.btn.disabled = true;
	var params = {};

	var customerName = $('#customerName').val();
	var village = $('#village').val();
	var contactNo = $('#contactNo').val();
	var aadhar = $('#aadharNo').val();
	var transExpense = $('#transExpence').val();
	var hamaliExpense = $('#hamaliExpence').val();
	var grossTotal = $('#grossTotal').val();
	var total = $('#totalWithExpense').val();
	var paymentMode = $('#paymentMode').val();
	var chequeNum = $('#chequeNum').val();
	var nameOnCheck = $('#nameOnCheck').val();
	var cardNum = $('#cardNum').val();
	var accNum = $('#accNum').val();
	var bankName = $('#bankName').val();

	var count = jQuery("#list4").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#list4').getGridParam('data');// to get all rows
	// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var itemName = allRowsInGrid[i].itemName;
		params["itemName" + i] = itemName;

		var companyName = allRowsInGrid[i].companyName;
		params["companyName" + i] = companyName;

		var weight = allRowsInGrid[i].weight;
		params["weight" + i] = weight;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;

		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice" + i] = salePrice;

		var mrp = allRowsInGrid[i].mrp;
		params["mrp" + i] = mrp;

		var vatPercentage = allRowsInGrid[i].vatPercentage;
		params["vatPercentage" + i] = vatPercentage;

		var total = allRowsInGrid[i].total;
		params["total" + i] = total;
	}

	params["customerName"] = customerName;
	params["count"] = count;
	params["village"] = village;
	params["contactNo"] = contactNo;
	params["aadhar"] = aadhar;
	params["transExpense"] = transExpense;
	params["total"] = total;
	params["grossTotal"] = grossTotal;
	params["hamaliExpense"] = hamaliExpense;

	params["paymentMode"] = paymentMode;
	params["chequeNum"] = chequeNum;
	params["nameOnCheck"] = nameOnCheck;
	params["cardNum"] = cardNum;
	params["accNum"] = accNum;
	params["bankName"] = bankName;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;

	params["methodName"] = "addingFertilizerBill_28_5_17";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		window.open("FertilizerBillPDF.jsp");
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

/**
 * *********** Credit Customer Bill adding to fertilizerBilling table
 * ***********************
 */
function fertilizerBillForCreditCustomer() {
	if(document.creditFertiBill1.billNo.value != "") {



	if (document.creditFertiBill1.productName.value != "") {

		/*
		 * if (document.creditFertiBill1.ShopName.value == "") { alert("Please
		 * select Shop Name"); return false; }
		 */

		if (document.creditFertiBill1.saleDate2.value != "") {
			if (document.creditFertiBill1.vehicle.value != "") {
				fertilizerBillForCredit();
			} else {
				alert("Please select Vehicle No");
				return false;
			}
		} else {
			alert("Please select Sale Date");
			return false;
		}

	} else {
		alert("Please Enter product Name");
		return false;
	}
	} else {
		alert("Please Enter Bill No");
		return false;
	}

}

function fertilizerBillForCredit() {

	document.creditFertiBill1.printBillBtn.disable = true;
	var params = {};

	var input = document.getElementById('creditCustomer'), list = document
			.getElementById('cust_drop1'), i, creditCustomer;

	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid').getGridParam('data');// to get all rows
	// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productName = allRowsInGrid[i].productName;
		params["productName" + i] = productName;

		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var okquantity = allRowsInGrid[i].okquantity;
		params["okquantity" + i] = okquantity;
		
		/*if(Number(okquantity) > Number(okquantity))
			{		
			
				alert("Please Enter Return Quantity less than Available Quantity");
				document.getElementById("save").disabled = false;
				return false;				
			}*/
		
		
		var Gst = allRowsInGrid[i].Gst;
		params["Gst" + i] = Gst;

		var IGst = allRowsInGrid[i].IGst;
		params["IGst" + i] = IGst;

		var TaxAmount = allRowsInGrid[i].TaxAmount;
		params["TaxAmount" + i] = TaxAmount;

		/*
		 * var outChallanno = allRowsInGrid[i].outChallanno;
		 * params["outChallanno" + i] = outChallanno;
		 */

		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice" + i] = buyPrice;

		var operation = allRowsInGrid[i].operation;
		if(operation=="" || operation==undefined || operation==null)
		{
			alert("Please Enter Operation In Grid");
			document.getElementById('btn').disabled = false;
			return false;
			
			
		}		
		params["operation" + i] = operation;

		var description = allRowsInGrid[i].description;
		if(description =="" || description==undefined || description==null)
			{
			alert("Please Enter Description In Grid");
			document.getElementById('btn').disabled =false;
			return false;
			}
		params["description" + i] = description;

		var Total = allRowsInGrid[i].Total;
		params["Total" + i] = Total;

	}
	
	var billNo =$('#billNo').val();
	var creditCustomer = $('#creditCustomer').val();
	var custName = $('#custName').val();
	var address = $('#address').val();
	var contactNo1 = $('#contactNo1').val();
	var gstNo2 = $('#gstNo2').val();
	var saleDate2 = $('#saleDate2').val();
	var custgstno = $('#custgstno').val();
	// var ShopName = $('#ShopName').val();
	var outwardchallanno = $('#outwardchallanno').val();
	var paymentMode2 = $('#paymentMode2').val();
	var initialPayment = $('#initialPayment').val();
	var gstForExpense1 = $('#gstForExpense1').val();
	var totalWithExpense1 = $('#totalWithExpense1').val();
	var discount1 = $('#discount1').val();
	var discountAmount1 = $('#discountAmount1').val();
	var hamaliExpence3 = $('#hamaliExpence3').val();
	var hamaliExpence1 = $('#hamaliExpence1').val();
	var grossTotal1 = $('#grossTotal1').val();
	var inwordchallanNo = $('#inwordchallanNo').val();
	var vehicle = $('#vehicle').val();
	/*var Total = $('#Total').val();*/
	var finaldebit = +okquantity * +buyPrice 
/*	var total = $('#total').val();*/
	var grossTotal = $('#grossTotal').val();
	var fk_supplier_id = $("#supplier").val();
	
	 var input = document.getElementById('creditCustomer'),
     list = document.getElementById('cust_drop1'),
     	i,fkRootsupId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootsupId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	
	if(initialPayment=="" || initialPayment=="undefined" ||initialPayment==null )
	{
		initialPayment="0";
	}
	params["billNo"]= billNo;
	params ["supplier"] = fkRootsupId;
	params["creditCustomer"] = creditCustomer;
	params["custName"] = custName;
	params["address"] = address;
	params["contactNo1"] = contactNo1;
	params["saleDate2"] = saleDate2;
	params["gstNo2"] = gstNo2;
	params["custgstno"] = custgstno;
	// params["ShopName"] = ShopName;
	params["outwardchallanno"] = outwardchallanno;
	params["paymentMode2"] = paymentMode2;
	params["initialPayment"] = initialPayment;
	params["gstForExpense1"] = gstForExpense1;
	params["totalWithExpense1"] = totalWithExpense1;
	params["discount1"] = discount1;
	params["discountAmount1"] = discountAmount1;
	params["hamaliExpence3"] = hamaliExpence3;
	params["hamaliExpence1"] = hamaliExpence1;
	params["grossTotal1"] = grossTotal1;
	params["count"] = count;
	params["vehicle"] = vehicle;
	params["inwordchallanNo"] = inwordchallanNo;
	params["total"] = finaldebit;


	params["methodName"] = "addingFertilizerBill1";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.creditFertiBill1.printBillBtn.disable = true;
		window.open("RepackingBillPdf.jsp");

	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

/** * +++ Fetching product Name FOR CASH CUSTOMER+++ **** */
function getProductName() {

	var fk_cat_id = 1;
	$("#proName").empty();
	$("#proName").append(
			$("<option></option>").attr("value", "").text("Select product"));
	var params = {};

	params["methodName"] = "getAllProductByCategoriesForFertiBill";

	// params["fk_cat_id"]= fk_cat_id;

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData, function(i, v) {
					$("#proName").append(
							$("<option></option>").attr("value", count).text(
									v.product + "," + "SubCat=," + v.fkSubCatId
											+ "," + "Containers =,"
											+ v.quantityDouble + ",cat =,"
											+ v.catName + "," + v.fkCatId
											+ ",PackingType =,"
											+ v.fkPackTypeId + "Ltr,"
											+ v.fkSubCatId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}

/** * +++ Fetching product Name FOR CREDIT CUSTOMER+++ **** */
function getProductNameForCredit() {

	var fk_cat_id = 1;
	$("#proName1").empty();
	$("#proName1").append(
			$("<option></option>").attr("value", "").text("Select product"));
	var params = {};

	params["methodName"] = "getAllProductByCategoriesForFertiBill";

	// params["fk_cat_id"]= fk_cat_id;

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				$.each(jsonData, function(i, v) {
					$("#proName1").append(
							$("<option></option>").attr("value", count).text(
									v.product + "," + "SubCat=," + v.fkSubCatId
											+ "," + "Containers =,"
											+ v.quantityDouble + "," + "cat =,"
											+ v.catName + "," + v.fkCatId
											+ ",PackingType =,"
											+ v.fkPackTypeId + "Ltr,"
											+ v.fkSubCatId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}

/* ++++++++++++++ Get credit customer details ++++ */
function customerDetail() {

	this.getVillageName = getVillageName;
	this.getContactNo = getContactNo;
	this.getName = getName;
	this.gstNo = gstNo;
	// this.getAadhar = getAadhar;

	function getVillageName() {

		var input = document.getElementById('creditCustomer'), list = document
				.getElementById('cust_drop1'), i, creditCustomer;

		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input.value) {
				creditCustomer = list.options[i].getAttribute('data-value');
			}
		}

		var creditCustomerId = creditCustomer;
		$("#address").empty();
		$("#address").append($("<input/>").attr("value", "").text());
		var params = {};
		params["methodName"] = "getVillageNameAndContactNoAndFirstNameByCustomer";
		params["creditCustomerId"] = creditCustomerId;
		$.post('/processSoft/jsp/utility/controller.jsp', params,
				function(data) {
					var jsonData = $.parseJSON(data);
					// var jsonData = jsonData.list;
					$.each(jsonData, function(i, v) {
						document.getElementById("address").value = v.village;
					});
				}).error(function(jqXHR, textStatus, errorThrown) {
			if (textStatus === "timeout") {

			}
		});

	}

	function gstNo() {

		var input = document.getElementById('creditCustomer'), list = document
				.getElementById('cust_drop1'), i, creditCustomer;

		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input.value) {
				creditCustomer = list.options[i].getAttribute('data-value');
			}
		}

		var creditCustomerId = creditCustomer;
		$("#gstNo2").empty();
		$("#gstNo2").append($("<input/>").attr("value", "").text());
		var params = {};
		params["methodName"] = "getVillageNameAndContactNoAndFirstNameByCustomer";
		params["creditCustomerId"] = creditCustomer;
		$.post('/processSoft/jsp/utility/controller.jsp', params,
				function(data) {
					var jsonData = $.parseJSON(data);
					// var jsonData = jsonData.list;
					$.each(jsonData, function(i, v) {
						document.getElementById("gstNo2").value = v.gstNo;

					});

				}).error(function(jqXHR, textStatus, errorThrown) {
			if (textStatus === "timeout") {

			}
		});

	}

	function getContactNo() {

		var input = document.getElementById('creditCustomer'), list = document
				.getElementById('cust_drop1'), i, creditCustomer;

		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input.value) {
				creditCustomer = list.options[i].getAttribute('data-value');
			}
		}

		var creditCustomerId = creditCustomer;
		$("#contactNo1").empty();
		$("#contactNo1").append($("<input/>").attr("value", "").text());
		var params = {};
		params["methodName"] = "getVillageNameAndContactNoAndFirstNameByCustomer";
		params["creditCustomerId"] = creditCustomerId;
		$
				.post(
						'/processSoft/jsp/utility/controller.jsp',
						params,
						function(data) {
							var jsonData = $.parseJSON(data);
							// var jsonData = jsonData.list;
							$
									.each(
											jsonData,
											function(i, v) {
												document
														.getElementById("contactNo1").value = v.contactNo;
											});
						}).error(function(jqXHR, textStatus, errorThrown) {
					if (textStatus === "timeout") {

					}
				});

	}

	function getName() {

		var input = document.getElementById('creditCustomer'), list = document
				.getElementById('cust_drop1'), i, creditCustomer;

		for (i = 0; i < list.options.length; ++i) {
			if (list.options[i].value === input.value) {
				creditCustomer = list.options[i].getAttribute('data-value');
			}
		}

		var creditCustomerId = creditCustomer;
		$("#custName").empty();
		$("#custName").append($("<input/>").attr("value", "").text());
		var params = {};
		params["methodName"] = "getVillageNameAndContactNoAndFirstNameByCustomer";
		params["creditCustomerId"] = creditCustomerId;
		$.post('/processSoft/jsp/utility/controller.jsp', params,
				function(data) {
					var jsonData = $.parseJSON(data);
					// var jsonData = jsonData.list;
					$.each(jsonData, function(i, v) {
						document.getElementById("custName").value = v.IdNo;
					});
				}).error(function(jqXHR, textStatus, errorThrown) {
			if (textStatus === "timeout") {

			}
		});
	}
}

var custDetail = new customerDetail();

function getSupWiseBillingProduct() {

	var input = document.getElementById('creditCustomer'), list = document
			.getElementById('cust_drop1'), i, supplier;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			supplier = list.options[i].getAttribute('data-value');
		}
	}

	$("#proName1").empty();
	$("#proName1").append(
			$("<option></option>").attr("value", "").text("Select Product"));
	var params = {};
	params["supplier"] = supplier;
	params["methodName"] = "getAllBillBySuppliers1";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		var count = 1;
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			$("#proName1").append(
					$("<option></option>").attr("value", count).text(
							v.productName + "," + v.quantity));
			count++;
		});
	})

}
// get all outword challan no from Inword Detail table
function getOutwardDetails() {

	var creditCustomer = $('#creditCustomer').val();
	var productName = $('#productName').val();
	$("#outwardchallanno").empty();
	$("#outwardchallanno").append(
			$("<option></option>").attr("value", "").text("Challan No"));
	var params = {};
	params["creditCustomer"] = creditCustomer;
	params["productName"] = productName;
	params["methodName"] = "getOutwardDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {

			$("#outwardchallanno").append(
					$("<option></option>").attr("value", i).text(
							v.outwardchallanno));
			// $("#outwardchallanno").append($("<option></option>").attr("value",count).text(v.outwardchallanno));
			// document.getElementById("#outwardchallanno").value =
			// v.outwardchallanno;
			// count++;
		});
	})

}
// get all Inword challan no from Inword Detail table

function getInwordChallanNo() {

	var creditCustomer = $('#creditCustomer').val();
	var productName = $('#productName').val();
	$("#inwordchallanNo").empty();
	$("#inwordchallanNo").append(
			$("<option></option>").attr("value", "").text("Inword Challan No"));
	var params = {};
	params["creditCustomer"] = creditCustomer;
	params["productName"] = productName;
	params["methodName"] = "getInwarddDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {

			$("#inwordchallanNo").append(
					$("<option></option>").attr("value", i).text(v.challanNo));
			// $("#outwardchallanno").append($("<option></option>").attr("value",count).text(v.outwardchallanno));
			// document.getElementById("#outwardchallanno").value =
			// v.outwardchallanno;
			// count++;
		});
	})

}

// this grid open agenst outward Challan No

function productDetailInGrid123() {

	// this.sumFmatter000 = sumFmatter000 ;

	var outwardchallanno = document.getElementById('outwardchallanno').value;

	itemparams = {};

	itemparams["outwardchallanno"] = outwardchallanno;

	itemparams["methodName"] = "getProductInGridInBilling";

	var count = 0;
	var newrow;
	var rowId;
	var cmpQty;
	$.post('/processSoft/jsp/utility/controller.jsp',itemparams,function(data) {
						var jsonData = $.parseJSON(data);
						$.each(jsonData,function(i, v) {
											count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
											var rowdata = $("#jqGrid").jqGrid('getGridParam', 'data');
											var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

											var prodName;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].productName;

												var rowId = ids[j];
												var rowData = jQuery('#jqGrid')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.productName) {

													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#jqGrid");
													grid.trigger("reloadGrid");
													break;
												} else {
													if(count > 0){
														alert("Product Name Already Inserted !!!");
														return false;
													}else {
													newrow = true;
													}
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
																		"Ok (Qty)",
																		"Rate",
																		"Operation",
																		"Gst",
																		"IGst",
																		"TaxAmount",
																		"Description",
																		"Total",
																		"Dokquantity1",
																		],
																colModel : [
																		{
																			name : "productName",// PARTICULARS
																			width : 150,
																		},
																		{
																			name : "hsn",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "okquantity",
																			width : 150,
																		},

																		{
																			name : "buyPrice",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "operation",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "Gst",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "IGst",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "TaxAmount",
																			width : 150,
																			
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
																			name : "okquantity1",
																			width : 150,
																			editable : false,
																			hidden : true,
																			
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
																
																	
																
																afterSaveCell : function()
																{
																	document.getElementById("discountAmount1").value = 0;
																	document.getElementById("discount1").value = 0;
																	document.getElementById("hamaliExpence3").value = 0;
																	document.getElementById("hamaliExpence1").value = 0;
																		
																	// $(this).trigger('reloadGrid');
																	var rowId = $("#jqGrid").jqGrid('getGridParam','selrow');
																	var rowData = jQuery("#jqGrid").getRowData(rowId);
																	var okquantity = rowData['okquantity'];
																	//cmpQty = rowData['okquantity'];
																	var count1 = jQuery("#jqGrid").jqGrid('getGridParam','records');
																	var okquantity = rowData['okquantity'];		
																	var description =rowData['description'];
																	var buyPrice =rowData['buyPrice'];
																	var   operation =rowData['operation'];
																	var TaxAmount = rowData['TaxAmount'];
																	var buyPrice = rowData['buyPrice'];
																	var gst = rowData['Gst'];
																	var Igst = rowData['IGst'];
																	var vatAmt = 0;
																	var discount = 0;
																	var tota = 0;
																	var totAmt = 0;
																	var ids = jQuery("#jqGrid").jqGrid('getDataIDs');
																	
																	
																	var okquantity1 = rowData['okquantity1'];
																	if(Number(okquantity) > Number(okquantity1))
																	{
																		alert("Available Stock ="+okquantity1);
																		$("#jqGrid").jqGrid("setCell",rowId,"okquantity",okquantity1);	
																		return false;
																	}
																	
																	if(buyPrice !="")
																	{
																	var Price = /^\d{0,10}(?:\.\d{0,2})?$/;
																	if(buyPrice.match(Price)){
																		
																	}
																	else
																		{
																		 var buy ="0";
																		alert("Please Enter Only Number In Rate ");
																		$("#jqGrid").jqGrid("setCell",rowId, "buyPrice", buy);
																		location.reload();
																		return false;
																		}
																	}
																	
																	/*if(operation != ""){
																		var oper = /^[a-zA-Z, ]+$/;
																		if(operation.match(oper))
																			{
																			
																			}
																		else
																			{
																			alert("Please Enter Alphabates In Operation");
																			location.reload();
																			return false;
																			}
																	}*/
																	
																
																	
																
																if(gst != "")
																{
																	var IDecs = /^[0-9]+$/;
																	if(gst.match(IDecs))
																	{
																		(gst > Number(0))
																		{
																		/*var abc ="0";
																		
																		alert(" Please Enter GST Number OR IGST Number");
																		$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																		$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																		return false;*/
																		}
	
																	}
																else{
																	var abc ="0";
																	var pqr ="0"
																	alert(" Please Enter GST Number OR IGST Number ");
																	$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																	$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																	$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																	return false;
																	}
																
																}
																
																if(Igst != "")
																{
																	var IDecs = /^[0-9]+$/;
																	if(Igst.match(IDecs))
																	{
																		(Igst > Number(0))
																		{
																		/*var abc ="0";
																		
																		alert(" Please Enter GST Number OR IGST Number");
																		$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																		$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																		return false;
*/																			}
	
																	}
																else{
																	var abc ="0";
																	
																	alert(" Please Enter GST Number OR IGST Number ");
																	$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																	$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																	$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																	return false;
																	}
																
																}
																if(Igst >0 && gst > 0 )
																{
																var abc ="0";
																alert(" Please Enter GST Number OR IGST Number");
																$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																return false;
																}
																
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
															
																	//var okquantity = rowData['okquantity'];
																	/*var fixedQty = rowData['okquantity'];
																	alert("okquantity======== "+cmpQty+"\nfixedQty======== "+fixedQty);
																	if(Number(cmpQty) > Number(fixedQty))
																		{
																			alert(cmpQty+"<"+fixedQty);
																			$("#jqGrid").jqGrid("setCell",rowId,"okquantity",fixedQty);	
																			return false;																								
																		}
																	else
																		{
																		alert(Number(cmpQty)+">"+Number(fixedQty));
																		return false;
																		}*/
																	
																	
																	
																	//GST and  IGST calculation
																	var gst1 = 0;
																	var iGst1 = 0;
																	
																	if(gst!="0")
																	{	
																	var tax = ((+gst / 100) * 100) + buyPrice ;
																	var taxAmt = ((+gst / 100) * 100) * okquantity;
																	var totAmt = okquantity * tax;
																	}
																	else
																	{
																var tax = ((+Igst / 100) * 100) + buyPrice;
																var taxAmt = ((+Igst / 100) * 100) * okquantity;
																var totAmt = +okquantity * tax;
																	}
																	
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
																	tota = okquantity * buyPrice;
																	
																	if(gst!="0"){
																	gstAmnt = ((tota * gst) / 100);
																	totAmt1 = tota	+ gstAmnt;
																	}
																	else
																	{
																	gstAmnt  = ((tota * Igst) / 100);
																	totAmt1 = tota	+ gstAmnt;
																	}
																	$("#jqGrid").jqGrid("setCell",rowId,"Total",Math.round(totAmt1));
																	$("#jqGrid").jqGrid("setCell",rowId,"TaxAmount",Math.round(gstAmnt));

																	// }
																	var Total = 0;
																	var TotalQuantity = 0;
																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var TotalGross = 0;

																	var count2 = jQuery("#jqGrid").jqGrid('getGridParam','records');
																	var allRowsInGrid1 = $('#jqGrid').getGridParam('data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);
																	for (var k = 0; k < count2; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		if (Total1 != undefined) {
																			Total = +Total
																					+ +Total1;
																		}
																	}

																	document
																			.getElementById("grossTotal1").value = 
																			(Total).toFixed(2);
																	document
																			.getElementById("totalWithExpense1").value = 
																			(Total).toFixed(2);

																},

																pager : "#jqGridPager",

															});

											// $("#list4").addRowData(i+1,jsonData[i]);
											if (count == 0 || count == null) {
												// $("#list4").addRowData(i,jsonData[i]);
												$("#jqGrid").addRowData(0,
														jsonData.offer);
											}

											$('#jqGrid').navGrid('#jqGridPager',

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
															/*	afterSubmit : function() {
																	$('#list4')
																			.trigger(
																					'reloadGrid');
																},*/
																errorTextFormat : function(
																		data) {
																	return 'Error: '
																			+ data.responseText
																},
																afterComplete : function() {
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
																	var count = jQuery(
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
																	
																	 document.getElementById("discount1").value = 0; 
																	 document.getElementById("discountAmount1").value = 0;
																	 document.getElementById("hamaliExpence3").value = 0; 
																	 document.getElementById("hamaliExpence1").value = 0;
																	 var total = document.getElementById("totalWithExpense1").value;
																	 document.getElementById("grossTotal1").value = total;

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

																	var count = jQuery(
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

																	for (var k = 0; k < count; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		if (Total1 != undefined) {
																			Total = +Total
																					+ +Total1;
																		}
																	}
																	var allRowsInGrid1 = $(
																			'#jqGrid')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);

																	for (var n = 0; n < count; n++) {
																		var grossTotal1 = allRowsInGrid1[n].Total;
																		var taxAmt1 = allRowsInGrid1[n].taxAmt;
																		if (taxAmt1 != undefined) {
																			TotalGross = (+TotalGross
																					+ +grossTotal1
																					+ +taxAmt1).toFixed(2);
																		}
																	}

																	document.getElementById("totalWithExpense1").value = (Total).toFixed(2);
																	document.getElementById("grossTotal1").value = (Total).toFixed(2);

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

// this grid open agenst Inward challan No

function productDetailInGrid1234() {

	// this.sumFmatter000 = sumFmatter000 ;

	var inwordchallanNo = document.getElementById('inwordchallanNo').value;

	itemparams = {};

	itemparams["inwordchallanNo"] = inwordchallanNo;

	itemparams["methodName"] = "getProductInGridInBillingInwardChallanNo";

	var count = 0;
	var newrow;
	var rowId;

	$.post('/processSoft/jsp/utility/controller.jsp',itemparams,function(data) {
						var jsonData = $.parseJSON(data);
						$
								.each(
										jsonData,
										function(i, v) {
											count = jQuery("#jqGrid").jqGrid(
													'getGridParam', 'records');
											var rowdata = $("#jqGrid").jqGrid(
													'getGridParam', 'data');
											var ids = jQuery("#jqGrid").jqGrid(
													'getDataIDs');

											var prodName;
											for (var j = 0; j < count; j++) {
												prodName = rowdata[j].productName;

												var rowId = ids[j];
												var rowData = jQuery('#jqGrid')
														.jqGrid('getRowData',
																rowId);

												if (prodName == jsonData.offer.productName) {

													newrow = false;
													alert("Product Name Already Inserted !!!");
													var grid = jQuery("#jqGrid");
													grid.trigger("reloadGrid");
													break;
												} else {
													if(count >0)
														{
														alert("Product Name Already Inserted !!!");
														return false;
														
														}else
															{
													newrow = true;}
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
																		"Ok (Qty)",
																		"Rate",
																		"Operation",
																		"Gst",
																		"IGst",
																		"TaxAmount",
																		"Description",
																		"Total",
																		"Dokquantity1",
																		],
																colModel : [
																		{
																			name : "productName",// PARTICULARS
																			width : 150,
																		},
																		{
																			name : "hsn",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "okquantity",
																			width : 150,
																			
																		},

																		{
																			name : "buyPrice",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "operation",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "Gst",
																			width : 150,
																			editable : true
																		},
																		{
																			name : "IGst",
																			width : 150,
																			editable : true
																		},

																		{
																			name : "TaxAmount",
																			width : 150,
																			
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
																			name : "okquantity1",
																			width : 150,
																			editable : false,
																			hidden : true
																			
																			
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
																	var buyPrice = rowData['buyPrice'];
																	var gst = rowData['Gst'];
																	var TaxAmount = rowData['TaxAmount'];
																	var buyPrice=rowData['buyPrice'];
																	var operation =rowData['operation'];
																	var description =rowData['description'];
																	var Igst = rowData['IGst'];
																	var vatAmt = 0;
																	var discount = 0;
																	var tota = 0;
																	var totAmt = 0;
																	var ids = jQuery("#jqGrid").jqGrid('getDataIDs');
																	
																	
																	var okquantity1 = rowData['okquantity1'];
																	if(Number(okquantity) > Number(okquantity1))
																	{
																		alert("Available Stock ="+okquantity1);
																		$("#jqGrid").jqGrid("setCell",rowId,"okquantity",okquantity1);	
																		return false;
																	}
																	
																	/*if(description !="")
																		{
																		var Decs = /^[a-zA-Z, ]+$/;
																		if(description.match(Decs))
																		{}
																		else
																		{
																			//var setDesc="abc";
																			alert("Please Enter  Alphabates In Description");
																			//$("#jqGrid").jqGrid("setCell",rowId, "description", setDesc);	
																			return false;
																		}
																	}*/
																	/*if(operation != ""){
																		var oper = /^[a-zA-Z, ]+$/;
																		if(operation.match(oper))
																			{
																			
																			}
																		else
																			{
																			alert("Please Enter Alphabates In Operation");
																			return false;
																			}
																	}*/
																	if(buyPrice !="")
																	{
																	var Price = /^\d{0,10}(?:\.\d{0,2})?$/;
																	if(buyPrice.match(Price)){
																		
																	}
																	else
																		{
																		 var buy ="0";
																		alert("Please Enter Only Number In Rate");
																		$("#jqGrid").jqGrid("setCell",rowId, "buyPrice", buy);
																		location.reload();
																		return false;
																		}
																	}
															
																	
																	if(gst != "")
																	{
																		var IDecs = /^[0-9]+$/;
																		if(gst.match(IDecs))
																		{
																			(gst > Number(0))
																			{
																			/*var abc ="0";
																			
																			alert(" Please Enter GST Number OR IGST Number");
																			$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																			$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																			return false;*/
																			}
		
																		}
																	else{
																		var abc ="0";
																		var pqr ="0"
																		alert(" Please Enter GST Number OR IGST Number ");
																		$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																		$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																		$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																		return false;
																		}
																	
																	}
																	
																	if(Igst != "")
																	{
																		var IDecs = /^[0-9]+$/;
																		if(Igst.match(IDecs))
																		{
																			(Igst > Number(0))
																			{
																			/*var abc ="0";
																			
																			alert(" Please Enter GST Number OR IGST Number");
																			$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																			$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																			return false;
*/																			}
		
																		}
																	else{
																		var abc ="0";
																		
																		alert(" Please Enter GST Number OR IGST Number ");
																		$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																		$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																		$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																		return false;
																		}
																	
																	}
																	if(Igst >0 && gst > 0 )
																	{
																	var abc ="0";
																	alert(" Please Enter GST Number OR IGST Number");
																	$("#jqGrid").jqGrid("setCell",rowId, "IGst", abc);

																	$("#jqGrid").jqGrid("setCell",rowId, "Gst", abc);
																	$("#jqGrid").jqGrid("setCell",rowId, "TaxAmount", pqr);
																	return false;
																	}
																
																
																	/*var setZero = 0;
										                    		$("#list4").jqGrid("setCell", rowId, "total", setZero);
*/
																	var gst1 = 0;
																	var iGst1 = 0;
																		
																	if(gst!="0")
																	{	
																	var tax = ((+gst / 100) * 100) + buyPrice ;
																	var taxAmt = ((+gst / 100) * 100) * okquantity;
																	var totAmt = okquantity * tax;
																	}
																	else
																	{
																var tax = ((+Igst / 100) * 100) + buyPrice;
																var taxAmt = ((+Igst / 100) * 100) * okquantity;
																var totAmt = +okquantity * tax;
																	}
															
															
																
																/*		var tax = ((+Igst / 100) * 100)
																		+ +buyPrice;
																var taxAmt = ((+Igst / 100) * 100)
																		* +okquantity;
																var totAmt = +okquantity
																		* +tax;*/
																

																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var sGstAmt = 0;
																	var cGstAmt = 0;

																	var rowData = jQuery("#jqGrid").getRowData(rowId);

																	tota = okquantity * buyPrice;
															
																		
																		
																	if(gst!="0"){
																		gstAmnt = ((tota * gst) / 100);
																		totAmt1 = tota	+ gstAmnt;
																		}
																		else
																		{
																		gstAmnt  = ((tota * Igst) / 100);
																		totAmt1 = tota	+ gstAmnt;
																		}
																	
																			/*gstAmnt = ((tota * Igst) / 100);
																			totAmt1 = tota	+ gstAmnt;*/
																			
																	

																	$("#jqGrid").jqGrid("setCell",rowId,"Total",Math.round(totAmt1));
																	$("#jqGrid").jqGrid("setCell",rowId,"TaxAmount",Math.round(gstAmnt));

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

																	document.getElementById("grossTotal1").value = (Total).toFixed(2);
																	document.getElementById("totalWithExpense1").value = (Total).toFixed(2);
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
																afterComplete : function() {
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
																	var count = jQuery(
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

																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var sGstAmt = 0;
																	var cGstAmt = 0;
																	
																	 document.getElementById("discount1").value = 0; 
																	 document.getElementById("discountAmount1").value = 0;
																	 document.getElementById("hamaliExpence3").value = 0; 
																	 document.getElementById("hamaliExpence1").value = 0;
																	 var total = document.getElementById("totalWithExpense1").value;
																	 document.getElementById("grossTotal1").value = total;

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

																	}
																	var Total = 0;
																	var TotalQuantity = 0;
																	var TotalGst = 0;
																	var TotalIgst = 0;
																	var TotalGross = 0;

																	var count = jQuery(
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

																	for (var k = 0; k < count; k++) {
																		var Total1 = allRowsInGrid1[k].Total;
																		if (Total1 != undefined) {
																			Total = +Total
																					+ +Total1;
																		}
																	}
																	var allRowsInGrid1 = $(
																			'#jqGrid')
																			.getGridParam(
																					'data');
																	var AllRows = JSON
																			.stringify(allRowsInGrid1);

																	for (var n = 0; n < count; n++) {
																		var grossTotal1 = allRowsInGrid1[n].Total;
																		var taxAmt1 = allRowsInGrid1[n].taxAmt;
																		if (taxAmt1 != undefined) {
																			TotalGross = +TotalGross
																					+ +grossTotal1
																					+ +taxAmt1;
																		}
																	}

																	document.getElementById("totalWithExpense1").value = (Total).toFixed(2);
																	document.getElementById("grossTotal1").value = (Total).toFixed(2);

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

															}

													);

										});
					})

}
