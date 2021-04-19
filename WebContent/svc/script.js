/* 회원 관리 */
var emailerror = "이메일 형식에 맞지 않습니다";
var confirmerror = "아이디 중복확인 해 주세요";
var gendererror = "성별을 선택해 주세요";

var emailconfirmerror = "이메일 인증에 실패하였습니다."
var inputerror = "회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.";
var loginiderror = "입력하신 아이디가 없습니다.\n아이디를 다시 확인하세요.";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n비밀번호를 다시 확인하세요.";
var deleteerror = "회원탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요.";

/* 게시물 관리 */
var trip_tileerror = "글제목을 입력해주세요";
var contenterror = "글내용을 입력해주세요";

var boarddeleteerror="게시물 삭제에 실패했습니다.\n잠시후 다시 시도하세요";
var photodeleteerror="사진 삭제에 실패했습니다.\n잠시후 다시 시도하세요";
var extensionerror="jpg, gif, png 확장자만 업로드 가능합니다.";
var sizeerror="이미지 용량은 5M이하만 가능합니다.";





//AJAX 또는 DOM
function passwordCheckFunction() {
	var userPassword1 = $('#userPassword1').val();
	var userPassword2 = $('#userPassword2').val();

	if (userPassword1 != userPassword2) {
		$('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
	} else {
		$('#passwordCheckMessage').html(" ");
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

function emailAuthentic(){
	var user_email = joinform.cus_email1.value+"@" + joinform.cus_email3.value;
	var url="emailCheck.go?email="+user_email;
	window.open(url, "b", "width=600,height=300,scrollbars=yes,resizeable=no,left=150,top=150") 
}


$(function() {
    $( "#testDatepicker").datepicker({
    });
});
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


function confirmeMail(authNum){
	var Email = $('#EmailVlaue').val(); //이메일 인증 창에서 내가 입력한 인증번호 값가져옴
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!Email || Email!= authNum){
		alert(emailconfirmerror);
		self.close();
    // 인증코드가 일치하는 경우
	}else if(Email==authNum){
		alert("인증완료");
		opener.document.inputform.confirm.value = 1;
		self.close();
	}
}

function inputcheck() {
	if (confirm("회원가입을 하시겠습니까?")) {
		if (idck == 0) {
			alert('아이디 중복체크를 해주세요');
			return false;
		} else if (inputform.confirm.value == 0){
			alert('이메일 인증을해주세요');
			return false;
		} else if (passwdck == 0){
			alert('비밀번호를 같도록 입력하세요');
			return false;
		} else {
			alert("회원가입을 축하합니다");
			$("#inputform").button();
		}
	}
}

/////댓글 목록 
function commentList(tb_no){
	var SessionID=$("input[name=session]").val();
	$.ajax({
        url : 'commentSelect.go',
        type : 'get',
        data : {tb_no : tb_no},
        success : function(data){
            var commentView ='';
            var UserName = 'Ex-User';
            $.each(data, function(key, comment){ 
            	commentView += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
            	commentView += '</div class="commentInfo'+comment.c_id+'"><b>'+comment.user_name+'</b>';
            	if(SessionID == comment.user_id && comment.user_name != UserName){
            	commentView += '<a onclick="commentUpdate('+comment.c_id+',\''+comment.c_content+'\');"> 수정 </a>';
            	commentView += '<a onclick="commentDelete('+comment.c_id+');"> 삭제 </a>';
            	}
            	commentView += '<div class="commentContent"> <p>'+comment.c_content +'</p>';
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
	var tb_no=$("input[name=tb_no").val();
	if(commentInsertForm.c_content.value){
	$.ajax({
        url : 'commentInsert.go',
        type : 'post',
        data : insertData,
        success : function(data){
        	if(data == 1) {
        		/*오류메세지 작성*/
           }else{
        	   commentList(tb_no);
        	   $('[name=c_content]').val('');
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
function commentUpdate(c_id, c_content){
    var commentModify ='';
    
    commentModify += '<div class="input-group">';
    commentModify += '<input type="text" class="form-control" name="c_content_'+c_id+'" value="'+c_content+'"/>';
    commentModify += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+c_id+');">수정</button> </span>';
    commentModify += '</div>';
    
    $('.commentContent'+c_id).html(commentModify);
    
}
 
//댓글 수정
function commentUpdateProc(c_id){
    var updateContent = $('input[name=c_content_'+c_id+']').val();
    var tb_no=$("input[name=tb_no").val();
    $.ajax({
        url : 'commentUpdate.go',
        type : 'post',
        data : {'c_content' : updateContent, 'c_id' : c_id},
        success : function(data){
            commentList(tb_no); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(c_id){
	var tb_no=$("input[name=tb_no]").val();
    $.ajax({
        url : 'commentDelete.go',
        type : 'post',
        data : {
        	c_id : c_id
        },
        success : function(data){
            commentList(tb_no); //댓글 삭제후 목록 출력 
        },
        error : function(error) {
            alert("error : " + error);
        }
    });
}



