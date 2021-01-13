//validateing password with re-password

function validatePassword(){
        	 var password=$('#password').val();
        	 var rePassword=$('#password2').val();
        	 
        	 if(password != rePassword){
        		 alert("Password mismatch")
        	 }
        	 
         }

 
 
 //Ading user detail
 
function regUserDetails(){
	
        		if(document.usd.firstName.value == "")
        		{
        			alert("Enter Employee First Name.");
        			return false;
        		}	
        		var letterNumber = /^[a-zA-Z, ]+$/;
        		if(document.usd.firstName.value.match(letterNumber))
        		{
        			
        			/* var letterNumber = /^[a-zA-Z, ]+$/;
        			if(document.usd.middleName.value.match(letterNumber))
        			{
        				 */if(document.usd.lastName.value == "")
        				{
        					alert("Enter Employee Last Name.");
        					return false;
        				}	
        				var letterNumber = /^[a-zA-Z, ]+$/;
        				if(document.usd.lastName.value.match(letterNumber))
        				{
        					
        		   	        			 if ( document.usd.contactNo.value == "" )
        		   	        			 {
        						  	       alert("Please Enter Contact Number");
        						  	       return false;
        		   	        			 }
        		   	        			 var letterNumber = /^[0-9]{10}$/;
        		   	        			 if(document.usd.contactNo.value.match(letterNumber))
        		   	        			 {
        		   	        				if(document.usd.address1.value == "")
        		   	        				{
        		   	        					alert("Please Enter Employee Address line 1.");
        		   	        					return false;
        		   	        				}	
        		   	        				var letterNumber = /^[a-zA-Z0-9, ]+$/;
        		   	        				if(document.usd.address1.value.match(letterNumber))
        		   	        				{
        		   	        					
												if ( document.usd.userName.value == "" )
    										    {
    										         
    										  	      alert("Please Enter user name...!!!");
    										          return false;
    										    }
    											var letterNumber = /^[a-zA-Z0-9, ]+$/;
    											if(document.usd.userName.value.match(letterNumber))
    											{
    												if ( document.usd.password.value == "" )
    												{
   										         
    													alert("Please Enter password...!!!");
    													return false;
		  										    }
														if ( document.usd.password2.value == "" )
		  										    {
		  										         
		  										  	      alert("Please Enter re-password...!!!");
		  										          return false;
		  										    }
        											if ( document.usd.pan.value == "" )
        										    {
        										         
        										  	      alert("Please Enter Pan number...!!!");
        										          return false;
        										    }
        											var letterNumber = /^[a-zA-Z0-9]+$/;
        											if(document.usd.pan.value.match(letterNumber))
        											{
        												
            												
            												
            												usrDetails();
        											
            											}
        										
            											else
            											{
            													alert("Enter Numbers And Alphabates Only in user name field..!!");
            													return false;
            												}
            											}
            											
            											else
        											{
        													alert("Enter Numbers And Alphabates Only in Pan Number field..!!");
        													return false;
        												}
        											}
        										
        		   	        				else
        										{
        											alert("Enter Numbers and Alphabates Only in address line 1 field..!!");
        											return false;
        										}	
        									}
        											
        		   	        			 else
        									{
        										alert("Enter 10 digit Numbers Only in contact number field..!!");
        										return false;
        										}	
        									}
        		   	        		 		
        				else
        					{
        						alert("Enter Alphabets Only in last name field..!!");
        						return false;
        					}
        				}
        																	
        			
        													
        		else
        			{
        				alert("Enter Alphabets Only in first name field..!!");
        				return false;
        			}

        		}	
      
        
        		
    function usrDetails(){

        		//document.usd.btn.disabled = true;
        		document.getElementById('save').disabled = false;
        			
        		var params = {};
        		
        			var firstName = $('#firstName').val();
        			var city = $('#city').val();
        			var lastName  = $('#lastName').val();
        			var contactNo = $('#contactNo').val();
        			var address1 = $('#address1').val();
        			var pan = $('#pan').val();
        			var userName = $('#userName').val();
        			var password = $('#password').val();
        			var password2 = $('#password2').val();
        			var typeId= $('#typeId').val();
        			var shopname=$('#shopname').val();
        			
        			
        			params["firstName"] = firstName;
        			params["city"] = city;
        			params["lastName"] = lastName;
        			params["contactNo"] = contactNo;
        			params["address1"] = address1;
        			params["pan"] =pan;
        			params["userName"] = userName;
        			params["password"] = password;
        			params["password2"] =password2;
        			params ["typeId"] = typeId;
        			params["shopname"]=shopname;
        			
        			params["methodName"] = "regUserDetails";

        			$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
        		 	    	{
        		 				alert(data);
        		 				if(document.usd)
        		 				{
        		 					document.usd.reset();
        		 				}	
        		 				document.usd.btn.disabled =false;
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
        	document.usd.reset();	

        	}




/*function regUserDetails(){
	if(document.usd.firstName.value == "")
	{
		alert("Enter Employee First Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z]+$/;
	if(document.usd.firstName.value.match(letterNumber))
	{
		
		var letterNumber = /^[a-zA-Z]+$/;
		if(document.usd.middleName.value.match(letterNumber))
		{
			if(document.usd.lastName.value == "")
			{
				alert("Enter Employee Last Name.");
				return false;
			}	
			var letterNumber = /^[a-zA-Z]+$/;
			if(document.usd.lastName.value.match(letterNumber))
			{
				
	   	        			 if ( document.usd.contactNo.value == "" )
	   	        			 {
					  	       alert("Please Enter Contact Number");
					  	       return false;
	   	        			 }
	   	        			 var letterNumber = /^[0-9]+$/;
	   	        			 if(document.usd.contactNo.value.match(letterNumber))
	   	        			 {
	   	        				if(document.usd.address1.value == "")
	   	        				{
	   	        					alert("Please Enter Employee Address line 1.");
	   	        					return false;
	   	        				}	
	   	        				var letterNumber = /^[a-zA-Z]+$/;
	   	        				if(document.usd.address1.value.match(letterNumber))
	   	        				{
	   	        					
	   	        					
										if ( document.usd.pan.value == "" )
									    {
									         
									  	      alert("Please Enter Pan number...!!!");
									          return false;
									    }
										var letterNumber = /^[a-zA-Z0-9]+$/;
										if(document.usd.pan.value.match(letterNumber))
										{
										usrDetails();
										}
									else
										{
												alert("Enter Numbers And Alphabates Only in Pan Number field..!!");
												return false;
											}
										}
									
	   	        				else
									{
										alert("Enter Alphabates Only in address line 1 field..!!");
										return false;
									}	
								}
										
	   	        			 else
								{
									alert("Enter Numbers Only in contact number field..!!");
									return false;
									}	
								}
	   	        		 		
			else
				{
					alert("Enter Alphabets Only in last name field..!!");
					return false;
				}
			}
																
		
												
	else
		{
			alert("Enter Alphabets Only in first name field..!!");
			return false;
		}

	}	
}
	
	
function usrDetails(){

	document.usd.btn.disabled = true;
		
	var params = {};
	
		var firstName = $('#firstName').val();
		var city = $('#city').val();
		var lastName  = $('#lastName').val();
		var contactNo = $('#contactNo').val();
		var address1 = $('#address1').val();
		var pan = $('#pan').val();
		var userName = $('#userName').val();
		var password = $('#password').val();
		var password2 = $('#password2').val();
		

		
		
		params["firstName"] = firstName;
		params["city"] = city;
		params["lastName"] = lastName;
		params["contactNo"] = contactNo;
		params["address1"] = address1;
		params["pan"] =pan;
		params["userName"] = userName;
		params["password"] = password;
		params["password2"] =password2;
		
		
		params["methodName"] = "regUserDetails";

		$.post('/Fertilizer/jsp/utility/controller.jsp',params,function(data)
	 	    	{
	 				alert(data);
	 				if(document.usd)
	 				{
	 					document.usd.reset();
	 				}	
	 				document.usd.btn.disabled =false;
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
document.usd.reset();	

}

*/