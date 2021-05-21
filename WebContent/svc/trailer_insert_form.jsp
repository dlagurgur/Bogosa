<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp" %>
<%@ include file="header.jsp" %>
<script src="${project}script.js"></script>

<!--//////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<body>
<!--enctype="multipart/form-data"-->
<div class="container">
	<form name="inputform" id ="target" action="trailer_insert_pro.go" method="post" enctype="multipart/form-data">
		<h3>상품에 대한 정보를 입력하세요</h3>
		<div class="form-group row">		
			<div class="col-xs-2">
				<label for="trailer_name">상품 명</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="trailer_name" id="trailer_name" maxlength="50">
			</div>
			
			
			<div class="col-xs-2">
				<label for="trailer_name">방제목</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="text" name="trailer_title" id="trailer_title" maxlength="50">
			</div>			
		</div>
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="trailer_price">상품 가격</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="number" name="trailer_price" id="trailer_price" maxlength="20">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="trailer_price">라이브 예정 일정</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="datetime-local" name="trailer_launchdate" id="trailer_launchdate" maxlength="20">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="trailer_image">상품 이미지</label>
			</div>
			<div class="col-xs-2">
				<input class="form-control" type="file" name="trailer_image" id="trailer_image">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="trailer_aws_url">광고 영상</label>
			</div>
			<div class="col-xs-2">
				 	<input class="form-control" type="file" id="file-chooser"/>
    				<!--  <button type="button"  id="upload-button">Upload to S3</button> -->		 
			</div>
		</div>
		
		
		<div id="results"></div>
		
	
		<div class="form-group row">
			<div class="col-xs-2">
				<label for="trailer_detail">상품 설명</label>
			</div>
			<div class="col-xs-2">
				<textarea class="form-control" name="trailer_detail" id="trailer_detail" rows="10" cols="30">
				</textarea>
			</div>
			
			
	
			
			
		
			
			<input type="hidden" name="session" id="session" value="${user_id}" /> 
			<input type="hidden" name="trailer_id" value="${trailer_id}" /> 
			
		</div>
		
		

		<div class="form-group row">
			<button type="button"  id="upload-button">Upload</button>
			<input class="btn btn-primary" type="reset" value="취소">
		</div>
		
		
		
	</form>
</div>


 <script src="${project}aws-sdk-2.897.0.min.js"></script>
 <script type="text/javascript">

 
    AWS.config.region = 'us-east-1'; // 1. Enter your region

    AWS.config.update({
        "accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
        "secretAccessKey": "9LogjlXLsizoYkPCOBUnc/phg3Si6SoVXPy9KPIN",
        "region": "us-east-1"
        });

    var bucketName = 'cdn-video-source71e471f1-1w5ehaaqw3boh'; // Enter your bucket name
    var bucket = new AWS.S3({
        params: {
            Bucket: bucketName
        }
    });

    var fileChooser = document.getElementById('file-chooser');
    var button = document.getElementById('upload-button');
    var results = document.getElementById('results');
    var session = $('#session').val();
    

    button.addEventListener("click", function(){
        var file = fileChooser.files[0];

        if (file) {

            results.innerHTML = '';
            var objKey = 'assets01/'+session+file.name;
            var params = {
                Key: objKey,
                ContentType: file.type,
                Body: file,
                ACL: 'public-read'
            };

            bucket.putObject(params, function(err, data) {
                if (err) {
                    results.innerHTML = 'ERROR: ' + err;
                    document.getElementById('target').submit();
                } else {
                	console.log(data);
                    
                    var s3 = new AWS.S3();
                    
                    var timer = setInterval(function(){
                    	console.log("hello");
                        s3.getObject({
                            Bucket: "cdn-video-source71e471f1-1w5ehaaqw3boh", 
                            Key: "jobs-manifest.json"
                           }
                           , function(err, data) {
                            if (err) console.log(err, err.stack); 
                            else
                             
                               data = data.Body.toString();
                               
                               data = JSON.parse(data);
                               
                               data = data.Jobs.filter(function(element){
                                  return element.Job.Settings.Inputs[0].FileInput == 's3://cdn-video-source71e471f1-1w5ehaaqw3boh/assets01/'+session+file.name;
                                });
                                
                                if(data.length != 0){
                                    trailer_aws_url = data[0].Outputs.HLS_GROUP[0];
                                    console.log(trailer_aws_url);
                                    //console.log(typeof(trailer_aws_url));
                                    //console.log(typeof(trailer_aws_url.value));
                                    results.innerHTML = '<input type="hidden" name="trailer_aws_url" id="trailer_aws_url" value="'+trailer_aws_url+'">'
                                    document.getElementById('target').submit();
                                    clearInterval(timer);
                                }
                                else{
                                    console.log("data is not detected")
                                }

                                 
                        
                           })
                    }, 10000);
                    
                    timer;

                    
 
                }
            });
        } else {
            results.innerHTML = 'Nothing to upload.';
            document.getElementById('target').submit();
        }
    }, false);
    
    </script>
