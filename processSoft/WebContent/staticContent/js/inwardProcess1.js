/**
 inwardProcess1.js
 */



function getChallanNo() {
	
	var purchaseOrderNo = $('#purchaseOrderNo').val();

	var input = document.getElementById('purchaseOrderNo'), list = document
			.getElementById('purchaseOrderNo_drop'), i, InwardProcessingInfoPk;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			InwardProcessingInfoPk = list.options[i].getAttribute('data-value');
		}
	}
	
	/*if(purchaseOrderNo == "") {
		alert("Please Select purchase order no...!");
		return false;
	}*/
	
	if(purchaseOrderNo != "" || purchaseOrderNo !=null || purchaseOrderNo !="undefined") {
		
		$("#challanNo").append($("<input/>").attr("value", "").text());
		//$("#personName").append($("<input/>").attr("value", "").text());
		
		var params = {};
		
		params["InwardProcessingInfoPk"] = InwardProcessingInfoPk;
		params["purchaseOrderNo"] = purchaseOrderNo;
		params["methodName"] = "getChallanNo";
		
		$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		
			var jsonData = $.parseJSON(data);
			var catmap = jsonData.list;
			$.each(jsonData, function(i, v) {
				document.getElementById("challanNo").value = v.challanNo;
				//document.getElementById("personName").value = v.personName;
			
		});
		}).error(function(jqXHR, textStatus, errorThrown) {
			if (textStatus === "timeout") {
				
			}	
		});	
	}

}


function validationInwardProcess1Details() {
	
	var purchaseOrderNo = $('#purchaseOrderNo').val();
	var challanNo = $('#challanNo').val();
	var operationName = $('#operationName').val();
//	var sendToOperationName = $('#sendToOperationName').val();
//	var comment = $('#comment').val();
	
	/*if(purchaseOrderNo == "") {
		alert("Please Select purchase order no...!");
		return false;
	}*/
	if (purchaseOrderNo == "" && challanNo == "") {
		alert("Please Select Either Purchase Order No Or Challan No");
		return false;
	}
	if(challanNo == "" ) {
		alert("Please enter challan no...!");
		return false;
	}
	if(operationName == "" ) {
		alert("Please Select operation name...!");
		return false;
	}
	/*if(sendToOperationName == "") {
		alert("Please Select send to operation name...!");
		return false;
	}
	if(comment == "") {
		alert("Please enter comment...!");
		return false;
	}*/
	
	inwardProcess1Details();
	
}

function inwardProcess1Details() {

	document.getElementById('saveInwardProcess1DetailsBtn').disabled = true;
	
	var purchaseOrderNo = $('#purchaseOrderNo').val();
	var challanNo = $('#challanNo').val();	
	var pkOperationDetailsId = $('#pkOperationDetailsId').val();
	var operationName = $('#operationName').val();
	
	var sendToOperationName = $('#sendToOperationName').val();
	var input = document.getElementById('sendToOperationName'), list = document
			.getElementById('sendToOperationName_drop'), i, sendToOperationDetailsIdFk;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			sendToOperationDetailsIdFk = list.options[i].getAttribute('data-value');
		}
	}
	
	var comment = $('#comment').val();

	var params = {};
	
	if(sendToOperationDetailsIdFk=="" |sendToOperationDetailsIdFk==null |sendToOperationDetailsIdFk=="undefined")
	{
		sendToOperationDetailsIdFk="0";
	}
	
	/*if(personName=="" |personName==null |personName=="undefined")
	{
		personName="N/A";
	}
	if(landline=="" |landline==null |landline=="undefined" )
		{
		landline="00"
		}*/

	params["purchaseOrderNo"] = purchaseOrderNo;
	params["challanNo"] = challanNo;
	params["pkOperationDetailsId"] = pkOperationDetailsId;
	params["operationName"] = operationName;
	params["sendToOperationDetailsIdFk"] = sendToOperationDetailsIdFk;
	params["sendToOperationName"] = sendToOperationName;
	params["comment"] = comment;
	
	params["methodName"] = "saveInwardProcess1Details1";
	

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.getElementById('saveInwardProcess1DetailsBtn').disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


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
	params["methodName"] = "getInwardDetailsTablewithpo";

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
																					7)
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
																			"data" : "pono",
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
															                title: 'With Po Inward Process Wise Reports'
															            },
															            {
															                extend: 'csvHtml5',
															                title: 'With Po Inward Process Wise Reports'
															            },
															        	{
															                extend: 'excelHtml5',
															                title: 'With Po Inward Process Wise Reports'
															            },
															            {
															                extend: 'pdfHtml5',
															                title: 'With Po Inward Process Wise Reports'
															            },
															            {
															            	 extend: 'print',
															                title: 'With Po Inward Process Wise Reports'
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















