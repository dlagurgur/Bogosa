/* 회원 관리 */
var emailerror = "이메일 형식에 맞지 않습니다";
var confirmerror = "아이디 중복확인 해 주세요";

var emailconfirmerror = "이메일 인증에 실패하였습니다."
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";
var deleteerror = "회원탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요.";



//AJAX 또는 DOM
var passwdch = 0;
function passwordCheckFunction() {
	var userPassword1 = $('#userPassword1').val();
	var userPassword2 = $('#userPassword2').val();

	if (userPassword1 != userPassword2) {
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	} else {
		$('#passwordCheckMessage').html(" ");
		passwdch = 1;
	}
}

//아이디
var idck = 0;
function IdCheck() {
	var user_id = $("#id_val").val();
	if (user_id) {
		$.ajax({
			async : true,
			type : 'POST',
			data : user_id,
			url : "idCheck.go",
			dataType : "json",
			success : function(data) {
				if (data.countId > 0) {
					$('#IdCheckMessagegg').html(
					"아이디가 존재합니다. 다른 아이디를 입력해주세요.");
			$('#IdCheckMessagegg').css("color","red")
				} else {
					$('#IdCheckMessagegg').html("사용가능한 아이디입니다.");
					$('#IdCheckMessagegg').css("color","blue")
					idck = 1;
				}
			},
			error : function(error) {
				alert("실패");
			}
		});
	}
}




function toMain() {
	window.location.href='join.go';
}

//이메일
function gridClose(){
	self.close();
}
function EmailClose(){
	self.close();
}



//이메일 입력방식 선택
$('#cus_email2').change(function(){
   $("#cus_email2 option:selected").each(function () {
		
		if($(this).val()== '0'){ //직접입력일 경우
			 $("#cus_email3").val('');                        //값 초기화
			 $("#cus_email3").attr("disabled",false); //활성화
		}else{ //직접입력이 아닐경우
			 $("#cus_email3").val($(this).text());      //선택값 입력
			 $("#cus_email3").attr("disabled",true); //비활성화
		}
   });
}); 

function EmailIdCheck(email2){
	var url="EmailIdd.go?email2="+email2
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no,width=500, height=200" );
}

function EmailIdPasswd(email2){
	var url="EmailPasswdd.go?email2="+email2
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no,width=500, height=200" );
}


var AWS = 0;
function AWScheck(){
	var user_id = $('#id_val').val();
	if (!user_id){
		alert('아이디를 입력해주세요')
		return false;
	}else{
		
	
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
		    name: user_id //{user_id를 채널이름으로}
		  };
		  ivs.createChannel(params, function(err, data) {
		    if (err) console.log(err, err.stack); // an error occurred
		    else     console.log(data);        
		    var a = data.channel.playbackUrl; // 영상 url
		    var b = data.streamKey.value;	// 키값
		    var c = data.channel.ingestEndpoint; // 키값
		    document.getElementById("a").value = a
		    document.getElementById("b").value = b
		    document.getElementById("c").value = c
		    AWS = 1;
		    alert("채널 생성완료!")
		    // return a, b; // successful response
		  });
  
	}

	
}




function inputcheck() {
	if (confirm("회원가입을 하시겠습니까?")) {
		if (idck == 0) {
			alert('아이디 중복체크를 해주세요');
			return false;
		} else if (joinform.confirm.value == 0){
			alert('이메일 인증을해주세요');
			return false;
		} else if (passwdch == 0){
			alert('비밀번호를 같도록 입력하세요');
			return false;
		} else {			
			alert("회원가입을 축하합니다");
			$("#inputform").button();
		}
	}
}



function orderNow(product_id) {
	var menu_id=menuform.menu_id.value;
	var menu_name=menuform.menu_name.value;
	var menu_price=menuform.menu_price.value;
	var menu_image=menuform.menu_image.value;
	var order_qnt=menuform.qty.value;
	var user_id = $("#session").val();    
	var order=[{'product_id':menu_id, 'product_name':menu_name, 'product_price':menu_price, 'product_qnt':order_qnt, 'product_image':menu_image},];
	
	sessionStorage.setItem('order', JSON.stringify(order));
	
	if(!user_id) {			
		alert('로그인 먼저 해 주세요.');
		window.location.href='login.go';
	} else {
		window.location.href='order_insert.go';
	}
}



//ajax

function commentInsert(){ //댓글 등록 버튼 클릭시 
	 var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	 CmtInsert(insertData); //Insert 함수호출(아래)
}

/////댓글 목록 
function commentList(trailer_id){
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
       	   commentList(trailer_id);
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
	var tb_no=$("input[name=trailer_id]").val();
   $.ajax({
       url : 'commentDelete.go',
       type : 'post',
       data : {
    	   comment_id : comment_id
       },
       success : function(data){
           commentList(tb_no); //댓글 삭제후 목록 출력 
       },
       error : function(error) {
           alert("error : " + error);
       }
   });
}






