<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="${project}script.js"></script>
</head>
	<body class="registration">
	
		<div class="container" style="width: 600px">
		<div class="text-center">
		<br><br>
			<h2>회원가입</h2>
			<br>
		</div>
		
		<!-- Container -->
	
			<!-- Join Form --> 
			<form class="form-horizontal" name="joinform" method="post" role="form" action="svc_join_pro.go" onsubmit="return inputcheck()">
			<div class="form-group row">
				<label for="inputID" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-8">
					<input type="text" name="user_id" maxlength="20" class="form-control"
						id="id_val" placeholder="ID" maxlength="20" required autofocus onkeyup="IdCheck()">
						<h6  id="IdCheckMessagegg"></h6>

				</div>

			</div>
			
			<div class="form-group row">
				<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="userPassword1" name="user_pw" maxlength="20" placeholder="비밀번호" maxlength="30" required
						onkeyup="passwordCheckFunction()">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<input type="password" class="form-control" id="userPassword2"
						placeholder="비밀번호 재입력" name="repasswd" maxlength="20" required 
							onkeyup="passwordCheckFunction()">
				<h6 style="color: red;" id="passwordCheckMessage"></h6>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="inputNickname" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="user_name" id="user_name" placeholder="이름" required>
					<h6 style="color: red;" id="NameCheckMessage"></h6>
				</div>
			</div>
			
			<fieldset class="form-group">
				<div class="row">
					<label class="col-form-label col-sm-2 pt-0">권한</label>
					<div class="col-sm-10">
						<div class="form-check">
							<input class="form-check-input" type="radio" name="user_corp"
								id="gridRadios1" value="1" checked> <label
								class="form-check-label" for="gridRadios1">
								기업</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="user_corp"
								id="gridRadios2" value="2"> <label
								class="form-check-label" for="gridRadios2">
								일반 </label>
						</div>
					</div>
				</div>
			</fieldset>
			
			
					<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">주소</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="user_addr" id="user_add" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
							<div class="col-sm-2">
							<button class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()">주소찾기</button>
							</div>
					</div>
						
					<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">상세주소</label>							
							<div class="col-sm-8">
								<input type="text" class="form-control" name="user_addr2" id="cus_address2" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
					</div>
					<div class="form-group row">						
						<label for="inputNickname" class="col-sm-2 col-form-label">이메일</label>&nbsp;
								&nbsp;<input type="text" style="width:110px;" class="form-control" name="cus_email1" id="cus_email1" maxlength="20" placeholder="이메일" required>
								@
								<input type="text" style="width:130px;" class="form-control" name="cus_email3" id="cus_email3" maxlength="20" placeholder="이메일" required>
								<select class="form-control" style="width:115px;" name="cus_email2" id="cus_email2">
									<option value="0"> 직접 입력 </option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="gmail.com">gmail.com</option>
								</select>
							<div class="col-sm-2">
 								<button type="button" class="btn btn-md btn-secondary" onclick="emailAuthentic()">이메일인증</button>
								<input type="hidden" name="confirm" value="0">
							</div>
							
						</div>
						
						<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">전화번호</label>&nbsp;
							
								&nbsp;<input type="text" style="width:100px;" class="form-control" name="cus_tel1" id="cus_tel1" 
								maxlength="3" placeholder="번호" required>
								-
								<input type="text" style="width:130px;" class="form-control" name="cus_tel2" id="cus_tel2" maxlength="4" placeholder="번호" required>
								-
								<input type="text" style="width:130px;" class="form-control" name="cus_tel3" id="cus_tel3" maxlength="4" placeholder="번호" required>						
						</div>
					
				<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<button type="submit" class="btn btn-lg btn-secondary btn-block">${btn_join}</button>
				</div>
			</div>
				<br><br><br><br><br><br><br>
		</form>
		</div>
		
<script>
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


function sample4_execDaumPostcode() {  //다음 주소 api
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('user_add').value = data.jibunAddress;
            self.close();

            
        }
    }).open();
}
</script>