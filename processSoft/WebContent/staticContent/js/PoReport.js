/* Reports for Po details Shop NAME WISE */
function PoReportAsPerShopNameWise(){
	if(document.PoReportShopNameForm.ShopName.value == "")
	{
		alert("Please select Shop Name");
		return false;
	}
	PoReportAsPerShopNameWise1();
}

function PoReportAsPerShopNameWise1()
{
	var params= {};
	var ShopName = $("#ShopName").val(); 
	
	params["ShopName"]= ShopName;
	params["methodName"] = "getPoDetailsAsPerShopWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#ShopTbl').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == ""||catmap ==null) {
					alert("there is no data available for selected field.");
					return false;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#ShopTbl').DataTable( {
					 		fnRowCallback : function(nRow, aData, iDisplayIndex){
				            $("th:first", nRow).html(iDisplayIndex +1);
				            return nRow;
				        },
			   "footerCallback": function ( row, data, start, end, display ) 
			   {
		            var api = this.api(), data;
	                // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		            return typeof i === 'string' ?
		            i.replace(/[\$,]/g, '')*1 :
				    typeof i === 'number' ?
	                i : 0;
               };
       
               // Total over this page
	            pageTotal = api
	                .column( 4 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 4 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "productname", "width": "5%"},
           {"data": "date", "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "rate" , "width": "5%"},
           {"data": "gridTotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Vendor Name Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Vendor Name Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#ShopTbl').dataTable().fnAddData(mydata);

}


);

}

/*Report For Po Details As Per Range Wise*/

function PoReportAsPerRangeWise(){
	if(document.PoReportFormRange.ShopName2.value == "")
	{
		alert("Please select Shop Name");
		return false;
	}
	
	if(document.PoReportFormRange.fisDate.value == "")
	{
		alert("Please select Start Name");
		return false;
	}
	
	if(document.PoReportFormRange.endDate.value == "")
	{
		alert("Please select End Name");
		return false;
	}
	
	PoReportAsPerRangeWise1();
}

function PoReportAsPerRangeWise1()
{
	var params= {};
	var fisDate = $("#fisDate").val(); 
	var endDate = $("#endDate").val();
	var ShopName2 = $("#ShopName2").val();
	
	params["ShopName2"]= ShopName2;
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getPoDetailsAsPerRangeWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#VendorTblRange').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#VendorTblRange').DataTable( {
					 		fnRowCallback : function(nRow, aData, iDisplayIndex){
				            $("th:first", nRow).html(iDisplayIndex +1);
				            return nRow;
				        },
			   "footerCallback": function ( row, data, start, end, display ) 
			   {
		            var api = this.api(), data;
	                // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		            return typeof i === 'string' ?
		            i.replace(/[\$,]/g, '')*1 :
				    typeof i === 'number' ?
	                i : 0;
               };
       
               // Total over this page
	            pageTotal = api
	                .column( 4 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 4 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "productname", "width": "5%"},
           {"data": "date", "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "rate" , "width": "5%"},
           {"data": "gridTotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Vendor Name Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Vendor Name Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTblRange').dataTable().fnAddData(mydata);

}


);

}

/*Reports for Po details Vender NAME WISE*/
function PoReportAsPerVendorNameWise(){
	if(document.PoReportvendorwiseForm.ShopName1.value == "")
	{
		alert("Please select Shop Name");
		return false;
	}
	
	if(document.PoReportvendorwiseForm.VendorName.value == "")
	{
		alert("Please select Vendor Name");
		return false;
	}
	
	PoReportAsPerVendorNameWise1();
}
function PoReportAsPerVendorNameWise1()
{
	var params= {};
	var VendorName = $("#VendorName").val(); 
    var ShopName1 = $("#ShopName1").val(); 
	
	params["ShopName1"]= ShopName1;
	params["VendorName"]= VendorName;
	
	params["methodName"] = "getPoDetailsAsPerVendorWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#VendorTbl').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#VendorTbl').DataTable( {
					 		fnRowCallback : function(nRow, aData, iDisplayIndex){
				            $("th:first", nRow).html(iDisplayIndex +1);
				            return nRow;
				        },
			   "footerCallback": function ( row, data, start, end, display ) 
			   {
		            var api = this.api(), data;
	                // Remove the formatting to get integer data for summation
		            var intVal = function ( i ) {
		            return typeof i === 'string' ?
		            i.replace(/[\$,]/g, '')*1 :
				    typeof i === 'number' ?
	                i : 0;
               };
       
               // Total over this page
	            pageTotal = api
	                .column( 4 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 4 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "productname", "width": "5%"},
           {"data": "date", "width": "5%"},
           {"data": "quantity" , "width": "5%"},
           {"data": "rate" , "width": "5%"},
           {"data": "gridTotal", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'csvHtml5',
               title: 'Vendor Name Wise Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'Vendor Name Wise Report'
           },
           {
           	 extend: 'print',
               title: 'Vendor Name Wise Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#VendorTbl').dataTable().fnAddData(mydata);

}


);

}