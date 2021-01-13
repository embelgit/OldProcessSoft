/**
 inwardProcess3.js
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
		params["methodName"] = "getChallanNoForProcess3";
		
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


function validationInwardProcess3Details() {
	
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
	if(challanNo == "") {
		alert("Please enter challan no");
		return false;
	}
	if(operationName == "") {
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
	
	inwardProcess3Details();
	
}

function inwardProcess3Details() {

	document.getElementById('saveInwardProcess3DetailsBtn').disabled = true;
	
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
	
	params["methodName"] = "saveInwardProcess3Details";
	

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.getElementById('saveInwardProcess3DetailsBtn').disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


















