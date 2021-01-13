function catDetails(){
	
	if(document.catd.categoryName.value == "")
	{
		alert("Enter Category Name");
		return false;
	}	
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.catd.categoryName.value.match(letterNumber))
	{
		categoryDetails();
	}
	
	else
	{
		alert("Enter Alphabates Only in Category Name Field..!!");
		return false;
	}	
}

function categoryDetails(){
	
	document.catd.btn.disabled =true;
	
		var categoryName = $('#categoryName').val();
		/*var subCategoryName = $('#subCategoryName').val();*/
		
		var params = {};
		
		params["categoryName"] =categoryName;
		/*params["subCategoryName"] =subCategoryName;*/
		
		
		params["methodName"] = "categoryDetails";
	
	 	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	 	    	{
	 				
	 		
	 			alert(data);
	 			location.reload();
	 				
	 				if(document.catd)
	 				{
	 					document.catd.reset();
	 				}	
	 				document.catd.btn.disabled =false;
	 			}
	 	    	).error(function(jqXHR, textStatus, errorThrown){
	 	    		if(textStatus==="timeout") {
	 	    			$(loaderObj).hide();
	 	    			$(loaderObj).find('#errorDiv').show();
	 	    		}
	 	    	});

		
}

/*sub category method by RK*/
function subcat(){
	if(document.subCat.fk_cat_id.value == "")
	{
		alert("Enter Category Name ");
		return false;
	}	
	else if(document.subCat.subcategoryName.value == "")
	{
		alert("Enter Sub Category Name Name.");
		return false;
	}	
	var letterNumber = /^[a-zA-Z, ]+$/;
	if(document.subCat.subcategoryName.value.match(letterNumber))
	{
		subCategoryDetails();
	}
	else
	{
		alert("Enter Alphabates Only in Sub Category name field..!!");
		return false;
	}	
}

function subCategoryDetails(){
	 
	document.catd.btn.disabled =true;
	
	var input = document.getElementById('fk_cat_id'),
    list1 = document.getElementById('cat_drop'),
    i,fk_cat_id;

	for (i = 0; i < list1.options.length; ++i) {
    if (list1.options[i].value === input.value) {
    	fk_cat_id = list1.options[i].getAttribute('data-value');
    }
	}
	//var fk_cat_id = $('#fk_cat_id').val();
	var subcategoryName = $('#subcategoryName').val();
	
	var params = {};
	
	params["fk_cat_id"] =fk_cat_id;
	params["subcategoryName"] =subcategoryName;
	
	
	params["methodName"] = "subCategoryDetails";

	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
	    	{
				
		
			alert(data);
			location.reload();	
				if(document.catd)
				{
					document.catd.reset();
				}	
				document.catd.btn.disabled =false;
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