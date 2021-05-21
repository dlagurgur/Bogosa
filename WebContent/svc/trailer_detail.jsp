<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		<script src="${project}script.js"></script>
		<script src="//code.jquery.com/jquery.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
		<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
   		<script src="https://vjs.zencdn.net/7.8.2/video.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
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
  width: 50%;
}

 #video{
            width: 960px;
            height: 540px;
            margin:0 auto; 
            margin-top:200px;
        }
        
 


</style>

	</head>
	<body  onload="commentList()">
		
		<!-- Container -->


  


<h1 style="
    padding-left: 60px;
    padding-bottom: 0px;
    color:white;
    margin-bottom: 0px;
    width: 1550px;
    height: 5px;
    margin-top: 20px;
">${Trailer_dto.trailer_name}</h1>

<video id=video  class="video-js vjs-big-play-centered" controls>
    <source src="${Trailer_dto.trailer_aws_url}" type="application/x-mpegURL">
</video>

<script>
    var player = videojs('video');
    // player.play();
</script>

 <!--  

        <input id="inputMessage" type="text" style=" background-color: black; color:white;"/>
        <input type="submit" value="send" onclick="send()" style=" background-color: black; color:white;"/>
-->





			<!-- Menu Item -->





<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" /> 
<input type="hidden" name="aws_url" id="aws_url" value="${Trailer_dto.trailer_aws_url}" /> 

<div class="site__container">

    <div class="grid__container">

	<form class="form form--login" id="menuform" name="menuform" role="form" style="width: 870px;margin-left: 100px;margin-bottom: 0px;margin-top: 0;">
      
    	        
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
//ajax

function commentInsert(){ //댓글 등록 버튼 클릭시 
 	 var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
 	 CmtInsert(insertData); //Insert 함수호출(아래)
 }

 /////댓글 목록 

function commentList(){
	var trailer_id=$("input[name=trailer_id").val();
 	var SessionID=$("input[name=session]").val();
 	$.ajax({
        url : 'commentSelect.go',
        type : 'get',
        data : {trailer_id : trailer_id},
        success : function(data){
            var commentView ='';
            $.each(data, function(key, comment){ 
            	commentView += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
            	commentView += '</div class="commentInfo'+comment.comment_id+'"><b>'+comment.user_id+'</b>';
            	if(SessionID == comment.user_id){
            	commentView += '<a onclick="commentUpdate('+comment.comment_id+',\''+comment.comment_content+'\');"> 수정 </a>';
            	commentView += '<a onclick="commentDelete('+comment.comment_id+');"> 삭제 </a>';
            	}
            	commentView += '<div class="commentContent"> <p>'+comment.comment_content +'</p>';
            	commentView += '</div></div>'
            });
            $(".commentList").html(commentView);
        },
        error : function(error) {
            alert("댓글을 입력해주세요!");
        }
    });
 	}


 //댓글 등록

function CmtInsert(insertData){
 	var trailer_id=$("input[name=trailer_id").val();
 	if(commentInsertForm.comment_content.value){
 	$.ajax({
        url : 'commentInsert.go',
        type : 'post',
        data : insertData,
        success : function(data){
        	if(data == 1) {
        		/*오류메세지 작성*/
           }else{
        	   commentList();
        	   $('[name=comment_content]').val('');
           }
        },
    	error : function(error) {
        alert("error : " + error);
    }
    });
 	}else{
 		alert("댓글을 입력해주세요");
 	}
 	}

 //댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
 function commentUpdate(comment_id, comment_content){
     var commentModify ='';
     
     commentModify += '<div class="input-group">';
     commentModify += '<input type="text" class="form-control" name="comment_content_'+comment_id+'" value="'+comment_content+'"/>';
     commentModify += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comment_id+');">수정</button> </span>';
     commentModify += '</div>';
     
     $('.commentContent'+comment_id).html(commentModify);
     
 }



 //댓글 수정
 function commentUpdateProc(comment_id){
    var updateContent = $('input[name=comment_content_'+comment_id+']').val();
    var tb_no=$("input[name=trailer_id").val();
    $.ajax({
        url : 'commentUpdate.go',
        type : 'post',
        data : {'comment_content' : updateContent, 'comment_id' : comment_id},
        success : function(data){
            commentList(trailer_id); //댓글 수정후 목록 출력 
        
        }
    });
 }

 //댓글 삭제 
 function commentDelete(comment_id){
 	//var tb_no=$("input[name=trailer_id]").val();
    $.ajax({
        url : 'commentDelete.go',
        type : 'post',
        data : {
     	   comment_id : comment_id
        },
        success : function(data){
        	commentList(); //댓글 삭제후 목록 출력 
        },
        error : function(error) {
            alert("error : " + error);
        }
    });
 }
 
 
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