/*function btnhide() {
	$("#save").hide();
}*/
function btnShow() {
	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			/*if(document.spld.personName.value != "")
			{
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(document.spld.personName.value.match(letterNumber))
				{*/
			if (document.spld.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo.value.match(contactno)) {
					/*var mobileno=$('#contactNo').val();
					if(mobileno.length<=10)
					{
						alert("Please Enter 10 Digit mobile Number")
					}*/
					if (document.spld.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city.value.match(City)) {
							if (document.spld.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo.value.match(GstNo)) {
									$("#save").show();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Numbers Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			} else {

				alert("Please Enter Contact Number");
				return false;
			}

		}
		/*else
		{
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}
		}
		else
		{
		alert("Enter person Name");
		return false;
		}
		}*/
		else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}
	} else {
		message("Enter supplier Name.");
		return false;
	}

}
function phoneno() {
	$('#contactNo').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}
function lanlineNo() {
	$('#landline').keypress(function(e) {
		var a = [];
		var k = e.which;

		for (i = 48; i < 58; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})
}

function characters() {

	$('#city').keypress(function(e) {
		var a = [];
		var k = e.which;
		for (i = 65; i < 123; i++)
			a.push(i);

		if (!(a.indexOf(k) >= 0))
			e.preventDefault();
	})

}

function supplierDetail() {
	if (document.spld.IdNo1.value != "") {
		
	if (document.spld.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld.dealerName.value.match(letterNumber)) {
			/*if(document.spld.personName.value != "")
			{
				var letterNumber = /^[a-zA-Z, ]+$/;
				if(document.spld.personName.value.match(letterNumber))
				{*/
			if (document.spld.contactNo1.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld.contactNo1.value.match(contactno)) {
					
					/*var landline = /^\d{10}$/;
					if (document.spld.landline.value.match(landline)) {*/
					
					/*var mobileno=$('#contactNo').val();
					if(mobileno.length<=10)
					{
						alert("Please Enter 10 Digit mobile Number")
					}*/
					if (document.spld.city1.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld.city1.value.match(City)) {
							if (document.spld.tinNo1.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld.tinNo1.value.match(GstNo)) {
									supDetails();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}

							} else {

								alert("Please Enter GST Number");
								return false;
							}
						} else {
							alert("Only Alphabets Are allowed in City");
							return false;
						}

					} else {

						alert("Please Enter City");
						return false;
					}
				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}
				/*else{
						alert("Enter 10 Digit Landline Number");
						return false;
						}
					}*/
			}
			else
						{			
							alert("Please Enter Contact Number");
							return false;
						}
		}
		/*else
		{
			alert("Enter Alphabets Only in Person name field..!!");
			return false;
		}
		}
		else
		{
		alert("Enter person Name");
		return false;
		}
		}*/
		else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}
	} else {
		alert("Enter Vendor  Name.");
		return false;
	}
	
} else {
	alert(" Please Enter Vendor Code ");
	return false;
}

}

function supDetails() {

	document.getElementById('saveSupplierDetailsBtn').disabled = true;

	var dealerName = $('#dealerName').val();
	var personName = $('#personName').val();
	var contactNo = $('#contactNo1').val()
	var landline = $('#landline').val();
	var emailId = $('#emailId').val();
	var tinNo = $('#tinNo1').val();
	var city = $('#city1').val();
	var address = $('#address1').val();
	var IdNo = $('#IdNo1').val();

	var params = {};
	
	if(personName=="" |personName==null |personName=="undefined")
	{
		personName="N/A";
	}
	if(landline=="" |landline==null |landline=="undefined" )
		{
		landline="00"
		}

	params["dealerName"] = dealerName;
	params["personName"] = personName;
	params["contactNo"] = contactNo;
	params["landline"] = landline;
	params["emailId"] = emailId;
	params["tinNo"] = tinNo;
	params["city"] = city;
	params["address"] = address;
	params["IdNo"] = IdNo;

	params["methodName"] = "supplierDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.getElementById('saveSupplierDetailsBtn').disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function reset() {
	document.spld.reset();

}

/********* Edit Supplier Details ************/
function getSupplierDetails() {
	var params = {};

	var input = document.getElementById('supplier'), list = document
			.getElementById('sup_drop'), i, fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}

	$("#dealerName").append($("<input/>").attr("value", "").text());
	$("#personName").append($("<input/>").attr("value", "").text());
	$("#contactNo").append($("<input/>").attr("value", "").text());
	$("#landline").append($("<input/>").attr("value", "").text());
	$("#emailId").append($("<input/>").attr("value", "").text());
	$("#city").append($("<input/>").attr("value", "").text());
	$("#tinNo").append($("<input/>").attr("value","").text());
	$("#address").append($("<input/>").attr("value", "").text());
	$("#IdNo").append($("<input/>").attr("value", "").text());

	params["SupplierId"] = fkRootSupId;
	params["methodName"] = "getSupplierDetailsToEdit";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			document.getElementById("dealerName").value = v.dealerName;
			document.getElementById("personName").value = v.personName;
			document.getElementById("contactNo").value = v.contactNo;
			document.getElementById("landline").value = v.landline;
			document.getElementById("emailId").value = v.email;
			document.getElementById("city").value = v.city;
			document.getElementById("tinNo").value = v.tin;
			document.getElementById("address").value = v.address;
			document.getElementById("IdNo").value = v.IdNo;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}
//Edit suplier details validation
function supplierDetail1() {
	if (document.spld1.dealerName.value != "") {
		var letterNumber = /^[a-zA-Z, ]+$/;
		if (document.spld1.dealerName.value.match(letterNumber)) {

			if (document.spld1.contactNo.value != "") {
				var contactno = /^\d{10}$/;
				if (document.spld1.contactNo.value.match(contactno)) {
					if (document.spld1.city.value != "") {
						var City = /^[a-zA-Z, ]+$/;
						if (document.spld1.city.value.match(City)) {
							if (document.spld1.tinNo.value != "") {
								var GstNo = /^[a-zA-Z,0-9]+$/;
								if (document.spld1.tinNo.value.match(GstNo)) {
									updateSupplierDetails();
								} else {
									alert(" Alphanumerics Are allowed in GST");
									return false;
								}
							} else {

								alert("Please Enter GST Number");
								return false;
							}

						} else {
							alert("Only Alphabets Are allowed in City");
							return false;
						}
					} else {

						alert("Please Enter City");
						return false;
					}

				} else {
					alert("Enter 10 Digit Mobile Number ");
					return false;
				}

			} else {
				alert("Please Enter Contact Number");
				return false;
			}
		} else {
			alert("Enter Alphabets Only in Dealer name field..!!");
			return false;
		}

	} else {
		alert("Enter Vendor Name.");
		return false;
	}

}

function updateSupplierDetails() {

	document.spld1.btn.disabled = true;

	var input = document.getElementById('supplier'), list = document
			.getElementById('sup_drop'), i, fkRootSupId;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input.value) {
			fkRootSupId = list.options[i].getAttribute('data-value');
		}
	}

	//var customerId = document.getElementById("customerId").value;

	
	var dealerName = $('#dealerName').val();
	var personName = $('#personName').val();
	var contactNo = $('#contactNo').val();
	//var salePrice = $('#salePrice').val();
	var landline = $('#landline').val();
	var emailId = $('#emailId').val();
	var city = $('#city').val();
	var tinNo = $('#tinNo').val();
	var address = $('#address').val();
	//var IdNo = $('#IdNo').val();

	var params = {};
	
	if(personName=="" |personName==null |personName=="undefined")
	{
		personName="N/A";
	}
	if(landline=="" |landline==null |landline=="undefined")
		{
		landline="00"
		}

	params["supplierId"] = fkRootSupId;

	params["dealerName"] = dealerName;
	params["personName"] = personName;
	params["contactNo"] = contactNo;
	//params["salePrice"] = salePrice;
	params["landline"] = landline;
	params["emailId"] = emailId;
	params["city"] = city;
	params["tinNo"] = tinNo;
	params["address"] = address;
	//params["IdNo"] = IdNo;

	params["methodName"] = "updateSupplierDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.spld1) {
			document.spld1.reset();
		}
		document.spld1.btn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {

		/*alert("Data Added Successfully..");
		location.reload();
		document.ccd.btn.disabled =false;*/

		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

