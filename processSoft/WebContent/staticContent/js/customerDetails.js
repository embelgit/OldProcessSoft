function customerDetails(){

	if(document.cstd.IdNo.value == "")
	{
		alert("Enter Party Number");
		return false;
	}	
	if(document.cstd.firstName.value == "")
	{
		alert("Enter Customer  Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.cstd.firstName.value.match(letterNumber))
	{
		/*if(document.cstd.middleName.value == "")
		{
			alert("Enter Customer First Name.");
			return false;
		}	
		var letterNumber = /^[a-zA-Z, ]+$/;
		if(document.cstd.middleName.value.match(letterNumber))
		{
			if(document.cstd.lastName.value == "")
			{
				alert("Enter Customer Last Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z, ]+$/;
			if(document.cstd.lastName.value.match(letterNumber))
			{*/
				          /* if(document.cstd.gstNo.value == "")
   				           {
   					          alert("Please Enter GST Number");
   					          return false;
   				           }	*/
   				           var letterNumber = /^[a-zA-Z, ]+$/;
   				           /*if(document.cstd.address.value.match(letterNumber))
   				           {
				           
	   	        			 if ( document.cstd.contactNo.value == "" )
	   	        			 {
					  	       alert("Please Enter Contact Number");
					  	       return false;
	   	        			 }
	   	        			 var letterNumber = /^[0-9]{10}$/;
	   	        			 if(document.cstd.contactNo.value.match(letterNumber) && document.cstd.contactNo.value != "0000000000")
	   	        			 {
	   	        				
	   	        					if ( document.cstd.aadharNo.value == "" || document.cstd.aadharNo.value == null)
								    {
								         
								  	      alert("Please Enter Aadhar Number");
								          return false;
								    }
									var letterNumber = /^[0-9]{12}$/;
									if(document.cstd.aadharNo.value.match(letterNumber))
									{
	   	        					if ( document.cstd.zipCode.value == "" )
								    {
								         
								  	      alert("Please Enter Zip Code");
								          return false;
								    }
									var letterNumber = /^[0-9]{6}$/;
									if(document.cstd.zipCode.value.match(letterNumber))
									{*/
											
										/*var letterNumber = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						   	        	 if(document.cstd.emailId.value.match(letterNumber) || document.cstd.emailId.value == null ||  document.cstd.emailId.value == "")
						   	        	 {*/

						   	        		 custDetails();
											
											}
						   	        	 /*else
											{
												alert("Enter a Valid email address..!!");
												return false;
											}
										}*/
							/*		 else
										{
												alert("Enter 6 digit Numbers Only in zip code field..!!");
												return false;
											}
										}
										 else
											{
												alert("Enter a Valid 12 digit Aadhar number.!!");
												return false;
											}
										}
						   	        	
	   	        			 else
								{
									alert("Enter 10 digits Only in contact number field And All 0's is invalid..!!");
									return false;
									}	
								}
   				           
   				        else
						{
							alert("Enter Alphabates Only in address field..!!");
							return false;
						}	
					}*/
																
			/*else
				{
					alert("Enter Alphabets Only in Last Name Field..!!");
					return false;
				}
			}
																
		else
			{
				alert("Enter Alphabets Only in Middle Name Field..!!");
				return false;
			}
		}*/
												
	else
		{
			alert("Enter Alphabets Only in Customer Name Field..!!");
			return false;
		}

	}	



function custDetails(){
	
	document.cstd.btn.disabled = true;
				var firstName = $('#firstName').val();
				var middleName = $('#middleName').val();
				var lastName = $('#lastName').val();
				var address = $('#address').val();
				var contactNo  = $('#contactNo').val();
				var emailId = $('#emailId').val();
				var zipCode = $('#zipCode').val();
				var gstNo = $('#gstNo').val();
				var IdNo = $('#IdNo').val();
				var params = {};
				
				params["firstName"] =firstName;
				params["middleName"] =middleName;
				params["lastName"] =lastName;
				params["address"] = address;
				params["contactNo"] =contactNo;
				params["emailId"] = emailId;
				params["zipCode"] = zipCode;
				params["gstNo"] = gstNo;
				params["IdNo"] = IdNo;
				
				params["methodName"] = "customerDetails";
				
			 	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			 	    	{
			 				alert(data);
			 				if(document.cstd)
			 				{
			 					document.cstd.reset();
			 				}	
			 				document.cstd.btn.disabled =false;
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
   document.cstd.reset();	

}




/*************** Edit Credit Customer Details **********/
function getCustomerDetails(){
	var params= {};
	
	var input = document.getElementById('creditCustomer'),
     list = document.getElementById('cust_drop'),
     	i,fkRootCustId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootCustId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	$("#firstName").append($("<input/>").attr("value","").text());
	$("#middleName").append($("<input/>").attr("value","").text());
	$("#lastName").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value","").text());
	$("#contactNo").append($("<input/>").attr("value","").text());
	$("#gstNo").append($("<input/>").attr("value","").text());
	$("#emailId").append($("<input/>").attr("value","").text());
	$("#zipCode").append($("<input/>").attr("value","").text());
	$("#IdNo").append($("<input/>").attr("value","").text());
	
	
	
	params["creditCustomer"]= fkRootCustId;
	params["methodName"] = "getCreditCustomerDetailsToEdit";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data){
		
		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
				  document.getElementById("firstName").value = v.firstName;
			      document.getElementById("middleName").value = v.middleName;
			      document.getElementById("lastName").value = v.lastName;
			      document.getElementById("address").value = v.address;
			      document.getElementById("contactNo").value = v.contactNo;
			     /* document.getElementById("gstNo").value = v.gstNo;*/
			      document.getElementById("emailId").value = v.email;
			      document.getElementById("zipCode").value = v.zipCode;
			      document.getElementById("IdNo").value = v.IdNo;
			   
		      
				});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
 	    	
}


function updateCustomerDetails(){

	
	document.cstd1.btn.disabled = true;
	
	var input = document.getElementById('creditCustomer'),
    list = document.getElementById('cust_drop'),
    	i,fkRootCustId;
	 		for (i = 0; i < list.options.length; ++i) {
			     if (list.options[i].value === input.value) {
			    	 fkRootCustId = list.options[i].getAttribute('data-value');
			     }
	 		}
	
	//var customerId = document.getElementById("customerId").value;
	
	var firstName = $('#firstName').val();
	var middleName = $('#middleName').val();
	var lastName = $('#lastName').val();				
	var address = $('#address').val();
	var contactNo = $('#contactNo').val();
	var gstNo = $('#gstNo').val();
	var emailId = $('#emailId').val();
	var zipCode = $('#zipCode').val();
	var IdNo = $('#IdNo').val();

	
	
	var params = {};
	
	params["customerId"] = fkRootCustId;
	
	params["firstName"] = firstName;	
	params["middleName"] = middleName;
	params["lastName"] = lastName;
	params["address"] = address;
	params["contactNo"] =contactNo;
	params["gstNo"] = gstNo;
	params["emailId"] = emailId;
	params["zipCode"] = zipCode;
	params["IdNo"] = IdNo;
	
	
	
	params["methodName"] = "updateCreditCustomerDetails";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data){
			alert(data);
				if(document.cstd1)
				{
					document.cstd1.reset();
				}	
				document.cstd1.btn.disabled =false;
			}
 	    	).error(function(jqXHR, textStatus, errorThrown){
 	    		
 	    		/*alert("Data Added Successfully..");
 	    		location.reload();
 				document.ccd.btn.disabled =false;*/
 	    		
 	    		if(textStatus==="timeout") {
 	    			$(loaderObj).hide();
 	    			$(loaderObj).find('#errorDiv').show();
 	    		}
 	    	});


}

