function addtax() {
	if (document.txc.taxType.value == "") {
		alert("Please Enter Tax Type");
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if (document.txc.taxType.value.match(letterNumber)) {
		if (document.txc.taxPercentage.value == "") {
			alert("Please Enter Tax Percentage");
			return false;
		}
		var letterNumber = /^\s*-?[0-9]\d*(\.\d{1,2})?\s*$/;
		if (document.txc.taxPercentage.value.match(letterNumber)) {
			txCreation();
		}

		else {
			alert("Enter Only Number upto 2 decimal in Tax percentage field..!!");
			return false;
		}
	} else {
		alert("Enter Alphabates And Number Only in Tax Type field..!!");
		return false;
	}
}

function txCreation() {
    document.getElementById('saveTaxDetails').disabled =true;
	//document.txc.btn.disabled = true;
	var taxType = $('#taxType').val();
	var taxPercentage = $('#taxPercentage').val();
	/* var activeYn = $('#activeYn').val(); */

	var params = {};

	params["taxType"] = taxType;
	params["taxPercentage"] = taxPercentage;
	/* params ["activeYn"] = activeYn; */

	params["methodName"] = "taxCreation";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.txc) {
			location.reload();
			//location.reload();
			window.reload("product_detail.jsp")
		}
		document.getElementById('saveTaxDetails').disabled = false;

	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function editTax() {

	if (document.txc.taxType1.value == "") {
		alert("Please Enter Tax Type");
		return false;
	}

	if (document.txc.taxPercentage.value == "") {
		alert("Please Enter Tax Percentage");
		return false;
	}
	var letterNumber = /^\d+(\.\d+)?$/;
	if (document.txc.taxPercentage.value.match(letterNumber)) {
		edittxCreation();
	}

	else {
		alert("Enter Number Only in percentage field..!!");
		return false;
	}

}

function edittxCreation() {
	var input = document.getElementById('taxType1'), list = document
			.getElementById('tax_drop1'), i, taxType1;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			taxType1 = list.options[i].getAttribute('data-value');
		}
	}
	/*
	 * var taxId=$('#fk_tax_id').val(); alert(taxId);
	 */
	var taxName = $('#taxName').val();
	var taxPercentage = $('#taxPercentage').val();
	/* var activeYn = $('#activeYn').val(); */

	var params = {};

	params["taxType1"] = taxType1;

	params["taxName"] = taxName;
	// alert(taxType1);
	params["taxPercentage"] = taxPercentage;
	/* params ["activeYn"] = activeYn; */

	params["methodName"] = "edittaxCreation";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function reset() {
	document.txc.reset();

}

/* +++++++++++ Tax reports +++++++++++++ */
/* ++++++++ for SALE +++++++++ */
/* ++++++++ for Single date SALE +++++++++ */
function taxReportForSale() {
	var params = {};

	var input1 = document.getElementById('fk_cat_id_for_sale'), list = document
			.getElementById('cat_drop_for_sale'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	var fDate = $('#fDate').val();
	params["cat"] = fk_cat_id;
	params["fDate"] = fDate;
	params["methodName"] = "getTaxDetailsAsPerCategoryFromSale";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#saleTax').dataTable().fnClearTable();

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $('#saleTax')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},

																"footerCallback" : function(
																		row,
																		data,
																		start,
																		end,
																		display) {
																	var api = this
																			.api(), data;

																	// Remove
																	// the
																	// formatting
																	// to get
																	// integer
																	// data for
																	// summation
																	var intVal = function(
																			i) {
																		return typeof i === 'string' ? i
																				.replace(
																						/[\$,]/g,
																						'') * 1
																				: typeof i === 'number' ? i
																						: 0;
																	};

																	pageTotal = api
																			.column(
																					8)
																			.data()
																			.reduce(
																					function(
																							a,
																							b) {
																						return intVal(a)
																								+ intVal(b);
																					},
																					0);

																	// Update
																	// footer
																	$(
																			api
																					.column(
																							8)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																},

																destroy : true,
																searching : false,

																columns : [

																		{
																			"data" : "billNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "product",
																			"width" : "5%"
																		},
																		{
																			"data" : "manufacturer",
																			"width" : "5%"
																		},
																		{
																			"data" : "weight",
																			"width" : "5%"
																		},
																		{
																			"data" : "salePrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "mrp",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxPercentage",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxAmount",
																			"width" : "5%"
																		},

																],

															});
										});

						var mydata = catmap;
						$('#saleTax').dataTable().fnAddData(mydata);

					}

			);

}

/* ++++++++ Between Two date SALE +++++++++ */
function taxFromSaleBetweenTwoDate() {

	var params = {};

	var input1 = document.getElementById('fk_cat_id_for_sale_Two'), list = document
			.getElementById('cat_drop_for_sale_Two'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	var fDate = $('#fDateTwo').val();
	var sDate = $('#sDateTwo').val();
	params["cat"] = fk_cat_id;
	params["fDate"] = fDate;
	params["sDate"] = sDate;
	params["methodName"] = "getTaxDetailsAsPerCategoryFromSaleBetweenTwoDate";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#saleTaxTwo').dataTable().fnClearTable();

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $('#saleTaxTwo')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},

																"footerCallback" : function(
																		row,
																		data,
																		start,
																		end,
																		display) {
																	var api = this
																			.api(), data;

																	// Remove
																	// the
																	// formatting
																	// to get
																	// integer
																	// data for
																	// summation
																	var intVal = function(
																			i) {
																		return typeof i === 'string' ? i
																				.replace(
																						/[\$,]/g,
																						'') * 1
																				: typeof i === 'number' ? i
																						: 0;
																	};

																	pageTotal = api
																			.column(
																					8)
																			.data()
																			.reduce(
																					function(
																							a,
																							b) {
																						return intVal(a)
																								+ intVal(b);
																					},
																					0);

																	// Update
																	// footer
																	$(
																			api
																					.column(
																							8)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																},

																destroy : true,
																searching : false,

																columns : [

																		{
																			"data" : "billNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "product",
																			"width" : "5%"
																		},
																		{
																			"data" : "manufacturer",
																			"width" : "5%"
																		},
																		{
																			"data" : "weight",
																			"width" : "5%"
																		},
																		{
																			"data" : "salePrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "mrp",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxPercentage",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxAmount",
																			"width" : "5%"
																		},

																],

															});
										});

						var mydata = catmap;
						$('#saleTaxTwo').dataTable().fnAddData(mydata);

					}

			);

}

/* +++++++++++++ for Purchase +++++++++++++++ */
/* +++++++++++++++++ Single date ++++++++++++++++ */
function taxReportForPurchaseSingleDate() {

	var params = {};

	var input1 = document.getElementById('fk_cat_id_for_purchase'), list = document
			.getElementById('cat_drop_for_purchase'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	var fDate = $('#fDatePurchase').val();
	var sDate = $('#sDatePurchase').val();
	params["cat"] = fk_cat_id;
	params["fDate"] = fDate;
	params["sDate"] = sDate;
	params["methodName"] = "getTaxDetailsAsPerCategoryFromPurchase";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#purchaseTaxSingle').dataTable().fnClearTable();

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $('#purchaseTaxSingle')
													.DataTable(
															{

																fnRowCallback : function(
																		nRow,
																		aData,
																		iDisplayIndex) {
																	$(
																			"th:first",
																			nRow)
																			.html(
																					iDisplayIndex + 1);
																	return nRow;
																},

																"footerCallback" : function(
																		row,
																		data,
																		start,
																		end,
																		display) {
																	var api = this
																			.api(), data;

																	// Remove the formatting to get integer data for summation
																	var intVal = function(
																			i) {
																		return typeof i === 'string' ? i
																				.replace(
																						/[\$,]/g,
																						'') * 1
																				: typeof i === 'number' ? i
																						: 0;
																	};

																	pageTotal = api
																			.column(
																					10)
																			.data()
																			.reduce(
																					function(
																							a,
																							b) {
																						return intVal(a)
																								+ intVal(b);
																					},
																					0);

																	// Update footer
																	$(
																			api
																					.column(
																							10)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																},

																destroy : true,
																searching : false,

																columns : [
																		{
																			"data" : "supplier",
																			"width" : "5%"
																		},
																		{
																			"data" : "tinNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "billNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "companyName",
																			"width" : "5%"
																		},
																		{
																			"data" : "weight",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "mrp",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxPercentage",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity2",
																			"width" : "5%"
																		},
																		{
																			"data" : "taxAmount",
																			"width" : "5%"
																		},

																],

															});
										});

						var mydata = catmap;
						$('#purchaseTaxSingle').dataTable().fnAddData(mydata);

					}

			);

}