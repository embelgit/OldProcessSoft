/**
 DeletExpenditure.js
 */

function deleteExpenditureValidation(){
	
	if(document.delPro.delExpenditureName.value == "")
	{
		alert("Please Enter Expenditure Name");
		return false;
	}
	/*var letterNumber = /^[a-zA-Z]+$/;
	if(document.delCust.delCustName.value.match(letterNumber))
	{*/	
	/*else
	{
		alert("Enter Alphabates And Numbers Only in Godown name field..!!");
		return false;
	}	*/
	
	deleteExpenditure();
}

function deleteExpenditure(){
	
	var input = document.getElementById('delExpenditureName'),
    list = document.getElementById('delExpenditureName_drop'),
    i,delExpenditureNameId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	delExpenditureNameId = list.options[i].getAttribute('data-value');
    	}
	}
	//alert(delExpenditureNameId);
	
	var params = {};
	
	params["delExpenditureNameId"] = delExpenditureNameId;
	
	params["methodName"] = "deleteExpenditure";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 		if(data=="↵↵↵↵↵↵↵"){
 			alert("Not Added");
 		}
 		else{
 			alert(data);
 		}
 			location.reload();

 			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});
	
}