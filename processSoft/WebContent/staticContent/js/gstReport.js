
function getGstSaleReportPercentageWise()
{
	var params= {};
	var fisDate = $("#startDate1").val(); 
	var endDate = $("#enddate1").val();
	
	
	params["startDate1"]= fisDate;
	params["enddate1"]= endDate;
	
	params["methodName"] = "getgstsalePerRangeWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#RangewiseAndPercentageWiseSaleGstReport1').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#RangewiseAndPercentageWiseSaleGstReport1').DataTable( {
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
	                .column( 1 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 1 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
	            pageTotal = api
	                .column( 2 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 2 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
	            pageTotal = api
	                .column( 3 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 3 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
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
	           
	            // Total over this page
	            pageTotal = api
	                .column( 5 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 5 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "gst", "width": "5%"},
           {"data": "tValue", "width": "5%"},
           {"data": "Cgst" , "width": "5%"},
           {"data": "Sgst" , "width": "5%"},
           {"data": "IGst" , "width": "5%"},
           {"data": "Totalgst", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'GST Sale Reports'
           },
           {
               extend: 'csvHtml5',
               title: 'GST Sale Reports'
           },
       	{
               extend: 'excelHtml5',
               title: 'GST Sale Reports'
           },
           {
               extend: 'pdfHtml5',
               title: 'GST Sale Reports'
           },
           {
           	 extend: 'print',
               title: 'GST Sale Reports'
           }
       ]
   } );

} );

var mydata = catmap;
$('#RangewiseAndPercentageWiseSaleGstReport1').dataTable().fnAddData(mydata);

}


);

}
//gst sale report range wise
function getRangeWiseGSTSaleReport()
{
	var params= {};
	var fisDate = $("#startDate").val(); 
	var endDate = $("#enddate").val();
	
	
	params["startDate"]= fisDate;
	params["enddate"]= endDate;
	
	params["methodName"] = "getgstsalereportRangeWise";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#RangewiseSaleGstReport').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#RangewiseSaleGstReport').DataTable( {
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
$('#RangewiseSaleGstReport').dataTable().fnAddData(mydata);

}


);

}

//gst purchase range wise 
function getRangeWiseGSTPurchaseReport()
{
	var params= {};
	var fisDate = $("#fisDatep").val(); 
	var endDate = $("#endDatep").val();
	
	
	params["fisDatep"]= fisDate;
	params["endDatep"]= endDate;
	
	params["methodName"] = "getgstsalePerRangeWise1";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#RangewisePurchaseGstReport').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#RangewisePurchaseGstReport').DataTable( {
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
	                .column( 1 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 1 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
	            pageTotal = api
	                .column( 2 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 2 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            // Total over this page
	            pageTotal = api
	                .column( 3 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 3 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
	            
	            
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
	            
	            
	            // Total over this page
	            pageTotal = api
	                .column( 5 )
	                .data()
	                .reduce( function (a, b) 
	                		{
	                          return intVal(a) + intVal(b);
	                        }, 0 );
	 
	            // Update footer
	            $( api.column( 5 ).footer() ).html(
	              parseFloat(pageTotal).toFixed(2)
	            );
	            console.log( pageTotal);
           
           
       },
   	   destroy: true,
       searching: false,
       columns: [
           {"data": "gst", "width": "5%"},
           {"data": "tValue", "width": "5%"},
           {"data": "Cgst" , "width": "5%"},
           {"data": "Sgst" , "width": "5%"},
           {"data": "IGst" , "width": "5%"},
           {"data": "Totalgst", "width": "5%"},
       ],
       
       dom: 'Bfrtip',
       buttons: [

       	{
               extend: 'copyHtml5',
               title: 'GST Purchase Report'
           },
           {
               extend: 'csvHtml5',
               title: 'GST Purchase Report'
           },
       	{
               extend: 'excelHtml5',
               title: 'GST Purchase Report'
           },
           {
               extend: 'pdfHtml5',
               title: 'GST Purchase Report'
           },
           {
           	 extend: 'print',
               title: 'GST Purchase Report'
           }
       ]
   } );

} );

var mydata = catmap;
$('#RangewisePurchaseGstReport').dataTable().fnAddData(mydata);

}


);

}

//gst purchase report range wise
function saleReportBetweenTwoDatesAsPerCategory()
{
	var params= {};
	var fisDate = $("#fisDate").val(); 
	var endDate = $("#endDate").val();
	
	
	params["fisDate"]= fisDate;
	params["endDate"]= endDate;
	
	params["methodName"] = "getgstpurchasePerRangeWise2";
	$.post('/processSoft/jsp/utility/controller.jsp',params,function(data)
			{
				$('#saleBetTwoDates').dataTable().fnClearTable();
				var jsonData = $.parseJSON(data);
				var catmap = jsonData.list;
				
				if (catmap == "") {
					alert("there is no data available for selected field.");
					return true;
				}
				
				$(document).ready(function() 
						{
					 		var total =   $('#saleBetTwoDates').DataTable( {
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
$('#saleBetTwoDates').dataTable().fnAddData(mydata);

}


);

}