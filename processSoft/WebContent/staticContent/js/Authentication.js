function getShopNameForLogin()
{
/*	var input1 = document.getElementById('category'),
	list = document.getElementById('cat_drop'),
	i,fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}*/
	
	
	var uname=$('#uname').val();
	
	$("#shopname_drop").empty();
	$("#shopname_drop").append($("<option></option>").attr("value","").text("Select Shop Name"));
	var params= {};

	params["uname"]= uname;

	params["methodName"] = "getAllShopNameForLogin";
	
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{ var count = 1;

			var jsonData = $.parseJSON(data);
			$.each(jsonData,function(i,v)  
					{
				$("#shopname_drop").append($("<option></option>").attr("value",( v.userId+ ","+v.shopId+","+v.ShopName))); 
				count++;
					});
			}).error(function(jqXHR, textStatus, errorThrown){
				if(textStatus==="timeout") {

				}
			});
}