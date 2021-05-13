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
<%@include file="header.jsp"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->
	<script id="config1" src="${project}script.js"></script>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  background-color: #151515;
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}

a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


h3 {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}

.site__container {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 3rem 0;
}

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form input[type="number"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #1C1C1C;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"],.form input[type="number"], .form--login input[type="password"] {
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login .form input[type="number"]:focus,input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #2E2E2E;
}

.form--login input[type="submit"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}



.form--login button[type="button"] {
  border-radius: 0.15rem;
  padding: 1rem;
}

.form button[type="button"] {
  width: 100%;
}



.form--login button[type="button"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}

.form--login button[type="button"]:focus, .form--login input[type="button"]:hover {
  background-color: #AC58FA;
}


.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

.card{
background-color: bg-black;
}
</style>


	</head>
	<body>
		
		
		
		<!-- Container -->
		<div class="container">
			
			<!-- Menu List shown in Cards -->
			<div class="card-deck bg-black mt-4 mb-4" style="background-color: #151515;">
				<c:forEach var="menu" items="${menus}">
				<a class="menuListItem" href="product_detail.go?product_id=${menu.product_id}">
					<div class="card bg-black mt-4 mb-4" style="background-color: #151515;">
						<img class="card-img-top img-fluid" src="menu_images/${menu.product_image}" alt="Menu Img" style="width: 300px; height: 170px;">
						<div class="card-body text-center font-weight-bold flex-fill" style="background-color:#151515;">
							<b class="card-title" style="color:#D8D8D8;">${menu.product_name}</b>
							<p class="card-text" style="color:#D8D8D8;">${menu.product_price}원</p>
						</div>
					</div>
				</a>
				</c:forEach>
			</div>
			
		</div>
	</body>
	
	


<script type="text/javascript">

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
