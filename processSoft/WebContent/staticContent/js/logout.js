

function Logout(){
	
	var params = {};
	
	params["methodName"] = "LogOut";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	    	{   
				
		        alert (" You are logOut Successfully!!!");
				window.location.replace("/processSoft/jsp/login.jsp");
				
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
}
function login(){

	if (document.Login.uname.value == "") {
		alert("Please Enter User Name");
		return false;
	}

	if (document.Login.pass.value == "") {
		alert("Please Enter Passward ");
		return false;
	}
	login1();
}


function login1(){
	var uname = $("#uname").val();
	var pass = $("#pass").val();
	
	var params = {};
	
	params["uname"] = uname;
	params["pass"] = pass;
	
	params["methodName"] = "login";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	    	{   
	//alert(data)
	window.location.replace("/processSoft/jsp/index.html");
				
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
}


function login2(){
	 var uname = $("#uname").val();
		if(uname=="")
			{
			
			alert("Please Enter Username");
			return false;
			}
	 var pass = $("#pass").val();
		if(pass=="")
		{
		
		alert("Please Enter Password");
		return false;
		}
	 var shop = $("#shopname").val();
		if(shop=="")
		{
		
		alert("Please Enter Shop Name");
		return false;
		}
		
		var userid=shop.split(",")[0];
		var shopid=shop.split(",")[1];
		var shopname=shop.split(",")[2];
		
		var params = {};

		params["uname"] = uname;
		params["pass"] = pass;
		params["userid"] = userid;
		params["shopid"] = shopid;
		params["shopname"] = shopname;
		params["methodName"] = "login1";
		$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
				{   
			window.location.replace("/processSoft/jsp/index.html");
				}
		).error(function(jqXHR, textStatus, errorThrown){
			if(textStatus==="timeout") {
				$(loaderObj).hide();
				$(loaderObj).find('#errorDiv').show();
			}
		});
	}


function language(){
	
	var language = $("#language").val();
	
	var params = {};
	
	params["language"] = language;
	
	
	params["methodName"] = "language";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	    	{   
	
	           location.reload();
				
			    }
	    	).error(function(jqXHR, textStatus, errorThrown){
	    		if(textStatus==="timeout") {
	    			$(loaderObj).hide();
	    			$(loaderObj).find('#errorDiv').show();
	    		}
	    	});
	
	
}
