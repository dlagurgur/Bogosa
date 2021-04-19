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



$(document).ready(
		function() {
			/* 브라우저의 '뒤로가기' 버튼을 눌렀을 때 자동 새로고침. 화면 깜빡임이 싫다면 disable 시킬 것. */
/* 			if(performance.navigation.type == 2){
				   location.reload(true);
			} */
			
			$('.newTrex').on(
				'click',
				function(event) {
					window.location.href='cus_menu_details.do?menu_id=13';
				}
			);
			
			$('.navbar-toggler-icon').on(
				'click', 
				function(event) {
				    $('#collapsibleNavbar').collapse('hide');
				}
			);
			
			$('#joinButton').on(
				'click',
				function(event) {
					window.location.href='cus_join.do';
				}
			);
			
			$('#findIdPwButton').on(
				'click',
				function(event) {
					window.location.href='cus_find_id_pw.do';
				}
			);
			
			$('.clickableRow').on(
				'click',
				function(event) {
					window.location=$(this).data('href');
				}
			);
			
			$('.currentPageBottom').on(
				'click',
				function(event) {
					event.preventDefault();
				}
			);
			
			$('#loginCartNavbar').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						$('#loginCartNavbar').prop('disabled', true);
						window.location.href='cus_login_form.do';
					}
				}
			);
			
			$('.submitOrder').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 먼저 해 주세요.');
						window.location.href='cus_login_form.do?identifier=1';
					}
				}
			);
			
			$('.replyToContent').on(
					'click',
					function(event) {
						if(!sessionStorage.getItem('cus_id')) {
							event.preventDefault();
							alert('로그인 후 답글을 작성하실 수 있습니다.');
							window.location.href='cus_login_form.do?identifier=2';
						}
					}
				);
			
			$('.reportContent').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 신고하실 수 있습니다.');
						window.location.href='cus_login_form.do?identifier=2';
					}
				}
			);
			
			$('#writeReview').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 리뷰를 작성하실 수 있습니다.');
						window.location.href='cus_login_form.do?identifier=3';
					}
				}
			);
			
			$('.myReviews').on(
				'click',
				function(event) {
					if(!sessionStorage.getItem('cus_id')) {
						event.preventDefault();
						alert('로그인 후 이용해 주세요.')
						window.location.href='cus_login_form.do?identifier=4';
					}
				}
			);
			
			$('.msgCheck').on(
				'click',
				function(event) {
					sessionStorage.setItem('msgCount', eval(sessionStorage.getItem('msgCount'))-1);
					$('.msgCheck').attr('disabled', true);
					$('.message').html('새 메세지가 없습니다.');
				}
			);
			
			$('#review_image_file').change(
				function(event) {
					var fileName=$('#review_image_file')[0].files[0].name;
					$('.custom-file-label').text(fileName);
				}		
			);
		}
	);
	
	$(window).on(
		'load',
		function(event) {
			var cus_id=sessionStorage.getItem('cus_id');
			if(cus_id) {
				$('.showCusId').html(cus_id+'님');
			}
			
			if(localStorage.getItem('order')) {
	 			var cartItems=(JSON.parse(localStorage.getItem('order'))).length;
	 			$('.numberOfItems').html(cartItems);	
			}
		}
	);

	
 	$(window).on(
		'load',
		function(event) {
			if(sessionStorage.getItem('cus_id')) {
				function updateMsg() {
					$.ajax({
						url: 'cus_alarmResponse.do',
						contentType: 'application/json; charset="UTF-8"',
						cache: false,
						success: function(data) {
							var jsonalarms = JSON.parse(data);
							var newmessage = '';
							if (data == '') {
								$('.message').html('새 메세지가 없습니다.');
							} else if ( data != '') {
								for(var i in jsonalarms) {
									if( jsonalarms[i]['order_status'] == 2 ) {
										newmessage += '주문번호 '+jsonalarms[i]['order_no']+':<br>주문이 접수되었습니다.<br>';
										newmessage += '<button class="btn btn-sm btn-warning ml-2 msgCheck" name='+jsonalarms[i]['order_no']+'>확인</button> <br><br>';
									} else if (jsonalarms[i]['order_status'] == 3) {
										newmessage += '주문번호 '+jsonalarms[i]['order_no']+':<br>주문이 배달되었습니다.<br>';
										newmessage += '<button class="btn btn-sm btn-warning ml-2 msgDelivery" name='+jsonalarms[i]['order_no']+'>확인</button> <br><br>';
									}
								}
								$('.message').html(newmessage);
							}
						},
						error:function(e) {
							console.log('ajaxResponse 수신 실패');
						}
					});
				}	
				var ajaxIntervalSetter=setInterval(updateMsg, 3000);
			}
		}
	); 
 	
 	$(document).on("click",".msgCheck", function(e){ 
		var updatealarm = e.target.name;
		$.ajax({
			url: 'cus_ajaxOrderStatusUpdate.do',
			contentType: 'application/json; charset="UTF-8"',
			data: {
				order_no: updatealarm
			},
			cache: false,
			success: function(data) {
				if ( data == 1 ) {
					$('.message').html('새 메세지가 없습니다.');
				}			
			},
			error: function(e) {
				console.log('orderStatus Update 실패');
			}
		});
	 });	
 	$(document).on("click",".msgDelivery", function(e){ 
		var updatealarm = e.target.name;
		$.ajax({
			url: 'cus_ajaxUpdateDeliveryMsg.do',
			contentType: 'application/json; charset="UTF-8"',
			data: {
				order_no: updatealarm
			},
			cache: false,
			success: function(data) {
				if ( data == 1 ) {
					$('.message').html('새 메세지가 없습니다.');
				}			
			},
			error: function(e) {
				console.log('orderStatus Update 실패');
			}
		});
	 });
 
	$(window).on(
		'load',
		function(event) {
			if ($('#topNavbar').height()>72) {
				$('.sticky-top').css({
			        top: $('#topNavbar').height()+10
			    });
				$('.jumbotron').css({
					top: $('#topNavbar').height()
			    });
			} else {
				$('.sticky-top').css({
			        top: 72
			    });
			}
		}
	);
	
	$(window).on(
		'resize',	
		function (event) {
			if ($('#topNavbar').height()>72) {
				$('.sticky-top').css({
			        top: $('#topNavbar').height()+10
			    });
				$('.jumbotron').css({
					top: $('#topNavbar').height()
			    });
			} else {
				$(".sticky-top").css({
			        top: 72
			    });
			}
		}
	);	



/*------------General Functions------------*/
function erroralert(msg) {
	alert(msg);
	history.back();
}

function returnToList() {
	history.back();
}

/*------------Member Login Functions------------*/
function loginfocus() {
	loginform.cus_id.focus();
}

function logincheck() {
	if(! loginform.cus_id.value) {
		alert('아이디를 입력해 주세요.');
		loginform.cus_id.focus();
		return false;
	} else if(! loginform.cus_pw.value) {
		alert('패스워드를 입력해 주세요.');
		loginform.cus_pw.focus();
		return false;
	}
}

function storeId(cus_id) {
	sessionStorage.setItem('cus_id', cus_id);
}

function rememberMyId(cus_id) {
	localStorage.setItem('cus_id', cus_id);
	sessionStorage.setItem('cus_id', cus_id);
}

function forgetMyId(cus_id) {
	localStorage.removeItem('cus_id');
}

/*------------Review Functions------------*/
function enterKeyword() {
	if(! searchform.searchbar.value) {
		alert('검색 키워드를 입력해 주세요.');
		return false;
	}
}

function editorFocus() {
	textEditorForm.editorContainer.focus();
}	/* 작동 안함..! 수정 필요 */

/*------------Menu Functions------------*/
function moveItemsToCart(menu_id) {
	var menu_id=menuform.menu_id.value;
	var menu_name=menuform.menu_name.value;
	var menu_price=menuform.menu_price.value;
	var menu_image=menuform.menu_image.value;
	var order_qnt=menuform.qty.value;
	
	var order={'menu_id':menu_id, 'menu_name':menu_name, 'menu_price':menu_price, 'order_qnt':order_qnt, 'menu_image':menu_image};

	if (!localStorage.getItem('order')) {
		order='['+JSON.stringify(order)+']';
		localStorage.setItem('order', order);
	
	} else {
		var existingMenu=localStorage.getItem('order');
		existingMenu=existingMenu.replace('[', '');
		existingMenu=existingMenu.replace(']', '');
		order='['+existingMenu+', '+JSON.stringify(order)+']';
		localStorage.setItem('order', order);
	}
	
	alert('해당 상품을 카트에 담았습니다.');
	history.back();
}

function orderNow(menu_id) {
	var menu_id=menuform.menu_id.value;
	var menu_name=menuform.menu_name.value;
	var menu_price=menuform.menu_price.value;
	var menu_image=menuform.menu_image.value;
	var order_qnt=menuform.qty.value;
	var order=[{'menu_id':menu_id, 'menu_name':menu_name, 'menu_price':menu_price, 'order_qnt':order_qnt, 'menu_image':menu_image},];
	
	sessionStorage.setItem('order', JSON.stringify(order));
	
	if(!sessionStorage.getItem('cus_id')) {			
		alert('로그인 먼저 해 주세요.');
		window.location.href='cus_login_form.do?identifier=1';
	} else {
		window.location.href='cus_pay.do';
	}
}

