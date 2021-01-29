

/*JavaScript code file for Good Receive */

//function refreshGR() {                         
//        //Refresh page implementation here
//        //window.opener.location.reload("/processSoft/jsp/goodsReceive.jsp");
//		window.location.href="goodsReceive.jsp";
//        window.close();
//    }

productDetailInGrid()/*function btnhide()
{
	$("#save").hide();
}*/
function btnShow() {
	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			/*
			 * if(document.spld.personName.value != "") { var letterNumber =
			 * /^[a-zA-Z, ]+$/;
			 * if(document.spld.personName.value.match(letterNumber)) {
			 */
			if (document.spld.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo.value.match(contactno)) {
					/*
					 * var mobileno=$('#contactNo').val(); if(mobileno.length<=10) {
					 * alert("Please Enter 10 Digit mobile Number") }
					 */
					if (document.spld.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city.value.match(City)) {
							if (document.spld.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo.value.match(GstNo)) {
									$("#save").show();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Numbers Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			} else {

				alert("Please Enter Contact Number");
				return false;
			}

		} else {
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}
		/* } */
		/*
		 * else { alert("Enter person Name"); return false; }
		 */
		/* } */
		/*
		 * else { alert("Enter Alphabets Only in Dealer name field..!!"); return
		 * false; }
		 */
	} else {
		alert("Enter supplier  Name.");
		return false;
	}

}
function phoneno() {
	$('#contactNo').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}
function lanlineNo() {
	$('#landline').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}

function characters() {

	$('#city').keypress(function(e) {
		var a = [];
		var k = e.which;
		for (i = 65; i < 123; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})

}

function supplierDetail() {

	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			if (document.spld.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo.value.match(contactno)) {

					if (document.spld.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city.value.match(City)) {
							if (document.spld.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo.value.match(GstNo)) {
									supDetails();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Numbers Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			} else {
				alert("Please Enter Contact Number");
				return false;
			}

		} else {
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}

	} else {
		alert("Enter supplier  Name.");
		return false;
	}

}

function supDetails() {

	document.spld.btn.disabled = true;

	var dealerName = $('#dealerName').val();
	// var personName = $('#personName').val();
	var purchaseDate = $('#purchaseDate').val();
	var contactNo = $('#contactNo').val()
	// var landline = $('#landline').val();
	// var emailId = $('#emailId').val();
	// var saleDate = $('#saleDate2').val();
	var tinNo = $('#tinNo').val();
	var city = $('#city').val();
	var address = $('#address').val();
	var IdNo = $('#IdNo').val();

	var params = {};

	params["dealerName"] = dealerName;
	// params["personName"] =personName;
	params["purchaseDate"] = purchaseDate;
	params["contactNo"] = contactNo;
	// params["landline"] =landline;
	// params["emailId"] = emailId;
	// params["saleDate2"] = saleDate2;
	params["tinNo"] = tinNo;
	params["city"] = city;
	params["address"] = address;
	params["IdNo"] = IdNo;

	params["methodName"] = "poDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.spld) {
			document.spld.reset();
		}
		document.spld.btn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}
function reset() {
	document.spld.reset();
}
function reset() {
	document.spld1.reset();
}

/** ******* Edit Supplier Details *********** */
function getSupplierDetails() {
	var params = {};

	var input = document.getElementById('supplier'), list = document
			.getElementById('sup_drop'), i, fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}

	$("#dealerName").append($("<input/>").attr("value", "").text());
	$("#personName").append($("<input/>").attr("value", "").text());
	$("#contactNo").append($("<input/>").attr("value", "").text());
	$("#landline").append($("<input/>").attr("value", "").text());
	$("#emailId").append($("<input/>").attr("value", "").text());
	$("#city").append($("<input/>").attr("value", "").text());
	// $("#tinNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value", "").text());
	$("#IdNo").append($("<input/>").attr("value", "").text());

	params["SupplierId"] = fkRootSupId;
	params["methodName"] = "getSupplierDetailsToEdit";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			document.getElementById("dealerName").value = v.dealerName;
			document.getElementById("personName").value = v.personName;
			document.getElementById("contactNo").value = v.contactNo;
			// document.getElementById("landline").value = v.landline;
			document.getElementById("emailId").value = v.email;
			document.getElementById("city").value = v.city;
			// document.getElementById("tinNo").value = v.tin;
			document.getElementById("address").value = v.address;
			document.getElementById("IdNo").value = v.IdNo;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}

function updateSupplierDetails() {

	document.spld1.btn.disabled = true;

	var input = document.getElementById('supplier'), list = document
			.getElementById('sup_drop'), i, fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}

	// var customerId = document.getElementById("customerId").value;

	var dealerName = $('#dealerName').val();
	var personName = $('#personName').val();
	var contactNo = $('#contactNo').val();
	var salePrice = $('#salePrice').val();
	var landline = $('#landline').val();
	var emailId = $('#emailId').val();
	var city = $('#city').val();
	// var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	var IdNo = $('#IdNo').val();

	var params = {};

	params["supplierId"] = fkRootSupId;

	params["dealerName"] = dealerName;
	params["personName"] = personName;
	params["contactNo"] = contactNo;
	params["salePrice"] = salePrice;
	params["landline"] = landline;
	params["emailId"] = emailId;
	params["city"] = city;
	// params["tinNo"] = tinNo;
	params["address"] = address;
	params["IdNo"] = IdNo;

	params["methodName"] = "updateSupplierDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.spld1) {
			document.spld1.reset();
		}
		document.spld1.btn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {

		/*
		 * alert("Data Added Successfully.."); location.reload();
		 * document.ccd.btn.disabled =false;
		 */

		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

/*function productDetailInGrid() {

	// this.sumFmatter000 = sumFmatter000 ;

	var itemName = document.getElementById('productName').value;
	// var operationName = document.getElementById('operationName').value;
	
	itemparams = {};

	// itemparams["operationName"] = operationName;
	itemparams["itemName"] = itemName;

	itemparams["methodName"] = "getProductInGridOnSupplierPurchase1";

	var count = 0;
	var newrow;
	var rowId;

	$.post('/processSoft/jsp/utility/controller.jsp', itemparams, function(data) {
		var jsonData = $.parseJSON(data);
		$.each(jsonData, function(i, v) {
			count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
			var rowdata = $("#jqGrid").jqGrid('getGridParam', 'data');
			var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

			var prodName;
			for (var j = 0; j < count; j++) {
				prodName = rowdata[j].productName;

				var rowId = ids[j];
				var rowData = jQuery('#jqGrid').jqGrid('getRowData', rowId);

				if (prodName == jsonData.offer.productName) {

					newrow = false;
					alert("Product Name Already Inserted !!!");
					var grid = jQuery("#jqGrid");
					grid.trigger("reloadGrid");
					break;
				} else {
					newrow = true;
				}
			}

			if (newrow == true) {
				$("#jqGrid").addRowData(count, jsonData.offer);
			}

			$("#jqGrid").jqGrid(
					{
						datatype : "local",

						colNames : [ "Product Name","HSN", "Operation", "Qty(Kg)","Rate", "Unit", "Total" ],
						colModel : [ 
						{
							name : "productName",// PARTICULARS name will be
													// same as helper bean
							width : 150,
						}, 
						{
							name : "hsn",
							width : 150,
							editable : true
						},
						{
							name : "Operation",
							width : 150,
							editable : true
						},

						{
							name : "quantity",
							width : 150,
							editable : true
						},

						{
							name : "buyPrice",
							width : 150,
							editable : true
						},

						{
							name : "unit",
							width : 150,
							editable : true
						},

						{
							name : 'Total',
							// formatter: sumFmatter,
							width : 170,
						}

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
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count1 = jQuery("#jqGrid").jqGrid(
									'getGridParam', 'records');
							var quantity = rowData['quantity'];
							var Operation =rowData['Operation'];
							var buyPrice = rowData['buyPrice'];
							var unit = rowData['unit']; 
						    var Total =rowData['Total'];
 
							var vatAmt = 0;
							var discount = 0;
							var tota = 0;
							var totAmt = 0;
							var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

							var gst1 = 0;
							var iGst1 = 0;

							
							

							// for calculation of gst and total after change in
							// quantity and buy price in resp to itemname
							// to display gst total and igst total

							
							 * var TotalGst =
							 * document.getElementById("totalGst").value; var
							 * TotalIgst =
							 * document.getElementById("totalIgst").value;
							 

							var TotalGst = 0;
							var TotalIgst = 0;
							var sGstAmt = 0;
							var cGstAmt = 0;

							
							if(Operation !=""){
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
							}
							
							if(quantity !=""){
							//	var quan =/^[0-9 ]+$/;
				              var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
								if(quantity.match(quan))
									{	
									
									}
								else
									{
									var quant ="0";
									alert("Please Enter Quantity In Numbers");
									$("#jqGrid").jqGrid("setCell",rowId, "quantity", quant);
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
									//	location.reload();
									return false;
									
									
								}
							}
							// for(var r = 0;r < count1;r++){
							// var rowId = ids[r];
							var rowData = jQuery("#jqGrid").getRowData(rowId);

							// var buyPrice = rowData['buyPrice'];
							tota = quantity * buyPrice;
							totAmt = quantity * buyPrice;

							$("#jqGrid").jqGrid("setCell", rowId, "Total",
									totAmt);

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
									Total = +Total + +Total1;
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

							document.getElementById("total1").value = (Total).toFixed(2);
							document.getElementById("grossTotal1").value =(Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						pager : "#jqGridPager",

					});

			// $("#list4").addRowData(i+1,jsonData[i]);
			if (count == 0 || count == null) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#jqGrid").addRowData(0, jsonData.offer);
			}

			$('#jqGrid').navGrid(
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
										grid.trigger("reloadGrid", [ {
											current : true
										} ]);
									}, 500);

						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterdel : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						afterComplete : function() {
							$('#jqGrid').trigger('reloadGrid');

							// $(this).trigger('reloadGrid');
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count = jQuery("#jqGrid").jqGrid(
									'getGridParam', 'records');
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
							var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

							var gst1 = 0;
							var iGst1 = 0;

							// for calculation of gst and total after change in
							// quantity and buy price in resp to itemname
							// to display gst total and igst total

							
							 * var TotalGst =
							 * document.getElementById("totalGst").value; var
							 * TotalIgst =
							 * document.getElementById("totalIgst").value;
							 

							var TotalGst = 0;
							var TotalIgst = 0;
							var sGstAmt = 0;
							var cGstAmt = 0;

							for (var r = 0; r < count; r++) {
								var rowId = ids[r];
								var rowData = jQuery("#jqGrid").getRowData(
										rowId);

								var buyPrice = rowData['buyPrice'];
								tota = quantity * buyPrice;
								totAmt = quantity * buyPrice;

								
								 * if(sGst != "0" && cGst != "0"){ sGstAmt =
								 * ((tota*(sGst))/100); cGstAmt =
								 * ((tota*(cGst))/100);
								 * 
								 * vatAmt = +sGstAmt + +cGstAmt; } else{
								 * 
								 * vatAmt = ((tota*iGst)/100); totAmt = +tota +
								 * +vatAmt; TotalIgst = +TotalIgst + +vatAmt; }
								 * $("#jqGrid").jqGrid("setCell", rowId,
								 * "taxAmt", vatAmt);
								 * $("#jqGrid").jqGrid("setCell", rowId,
								 * "Total", totAmt);
								 * 
								 
							}
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

							for (var k = 0; k < count; k++) {
								var Total1 = allRowsInGrid1[k].Total;
								if (Total1 != undefined) {
									Total = +Total + +Total1;
								}
							}
							var allRowsInGrid1 = $('#jqGrid').getGridParam(
									'data');
							var AllRows = JSON.stringify(allRowsInGrid1);

							for (var n = 0; n < count; n++) {
								var grossTotal1 = allRowsInGrid1[n].Total;
								var taxAmt1 = allRowsInGrid1[n].taxAmt;
								if (taxAmt1 != undefined) {
									TotalGross = +TotalGross + +grossTotal1
											+ +taxAmt1;
								}
							}

							document.getElementById("total1").value = (Total).toFixed(2);
							document.getElementById("grossTotal1").value = (Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						onSelectRow : function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid").saveRow(lastSel, true,
										'clientArray');
								jQuery("#jqGrid").editRow(id, true);
								lastSel = id;
								console.log(id);
							}
						}

					});
		});
	})

}
*/
// vlaidation for the po details form

function productDetailInGrid() {

	// this.sumFmatter000 = sumFmatter000 ;

	var itemName = document.getElementById('productName').value;
	// var operationName = document.getElementById('operationName').value;
	
	itemparams = {};

	// itemparams["operationName"] = operationName;
	itemparams["itemName"] = itemName;

	itemparams["methodName"] = "getProductInGridOnSupplierPurchase1";

	var count = 0;
	var newrow;
	var rowId;

	$.post('/processSoft/jsp/utility/controller.jsp', itemparams, function(data) {
		var jsonData = $.parseJSON(data);
		$.each(jsonData, function(i, v) {
			count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
			var rowdata = $("#jqGrid").jqGrid('getGridParam', 'data');
			var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

			var prodName;
			for (var j = 0; j < count; j++) {
				prodName = rowdata[j].productName;

				var rowId = ids[j];
				var rowData = jQuery('#jqGrid').jqGrid('getRowData', rowId);

				if (prodName == jsonData.offer.productName) {

					newrow = false;
					alert("Product Name Already Inserted !!!");
					var grid = jQuery("#jqGrid");
					grid.trigger("reloadGrid");
					break;
				} else {
					newrow = true;
				}
			}

			if (newrow == true) {
				$("#jqGrid").addRowData(count, jsonData.offer);
			}
			
			 document.getElementById('productName').value = "";

			$("#jqGrid").jqGrid(
					{
						datatype : "local",

						colNames : [ "Product Name","HSN", "Operation", "Qty(Kg)","Rate", "Unit", "Total" ],
						colModel : [ 
						{
							name : "productName",// PARTICULARS name will be
													// same as helper bean
							width : 150,
						}, 
						{
							name : "hsn",
							width : 150,
							editable : true
						},
						{
							name : "Operation",
							width : 150,
							editable : true
						},

						{
							name : "quantity",
							width : 150,
							editable : true
						},

						{
							name : "buyPrice",
							width : 150,
							editable : true
						},

						{
							name : "unit",
							width : 150,
							editable : true
						},

						{
							name : 'Total',
							// formatter: sumFmatter,
							width : 170,
						}

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
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count1 = jQuery("#jqGrid").jqGrid(
									'getGridParam', 'records');
							var quantity = rowData['quantity'];
							var Operation =rowData['Operation'];
							var buyPrice = rowData['buyPrice'];
							var unit = rowData['unit']; 
						    var Total =rowData['Total'];
 
							var vatAmt = 0;
							var discount = 0;
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
							
							if(quantity !=""){
							//	var quan =/^[0-9 ]+$/;
				              var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
								if(quantity.match(quan))
									{	
									
									}
								else
									{
									var quant ="0";
									alert("Please Enter Quantity In Numbers");
									$("#jqGrid").jqGrid("setCell",rowId, "quantity", quant);
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
									//	location.reload();
									return false;
									
									
								}
							}
							// for(var r = 0;r < count1;r++){
							// var rowId = ids[r];
							var rowData = jQuery("#jqGrid").getRowData(rowId);

							// var buyPrice = rowData['buyPrice'];
							tota = quantity * buyPrice;
							totAmt = (quantity * buyPrice).toFixed(2);

							$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);

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
									Total = +Total + +Total1;
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

							document.getElementById("total").value = (Total).toFixed(2);
							document.getElementById("grossTotal").value =(Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						pager : "#jqGridPager",

					});

			// $("#list4").addRowData(i+1,jsonData[i]);
			if (count == 0 || count == null) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#jqGrid").addRowData(0, jsonData.offer);
			}

			$('#jqGrid').navGrid(
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

					/*	afterSubmit : function() {

							var grid = $("#jqGrid"), intervalId = setInterval(
									function() {
										grid.trigger("reloadGrid", [ {
											current : true
										} ]);
									}, 500);

						},*/

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterdel : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						afterComplete : function() {
							$('#jqGrid').trigger('reloadGrid');

							// $(this).trigger('reloadGrid');
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count = jQuery("#jqGrid").jqGrid(
									'getGridParam', 'records');
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

							for (var r = 0; r < count; r++) {
								var rowId = ids[r];
								var rowData = jQuery("#jqGrid").getRowData(
										rowId);

								var buyPrice = rowData['buyPrice'];
								tota = quantity * buyPrice;
								totAmt = quantity * buyPrice;

								/*
								 * if(sGst != "0" && cGst != "0"){ sGstAmt =
								 * ((tota*(sGst))/100); cGstAmt =
								 * ((tota*(cGst))/100);
								 * 
								 * vatAmt = +sGstAmt + +cGstAmt; } else{
								 * 
								 * vatAmt = ((tota*iGst)/100); totAmt = +tota +
								 * +vatAmt; TotalIgst = +TotalIgst + +vatAmt; }
								 * $("#jqGrid").jqGrid("setCell", rowId,
								 * "taxAmt", vatAmt);
								 * $("#jqGrid").jqGrid("setCell", rowId,
								 * "Total", totAmt);
								 * 
								 */
							}
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

							for (var k = 0; k < count; k++) {
								var Total1 = allRowsInGrid1[k].Total;
								if (Total1 != undefined) {
									Total = +Total + +Total1;
								}
							}
							var allRowsInGrid1 = $('#jqGrid').getGridParam(
									'data');
							var AllRows = JSON.stringify(allRowsInGrid1);

							for (var n = 0; n < count; n++) {
								var grossTotal1 = allRowsInGrid1[n].Total;
								var taxAmt1 = allRowsInGrid1[n].taxAmt;
								if (taxAmt1 != undefined) {
									TotalGross = +TotalGross + +grossTotal1
											+ +taxAmt1;
								}
							}

							document.getElementById("total").value = (Total).toFixed(2);
							document.getElementById("grossTotal").value = (Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						onSelectRow : function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid").saveRow(lastSel, true,
										'clientArray');
								jQuery("#jqGrid").editRow(id, true);
								lastSel = id;
								console.log(id);
							}
						}

					});
		});
	})

}

function valforPoDetails()
{
	
	if (document.spld1.suppliername.value!="") {
		if(document.spld1.IdNo .value!=""){
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld1.suppliername.value.match(letterNumber)){
			if (document.spld1.contactNo.value!=""){
				var contactno = /^\d{10}$/;
				if (document.spld1.contactNo.value.match(contactno)){
					if (document.spld1.purchaseDate.value!=""){
						if (document.spld1.city.value!=""){
							var letterNumber = /^[a-zA-Z, ]+$/;
							if (document.spld1.city.value.match(letterNumber)){
								if (document.spld1.tinNo.value!=""){
									var GstNo = /^[a-zA-Z,0-9]+$/;
									if (document.spld1.tinNo.value.match(GstNo)){
										/*if (document.spld.productName.value!=""){*/
											
												addPoDetails();
											 
										/*}*/ /*else {
											alert("Enter Product Name");
											return false;
										}*/
									} else {
										alert("Only Alphanumerics Are allowed in GST ");
										return false;
									}
								} else {
									alert("please Enter GST NO");
									return false;
								}
							} else {
								alert("please Enter the Alphabate only");
								return false;
							}
						} else {
							alert("please Enter city");
							return false;
						}
					} else {
						alert("please Enter Date");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number");
					return false;
				}
			} else {
				alert("Please Enter the Contact no");
				return false;
			}
		} else {
			alert("The Supplier name Should be in Alphabate");
			return false;
		}
	} else {
		alert("Please Enter ID NO");
		return false;;
	}
	} else {
		alert("Please Enter Vendor name");
		return false;
	}
	

}

function addPoDetails() {

	document.getElementById("save").disabled = true;
	var params = {};

	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	if(count < 1)
	{
		alert("Please select Product Name ");
		document.getElementById("save").disabled = false;
		return false;
		
		}
	var allRowsInGrid = $('#jqGrid').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++)
	{

		var productName = allRowsInGrid[i].productName;
		
		params["productName" + i] = productName;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var Operation = allRowsInGrid[i].Operation;
		if(Operation =="" || Operation ==undefined || Operation==null)
		{

			alert("Please Enter Operation In Grid");
			document.getElementById('save').disabled = false; 
			return false;
			
		}
		
		params["Operation" + i] = Operation;

		var quantity = allRowsInGrid[i].quantity;
		if(quantity=="" || quantity==null || quantity==undefined)
			{
			alert("Please  Enter Quantity In Grid");
			document.getElementById('save').disabled = false;
			return false;
			}
		params["quantity" + i] = quantity;

		var Rate = allRowsInGrid[i].buyPrice;
		params["Rate" + i] = Rate;
		
		
		

		var unit = allRowsInGrid[i].unit;
		if(unit == "" ||unit ==undefined || unit ==null)
		{
		alert("Please  Enter Unit In Grid");
		document.getElementById('save').disabled = false;
		return false;
		
		}

		params["unit" + i] = unit;

		var Total = allRowsInGrid[i].Total;
		params["Total" + i] = Total;
	


	}

	var IdNo = $('#IdNo').val();
	var suppliername = $('#suppliername').val();
	var purchaseDate = $('#purchaseDate').val();
	var contactNo = $('#contactNo').val();
	var city = $('#city').val();
	var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	//var Total = $('#Total").val();
	/*var ShopName = $('#ShopName').val();*/
	var productName = $('#productName').val();
	var total = $('#total').val();
	var grossTotal = $('#grossTotal').val();

	params["IdNo"] = IdNo;
	params["suppliername"] = suppliername;
	params["purchaseDate"] = purchaseDate;
	params["contactNo"] = contactNo;
	params["city"] = city;
	params["tinNo"] = tinNo;
	params["address"] = address;
	/*params["ShopName"] = ShopName;*/
	//params["Total"] = Total;
	params["productName"] = productName;
	params["total"] = total;
	params["grossTotal"] = grossTotal;
	params["count"] = count;

	params["methodName"] = "addingPoDetails";

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

// this function is for good receive js get data in grid on product selection

function productDetailInGridForGoodReceive() {

	// this.sumFmatter000 = sumFmatter000 ;

	var itemName = document.getElementById('productName').value;

	itemparams = {};

	itemparams["itemName"] = itemName;

	itemparams["methodName"] = "getProductInGridForGoodReceive";

	var count = 0;
	var newrow;
	var rowId;

	$.post('/processSoft/jsp/utility/controller.jsp', itemparams, function(data) {
		var jsonData = $.parseJSON(data);
		$.each(jsonData, function(i, v) {
			count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
			var rowdata = $("#jqGrid").jqGrid('getGridParam', 'data');
			var ids = jQuery("#jqGrid").jqGrid('getDataIDs');

			var prodName;
			for (var j = 0; j < count; j++) {
				prodName = rowdata[j].productName;

				var rowId = ids[j];
				var rowData = jQuery('#jqGrid').jqGrid('getRowData', rowId);

				if (prodName == itemName) {

					newrow = false;
					alert("Product Name Already Inserted !!!");
					var grid = jQuery("#jqGrid");
					grid.trigger("reloadGrid");
					break;
				} else {
					newrow = true;
				}
			}

			if (newrow == true) {
				$("#jqGrid").addRowData(count, jsonData.offer);
			}

			 document.getElementById('productName').value = "";

			
			$("#jqGrid").jqGrid(
					{
						datatype : "local",

						colNames : [ "Product Name","HSN", "Operation", "Qty(Kg)","Rate","Discount %","GST %","IGST %","TaxAmount", "Unit", "Total" ],
						colModel : [ {
							name : "productName",// PARTICULARS name will be
													// same as helper bean
							width : 150,
						}, 
						{
							name : "hsn",
							width : 150,
							editable : true
						},{
							name : "Operation",
							width : 150,
							editable : true
						},

						{
							name : "quantity",
							width : 150,
							editable : true
						},

						{
							name : "buyPrice",
							width : 150,
							editable : true
						},

						{
							name : "discount",
							width : 150,
							editable : true
						},

						{
							name : "gst",
							width : 150,
							editable : true
						},
						{
							name : "igst",
							width : 150,
							editable : true
						},
						{
							name : "TaxAmount",
							width : 150,
							editable : true
						},

						{
							name : "unit",
							width : 150,
							editable : true
						},
						


						{
							name : 'Total',
							// formatter: sumFmatter,
							width : 170,
						}

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
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count1 = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
							var quantity = rowData['quantity'];
							var buyPrice = rowData['buyPrice'];
							var TaxAmount = rowData['TaxAmount'];
							var Operation =rowData['Operation'];
							var unit =rowData['unit'];
							// new calculation value for Discount and GST
							var gst = rowData['gst'];
							var igst = rowData['igst'];
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
							
							if(quantity !=""){
								//	var quan =/^[0-9 ]+$/;
					              var quan =/^\d{0,10}(?:\.\d{0,2})?$/;
									if(quantity.match(quan))
										{	
										
										}
									else
										{
										var quant ="0";
										alert("Please Enter Quantity In Numbers");
										$("#jqGrid").jqGrid("setCell",rowId, "quantity", quant);
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
							
							tota = quantity * buyPrice;
							disAmt = (tota/100)*discount;// this is discount
															// AMOUNT
							idisAmt = tota - disAmt; // total amount minus
													// discount amount
							
							
							
							
							
							
							
							
							if(gst!="0")
								{
								
								gstAmt = (idisAmt*gst)/100;
								totAmt = (idisAmt + gstAmt).toFixed(2);
								//$("#jqGrid").jqGrid("setCell", rowId, "gst",gst);
								$("#jqGrid").jqGrid("setCell", rowId, "TaxAmount",gstAmt.toFixed(2));
								//$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);
								}
							else {
								
								igstAmt = (idisAmt*igst)/100;
								totAmt = (idisAmt + igstAmt).toFixed(2);
								$("#jqGrid").jqGrid("setCell", rowId, "TaxAmount",igstAmt.toFixed(2));
								//$("#jqGrid").jqGrid("setCell", rowId, "gst",igst);
								//$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);
							}
							/*
							gstAmt = (idisAmt*gst)/100;
							totAmt = idisAmt + gstAmt;*/

							$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);
							

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

							document.getElementById("total").value =(Total).toFixed(2); 
							
							/*document.getElementById("total").value =Math.round(Total);*/
							document.getElementById("grossTotal").value =(Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						pager : "#jqGridPager",

					});

			// $("#list4").addRowData(i+1,jsonData[i]);
			if (count == 0 || count == null) {
				// $("#list4").addRowData(i,jsonData[i]);
				$("#jqGrid").addRowData(0, jsonData.offer);
			}

			$('#jqGrid').navGrid(
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
										grid.trigger("reloadGrid", [ {
											current : true
										} ]);
									}, 500);

						},

						recreateForm : true,
						checkOnUpdate : true,
						checkOnSubmit : true,
						closeAfterEdit : true,

						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterAdd : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						}
					},

					{
						closeAfterdel : true,
						recreateForm : true,
						errorTextFormat : function(data) {
							return 'Error: ' + data.responseText
						},
						afterComplete : function() {
							// $(this).trigger('reloadGrid');
							var rowId = $("#jqGrid").jqGrid('getGridParam',
									'selrow');
							var rowData = jQuery("#jqGrid").getRowData(rowId);
							var count1 = jQuery("#jqGrid").jqGrid(
									'getGridParam', 'records');
							var quantity = rowData['quantity'];
							var buyPrice = rowData['buyPrice'];
							// new calculation value for Discount and GST
							var gst = rowData['gst'];
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

							// var buyPrice = rowData['buyPrice'];
							tota = quantity * buyPrice;
							disAmt = (tota/100)*discount;// this is discount
															// AMOUNT
							idisAmt = tota - disAmt; // total amount minus
														// discount amount
							gstAmt = (idisAmt*gst)/100;
							totAmt = idisAmt + gstAmt;

							$("#jqGrid").jqGrid("setCell", rowId, "Total",totAmt);

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
									Total = +Total + +Total1;
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

							document.getElementById("total").value = (Total).toFixed(2);
							document.getElementById("grossTotal").value = (Total).toFixed(2);
							// document.getElementById("resolution1").value =
							// Math.round(Total);
							// document.getElementById("totalQuantity").value =
							// TotalQuantity;

						},

						onSelectRow : function(id) {
							if (id && id !== lastSel) {
								jQuery("#jqGrid").saveRow(lastSel, true,
										'clientArray');
								jQuery("#jqGrid").editRow(id, true);
								lastSel = id;
								console.log(id);
							}
						}

					});
		});
	})
}

// validation for the good receive form
function valforGrDetails()
{
	if (document.spld1.suppliername.value!="") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld1.suppliername.value.match(letterNumber)){
			if (document.spld1.contactNo.value!=""){
				var contactno = /^\d{10}$/;
				if (document.spld1.contactNo.value.match(contactno)){
					if (document.spld1.purchaseDate.value!=""){
						if (document.spld1.city.value!=""){
							var letterNumber = /^[a-zA-Z, ]+$/;
							if (document.spld1.city.value.match(letterNumber)){
								if (document.spld1.tinNo.value!=""){
									var GstNo = /^[a-zA-Z,0-9]+$/;
									if (document.spld1.tinNo.value.match(GstNo)){
										/*if (document.spld.productName.value!=""){*/
											
												if (document.spld1.BillNo.value!=""){
													addGRDetails();
												} else {
													alert("Enter Bill No");
													return false;
											}
											
										/*}*//* else {
											alert("Enter Product Name");
											return false;
										}*/
									} else {
										alert("Alphanumerics Are allowed in GST ");
										return false;
									}
								} else {
									alert("please Enter GST NO");
									return false;
								}
							} else {
								alert("please Enter the Alphabate only");
								return false;
							}
						} else {
							alert("please Enter city");
							return false;
						}
					} else {
						alert("please Enter Date");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number");
					return false;
				}
			} else {
				alert("Please Enter the Contact Number");
				return false;
			}
		} else {
			alert("The Supplier name Should be in Alphabate");
			return false;
		}
	} else {
		alert("Please Enter Vendor name");
		return false;
	}
}

// this method is use for Adding details to GR_Details table for good receive by
// harshad

function addGRDetails() {

	document.getElementById("save").disabled = true;
	var params = {};

	var count = jQuery("#jqGrid").jqGrid('getGridParam', 'records');
	if(count < 1)
		{
		alert("Please Select Product Name ");
		document.getElementById("save").disabled = false;
		return false;
		}
	
	var allRowsInGrid = $('#jqGrid').getGridParam('data');// to get all rows
															// of grid
	var AllRows = JSON.stringify(allRowsInGrid);
	for (var i = 0; i < count; i++) {

		
		var productName = allRowsInGrid[i].productName;
		params["productName" + i] = productName;
		
		var hsn = allRowsInGrid[i].hsn;
		params["hsn" + i] = hsn;

		var Operation = allRowsInGrid[i].Operation;
		if(Operation =="" || Operation == undefined || Operation == null){
			alert("Please Enter Operation in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}
		params["Operation" + i] = Operation;

		var quantity = allRowsInGrid[i].quantity;
		if(quantity == ""){
			alert("Please Enter Quantity in Grid  ");
			document.getElementById('save').disabled = false;
			return false;
		}	
		
		params["quantity" + i] = quantity;

		var Rate = allRowsInGrid[i].buyPrice;
		params["Rate" + i] = Rate;
		
		var discount = allRowsInGrid[i].discount;
		/*if(discount == "" )
		{
		alert(" Enter discount if there is no any Discount then Enter 0 ");
		document.getElementById('save').disabled = false;
		return false;
		}*/
		params["discount"+i] = discount;
		
		var gst = allRowsInGrid[i].gst;
		/*if(gst == ""){
			alert("Please Enter GST If There Is No Any GST Then Enter 0   ");
			document.getElementById('save').disabled = false;
			return false;
			
		}*/
		params["gst"+i] = gst;
		
		var igst = allRowsInGrid[i].igst;
		/*if(igst == ""){
			alert("Please Enter IGST If There Is No Any IGST Then Enter 0   ");
			document.getElementById('save').disabled = false;
			return false;
			
		}*/
		params["igst"+i] = igst;
		
		var TaxAmount = allRowsInGrid[i].TaxAmount;
		params["TaxAmount" + i] = TaxAmount;

		var unit = allRowsInGrid[i].unit;
		if(unit == "" || unit == undefined || unit == null)
		{
		alert("Please Enter Unit In Grid ");
		document.getElementById('save').disabled = false;
		return false;
		}
		params["unit" + i] = unit;

		var Total = allRowsInGrid[i].Total;
		params["Total" + i] = Total;

	}

	var IdNo = $('#IdNo').val();
	var BillNo = $('#BillNo').val();
	var suppliername = $('#suppliername').val();
	var purchaseDate = $('#purchaseDate').val();
	var contactNo = $('#contactNo').val();
	var city = $('#city').val();
	var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	/*var ShopName = $('#ShopName').val();*/
	var productName = $('#productName').val();
	var total = $('#total').val();
	var grossTotal = $('#grossTotal').val();

	params["IdNo"] = IdNo;
	params["BillNo"] = BillNo;
	params["suppliername"] = suppliername;
	params["purchaseDate"] = purchaseDate;
	params["contactNo"] = contactNo;
	params["city"] = city;
	params["tinNo"] = tinNo;
	params["address"] = address;
	/*params["ShopName"] = ShopName;*/
	params["productName"] = productName;
	params["total"] = total;
	params["grossTotal"] = grossTotal;
	params["count"] = count;

	params["methodName"] = "addingGRDetails";

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
