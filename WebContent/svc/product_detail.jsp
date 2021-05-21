<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
	<head>
		<%@include file="header.jsp"%>
		<script src="${project}script.js"></script>


	</head>
	<body onload="commentList()">
	




			





<input type="hidden" name="session" id="session" value="${sessionScope.user_id}" />  



	<form class="form form--login" id="menuform" name="menuform" role="form">
<textarea id="messageWindow" rows="10" cols="50" readonly="true" style="
    height: 664px;
    width: 404px;
    background-color: black;
    color:white;
    margin-bottom: 85px;
    ">

</textarea>
		<input id="inputMessage" type="text" style=" background-color: black; color:white;"/>
        <input type="submit" value="send" onclick="send()" style=" background-color: black; color:white;"/>
      
    	 
    	 
    	 
    	 
					
					
				
					<input type="hidden" name="menu_id" value="${Produt_dto.product_id}">
					<input type="hidden" name="menu_name" value="${Produt_dto.product_name}">
					<input type="hidden" name="menu_image" value="${Produt_dto.product_image}">
					<input type="hidden" name="menu_price" value="${Produt_dto.product_price}">
					
		
		


				
					
					
			</form>
		
			
			
			
	
	</body>
	
	
			<div class="container">
				<label for="content">comment</label>
				<form name="commentInsertForm" method="post">
					<div class="input-group">
						<input type="hidden" name="product_id" value="${Produt_dto.product_id}" /> <input
							type="hidden" name="session" value="${sessionScope.user_id}" /> <input
							type="text" class="input col-11" id="chat_content" name="chat_content"
							placeholder="댓글"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="commentInsert()">등록</button>
						</span>
					</div>
				</form>
			</div>
	
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
  </script>
</html>