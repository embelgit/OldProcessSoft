/*
 * Name : Meghraj Menkudle 
 * Date : 21/05/2017 
 * Method Name : expensePaymentValidation()
 * Reason : Credit Customer Validation in cashBook
 

function expensePaymentValidation() {

	var expenseName = $("#expenseName").val();
	var serviceProvider = $("#serviceProvider").val();
	var contactNumber = $("#contactNumber").val();
	var expCredit = $("#expCredit").val();
	var accountantName = $("#accountantName").val();

	if (expenseName != null && expenseName != "" && expenseName != " ") {
		if (serviceProvider != null && serviceProvider != ""
				&& serviceProvider != " ") {
			if (contactNumber != null && contactNumber != ""
					&& contactNumber != " ") {
				var phoneno = /^\d{10}$/;
				if (contactNumber.match(phoneno)) {
					if (accountantName != null && accountantName != ""
							&& accountantName != " ") {
						var onlyAlfabet = /^[a-zA-Z ]*$/;
						if (accountantName.match(onlyAlfabet)) {
							--if () {
								addExpense();
							} else {
								alert("Enter Accountant Name without Any Number and Special symbols");
							}
						} else {
							alert("Enter Accountant Name without Any Number and Special symbols");
						}
					} else {
						alert("Enter Accountant Name.");
					}

				} else {
					alert("Contact No Must be 10 digit.");
				}
			} else {
				alert("Enter Contact Number");
			}
		} else {
			alert("Enter Service Provider");
		}
	} else {
		alert("please Select Expenditure Name");
	}
}*/

//Adding expense detail
function addExpenseDetails(){
	if(document.expenseDetails.expenseName.value == "")
	{
		alert("Please Enter Expenditure  Name");
		return false;
	}	
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(document.expenseDetails.expenseName.value.match(letterNumber))
	{
		addExpense();
	}
	
	else
	{
		alert("Enter Alphabates And Numbers Only in Expense name field..!!");
		return false;
	}	

}




function addExpense() {

	document.expenseDetails.submitBtn.disabled = true;

	var expenseName = $('#expenseName').val();

	var params = {};

	params["expenseName"] = expenseName;

	params["methodName"] = "addExpenseDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) 
		{
				alert(data);
				location.reload();
			}
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});

}

function reset() {
	document.expenseDetails.reset();

}

function addExpenseForBillingAndGoodsReceive() {

	document.expenseDetails1.btn1.disabled = true;

	var expenseName = $('#expenseNameForBilling').val();

	var params = {};

	params["expenseName"] = expenseName;

	params["methodName"] = "addExpenseDetailsForBilling";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.expenseDetails1) {
			document.expenseDetails1.reset();
		}
		document.expenseDetails1.btn1.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

//getSupplierDetails to edit
function getExpenditureDetails() {
	var params = {};

	var input = document.getElementById('expenseName'), list = document
			.getElementById('expenseName_drop'), i, pkExpenseDetailsId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			pkExpenseDetailsId = list.options[i].getAttribute('data-value');
		}
	}

	$("#NewExpenseName").append($("<input/>").attr("value", "").text());

	params["pkExpenseDetailsId"] = pkExpenseDetailsId;
	params["methodName"] = "getExpenditureDetailsToEdit";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			document.getElementById("NewExpenseName").value = v.expenseName;
			//document.getElementById("personName").value = v.personName;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}


function updateExpenseDtlValidation() {
	
	var expenseName = $('#expenseName').val();
	var NewExpenseName = $('#NewExpenseName').val();
	
	if (NewExpenseName != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (NewExpenseName.match(letterNumber)) {
			updateExpenditureDetails()
		}
	} else {
		
		if (expenseName == null || expenseName == undefined || expenseName == "" || expenseName == " ") {
			alert("Please select expenditure name...!!!");
			//document.getElementById("focus").focus();
			document.getElementById('expenseName').focus();
			return false;
		}else {
			alert("Please enter expenditure name...!!!");
			document.getElementById('NewExpenseName').focus();
			return false;
		}
		
	}
}

function updateExpenditureDetails() {

	document.updateExpenseDetails.UpdateBtn.disabled = true;

	var input = document.getElementById('expenseName'), list = document
			.getElementById('expenseName_drop'), i, pkExpenseDetailsId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			pkExpenseDetailsId = list.options[i].getAttribute('data-value');
		}
	}
	
	var NewExpenseName = $('#NewExpenseName').val();
	
	var params = {};

	params["pkExpenseDetailsId"] = pkExpenseDetailsId;
	params["NewExpenseName"] = NewExpenseName;
	
	params["methodName"] = "updateExpenditureDetails";
	
	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		
		location.reload();
		
		/*if (document.updateExpenseDetails) {
			document.updateExpenseDetails.reset();
		}
		document.updateExpenseDetails.UpdateBtn.disabled = false;*/
		
		//window.open("editExpenditureDetails.jsp");
		
	}).error(function(jqXHR, textStatus, errorThrown) {

		/*alert("Data Added Successfully..");
		location.reload();
		document.ccd.btn.disabled =false;*/

		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}
























