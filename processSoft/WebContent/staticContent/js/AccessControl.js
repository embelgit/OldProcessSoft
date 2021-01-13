//featch username and password from userDetails
function getUserDetails(){
	var params= {};
	var name= $('#EmpName').val();
	
	var userId=name.split(",")[0];
	var empname=name.split(",")[1];


	$("#userName").append($("<input/>").attr("value","").text());
	$("#password").append($("<input/>").attr("value","").text());
	
	
	params["userId"]= userId;
	params["empname"]= empname;
	params["methodName"] = "getUserDetailsToAccessControl";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data){

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData,function(i,v)
				{
			document.getElementById("userName").value = v.userName;
			document.getElementById("password").value = v.password;


				});
	}).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {

		}
	});

}

//save Access Control
function AddAccessControlDetails(){

	document.getElementById("save").disabled = true;
	
	var EmpName = $('#EmpName').val();
	var userid= EmpName.split(",")[0];
	var employeeName = EmpName.split(",")[1];
	
	var userName = $('#userName').val();
	var password = $('#password').val();
	var type = $('#type').val();
	
	var shopname  = $('#shopname').val();
	var shopid= shopname.split(",")[0];
	var shop= shopname.split(",")[1];

	var params = {};


	params["userid"] =userid;
	params["EmpName"] =employeeName;
	params["userName"] =userName;
	params["password"] =password;
	params["type"] = type;
	params["shopid"] =shopid;
	params["shopname"] =shop;  

	params["methodName"] = "AddAccessControl";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data) 			 	    	{
		alert(data);
		
		
		
		/*$.getScript('/AgriSoft/staticContent/js/bootbox.min.js', function() 
				{
	
			var msg=data;
			var dialog = bootbox.dialog({
				//title: "Embel Technologies Says :",
			    message: '<p class="text-center">'+msg.fontcolor("red").fontsize(5)+'<img src="/AgriSoft/staticContent/images/s2.gif" height="50" width="50"/></p>',
			    closeButton: false
			});
			
			setTimeout(function() {
				dialog.modal('hide');
				location.reload();
				document.getElementById("save1").disabled = true;
			}, 1500);
			
			return false;
			
				});*/
		
		
		
		if(document.cstd)
		{
			document.cstd.reset();
			document.getElementById("save").disabled = false;
		}	
	}
	).error(function(jqXHR, textStatus, errorThrown){
		if(textStatus==="timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
