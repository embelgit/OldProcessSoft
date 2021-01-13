function getVendorWiseBillNO() {
		var VendorName = $('#VendorName').val();

		$("#billnumber").empty();
		$("#billnumber").append($("<option></option>").attr("value", "").text("Select Bill No"));

		var params = {};

		params["supplier"] = VendorName;
		params["methodName"] = "getAllBillByVendorNames1";

		$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

			var jsonData = $.parseJSON(data);
			// var jsonData = jsonData.list;
			$.each(jsonData, function(i, v) {
				$("#billnumber").append($("<option></option>").attr("value", i).text(v.billNo1));
				
			});
		})

	}

function getVendorWiseBillNO1() {
	var VendorName = $('#VendorName').val();

	$("#billnumber").empty();
	$("#billnumber").append($("<option></option>").attr("value", "").text("Select Bill No"));

	var params = {};

	params["supplier"] = VendorName;
	params["methodName"] = "getAllBillByVendorNames2";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			$("#billnumber").append($("<option></option>").attr("value", i).text(v.outwardchallanno));
			
			
		});
	})

}


function getVendorWiseBillNO2() {
	var VendorName = $('#VendorName').val();

	$("#OutwardChallanNo").empty();
	$("#OutwardChallanNo").append($("<option></option>").attr("value", "").text("Select Bill No"));

	var params = {};

	params["supplier"] = VendorName;
	params["methodName"] = "getAllBillByVendorNames3";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		// var jsonData = jsonData.list;
		$.each(jsonData, function(i, v) {
			$("#OutwardChallanNo").append($("<option></option>").attr("value", v.outwardchallanno).text(v.outwardchallanno));
			//$("#billNo1").append($("<option></option>").attr("value",v.billNo).text(v.billNo)); 
			
			
		});
	})

}
function BillCopy(){
	if(document.saleReportForm.VendorName.value == "")
		{
		alert("Please Select Vendor Name.");
		return false;
		}
	if(document.saleReportForm.billnumber.value == "")
	{
	alert("Please Select Bill  Number.");
	return false;
	}
	BillCopyNew()
}


function BillCopyNew(){
	
	var billnumber = $('#billnumber').val();
	var params = {};
	params["BillNum"] = billnumber;

	params["methodName"] = "BillCopyMethod";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
		location.reload(true);
		window.open("RepackingBillCopyPdf.jsp");
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

function BillCopy1(){
	if(document.saleReportForm.VendorName.value ==""){
		alert("Please Select Vendor Name ");
		return false;
		
	}
	if(document.saleReportForm.billnumber.value ==""){
		alert("Please Select Bill Number ");
		return false;
		
	}
	BillCopy2()
}
function BillCopy2(){
	
	var billnumber = $('#billnumber').val();
	var params = {};
	params["BillNum"] = billnumber;

	params["methodName"] = "BillCopyMethod1";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
		location.reload(true);
		window.open("RepackingBillCopyoutwardPdf.jsp");
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}
function OutwardReturnbill(){
	if(document.saleReportForm.VendorName.value ==""){
		alert("please Select Vendor Name ");
		return false;
	}
	if(document.saleReportForm.OutwardChallanNo.value ==""){
		alert("please Select Outward Challan No ");
		return false;
	}
	OutwardReturnbill1()
}
function OutwardReturnbill1(){
	
	var params = {};
	var OutwardChallanNo = $('#OutwardChallanNo').val();
	
	params["OutwardChallanNo"] = OutwardChallanNo;

	params["methodName"] = "BillCopyMethod2";

	$.post('/processSoft/jsp/utility/controller.jsp', params,
			function(data) {
		location.reload(true);
		window.open("OutwardRuturnBillCopyPDF.jsp");
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});
}

