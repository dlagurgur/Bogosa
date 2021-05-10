<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->
	<script id="config1" src="${project}script.js"></script>
<style>



</style>
	</head>
	<body>
		
		
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck mt-4 mb-4">
				<c:forEach var="menu" items="${menus}">
				<a class="menuListItem" href="product_detail.go?product_id=${menu.product_id}">
					<div class="card mt-4 mb-4">
						<img class="card-img-top img-fluid" src="menu_images/${menu.product_image}" alt="Menu Img" style="width: 300px; height: 250px;">
						<div class="card-body text-center font-weight-bold flex-fill">
							<b class="card-title text-danger">${menu.product_name}</b>
							<p class="card-text text-dark">${menu.product_price}원</p>
						</div>
					</div>
				</a>
				</c:forEach>
			</div>
			
		</div>
<iframe src="${project}config.txt" id="config"></iframe>
	</body>
	
	
<script src="${project}aws-sdk-2.897.0.min.js"> </script>

<script type="text/javascript">



AWS.config.region = 'us-east-1'; // 리전
AWS.config.update({"accessKeyId": "AKIAUUHFXRLVBFMMWAY3","secretAccessKey": "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","region": "us-east-1"});

var ivs = new AWS.IVS();

var params = {
    authorized : false ,
    name: 'test7' //{user_id를 채널이름으로}
  };
  
  ivs.createChannel(params, function(err, data) {
    if (err) console.log(err, err.stack); // an error occurred
    else     console.log(data);           // successful response
    var a = (JSON.stringify(data))
    console.log(a)
    var a1 = JSON.parse(channel) 
    console.log(a1)
  });
  </script>
  


 
</html> 


<!-- 
// var AWS = require("aws-sdk");

AWS.config.update({
  "accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
  "secretAccessKey": "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",
  "region": "us-east-1"
});

// AWS.config.loadFromPath('./config.json');
AWS.config.region = 'us-east-1'; // 리전

var ivs = new AWS.IVS();

var params = {
    authorized : false ,
    name: 'test4' //{user_id를 채널이름으로}
  };
  ivs.createChannel(params, function(err, data) {
    if (err) console.log(err, err.stack); // an error occurred
    else     console.log(data);        
    var a = data.channel.playbackUrl;
    var b = data.streamKey.value;
    var c = data.channel.ingestEndpoint;
    console.log(a);
    console.log(b);
    // return a, b; // successful response
  });


//   ivs.createChannel(params, function(err, data) {
//     if (err) console.log(err, err.stack); // an error occurred
//     else
//     var elements = JSON.parse(data);
//     return elements;           // successful response
//   });

// //   {
// //     "channel": { 
// //        "arn": "string",
// //        "authorized": boolean,
// //        "ingestEndpoint": "string",
// //        "latencyMode": "string",
// //        "name": "string",
// //        "playbackUrl": "string",
// //        "recordingConfigurationArn": "string",
// //        "tags": { 
// //           "string" : "string" 
// //        },
// //        "type": "string"
// //     },
// //     "streamKey": { 
// //        "arn": "string",
// //        "channelArn": "string",
// //        "tags": { 
// //           "string" : "string" 
// //        },
// //        "value": "string"
// //     }
// //  }

// // var params = {
// //     arn: 'STRING_VALUE' /* required */
// //   };
//   ivs.deleteChannel(params, function(err, data) {
//     if (err) console.log(err, err.stack); // an error occurred
//     else     console.log(data);           // successful response
//   });

  



// // var params = {
// //     arn: 'STRING_VALUE' /* required */
// //   };

//   ivs.getChannel(params, function(err, data) {
//     if (err) console.log(err, err.stack); // an error occurred
//     else     console.log(data);           // successful response
//   });

// //   {
// //     "channel": { 
// //        "arn": "string",
// //        "authorized": boolean,
// //        "ingestEndpoint": "string",
// //        "latencyMode": "string",
// //        "name": "string",
// //        "playbackUrl": "string",
// //        "recordingConfigurationArn": "string",
// //        "tags": { 
// //           "string" : "string" 
// //        },
// //        "type": "string"
// //     }
// //  }



 -->
