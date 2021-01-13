//Add goods receive
function addingGoodsReceive() {
	if (document.goodsReceiveForm.supplier.value == "") {
		alert("Please select Company Name");
		return false;
	}
	if (document.goodsReceiveForm.billNum.value == "") {
		alert("Please Enter Chalan Number");
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9/\, ]+$/;
	if (document.goodsReceiveForm.billNum.value.match(letterNumber)) {

		if (document.goodsReceiveForm.proName.value == "") {
			alert("Enter Product Name (DIE Number)");
			return false;
		}

		if (document.goodsReceiveForm.purchaseDate.value == "") {
			alert("Please Select Challan Date");
			return false;
		}
		addGoodsRecieve();
	} else {
		alert("Enter only Alphanumeric in Chalan Number field..!!");
		return false;
	}
}

function addingContainerGoodsReceive() {

	document.getElementById("btn").disabled = true;
	var params = {};

	var input = document.getElementById('supplier1'), list = document
			.getElementById('sup_drop1'), i, supplier;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			supplier = list.options[i].getAttribute('data-value');
		}
	}

	productId = $('#containerName').val();

	$("#containerName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var containerName = splitText[0];
	var capacity = splitText[2];
	var unit = splitText[3];
	
	var grossTotal1 = $('#grossTotal1').val();
	var purchaseDate1 = $('#purchaseDate1').val();
	var billNum1 = $('#billNum1').val();

	var count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid1').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var packing_Id = allRowsInGrid[i].packing_Id;
		params["packing_Id" + i] = packing_Id;

		var packing_Type = allRowsInGrid[i].packing_Type;
		params["packing_Type" + i] = packing_Type;

		var unitName = allRowsInGrid[i].unitName;
		params["unitName" + i] = unitName;

		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice" + i] = salePrice;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;

		var gst = allRowsInGrid[i].gst;
		if (gst == undefined || gst == null || gst == "") {
			params["gst" + i] = 0;
		} else if (gst != undefined || gst != null || gst != "") {
			params["gst" + i] = gst;
		}

		var igst = allRowsInGrid[i].igst;
		if (igst == undefined || igst == null || igst == "") {
			params["igst" + i] = 0;
		} else if (igst != undefined || igst != null || igst != "") {
			params["igst" + i] = igst;
		}
		
		var Total = allRowsInGrid[i].Total;
		params["Total" + i] = Total;

	}

	var total1 = $('#total1').val();
	
	params["containerName"] = containerName;
	params["capacity"] = capacity;
	params["unit"] = unit;
	params["count"] = count;
	params["billNum1"] = billNum1;
	params["purchaseDate1"] = purchaseDate1;
	params["supplier"] = supplier;
	params["total1"] = total1;
	params["grossTotal1"] = grossTotal1;

	params["methodName"] = "addingContainerGoodsReceive";

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

/*
 * ++++++++++++ Advance Booked Goods Receive adding to goods recive table
 * +++++++++++
 */
function addBookedGoodsReceive() {
	if (document.advanceGoodsReceive.supplier1.value == "") {
		alert("Please select Supplier Name");
		return false;
	}
	if (document.advanceGoodsReceive.billNum1.value == "") {
		alert("Please Enter Bill Number");
		return false;
	}
	if (document.advanceGoodsReceive.fk_cat_id1.value == "") {
		alert("Please Select Product Category");
		return false;
	}
	if (document.advanceGoodsReceive.proName1.value == "") {
		alert("Please Select Product Name");
		return false;
	}
	if (document.advanceGoodsReceive.dcNum1.value == "") {
		alert("Please Enter DC Number");
		return false;
	}
	if (document.advanceGoodsReceive.purchaseDate1.value == "") {
		alert("Please Select purchase Date");
		return false;
	}
	if (document.advanceGoodsReceive.fk_godown_id1.value == "") {
		alert("Please Select Godown");
		return false;
	}
	if (document.advanceGoodsReceive.discount1.value == "") {
		alert("Please Enter Discount in % ");
		return false;
	}
	if (document.advanceGoodsReceive.transExpence1.value == "") {
		alert("Please Enter Transportation Expense ");
		return false;
	}
	if (document.advanceGoodsReceive.hamaliExpence1.value == "") {
		alert("Please Enter Hamali Expense ");
		return false;
	}
	if (document.advanceGoodsReceive.dueDate1.value == "") {
		alert("Please Select Payment Due Date ");
		return false;
	}

	addbookedGoodReceive();

}

function addbookedGoodReceive() {

	document.getElementById("btn1").disabled = true;
	var params = {};

	var input = document.getElementById('fk_godown_id1'), list1 = document
			.getElementById('godown_drop1'), i, fk_godown_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_godown_id = list1.options[i].getAttribute('data-value');
		}
	}

	/*
	 * var input = document.getElementById('fkExpenseDescriptionId1'), list1 =
	 * document.getElementById('exp_drop1'), i,fk_expense_id;
	 * 
	 * for (i = 0; i < list1.options.length; ++i) { if (list1.options[i].value
	 * === input.value) { fk_expense_id =
	 * list1.options[i].getAttribute('data-value'); } }
	 */
	// var fkExpenseId = fk_expense_id;
	var input = document.getElementById('supplier1'), list = document
			.getElementById('sup_drop1'), i, supplier;

	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			supplier = list.options[i].getAttribute('data-value');
		}
	}

	var supplier = supplier;

	var input1 = document.getElementById('fk_cat_id1'), list = document
			.getElementById('cat_drop1'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	var catName = document.getElementById('fk_cat_id1').value;
	var dcNum = $('#dcNum1').val();
	var expenses = $('#extraExpence1').val();
	var grossTotal = $('#grossTotal1').val();
	var count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records');
	var allRowsInGrid = $('#jqGrid1').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productID = allRowsInGrid[i].productID;
		params["productID" + i] = productID;

		var productName = allRowsInGrid[i].productName;
		params["productName" + i] = productName;

		var companyName = allRowsInGrid[i].manufacturer;
		params["companyName" + i] = companyName;

		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice" + i] = salePrice;
		
		var gst = allRowsInGrid[i].gst;
		params["gst" + i] = gst;

		var weight = allRowsInGrid[i].weight;
		params["weight" + i] = weight;

		var quantity = allRowsInGrid[i].quantity;
		params["quantity" + i] = quantity;

		var batchNo = allRowsInGrid[i].batchNo;
		params["batchNo" + i] = batchNo;

		var expiryDate = allRowsInGrid[i].expiryDate;
		params["expiryDate" + i] = expiryDate;

		var taxPercentage = allRowsInGrid[i].taxPercentage;
		params["taxPercentage" + i] = taxPercentage;

		var mrp = allRowsInGrid[i].mrp;
		params["mrp" + i] = mrp;

	}

	var transExpence = $('#transExpence1').val();
	var hamaliExpence = $('#hamaliExpence1').val();
	var dueDate = $('#dueDate1').val();
	var purchaseDate = $('#purchaseDate1').val();
	var billtype = $('#billtype1').val();
	/* var expensesDescription = $('#expensesDescription1').val(); */
	var discount = $('#discount1').val();
	var discountAmount = $('#discountAmount1').val();
	var billNum = $('#billNum1').val();

	params["catName"] = catName;
	params["dueDate"] = dueDate;
	params["purchaseDate"] = purchaseDate;
	/* params["billtype"] = billtype; */
	params["fk_godown_id"] = fk_godown_id;
	params["billNum"] = billNum;
	params["fk_cat_id"] = fk_cat_id;
	params["supplier"] = supplier;
	params["dcNum"] = dcNum;
	params["count"] = count;
	params["discount"] = discount;
	params["discountAmount"] = discountAmount;
	params["transExpence"] = transExpence;
	params["hamaliExpence"] = hamaliExpence;
	params["grossTotal"] = grossTotal;

	params["methodName"] = "addingGoodsReceive";

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

/** ******************Purchase Reports ************ */

/** ******* Single Date ******** */

function purchaseReportForSingleDate() {

	var params = {};
	var fDate = $("#fDate").val();

	params["fDate"] = fDate;

	params["methodName"] = "getPurchaseDetailsForSingleDate";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchase1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchase1').DataTable({
				dom : 'Bfrtip',
				buttons : [ 'copy', ' csv', ' excel', 'pdf', 'print' ],

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				/*
				 * "footerCallback": function ( row, data, start, end, display ) {
				 * var api = this.api(), data;
				 *  // Remove the formatting to get integer data for summation
				 * var intVal = function ( i ) { return typeof i === 'string' ?
				 * i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ? i : 0; };
				 *  // Total over all pages total = api .column( 7 ) .data()
				 * .reduce( function (a, b) { return intVal(a) + intVal(b); }, 0 );
				 * console.log(total); // Total over this page pageTotal = api
				 * .column( 5 ) .data() .reduce( function (a, b) { return
				 * intVal(a) + intVal(b); }, 0 );
				 * 
				 *  // Update footer $( api.column( 7 ).footer() ).html( //
				 * 'Rs'+' '+pageTotal.toFixed(2) str = pageTotal.toFixed(0) );
				 * console.log( pageTotal);
				 *  // Total over this page
				 * 
				 * 
				 *  },
				 */

				destroy : true,
				searching : false,

				columns : [ {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				},/* {
					"data" : "batchNo",
					"width" : "5%"
				},*/ {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]

			});
		});

		var mydata = catmap;
		$('#purchase1').dataTable().fnAddData(mydata);

	}

	);

}

/** ************* Between Two Dates ********** */

function purchaseReportBetweenTwoDates() {

	var params = {};
	var startDate = $("#fisDate2").val();
	var endDate = $("#endDate2").val();

	params["fisDate"] = startDate;
	params["endDate"] = endDate;
	params["methodName"] = "getPurchaseReportBetweenTwoDates";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		$('#purchaseRange').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchaseRange').DataTable({
				dom : 'Bfrtip',
				buttons : [ 'copy', ' csv', ' excel', 'pdf', 'print' ],

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				/*
				 * "footerCallback": function ( row, data, start, end, display ) {
				 * var api = this.api(), data;
				 *  // Remove the formatting to get integer data for summation
				 * var intVal = function ( i ) { return typeof i === 'string' ?
				 * i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ? i : 0; };
				 *  // Total over all pages total = api .column( 7 ) .data()
				 * .reduce( function (a, b) { return intVal(a) + intVal(b); }, 0 );
				 * console.log(total); // Total over this page pageTotal = api
				 * .column( 5 ) .data() .reduce( function (a, b) { return
				 * intVal(a) + intVal(b); }, 0 );
				 * 
				 *  // Update footer $( api.column( 7 ).footer() ).html( //
				 * 'Rs'+' '+pageTotal.toFixed(2) str = pageTotal.toFixed(0) );
				 * console.log( pageTotal);
				 *  // Total over this page
				 * 
				 * 
				 *  },
				 */

				destroy : true,
				searching : false,

				columns : [ {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				},/* {
					"data" : "batchNo",
					"width" : "5%"
				},*/ {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],
				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]

			});
		});

		var mydata = catmap;
		$('#purchaseRange').dataTable().fnAddData(mydata);

	}

	);

}
/* Supplier wise purchase report */

function supplierWisePurchaseReport() {

	var params = {};

	var input11 = document.getElementById('fkSupplierId'), list1 = document
			.getElementById('sup_drop'), i, fk_supplier_id;
	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input11.value) {
			fk_supplier_id = list1.options[i].getAttribute('data-value');
		}
	}

	params["supplier"] = fk_supplier_id;

	params["methodName"] = "getPurchaseDetailsAsPerSupplier";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchase3').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchase3').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				destroy : true,
				searching : false,

				columns : [ {
					"data" : "supplier",
					"width" : "5%"
				}, {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				}, /*{
					"data" : "batchNo",
					"width" : "5%"
				},*/ {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],

			});
		});

		var mydata = catmap;
		$('#purchase3').dataTable().fnAddData(mydata);

	}

	);

}

/* Shop wise purchase report */

function shopWisePurchaseReport() {

	var params = {};
	var startDate = $("#fisDate3").val();
	var endDate = $("#endDate3").val();

	var input11 = document.getElementById('fkShopId'), list1 = document
			.getElementById('shp_drop'), i, fk_supplier_id;
	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input11.value) {
			fk_shop_id = list1.options[i].getAttribute('data-value');
		}
	}

	params["shop"] = fk_shop_id;
	params["fisDate"] = startDate;
	params["endDate"] = endDate;

	params["methodName"] = "getPurchaseDetailsAsPerShop";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchase4').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchase4').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				destroy : true,
				searching : false,

				columns : [ {
					"data" : "supplier",
					"width" : "5%"
				}, {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				}, /*{
					"data" : "batchNo",
					"width" : "5%"
				},*/ {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],

			});
		});

		var mydata = catmap;
		$('#purchase4').dataTable().fnAddData(mydata);

	}

	);

}

/* product wise Purchase report */

/* product wise Purchase report */

function purchaseReportAsPerProductName() {

	var params = {};

	var input1 = document.getElementById('fk_cat_id'), list = document
			.getElementById('cat_drop'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	
	productId = $('#proName').val();

	$("#proName option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var proName = splitText[0];
	var company = splitText[1];
	var weight = splitText[2];


	params["cat"] = fk_cat_id;
	params["proName"] = proName;
	params["company"] = company;
	params["weight"] = weight;

	params["methodName"] = "getPurchaseDetailsAsPerProduct";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchaseAsPerProduct').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchaseAsPerProduct').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				/*
				 * "footerCallback": function ( row, data, start, end, display ) {
				 * var api = this.api(), data;
				 *  // Remove the formatting to get integer data for summation
				 * var intVal = function ( i ) { return typeof i === 'string' ?
				 * i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ? i : 0; };
				 *  // Total over all pages total = api .column( 8 ) .data()
				 * .reduce( function (a, b) { return intVal(a) + intVal(b); }, 0 );
				 * console.log(total); // Total over this page pageTotal = api
				 * .column( 5 ) .data() .reduce( function (a, b) { return
				 * intVal(a) + intVal(b); }, 0 );
				 * 
				 *  // Update footer $( api.column( 8 ).footer() ).html( //
				 * 'Rs'+' '+pageTotal.toFixed(2) str = pageTotal.toFixed(0) );
				 * console.log( pageTotal);
				 *  // Total over this page
				 * 
				 * 
				 *  },
				 * 
				 */
				destroy : true,
				searching : false,

				columns : [ {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "expense",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],

			});
		});

		var mydata = catmap;
		$('#purchaseAsPerProduct').dataTable().fnAddData(mydata);

	}

	);

}

/* Category Wise Purchase report */

function purchaseReportAsPerCat() {

	var params = {};

	var input1 = document.getElementById('fk_cat_id6'), list = document
			.getElementById('cat_drop6'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	var fk_cat_id = fk_cat_id;
	params["cat"] = fk_cat_id;
	params["methodName"] = "getPurchaseDetailsAsPerCategory";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchase4').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchase4').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				destroy : true,
				searching : false,

				columns : [

				{
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				}, {
					"data" : "batchNo",
					"width" : "5%"
				}, {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity",
					"width" : "5%"
				}, {
					"data" : "totalAmount",
					"width" : "5%"
				} ],

			});
		});

		var mydata = catmap;
		$('#purchase4').dataTable().fnAddData(mydata);

	}

	);

}

// sub category dropdown by rk
function getAllSubCat() {

	var input = document.getElementById('fk_cat_id'), list1 = document
			.getElementById('cat_drop'), i, fk_cat_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_cat_id = list1.options[i].getAttribute('data-value');
		}
	}

	$("#subCat").empty();
	$("#subCat").append(
			$("<option></option>").attr("value", "")
					.text("Select Sub Category"));
	var params = {};

	params["fk_cat_id"] = fk_cat_id;

	params["methodName"] = "getSubCategoryDetails";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#subCat").append(
							$("<option></option>").attr("value", count).text(
									v.subcategoryName + "," + v.subcatId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

/*function getSupName() {

	var input = document.getElementById('supplier'), list1 = document
			.getElementById('sup_drop'), i, fk_sup_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_sup_id = list1.options[i].getAttribute('data-value');
		}
	}

	$("#supplierName").empty();
	$("#supplierName").append( $("<option></option>").attr("value", "").text(""));
	var params = {};

	params["fk_sup_id"] = fk_sup_id;

	params["methodName"] = "getSupName";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#supplierName").append(
							$("<option></option>").attr("value", i).text(
									v.dealerName));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}
*/

function getSupName1(){
	var params= {};
	
	var input = document.getElementById('supplier1'), list1 = document
	.getElementById('sup_drop1'), i, fk_sup_id;

		for (i = 0; i < list1.options.length; ++i) {
			if (list1.options[i].value === input.value) {
				fk_sup_id = list1.options[i].getAttribute('data-value');
				}
		}
	
	$("#supplierName1").append($("<input/>").attr("value","").text());
	params["fk_sup_id"]= fk_sup_id;
	params["methodName"] = "getSupName";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("supplierName1").value = v.dealerName;
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 
}

/*** +++ Fetching product Name FOR CASH CUSTOMER+++ *****/
function getContainerName(){
		
	 var fk_cat_id = 1;
		$("#containerName").empty();
		$("#containerName").append($("<option></option>").attr("value","").text("Select Container"));
		var params= {};
		
		params["methodName"] = "getContainerName";
		
		//params["fk_cat_id"]= fk_cat_id;
		
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{ var count = 1;
				
			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)
					{
				$("#containerName").append($("<option></option>").attr("value",count).text(v.containerName + ","+ "Capacity=,"+v.packing_Type+","+v.unitName)); 
					count++;
					});
				}).error(function(jqXHR, textStatus, errorThrown){
					if(textStatus==="timeout") {

					}
				});
		
	
}


// Product name dropdown by rk
function getProductName() {

	var input = document.getElementById('fk_cat_id'), list1 = document
			.getElementById('cat_drop'), i, fk_cat_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_cat_id = list1.options[i].getAttribute('data-value');
		}
	}

	productId = $('#subCat').val();

	$("#subCat option:selected").each(function() {
		selectedVal = $(this).text();
	});

	var splitText = selectedVal.split(",");

	var fk_subCat_id = splitText[1];
	// alert(fk_subCat_id);

	$("#proName").empty();
	$("#proName").append(
			$("<option></option>").attr("value", "")
					.text("Select Product Name"));
	var params = {};

	params["fk_cat_id"] = fk_cat_id;
	params["fk_subCat_id"] = fk_subCat_id;

	params["methodName"] = "getProductNameDetails";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#proName").append(
							$("<option></option>").attr("value", i).text(
									v.productName));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

function getAllShopName() {

	$("#shopName").empty();
	$("#shopName").append(
			$("<option></option>").attr("value", "").text("Select Shop Name"));
	var params = {};

	params["methodName"] = "getShopDetails";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#shopName").append(
							$("<option></option>").attr("value", count).text(
									v.shopName + "," + v.shopId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

/* GST purchase Report */
function purchaseReportAsPerGST() {

	var params = {};
	var startDate = $("#gstFisDate").val();
	var endDate = $("#gstEndDate").val();

	params["gstFisDate"] = startDate;
	params["gstEndDate"] = endDate;
	params["methodName"] = "getGSTPurchaseReport";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {
						$('#gstPurchaseReportTable').dataTable().fnClearTable();

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;

						$(document)
								.ready(
										function() {
											var total = $(
													'#gstPurchaseReportTable')
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
																	total = api
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
																	console
																			.log(total);
																	// Total
																	// over this
																	// page
																	// for item
																	// Rate
																	// total
																	pageTotal = api.column(7)
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
																							7)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
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

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					9)
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
																							9)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

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

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					11)
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
																							11)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					12)
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
																							12)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	pageTotal = api
																			.column(
																					13)
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
																							13)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					14)
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
																							14)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					15)
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
																							15)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	pageTotal = api
																			.column(
																					16)
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
																							16)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					17)
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
																							17)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					18)
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
																							18)
																					.footer())
																			.html(

																					parseFloat(
																							pageTotal)
																							.toFixed(
																									2)

																			);
																	console
																			.log(pageTotal);

																	// Quantity
																	// total
																	pageTotal = api
																			.column(
																					19)
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
																							19)
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
																			"data" : "serialnumber",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "saleDate",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "supplierName",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "billNo",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "gstNumber",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "hsnNumber",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "itemName",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "buyPrice",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "quanti",
																			"width" : "5%",
																			"defaultContent" : ""
																		},

																		{
																			"data" : "totalAmount",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "fivePercentageGST",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "twelwePercentageGST",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "eighteenPercentageGST",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "twentyEightPercentageGST",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "iGSTFivePercentage",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "iGSTTwelwePercentage",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "iGSTEighteenPercentage",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "iGSTTwentyeightPercentage",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "totalTaxAmount",
																			"width" : "5%",
																			"defaultContent" : ""
																		},
																		{
																			"data" : "netAmount",
																			"width" : "5%",
																			"defaultContent" : ""
																		} ],

																dom : 'Bfrtip',
																buttons : [
																		'copy',
																		'csv',
																		'excel',
																		'pdf',
																		'print' ]
															});
										});

						var mydata = catmap;
						$('#gstPurchaseReportTable').dataTable().fnAddData(
								mydata);

					}

			);

}

function supplierWisePurchaseReturnReport() {
	var params = {};

	var input11 = document.getElementById('fkSupplierId_Purchase_Return'), list1 = document
			.getElementById('sup_drop_Purchase_return'), i, fk_supplier_id_purchase_return;
	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input11.value) {
			fk_supplier_id_purchase_return = list1.options[i]
					.getAttribute('data-value');
		}
	}


	params["supplier"] = fk_supplier_id_purchase_return;

	params["methodName"] = "getPurchaseReturnDetailsAsPerSupplierBetweenTwoDate";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#purchaseReturnTable').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#purchaseReturnTable').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				destroy : true,
				searching : false,

				columns : [ {
					"data" : "supplier",
					"width" : "5%"
				}, {
					"data" : "billNo",
					"width" : "5%"
				}, {
					"data" : "purchaseDate",
					"width" : "5%"
				}, {
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "companyName",
					"width" : "5%"
				}, {
					"data" : "dcNo",
					"width" : "5%"
				}, /*{
					"data" : "batchNo",
					"width" : "5%"
				},*/ {
					"data" : "barcodeNo",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				}, {
					"data" : "mrp",
					"width" : "5%"
				}, {
					"data" : "weight",
					"width" : "5%"
				}, {
					"data" : "quantity2",
					"width" : "5%"
				}, {
					"data" : "returnQuantity",
					"width" : "5%"
				}, {
					"data" : "remainingQuantity",
					"width" : "5%"
				}, ],

				dom : 'Bfrtip',
				buttons : [ 'copy', 'csv', 'excel', 'pdf', 'print' ]
			});
		});

		var mydata = catmap;
		$('#purchaseReturnTable').dataTable().fnAddData(mydata);

	}

	);

}

function productDetailInGridForContainer(){
	
	var itemparams = {};
	
	containerName = $('#containerName').val();
	
	$("#containerName option:selected").each(function() {
		   selectedVal = $(this).text();
		});
	
	var splitText = selectedVal.split(",");
	
	var containerName = splitText[0];
	var capacity = splitText[2];
	
	itemparams["containerName"]= containerName;
	itemparams["capacity"]= capacity;
	
	
	var count=0;
	var newrow;
	var rowId;
	var	taxPercentage;
	itemparams["methodName"] = "getproductDetailInGridForContainer";
	$.post('/processSoft/jsp/utility/controller.jsp',itemparams,
			function(data)
			{ 
		var jsonData = $.parseJSON(data);
		
		

/*			 function sumFmatter (cellvalue, options, rowObject)
	        {
			 
	        	var jam=0;
	        	var jam1="";
	        	var tot= ((options.rowData.quantity) * ((options.rowData.buyPrice)+((options.rowData.taxPercentage/100)*options.rowData.buyPrice)));
	        	//var shree = document.poferti.grossTotal.value;// to get gross total
	     
	        	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	        	var allRowsInGrid1 = $('#jqGrid').getGridParam('data');
	        	var AllRows=JSON.stringify(allRowsInGrid1);
	        	for (var i = 0; i < count; i++) {
	        		
	            	var quantity = allRowsInGrid1[i].quantity;
	             	params["quantity"+i] = quantity;
	             	
	             	var buyPrice = allRowsInGrid1[i].buyPrice;
	            	params["buyPrice"+i] = buyPrice;
	            	
	            	var cGst = allRowsInGrid1[i].cGst;
	            	params["cGst"+i] = cGst;
	            	
	            	var sGst = allRowsInGrid1[i].sGst;
	            	params["sGst"+i] = sGst;
	            	
	            	var iGst = allRowsInGrid1[i].iGst;
	            	params["iGst"+i] = iGst;
	            	
	            	if(iGst == 0){
	            	taxPercentage = cGst + sGst;
	            	
	            	var taxAmount = ((taxPercentage/100)*buyPrice);
	            	
	            	var priceWithTaxamount = taxAmount+buyPrice;
	            	
	            	var totals1=((priceWithTaxamount)*(quantity));
	            
	            	jam = jam + totals1;
	            	}
	            	else if (iGst != 0){
	            		taxPercentage = iGst;
		            	var taxAmount = ((taxPercentage/100)*buyPrice);
		            	
		            	var priceWithTaxamount = taxAmount+buyPrice;
		            	
		            	var totals1=((priceWithTaxamount)*(quantity));
		            
		            	jam = jam + totals1;
	            	}
	            	document.getElementById("total").value = jam;
	            	document.getElementById("duptotal").value = jam;
        	    }
	        	if(count == 0){
	        		document.getElementById("total").value = tot;
	        		document.getElementById("duptotal").value = tot;
	        	}
	        	else{
	        	document.getElementById("total").value = jam;
	        	document.getElementById("duptotal").value = jam;
	        	}
	        	
	         
     	
		           return tot;	 
	           }*/	
		 
		$.each(jsonData,function(i,v)
				{

			var productName =  v.productName;
			var  buyPrice =  v.buyPrice;  
			var salePrice =v.salePrice;
			var quantity = v.quantity;
			var weight = v.weight;
			var productID = v.productID ;
			var manufacturer = v.manufacturer ;
			var hsn = v.hsn ;
			var lastsel = productID;
        	
			$("#jqGrid1").jqGrid({
				
			
			
				datatype:"local",

				colNames: [	"Packing ID","Container Name","Capacity","Unit","Sale Price","Extra Pcking","GST %","IGST %","Quantity","Total" ],

				colModel: [
							
				           { 	
				        	   name: "packing_Id",
				        	   hidden:true
				        	   //resizable: true,


				           },
				           { 	
				        	   name: "containerName",
				        	   width:120,

				           },
				           { 	
				        	   name: "packing_Type",
				        	   width:120
				        	  
				           },
				           { 	
				        	   name: "unitName",
				        	   width:120
				        	  
				           },
				           
				           
				          /* {
				        	   name: "mrp",
				        	   width: 140,
				        	   editable: true
				           },*/
				           {
				        	   name:  "salePrice",
				        	   width: 140,
				        	   editable: true
				           },
				           {
				        	   name: "extraPacking",
				        	   hidden:true				           
				        	},	
				           
				           {
				        	   name: "gst",
				        	   width: 80,
				        	   editable: true
				           },
				          /* {
				        	   name: "sGst",
				        	   width: 80,
				        	   editable: true
				           },*/
				           {
				        	   name: "igst",
				        	   width: 80,
				        	  editable: true
				           },
				           {
				        	   name: "quantity",
				        	   width: 120,
				        	   editable: true


				           },

				         {
				        	   name : 'Total',
				        	  // name: "",
				        	  //formatter: sumFmatter,
				        	   width: 150,
				        	  
				           },
				           /*{
				        	   label : 'batchNo',
				        	   name: "batchNo",
				        	   width: 150,
				        	   editable:true,
				        	  
				        	  
				           },*/
				           /*{
				        	   label : 'expiryDate',
				        	   name: "expiryDate",
				        	   index:'Date',
				        	   width: 200,
				        	   editable:true,
				        	   edittype:"text",
				        	   editrules:{date:true, minValue:0}, datefmt:'Y-m-d',
				        	   editoptions:{dataInit: function (elem) {$(elem).datepicker({dateFormat:"yy-mm-dd"});} }
				           }*/
				           ],


				           sortorder : 'desc',
							loadonce: false,
							viewrecords: true,
							width: 1200,
				         shrinkToFit:true,
				          hoverrows: true,
					        rownumbers: true,
				          rowNum: 10,
				          'cellEdit':true,
				           afterSaveCell: function  grossTotal() {
						       /* 	Calculation of total after editing quantity*/
						        	   
						        	   // $(this).trigger('reloadGrid');
						        	   var rowId =$("#jqGrid1").jqGrid('getGridParam','selrow');  
				                       var rowData = jQuery("#jqGrid1").getRowData(rowId);
				                    	
				                    	var quantity = rowData['quantity'];
				                    	var buyPrice = rowData['salePrice'];
				                    	
				                    	
				                    	
				                    /*		if (iGst != 0){
				                    			var taxPercentage = iGst;
					                    		var taxAmount = ((taxPercentage/100)*buyPrice);
					                    		var BuyPriceWithTaxAmount = Number(taxAmount) + Number(buyPrice);
					                    		var tota = quantity * buyPrice;
					                    		$("#jqGrid1").jqGrid("setCell", rowId, "Total", tota);
				                    	}
				                    	else if(iGst == 0){
				                    		var  taxPercentage = Number(Gst);
				                    		var taxAmount = ((taxPercentage/100)*buyPrice);
				                    		var BuyPriceWithTaxAmount = Number(taxAmount) + Number(buyPrice);
				                    		var tota = quantity * buyPrice;
				                    		$("#jqGrid1").jqGrid("setCell", rowId, "Total", tota);
				                    		
				                    	}*/
				                    		
				                    		var tota = quantity * buyPrice;
				                    		$("#jqGrid1").jqGrid("setCell", rowId, "Total", tota);
				                    		
				                    		var Total =0;
				                    		var count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records');
				        		        	var allRowsInGrid1 = $('#jqGrid1').getGridParam('data');
				        		        	var AllRows=JSON.stringify(allRowsInGrid1);
				        		        	for (var k = 0; k < count; k++) {
				        		        		var Total1 = allRowsInGrid1[k].Total;
				        		        		Total = +Total + +Total1;
				        		        	}
				        		        	
				        		        	
				        		        	document.getElementById("total1").value = Total;
			        		        		document.getElementById("grossTotal1").value = Total;
			        		        		
			        		        		
				        		        	
				        	},
				           
				           viewrecords: true,
				           width: 1200,
				           rowNum: 10,
				           pager: "#jqGridPager",
				           sortorder: "desc",
				       	onSelectRow: function(productID){
				       		if(productID && productID!==lastsel){
				       			jQuery('#jqGrid1').jqGrid('restoreRow',lastsel);
				       			jQuery('#jqGrid1').jqGrid('editRow',productID,true);
				       			//jQuery('#jqGrid').jqGrid('editRow',productID,true,pickdates);
				       			lastsel=productID;
				       		}
				       	},
				       	
			});

			count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records'); 
		     var rowdata =$("#jqGrid1").jqGrid('getGridParam','data');
		     var ids = jQuery("#jqGrid1").jqGrid('getDataIDs');
			 
			
			  var prodName,com,packing;
			  for (var j = 0; j < count; j++) 
			  {
				  prodName = rowdata[j].productName;
				  com = rowdata[j].manufacturer;
				  packing = rowdata[j].weight;
				
				 var rowId = ids[j];
				 var rowData = jQuery('#jqGrid1').jqGrid ('getRowData', rowId);
				
				if (prodName == jsonData[i].productName && com == jsonData[i].manufacturer && packing == jsonData[i].weight) {
			    	
			    	newrow=false;
					alert("Product Name Already Inserted !!!");
					var grid = jQuery("#jqGrid1");
				    grid.trigger("reloadGrid");
			    	break;
				}
				else
				{
					newrow = true;
				}
			   }
			  
			  if(newrow == true)
				 {
					
				 // $("#credit").addRowData(i,jsonData[i]);
				  $("#jqGrid1").addRowData(count,jsonData[i]);
					
				 }  
		        
			
			
			
			//$("#jqGrid").addRowData(i,jsonData[i]);
			if(count==0 || count==null)
			{
				// $("#credit").addRowData(i,jsonData[i]);
				 $("#jqGrid1").addRowData(0,jsonData[i]);
			}
			
			
			
			
			//$("#jqGrid").addRowData(i,jsonData[i]);
			function pickdates(productID){
				jQuery("#"+productID+"_expiryDate","#jqGrid").datepicker({dateFormat:"yyyy-mm-dd"});
			}
			/*jQuery("#jqGrid").jqGrid('navGrid',"#jqGridPager",{edit:false,add:false,del:true});*/


			
			$('#jqGrid1').navGrid('#jqGridPager',
					// the buttons to appear on the toolbar of the grid
					{edit: true, add: false,del: true, search: true, refresh: true, view: true, position: "left", cloneToTop: false },
					// options for the Edit Dialog
					
					
					
					
					
					{
						
						/*afterSaveCell: function () {
							  $("#jqGrid").trigger('reloadGrid');
						},*/
						editCaption: "The Edit Dialog",
						recreateForm: true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfteredit: true,
						afterSubmit: function() {
	                		$('#jqGrid1').trigger( 'reloadGrid' );
						},
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						}
					
						
					
					},
					
					{
						
					},
					
					// options for the Delete Dialogue
					{
						closeAfterdel:true,
						recreateForm: true,
						errorTextFormat: function (data) {
							return 'Error: ' + data.responseText
						},
						afterSubmit: function() {
	                		$('#jqGrid1').trigger( 'reloadGrid' );
						},

						onSelectRow: function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid1").saveRow(lastSel, true, 'clientArray');
								jQuery("#jqGrid1").editRow(id, true);
								
								lastSel = id;
								console.log(id);
							}
						},
						
						
					});
			
		// grid refresh code	
			
				});
       

			}); 
}
