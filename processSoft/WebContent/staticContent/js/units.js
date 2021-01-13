function AddMeasuringUnit(){
	if ( document.munits.unitName.value == "" )
	 {
     alert("Please Enter Unit");
     return false;
	 }
	 var letterNumber = /^[a-zA-Z0-9, ]+$/;
	 if(document.munits.unitName.value.match(letterNumber) )
	 {
		 if ( document.munits.unitDescription.value == "" )
		 {
	     alert("Please Enter SI Unit Description");
	     return false;
		 }
		 var letterNumber = /^[a-zA-Z0-9, ]+$/;
		 if(document.munits.unitDescription.value.match(letterNumber) )
		 {
		 addUnit()
	 }
	 else
		{
				alert("Enter Alphabates And Number Only in SI unit Description Field.");
				return false;
			}
		}
	 else
		{
				alert("Enter Alphabates And Number Only in Unit Name  Field..!!");
				return false;
			}
		}


function addUnit(){
	
	//document.munits.btn.disabled = true;
	document.getElementById('save').disabled = true;
	
	var unitName = $('#unitName').val();
	var unitDescription = $('#unitDescription').val();
	var params = {};
	
	params["unitName"] = unitName;
	params["unitDescription"] = unitDescription;
	params["methodName"] = "measuringUnits";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
 	    	{
 				alert(data);
 				if(document.munits)
 				{
 					location.reload();
 				}	
 				document.munits.btn.disabled =false;
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
document.munits.reset();	

}
