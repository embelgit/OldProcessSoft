
//Add goods receive
function addValGoodsRecieve() {

	if (document.goodsReceiveForm.productName.value == "") {
		alert("Please Select product Name");
		return false;
	}
	
	if (document.goodsReceiveForm.supplier.value == "") {
		alert("Please Select supplier Name");
		return false;
	}
	
	/*if (document.goodsReceiveForm.pono.value == "") {
		alert("Please Select po no");
		return false;
	}*/
	
	if (document.goodsReceiveForm.challanno.value == "") {
		alert("Please Enter challan No ");
		return false;
	}
	
	if (document.goodsReceiveForm.Challandate.value == "") {
		alert("Please Select Challan date ");
		return false;
	}
	
	if(document.goodsReceiveForm.operationName.value == "") {
		alert("Please Select operation name ");
		document.getElementById("operationName").focus();
		return false;
	}
	addGoodsRecieve();
				
}

function addGoodsRecieve() {

	document.getElementById("btn").disabled = true;
	var params = {};
	

	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	if(count < 1)
		{
		alert("Please Select Po No ");
		document.getElementById("btn").disabled = false;
		return false;
		}
	var allRowsInGrid = $('#jqGrid').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productname = allRowsInGrid[i].productname;
		params["productname" + i] = productname;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;
		
		var operation = allRowsInGrid[i].operation;
		params["operation" + i] = operation;
		
		/*var PODate = allRowsInGrid[i].PODate;
		params["PODate" + i] = PODate;*/
		
		var quantity = allRowsInGrid[i].quantity;
		if(quantity =="0" || quantity =="" || quantity ==undefined)
		{
			alert("Please Enter Quantity In Grid");
			
			document.getElementById("btn").disabled = false;
			return false;
			
		}
		
		params["quantity" + i] = quantity;
		
		var rate = allRowsInGrid[i].rate;
		params["rate" + i] = rate;
		
		var unit = allRowsInGrid[i].unit;
		params["unit" + i] = unit;
		
		var Total = allRowsInGrid[i].Total;
		
		if(Total=="" || Total==null|| Total ==undefined || Total =="NaN")
		{
			Total=0.0;
		}
		params["Total" + i] = Total;


	}

	var supplier = $('#supplier').val();
	var challanno = $('#challanno').val();
	var pono = $('#pono').val();
	var Challandate = $('#Challandate').val();
	var productName = $('#productName').val();
	/*var ShopName = $('#ShopName').val();*/
	
	var operationName = $('#operationName').val();
	var input1 = document.getElementById('operationName'), list = document
			.getElementById('operationName_drop'), i, fkOperationDetailsId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkOperationDetailsId = list.options[i].getAttribute('data-value');
		}
	}
	
	var total = $('#total').val();
	var grossTotal = $('#grossTotal').val();

	params["supplier"] = supplier;
	params["challanno"] = challanno;
	params["pono"] = pono;
	params["Challandate"] = Challandate;
	params["fkOperationDetailsId"] = fkOperationDetailsId;
	params["operationName"] = operationName;
	params["productName"] = productName;
	/*params["ShopName"] = ShopName;*/
	
	if(total=="" || total==null|| total ==undefined || total =="NaN")
	{
		total=0.0;
	}
	
	params["total"] = total;
	params["grossTotal"] = grossTotal;
	params["count"] = count;

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
/// Without Po entry Details by Kishor 

function addValGoodsRecieveWithoutPO() {

/*	if (document.goodsReceiveFormWithoutPO.productName1.value == "") {
		alert("Please Select product Name");
		return false;
	}*/
	
	if (document.goodsReceiveFormWithoutPO.supplier1.value == "") {
		alert("Please Select supplier Name");
		return false;
	}
	
	/*if (document.goodsReceiveForm.pono.value == "") {
		alert("Please Select po no");
		return false;
	}*/
	
	if (document.goodsReceiveFormWithoutPO.challanno1.value == "") {
		alert("Please Enter challan No ");
		return false;
	}
	
	if (document.goodsReceiveFormWithoutPO.Challandate1.value == "") {
		alert("Please Select Challan date ");
		return false;
	}	
	if(document.goodsReceiveFormWithoutPO.operationName1.value == "") {
		alert("Please Select operation name ");
		document.getElementById("operationName1").focus();
		return false;
	}
	addGoodsRecieveWithPo();
				
}
function addGoodsRecieveWithPo() {

	document.getElementById("saveGoodsRecieveWithoutPOBtn").disabled = true;
	var params = {};
	

	var count = jQuery("#jqGrid1").jqGrid('getGridParam', 'records');
	if(count <1)
	{
		alert("Please Select Product Name ");
		document.getElementById("btn").disabled = false;
		return false;
	}
	var allRowsInGrid = $('#jqGrid1').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		var productname = allRowsInGrid[i].productname;
		params["productname" + i] = productname;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;
		
		var operation = allRowsInGrid[i].operation;
		if(operation =="" || operation==undefined || operation==null)
			{
			alert("Please Enter Operation In Grid");
			document.getElementById("btn").disabled = false;
			return false;
			}
		
		params["operation" + i] = operation;
		
		/*var PODate = allRowsInGrid[i].PODate;
		params["PODate" + i] = PODate;*/
		
		var quantity = allRowsInGrid[i].quantity;
		if(quantity =="0" || quantity =="" || quantity ==undefined)
		{
			alert("Please Enter Quantity In Grid");
			
			document.getElementById("btn").disabled = false;
			return false;
			
		}
		
		params["quantity" + i] = quantity;
		
		var rate = allRowsInGrid[i].rate;
		params["rate" + i] = rate;
		
		var unit = allRowsInGrid[i].unit;
		if(unit =="" || unit==undefined || unit==null){
			alert("Please Enter Unit In Grid");
			
			document.getElementById("btn").disabled = false;
			return false;
		}
		
		params["unit" + i] = unit;
		
		var Total = allRowsInGrid[i].Total;
		
		if(Total=="" || Total==null|| Total ==undefined || Total =="NaN")
		{
			Total=0.0;
		}
		params["Total" + i] = Total;


	}

	var supplier = $('#supplier1').val();
	var challanno = $('#challanno1').val();
	var pono = $('#pono').val();
	var Challandate = $('#Challandate1').val();
	var productName = $('#productName1').val();
	/*var ShopName = $('#ShopName').val();*/
	
	var operationName = $('#operationName1').val();
	var input1 = document.getElementById('operationName1'), list = document
			.getElementById('operationName_drop1'), i, fkOperationDetailsId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fkOperationDetailsId = list.options[i].getAttribute('data-value');
		}
	}
	
	var total = $('#total1').val();
	var grossTotal = $('#grossTotal1').val();

	params["supplier1"] = supplier;
	params["challanno1"] = challanno;
	params["pono"] = pono;
	params["Challandate1"] = Challandate;
	params["productName1"] = productName;
	params["fkOperationDetailsId"] = fkOperationDetailsId;
	params["operationName"] = operationName;
	/*params["ShopName"] = ShopName;*/
	
	if(total=="" || total==null|| total ==undefined || total =="NaN")
	{
		total=0.0;
	}
	
	params["total1"] = total;
	params["grossTotal1"] = grossTotal;
	params["count"] = count;

	params["methodName"] = "addingGoodsReceiveWithOutPO";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.getElementById("saveGoodsRecieveWithoutPOBtn").disabled = false;
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

		var buyPrice = allRowsInGrid[i].buyPrice;
		params["buyPrice" + i] = buyPrice;

		var salePrice = allRowsInGrid[i].salePrice;
		params["salePrice" + i] = salePrice;

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
function getSupName(){
	var params= {};
	
	var input = document.getElementById('supplier'), list1 = document
	.getElementById('sup_drop'), i, fk_sup_id;

		for (i = 0; i < list1.options.length; ++i) {
			if (list1.options[i].value === input.value) {
				fk_sup_id = list1.options[i].getAttribute('data-value');
				}
		}
	
	$("#supplierName").append($("<input/>").attr("value","").text());
	params["fk_sup_id"]= fk_sup_id;
	params["methodName"] = "getSupName";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("supplierName").value = v.dealerName;
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
