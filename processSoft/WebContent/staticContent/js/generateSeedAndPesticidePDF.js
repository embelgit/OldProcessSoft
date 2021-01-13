function normalCustFertilzerBillCOPY() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('BillNo'), list = document
			.getElementById('seedBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["billNo"] = billNo;

	params["methodName"] = "NormalCustFertilizerBillCOPY";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_Fertilizer_normalCustomerBillPdf.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function creditCustFertilzerBillCOPY() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('CreditBillNo'), list = document
			.getElementById('creditCustBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["creditCustbillNo"] = billNo;

	params["methodName"] = "creditCustFertilzerBillCOPY";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_Fertilizer_Credit_CustomerBillPdf.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}





function billGeneration() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('BillNo'), list = document
			.getElementById('seedBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["billNo"] = billNo;

	params["methodName"] = "billGeneration";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_SeedPesticide_normalCustomerBillPdf.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


function billGenerationForNormalPesti() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('BillNo'), list = document
			.getElementById('seedBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["billNo"] = billNo;

	params["methodName"] = "billGeneration";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_Pesticide_normal_customer_PDF.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}


function CreditCustBillGeneration() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('CreditBillNo'), list = document
			.getElementById('creditCustBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["creditCustbillNo"] = billNo;

	params["methodName"] = "CreditCustmerBillCOPY";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_SeddPesticide_Credit_CustomerBillPdf.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}



function CreditCustBillGenerationForPesticide() {
	// document.genIn.btn.disabled = true;

	var input = document.getElementById('CreditBillNo'), list = document
			.getElementById('creditCustBillNo'), i, billNo;
	
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			billNo = list.options[i].getAttribute('data-value');
		}
	}
	var params = {};
	params["creditCustbillNo"] = billNo;

	params["methodName"] = "CreditCustmerBillCOPY";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
				location.reload(true);
				window.open("COPY_Pesticide_Credit_cust_Bill_PDF.jsp");
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}