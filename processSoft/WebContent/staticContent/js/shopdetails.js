function shopDetails(){
	
	if(document.catd.shopName.value == "")
	{
		alert("Please Enter shop Name.");
		return false;
	}	
	var letterNumber = /^[0-9a-zA-Z, ]+$/;
	if(document.catd.shopName.value.match(letterNumber))
	{
		shopDetails1();
	}	
	else
	{
		alert("Enter Alnumerics Only in shop name field..!!");
		return false;
	}	
}

function shopDetails1(){
	
	//document.saveShopDetails.submitBtn.disabled = true;
	//document.getElementById("save").disabled = false;
	document.getElementById('submitBtn').disabled = true;
	
		var shopName = $('#shopName').val();
		/*var subCategoryName = $('#subCategoryName').val();*/
		
		var params = {};
		
		params["shopName"] =shopName;
		/*params["subCategoryName"] =subCategoryName;*/
		
		
		params["methodName"] = "shopDetails";
	
	 	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	 	    	{	 		
	 			alert(data);
				location.reload();
	 				/*if(document.catd)
	 				{
	 					document.catd.reset();
	 				}	
	 				document.catd.btn.disabled =false;*/
	 			}
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	});

		
}

function reset()
{
   document.catd.reset();	
}