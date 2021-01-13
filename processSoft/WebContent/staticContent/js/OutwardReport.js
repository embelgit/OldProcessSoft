/* OUtward Report For SHop Name wISE*/

function outwardReportValidationForShopName() {
	if (document.outwardreportsHOPName.ShopName.value != "") {
		outwardReportValidationForShopName1();
	} else {
		alert("Please Select Shop Name");
	}
}

function outwardReportValidationForShopName1() {
	var params = {};

	ShopName = $('#ShopName').val();
	params["ShopName"] = ShopName;

	params["methodName"] = "getoutwardDetailsTableShopWise";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#OutwardShop').dataTable().fnClearTable();
						console.log(data);
						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $('#OutwardShop')
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

																	// Update
																	// footer
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardchallanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "inwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "okquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "unprocessquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rejectedquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom : 'Bfrtip',
																 buttons: [
														            	
														            	{
														                    extend: 'copyHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'csvHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														            	{
														                    extend: 'excelHtml5',
					
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'pdfHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                	 extend: 'print',
														                    title: 'Outward Process Wise Report'
														                }
														                
														            	
														              /*  'copy', 'csv', 'excel', 'pdf','print'*/
														            ]
															});

										});

						var mydata = catmap;

						var check = mydata.length;
						if (check != 0) {
							$('#OutwardShop').dataTable().fnAddData(mydata);
						} else {
							alert("Outward Data is Not Available for Given Challan No.");
						}

					}

			);

}

/* Outward report Challan no wise */
function outwardReportValidation() {
	if (document.outwardreport.ShopName1.value != "") {
		if (document.outwardreport.challanno.value != "") {
			outwardreporttable();
		} else {
			alert("Please Select Challan Number");
		}
	} else {
		alert("Please Select Shop Name");
	}

}

function outwardreporttable() {

	var params = {};

	ShopName1 = $('#ShopName1').val();
	challanno = $('#challanno').val();
	params["ShopName1"] = ShopName1;
	params["challanno"] = challanno;

	// var fDate = $("#fDate").val();
	// params["fDate"]= fDate;
	params["methodName"] = "getoutwardDetailsTable";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#OutwardtableForReport').dataTable().fnClearTable();
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
													'#OutwardtableForReport')
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

																	// Total
																	// over all
																	// pages
																	/*
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

																	// Update
																	// footer
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardchallanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "inwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "okquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "unprocessquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rejectedquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom : 'Bfrtip',
																 buttons: [
														            	
														            	{
														                    extend: 'copyHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'csvHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														            	{
														                    extend: 'excelHtml5',
					
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'pdfHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                	 extend: 'print',
														                    title: 'Outward Process Wise Report'
														                }
														                
														            	
														              /*  'copy', 'csv', 'excel', 'pdf','print'*/
														            ]
															});

										});

						var mydata = catmap;

						var check = mydata.length;
						if (check != 0) {
							$('#OutwardtableForReport').dataTable().fnAddData(
									mydata);
						} else {
							alert("Outward Data is Not Available for Given Challan No.");
						}

					}

			);

}

/* Outward report two date */
function outwardReportDatewiseValidation() {
	if (document.TwoDateOutwardReport.ShopName2.value != "") {
		if (document.TwoDateOutwardReport.fisDate.value != "") {
			if (document.TwoDateOutwardReport.endDate.value != "") {
				outwardreportDatewise();
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

function outwardreportDatewise() {
	var params = {};

	ShopName2 = $('#ShopName2').val();
	fisDate = $('#fisDate').val();
	endDate = $('#endDate').val();

	params["ShopName2"] = ShopName2;
	params["fisDate"] = fisDate;
	params["endDate"] = endDate;

	params["methodName"] = "getOutwardDetailsDatewise";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#outwardtableForReportDatewise').dataTable()
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
													'#outwardtableForReportDatewise')
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

																	// Total
																	// over all
																	// pages
																	/*
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

																	// Update
																	// footer
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardchallanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "inwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "okquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "unprocessquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rejectedquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		}, ],

																		dom : 'Bfrtip',
																		 buttons: [
																            	
																            	{
																                    extend: 'copyHtml5',
																                    title: 'Outward Process Wise Report'
																                },
																                {
																                    extend: 'csvHtml5',
																                    title: 'Outward Process Wise Report'
																                },
																            	{
																                    extend: 'excelHtml5',
							
																                    title: 'Outward Process Wise Report'
																                },
																                {
																                    extend: 'pdfHtml5',
																                    title: 'Outward Process Wise Report'
																                },
																                {
																                	 extend: 'print',
																                    title: 'Outward Process Wise Report'
																                }
																                
																            	
																              /*  'copy', 'csv', 'excel', 'pdf','print'*/
																            ]
															});

										});

						var mydata = catmap;
						var check = mydata.length;
						if (check != 0) {
							$('#outwardtableForReportDatewise').dataTable()
									.fnAddData(mydata);
						} else {
							alert("Outward Data is Not Available for Given Date")
						}
					}

			);

}

// this function for product Name Wise Raport

function outwardReportValidationForProduct() {
	if (document.outwardreportProductName.ShopName3.value != "") {
		if (document.outwardreportProductName.proName.value != "") {
			outwardreporttableforProduct();
		} else {
			alert("Please Select Product Name");
		}
	} else {
		alert("Please Select Shop Name");
	}

}

function outwardreporttableforProduct() {
	var params = {};

	

	ShopName3 = $('#ShopName3').val();
	proName = $('#proName').val();
	params["ShopName3"] = ShopName3;
	params["proName"] = proName;

	params["methodName"] = "getoutwardDetailsTableforProduct";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#OutwardtableForReportproduct').dataTable()
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
													'#OutwardtableForReportproduct')
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

																	// Total
																	// over all
																	// pages
																	/*
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

																	// Update
																	// footer
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardchallanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "inwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "okquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "unprocessquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rejectedquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom : 'Bfrtip',
																 buttons: [
														            	
														            	{
														                    extend: 'copyHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'csvHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														            	{
														                    extend: 'excelHtml5',
					
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'pdfHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                	 extend: 'print',
														                    title: 'Outward Process Wise Report'
														                }
														                
														            	
														              /*  'copy', 'csv', 'excel', 'pdf','print'*/
														            ]
															});

										});

						var mydata = catmap;

						var check = mydata.length;
						if (check != 0) {
							$('#OutwardtableForReportproduct').dataTable()
									.fnAddData(mydata);
						} else {
							alert("Outward Data is Not Available for Given product.");
						}

					}

			);

}

// for vendor name wise report

function outwardReportValidationForVendor() {
	if (document.outwardreportvendorName.ShopName4.value != "") {
		if (document.outwardreportvendorName.venName.value != "") {
		outwardreporttableforvendor();
	} else {
		alert("Please Select Product Name");
	}
	}
	 else {
			alert("Please Select Shop Name");
		}
}

function outwardreporttableforvendor() {
	var params = {};

	

	ShopName4 = $('#ShopName4').val();
	venName = $('#venName').val();
	params["ShopName4"] = ShopName4;
	params["venName"] = venName;

	
	params["methodName"] = "getoutwardDetailsTableforVendor";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						$('#OutwardtableForReportvendor').dataTable()
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
													'#OutwardtableForReportvendor')
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

																	// Total
																	// over all
																	// pages
																	/*
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

																	// Update
																	// footer
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
																			"data" : "suppliername",
																			"width" : "5%"
																		},
																		{
																			"data" : "challanNo",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardchallanno",
																			"width" : "5%"
																		},
																		{
																			"data" : "inwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "outwardDate",
																			"width" : "5%"
																		},
																		{
																			"data" : "productName",
																			"width" : "5%"
																		},
																		{
																			"data" : "okquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "unprocessquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "rejectedquantity",
																			"width" : "5%"
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%"
																		},
																		{
																			"data" : "GridTotal",
																			"width" : "5%"
																		},

																],

																dom : 'Bfrtip',
																 buttons: [
														            	
														            	{
														                    extend: 'copyHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'csvHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														            	{
														                    extend: 'excelHtml5',
					
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                    extend: 'pdfHtml5',
														                    title: 'Outward Process Wise Report'
														                },
														                {
														                	 extend: 'print',
														                    title: 'Outward Process Wise Report'
														                }
														                
														            	
														              /*  'copy', 'csv', 'excel', 'pdf','print'*/
														            ]
															});

										});

						
						var mydata = catmap;

						var check = mydata.length;
						
						if (check != 0) {
							$('#OutwardtableForReportvendor').dataTable()
									.fnAddData(mydata);
						} else {
							alert("Outward Data is Not Available for Given Vendor.");
						}

					}

			);

}
