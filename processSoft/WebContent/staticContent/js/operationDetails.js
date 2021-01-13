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
function addOperationDetails(){
	if(document.operationDetails.operationName.value == "")
	{
		alert("Please Enter Operation Name");
		return false;
	}	
	var letterNumber = /^[a-zA-Z0-9, ]+$/;
	if(document.operationDetails.operationName.value.match(letterNumber))
	{
		addExpense1();
	}
	
	else
	{
		alert("Enter Alphabates And Numbers Only in Expense name field..!!");
		return false;
	}	

}




function addExpense1() {
	
	document.operationDetails.submitBtn.disabled = true;

	var operationName = $('#operationName').val();

	var params = {};

	params["operationName"] = operationName;

	params["methodName"] = "addOperationDetails";

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
	document.operationDetails.reset();

}

function addExpenseForBillingAndGoodsReceive() {

	document.operationDetails.btn1.disabled = true;

	var operationName = $('#operationNameForBilling').val();

	var params = {};

	params["operationName"] = operationName;

	params["methodName"] = "addOerationDetailsForBilling";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.operationDetails1) {
			document.operationDetails1.reset();
		}
		document.operationDetails1.btn1.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}