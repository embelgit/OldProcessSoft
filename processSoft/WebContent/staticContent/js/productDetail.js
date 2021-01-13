//sale price compaire with MRP
function salePriceCompaireWithMRP() {
	var salePrice = $('#salePrice').val();
	var mrp = $('#mrp').val();

	if (salePrice > mrp) {
		alert("Sale Price Should be less than MRP")
	}
}
// Credit sale price compaire with MRP
/*
 * function creditSalePriceCompaireWithMRP(){ var
 * salePrice=$('#creditSalePrice').val(); var mrp = $('#mrp').val();
 * 
 * if(salePrice>mrp){ alert("Credit Sale Price Should be less than MRP") }
 *  }
 */

//this function for Save product data in Database
function productDetails() {

	if (document.prd.productName_1.value == "") {
		alert("Please Enter product Name");
		return false;
	}
	
	
	if (document.prd.fk_tax_id.value == "selected") {
		alert("Please select Product Gst Tax Type");
		return false;
	}
	if (document.prd.hsn.value == "") {
		alert("Please Enter Hsn No");
		return false;
	}
	if (document.prd.salePrice.value == "") {
		alert("Enter rate.");
		return false;
	}
	

	if (document.prd.productName_1.value == "") {
		alert("Enter Product Name.");
		return false;
	}
	var letterNumber = /^[a-zA-Z0-9\\.;,:()' ]{0,100}$/;
	if (document.prd.productName_1.value.match(letterNumber)) {

		prdctDetails();
	}

	else {
		alert("Enter Alphabets And Numbers Only in Product Name field..!!");
		return false;
	}
}

function prdctDetails() {

	document.getElementById('submitProductDtlBtn').disabled = true;
	//document.productDtl.productDtlBtn.disabled = true;

	var i, fk_cat_id;
	var productName = $('#productName_1').val();
	var manufacturingCompany = $('#manufacturingCompany').val();
	// var unitName= $('#unitName').val();
	/* var weight=$('#weight').val(); */
	/* var buyPrice=$('#buyPrice').val(); */
	var Rate = $('#Rate').val();
	/* var creditSalePrice=$('#creditSalePrice').val(); */
	var taxpercentage = $('#taxPercentage').val();
	/* var mrp = $('#mrp').val(); */
	var fk_tax_id = $('#fk_tax_id').val();
	var IdNo = $('#pidno').val();
	var hsn = $('#hsn').val();

	/*
	 * productId = $('#subCat').val();
	 * 
	 * 
	 * 
	 * $("#subCat option:selected").each(function() { selectedVal =
	 * $(this).text(); });
	 * 
	 * var splitText = selectedVal.split(",");
	 * 
	 * var fk_subCat_id = splitText[1];
	 */
	/*
	 * productId = $('#shopName').val();
	 * 
	 * $("#shopName option:selected").each(function() { selectedVal =
	 * $(this).text(); });
	 * 
	 * var splitText = selectedVal.split(",");
	 * 
	 * var fk_shop_id = $('#shopName').val();
	 */

	/*
	 * var input1 = document.getElementById('fk_cat_id'); list =
	 * document.getElementById('cat_drop'), i,fk_cat_id; for (i = 0; i <
	 * list.options.length; ++i) { if (list.options[i].value === input1.value) {
	 * fk_cat_id = list.options[i].getAttribute('data-value'); } }
	 */

	/*
	 * var input3 = document.getElementById('fk_unit_id'), list3 =
	 * document.getElementById('unit_drop'), i,fk_unit_id; for (i = 0; i <
	 * list3.options.length; ++i) { if (list3.options[i].value === input3.value) {
	 * fk_unit_id = list3.options[i].getAttribute('data-value'); } }
	 */

	var params = {};
	
	if(hsn=="" |hsn==null |hsn=="undefined")
	{
		hsn="00";
	}
	if(manufacturingCompany=="" | manufacturingCompany==null | manufacturingCompany=="undefined")
		{
		manufacturingCompany="N/A"
		}
	
	params["fkTaxId"] = fk_tax_id;
	params["taxPercentage"] = taxpercentage;
	/* params["mrp"] = mrp; */
	/*
	 * params["fk_cat_id"] = fk_cat_id; params["fk_subCat_id"]= fk_subCat_id;
	 */params["productName"] = productName;
	// params["unitName"] =unitName;
	params["manufacturingCompany"] = manufacturingCompany;
	/* params["weight"] =weight; */
	/* params["fk_unit_id"] = fk_unit_id; */
	/* params["buyPrice"] = buyPrice; */
	params["Rate"] = Rate;
	params["IdNo"] = IdNo;
	// params["fk_shop_id"]= fk_shop_id;
	/* params["creditSalePrice"] = creditSalePrice; */
	params["hsn"] = hsn;
	params["methodName"] = "proDetails";
	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		location.reload();
		document.getElementById('submitProductDtlBtn').disabled = false;
		//document.productDtl.productDtlBtn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}

function reset() {
	document.prd.reset();
}

/** ***************** For reports ************** */

function getProductDetailAsperCategory() {

	var params = {};

	var input1 = document.getElementById('fk_cat_id'), list = document
			.getElementById('cat_drop'), i, fk_cat_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_cat_id = list.options[i].getAttribute('data-value');
		}
	}

	params["cat"] = fk_cat_id;
	params["methodName"] = "getProductDetailForReportAsPerCat";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		$('#example1').dataTable().fnClearTable();

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;

		$(document).ready(function() {
			var total = $('#example1').DataTable({

				fnRowCallback : function(nRow, aData, iDisplayIndex) {
					$("th:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},

				/*
				 * "footerCallback": function ( row, data, start, end, display ) {
				 * var api = this.api(), data;
				 *  // Remove the formatting to get integer data for summation
				 * var intVal = function ( i ) { return typeof i === 'string' ?
				 * i.replace(/[\$,]/g, '')*1 : typeof i === 'number' ? i : 0; };
				 *  // Total over all pages total = api .column( 7 ) .data()
				 * .reduce( function (a, b) { return intVal(a) + intVal(b); }, 0 );
				 * console.log(total); // Total over this page pageTotal = api
				 * .column( 5 ) .data() .reduce( function (a, b) { return
				 * intVal(a) + intVal(b); }, 0 );
				 * 
				 *  // Update footer $( api.column( 7 ).footer() ).html( //
				 * 'Rs'+' '+pageTotal.toFixed(2) str = pageTotal.toFixed(0) );
				 * console.log( pageTotal);
				 *  // Total over this page
				 * 
				 * 
				 *  },
				 */

				destroy : true,
				searching : false,

				columns : [

				{
					"data" : "productName",
					"width" : "5%"
				}, {
					"data" : "ManufacturingCompany",
					"width" : "5%"
				}, {
					"data" : "buyPrice",
					"width" : "5%"
				}, {
					"data" : "salePrice",
					"width" : "5%"
				} ],

			});
		});

		var mydata = catmap;
		$('#example1').dataTable().fnAddData(mydata);

	}

	);

}

/** **************** For Edit Product Details ******************* */
function getAllProductDetails() {
	var params = {};
	var input1 = document.getElementById('fk_product_id'), list = document
			.getElementById('pro_drop'), i, fk_product_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_product_id = list.options[i].getAttribute('data-value');
		}
	}
	$("#productName").append($("<input/>").attr("value", "").text());
	$("#manufacturingCompany").append($("<input/>").attr("value", "").text());
	$("#existedTax").append($("<input/>").attr("value", "").text());
	$("#existedTaxPercentage").append($("<input/>").attr("value", "").text());
	$("#rate").append($("<input/>").attr("value", "").text());
	$("#mrp").append($("<input/>").attr("value", "").text());
	$("#existedHsn").append($("<input/>").attr("value", "").text());
	$("#creditSalePrice").append($("<input/>").attr("value", "").text());
	$("#hsncode").append($("<input/>").attr("value", "").text());
	params["productId"] = fk_product_id;

	params["methodName"] = "getProuctDetailsToEdit";

	$
			.post(
					'/processSoft/jsp/utility/controller.jsp',
					params,
					function(data) {

						var jsonData = $.parseJSON(data);
						var catmap = jsonData.list;
						$
								.each(
										jsonData,
										function(i, v) {
											document
													.getElementById("productName").value = v.product;
											document
													.getElementById("manufacturingCompany").value = v.manufacturer;
											document
													.getElementById("existedTax").value = v.taxType;
											document
													.getElementById("existedTaxPercentage").value = v.taxPercentage;
											/*document
													.getElementById("existedHsn").value = v.;Hsn;*/
											document.getElementById("rate").value = v.buyPrice
											document.getElementById("hsncode").value = v.hsncode
										});
					}).error(function(jqXHR, textStatus, errorThrown) {
				if (textStatus === "timeout") {

				}
			});

}

// update/edit product details
function updateProductDetails() {

	if (document.prd1.fk_product_id.value == "") {
		alert("Select Product Name.");
		return false;
	}	

	/*if (document.prd1.manufacturingCompany.value == "") {
		alert("Enter Manufacturing Company Name.");
		return false;
	}*/
	var letterNumber = /^[a-zA-Z]+$/;

	if (document.prd1.fk_tax_id.value == ""
			|| document.prd1.fk_tax_id.value == "selected") {
		alert("Please select New Tax type");
		return false;
	}
	if (document.prd1.taxPercentage.value == "") {
		alert("Please Enter New Tax Percentage");
		return false;
	}
	var letterNumber = /^[0-9]+([.][0-9]+)?$/;
	if (document.prd1.taxPercentage.value.match(letterNumber)) {
		addEditedProductDetails();
	}

	else {
		alert("Enter Numbers Only in Tax Percentage field..!!");
		return false;
	}
}

function addEditedProductDetails() {
	document.prd1.btn.disabled = true;
	document.getElementById('UpdateProductDtlBtn').disabled = true;

	var input1 = document.getElementById('fk_product_id'), list = document
			.getElementById('pro_drop'), i, fk_product_id;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			fk_product_id = list.options[i].getAttribute('data-value');
		}
	}

	// var customerId = document.getElementById("customerId").value;
	var productName = $('#productName').val();
	var manufacturingCompany = $('#manufacturingCompany').val();
	var fk_tax_id = $('#fk_tax_id').val();
	var taxPercentage = $('#taxPercentage').val();
	/*
	 * var buyPrice = $('#buyPrice').val(); var mrp = $('#mrp').val(); var
	 * salePrice = $('#salePrice').val(); var creditSalePrice =
	 * $('#creditSalePrice').val();
	 */
	var rate = $('#rate').val();
	var existedTax = $('#existedTax').val();
	var existedTaxPercentage = $('#existedTaxPercentage').val();
	var newHsn = $('#hsncode').val();

	var params = {};

	params["productId"] = fk_product_id;
	params["manufacturingCompany"] = manufacturingCompany;
	params["fk_tax_id"] = fk_tax_id;
	params["taxPercentage"] = taxPercentage;
	params["productName"] = productName;
	params["rate"] = rate;
	/*
	 * params["buyPrice"] =buyPrice; params["mrp"] = mrp; params["salePrice"] =
	 * salePrice; params["creditSalePrice"] = creditSalePrice;
	 */

	params["existedTaxPercentage"] = existedTaxPercentage;
	params["existedTax"] = existedTax;
	params["hsncode"] = newHsn;

	params["methodName"] = "updateProductDetails";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {
		alert(data);
		if (document.prd1) {
			document.prd1.reset();
		}
		document.getElementById('UpdateProductDtlBtn').disabled = false;
		document.prd1.btn.disabled = false;
	}).error(function(jqXHR, textStatus, errorThrown) {

		/*
		 * alert("Data Added Successfully.."); location.reload();
		 * document.ccd.btn.disabled =false;
		 */

		if (textStatus === "timeout") {
			$(loaderObj).hide();
			$(loaderObj).find('#errorDiv').show();
		}
	});

}
function getAllSubCat() {

	var input = document.getElementById('fk_cat_id'), list1 = document
			.getElementById('cat_drop'), i, fk_cat_id;

	for (i = 0; i < list1.options.length; ++i) {
		if (list1.options[i].value === input.value) {
			fk_cat_id = list1.options[i].getAttribute('data-value');
		}
	}

	$("#subCat").empty();
	$("#subCat").append(
			$("<option></option>").attr("value", "")
					.text("Select Sub Category"));
	var params = {};

	params["fk_cat_id"] = fk_cat_id;

	params["methodName"] = "getSubCategoryDetails";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#subCat").append(
							$("<option></option>").attr("value", count).text(
									v.subcategoryName + "," + v.subcatId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

function getAllShopName() {

	$("#shopName").empty();
	$("#shopName").append(
			$("<option></option>").attr("value", "").text("Select Shop Name"));
	var params = {};

	params["methodName"] = "getShopDetails";

	$.post(
			'/processSoft/jsp/utility/controller.jsp',
			params,
			function(data) {
				var count = 1;

				var jsonData = $.parseJSON(data);
				// var jsonData = jsonData.list;
				$.each(jsonData, function(i, v) {
					$("#shopName").append(
							$("<option></option>").attr("value", count).text(
									v.shopName + "," + v.shopId));
					count++;
				});
			}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});
}

//this finction for get vendor details on slecting vender name

function getvenderDataForPDdetails() {
	var params = {};
	var input1 = document.getElementById('suppliername'), list = document
			.getElementById('dealerName_drop'), i, suppliername;
	for (i = 0; i < list.options.length; ++i) {
		if (list.options[i].value === input1.value) {
			suppliername = list.options[i].getAttribute('data-value');
		}
	}
	/*$("#IdNo").append($("<input/>").attr("value", "").text());*/
	$("#city").append($("<input/>").attr("value", "").text());
	$("#tinNo").append($("<input/>").attr("value", "").text());
	$("#contactNo").append($("<input/>").attr("value", "").text());
	$("#address").append($("<input/>").attr("value", "").text());

	/*$("#existedTaxPercentage").append($("<input/>").attr("value", "").text());
	$("#buyPrice").append($("<input/>").attr("value", "").text());
	$("#mrp").append($("<input/>").attr("value", "").text());
	$("#existedHsn").append($("<input/>").attr("value", "").text());
	$("#creditSalePrice").append($("<input/>").attr("value", "").text());*/

	params["supId"] = suppliername;

	params["methodName"] = "getvenderDetailsToPODetail";

	$.post('/processSoft/jsp/utility/controller.jsp', params, function(data) {

		var jsonData = $.parseJSON(data);
		var catmap = jsonData.list;
		$.each(jsonData, function(i, v) {
			
			/*document.getElementById("IdNo").value = v.IdNo;*/
			document.getElementById("city").value = v.city;
			document.getElementById("tinNo").value = v.tin;
			document.getElementById("contactNo").value = v.contactNo;
			document.getElementById("address").value = v.address;

		});
	}).error(function(jqXHR, textStatus, errorThrown) {
		if (textStatus === "timeout") {

		}
	});

}
