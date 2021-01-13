function packType(){
	
	if(document.Pcktyp.packing_Type.value == "")
	{
		alert("Enter Capacity");
		return false;
	}	
	packingInfo();
	/*var letterNumber = /^[a-zA-Z0-9]+$/;
	if(document.Pcktyp.packing_Type.value.match(letterNumber))
	{
		
	}
	else
	{
		alert("Enter Proper Unit value..!!");
		return false;
	}	*/
}

function packingInfo(){
	document.Pcktyp.btn.disabled =true;
	
	var containerName=$('#containerName').val();
	var packing_Type = $('#packing_Type').val();
	
	var input = document.getElementById('unitName'),
    list = document.getElementById('unit_drop1'),
    i,unitId;

	for (i = 0; i < list.options.length; ++i) {
    if (list.options[i].value === input.value) {
    	unitId = list.options[i].getAttribute('data-value');
    	}
	}
	
	var extrapacking = $('#extrapacking').val();
	
		var params = {};
		
		params["containerName"] =containerName;
		params["packing_Type"] =packing_Type;
		params["unitId"] =unitId;
		params["extrapacking"] =extrapacking;
	
		params["methodName"] = "PackingTypeInfo";
	
	 	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	 	    	{
	 				
	 		
	 			alert(data);
	 			location.reload();
	 				
	 				if(document.Pcktyp)
	 				{
	 					document.Pcktyp.reset();
	 				}	
	 				document.Pcktyp.btn.disabled =false;
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