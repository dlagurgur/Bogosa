<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		<script src="${project}script.js"></script>
		<script src="//code.jquery.com/jquery.js"></script>
<style type="text/css">
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

button {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
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

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form button[type="button"],.form input[type="number"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"],
.form--login button[type="button"] {
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


</style>

	</head>
	<body>
		
		<!-- Container -->
<!--
		<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>
	  	
<video controls id="video-player" style="
    padding-top: 0px;
    padding-left: 0px;
    height: 750px;
    width: 1300px;
    margin-left: 70px;
    margin-top: 20px;
"></video>
-->


  


<h1 style="
    padding-left: 60px;
    padding-bottom: 0px;
    color:white;
    margin-bottom: 0px;
    width: 1550px;
    height: 5px;
    margin-top: 20px;
">${Trailer_dto.trailer_name}</h1>

 <!--  

        <input id="inputMessage" type="text" style=" background-color: black; color:white;"/>
        <input type="submit" value="send" onclick="send()" style=" background-color: black; color:white;"/>
-->





			<!-- Menu Item -->





<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" /> 
<input type="hidden" name="aws_url" id="aws_url" value="${Trailer_dto.trailer_aws_url}" /> 

<div class="site__container">

    <div class="grid__container">

	<form class="form form--login" id="menuform" name="menuform" role="form" style="width: 870px;margin-left: 100px;margin-bottom: 0px;margin-top: -545;">
      
    	        
        <div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">판매자</label>
				<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.user_id}" readonly>
		</div>
		
		<div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">상품설명</label>
				<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.trailer_detail}" readonly>
		</div>
		
		<div class="form__field">
		       <label for="nickname" class="col-sm-3 col-form-label" style="color:white;">가격</label>
				<input style="color:white;" class="form__input" type="text" value="${Trailer_dto.trailer_price}원" readonly>
		</div>

					
					
				
					<input type="hidden" name="menu_id" value="${Trailer_dto.trailer_id}">
					<input type="hidden" name="menu_name" value="${Trailer_dto.trailer_name}">
					<input type="hidden" name="menu_price" value="${Trailer_dto.trailer_price}">
					
		
		


				<!--  
					<div class="form__field">
						
						<button type="button" class="btn btn-lg btn-secondary btn-block"  onclick="orderNow(${Produt_dto.product_id})">바로 주문하기</button>
					</div>
					-->
					
			</form>
					</div>
			</div>
				
	
			
			
	
	</body>
	
	

		<c:if test="${sessionScope.user_id != null}">
			<div class="container">
				<label for="content">comment</label>
				<form name="commentInsertForm" method="post">
					<div class="input-group">
						<input type="hidden" name="trailer_id" value="${Trailer_dto.trailer_id}" /> <input
							type="hidden" name="session" value="${sessionScope.user_id}" /> <input
							type="text" class="input col-11" id="comment_content" name="comment_content"
							placeholder="댓글"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="commentInsert()">등록</button>
						</span>
					</div>
				</form>
			</div>
		</c:if>
		<div class="commentList"></div>

 <script type="text/javascript">
 /*
 AWS.config.update({
   "accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
   "secretAccessKey": "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",
   "region": "us-east-1"
 });

 var s3 = new AWS.S3();
    
     s3.getObject({
         Bucket: "transvideo-source71e471f1-knewdmajkw29", 
         Key: "jobs-manifest.json"
        }
        , function(err, data) {
         if (err) console.log(err, err.stack); // an error occurred
         else
            // console.log(data.Body.toString());           // successful response
            data = data.Body.toString();
            // console.log(a);
            data = JSON.parse(data);
            
            data = data.Jobs.filter(function(element){
                return element.InputFile == 's3://transvideo-source71e471f1-knewdmajkw29/assets01/파일명';
        
             });
            console.log(data[0].Outputs.HLS_GROUP[0]);
        });

     
     
        s3.upload({
            Bucket: 'bucket',
             Key: '업로드할 파일명'}, function(err, data) {
         console.log(err, data);
       });

*/

//     s3.getObject(params, function(err, data) {
//       if (err) console.log(err, err.stack); // an error occurred
//       else
//          // console.log(data.Body.toString());           // successful response
//          var a = data.Body.toString();
//          // console.log(a);
//          var b = JSON.parse(a);
//          var c = b.Jobs;
//          var d = c.filter(function(element){
//              return element.InputFile == 's3://transvideo-source71e471f1-knewdmajkw29/assets01/Pexels Videos 2219383.mp4';
     
//           });
//          console.log(d[0].Outputs.HLS_GROUP[0]);
//      });

  </script>
</html>