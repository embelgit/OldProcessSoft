/*Inward Report for Shop Name Wise */

function ShopNameWiseinwardReportValidation() {
	if (document.Shopinwardreport.ShopName.value != "") {
		ShopNameWiseinwardReportValidation1();
	} else {
		alert("Please Select Shop Name");
	}
}

function ShopNameWiseinwardReportValidation1() {
	var params = {};

	ShopName = $('#ShopName').val();
	params["ShopName"] = ShopName;
	params["methodName"] = "getInwardDetailsTableforShopName";
	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#inwardtableForReportShopNameWise').dataTable()
								.fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $(
													'#inwardtableForReportShopNameWise')
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

																	/*
																	 * // Total
																	 * over all
																	 * pages
																	 * total =
																	 * api
																	 * .column(
																	 * 6 )
																	 * .data()
																	 * .reduce(
																	 * function
																	 * (a, b) {
																	 * return
																	 * intVal(a) +
																	 * intVal(b); },
																	 * 0 );
																	 * console.log(total);
																	 */

																	// Total
																	// over this
																	// page
																	pageTotal = api
																			.column(
																					6)
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
																							6)
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "challadate",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "productname",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rate",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom: 'Bfrtip',
														        buttons: [

														        	{
														                extend: 'copyHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'csvHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														        	{
														                extend: 'excelHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'pdfHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														            	 extend: 'print',
														                title: 'Without Po Inward Process Wise Reports'
														            }
														        ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#inwardtableForReportShopNameWise').dataTable()
									.fnAddData(mydata);
						} else {
							alert("Inward Data is Not Available for Given Shop Name")
						}
					}

			);

}

/* End Of Inward Report Shop Wise */

function inwardReportValidation() {
	if (document.inwardreport.ShopName1.value != "") {
		if (document.inwardreport.Billno.value != "") {
			inwardreporttable();
		} else {
			alert("Please Select Challan Number");
		}
	} else {
		alert("Please Select Shop Name");
	}
}

function inwardreporttable() {
	var params = {};

	var input1 = document.getElementById('Billno'), list = document
			.getElementById('bill_drop'), i, Billno;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {

			Billno = list.options[i].getAttribute('data-value');
		}
	}

	ShopName1 = $('#ShopName1').val();
	Billno = $('#Billno').val();
	params["ShopName1"] = ShopName1;
	params["Billno"] = Billno;

	// var fDate = $("#fDate").val();
	// params["fDate"]= fDate;
	params["methodName"] = "getInwardDetailsTable";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#inwardtableForReport').dataTable().fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $(
													'#inwardtableForReport')
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

																	/*
																	 * // Total
																	 * over all
																	 * pages
																	 * total =
																	 * api
																	 * .column(
																	 * 6 )
																	 * .data()
																	 * .reduce(
																	 * function
																	 * (a, b) {
																	 * return
																	 * intVal(a) +
																	 * intVal(b); },
																	 * 0 );
																	 * console.log(total);
																	 */

																	// Total
																	// over this
																	// page
																	pageTotal = api
																			.column(
																					6)
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
																							6)
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "challadate",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "productname",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rate",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom: 'Bfrtip',
														        buttons: [

														        	{
														                extend: 'copyHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'csvHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														        	{
														                extend: 'excelHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'pdfHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														            	 extend: 'print',
														                title: 'Without Po Inward Process Wise Reports'
														            }
														        ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#inwardtableForReport').dataTable().fnAddData(
									mydata);
						} else {
							alert("Inward Data is Not Available for Given Challan Number")
						}
					}

			);

}

function inwardReportDatewiseValidation() {
	if (document.TwoDateinwardreport.ShopName2.value != "") {
		if (document.TwoDateinwardreport.fisDate.value != "") {
			if (document.TwoDateinwardreport.endDate.value != "") {
				inwardreportDatewise();
			} else {
				alert("Please Select End Date");
			}
		} else {
			alert("Please Select Start Date");
		}
	} else {
		alert("Please Select Shop Name");
	}

}

function inwardreportDatewise() {
	var params = {};

	ShopName2 = $('#ShopName2').val();
	fisDate = $('#fisDate').val();
	endDate = $('#endDate').val();

	params["ShopName1"] = ShopName2;
	params["fisDate"] = fisDate;
	params["endDate"] = endDate;

	params["methodName"] = "getInwardDetailsDatewise";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#inwardtableForReportDatewise').dataTable()
								.fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $(
													'#inwardtableForReportDatewise')
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

																	/*
																	 * // Total
																	 * over all
																	 * pages
																	 * total =
																	 * api
																	 * .column(
																	 * 6 )
																	 * .data()
																	 * .reduce(
																	 * function
																	 * (a, b) {
																	 * return
																	 * intVal(a) +
																	 * intVal(b); },
																	 * 0 );
																	 * console.log(total);
																	 */

																	// Total
																	// over this
																	// page
																	pageTotal = api
																			.column(
																					6)
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
																							6)
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "challadate",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "productname",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rate",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom: 'Bfrtip',
														        buttons: [

														        	{
														                extend: 'copyHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'csvHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														        	{
														                extend: 'excelHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'pdfHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														            	 extend: 'print',
														                title: 'Without Po Inward Process Wise Reports'
														            }
														        ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#inwardtableForReportDatewise').dataTable()
									.fnAddData(mydata);
						} else {
							alert("Inward Data is Not Avaible for Given Date");
						}
					}

			);

}

function ProductNameWiseinwardReportValidation() {
	if (document.productinwardreport.ShopName3.value != "") {
		if (document.productinwardreport.proName.value != "") {
			productNameWiseinwardreporttable();
		} else {
			alert("Please Select Produt Name");
		}
	} else {
		alert("Please Select Shop Name");
	}

}

function productNameWiseinwardreporttable() {
	var params = {};

	var input1 = document.getElementById('proName'), list = document
			.getElementById('pro_drop'), i, proName;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {

			proName = list.options[i].getAttribute('data-value');
		}
	}

	ShopName3 = $('#ShopName3').val();
	proName = $('#proName').val();
	params["ShopName3"] = ShopName3;
	params["proName"] = proName;

	// var fDate = $("#fDate").val();
	// params["fDate"]= fDate;
	params["methodName"] = "getInwardDetailsTableforProductName";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#inwardtableForReportproductNameWise').dataTable()
								.fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $(
													'#inwardtableForReportproductNameWise')
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

																	/*
																	 * // Total
																	 * over all
																	 * pages
																	 * total =
																	 * api
																	 * .column(
																	 * 6 )
																	 * .data()
																	 * .reduce(
																	 * function
																	 * (a, b) {
																	 * return
																	 * intVal(a) +
																	 * intVal(b); },
																	 * 0 );
																	 * console.log(total);
																	 */

																	// Total
																	// over this
																	// page
																	pageTotal = api
																			.column(
																					6)
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
																							6)
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "challadate",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "productname",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rate",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom: 'Bfrtip',
														        buttons: [

														        	{
														                extend: 'copyHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'csvHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														        	{
														                extend: 'excelHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'pdfHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														            	 extend: 'print',
														                title: 'Without Po Inward Process Wise Reports'
														            }
														        ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#inwardtableForReportproductNameWise')
									.dataTable().fnAddData(mydata);
						} else {
							alert("Inward Data is Not Available for Given Product Name")
						}
					}

			);

}

// this function for inword report as per vendor Name
function vendorNameWiseinwardReportValidation() {
	if (document.vendorinwardreport.ShopName4.value != "") {
		if (document.vendorinwardreport.venName.value != "") {
		vendorNameWiseinwardreporttable();
	} else {
		alert("Please Select vendor Name");
	}
	}
 else {
	alert("Please Select Shop Name");
}

	
}

function vendorNameWiseinwardreporttable() {
	var params = {};

	var input1 = document.getElementById('venName'), list = document
			.getElementById('ven_drop'), i, venName;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {

			venName = list.options[i].getAttribute('data-value');
		}
	}

	ShopName4 = $('#ShopName4').val();
	venName = $('#venName').val();
	params["ShopName4"] = ShopName4;
	params["venName"] = venName;

	// var fDate = $("#fDate").val();
	// params["fDate"]= fDate;
	params["methodName"] = "getInwardDetailsTableforvendorName";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#inwardtableForReportvendorNameWise').dataTable()
								.fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						/*
						 * $(document).ready(function() { } );
						 */

						$(document)
								.ready(
										function() {
											var total = $(
													'#inwardtableForReportvendorNameWise')
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

																	/*
																	 * // Total
																	 * over all
																	 * pages
																	 * total =
																	 * api
																	 * .column(
																	 * 6 )
																	 * .data()
																	 * .reduce(
																	 * function
																	 * (a, b) {
																	 * return
																	 * intVal(a) +
																	 * intVal(b); },
																	 * 0 );
																	 * console.log(total);
																	 */

																	// Total
																	// over this
																	// page
																	pageTotal = api
																			.column(
																					6)
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
																							6)
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "challadate",
																			"width" : "5%"
																		},
																		
																		{
																			"data" : "productname",
																			"width" : "5%"
																		},
																		{
																			"data" : "quantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rate",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom: 'Bfrtip',
														        buttons: [

														        	{
														                extend: 'copyHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'csvHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														        	{
														                extend: 'excelHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														                extend: 'pdfHtml5',
														                title: 'Without Po Inward Process Wise Reports'
														            },
														            {
														            	 extend: 'print',
														                title: 'Without Po Inward Process Wise Reports'
														            }
														        ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#inwardtableForReportvendorNameWise')
									.dataTable().fnAddData(mydata);
						} else {
							alert("Inward Data is Not Available for Given Vendor Name")
						}
					}

			);

}
