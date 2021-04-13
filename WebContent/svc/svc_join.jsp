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
			<form class="form-horizontal" name="joinform" method="post" role="form" action="cus_join_pro.do" onsubmit="return inputcheck()">
			<div class="form-group row">
				<label for="inputID" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-8">
					<input type="text" name="user_id" maxlength="20" class="form-control"
						id="id_val" placeholder="ID" maxlength="20" required autofocus onkeyup="IdCheck()">
						<h6 style="color: red;" id="IdCheckMessagegg"></h6>
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
					<input type="text" class="form-control" name="user_name" id="user_name" placeholder="user_name" required>
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
								<input type="text" class="form-control" name="user_add" id="cus_address" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
							<div class="col-sm-2">
							<button class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()">주소찾기</button>
							</div>
					</div>
						
					<div class="form-group row">
								<label for="inputNickname" class="col-sm-2 col-form-label">상세주소</label>							
							<div class="col-sm-8">
								<input type="text" class="form-control" name="user_add2" id="cus_address2" maxlength="20" placeholder="주소를 다시 입력해 주세요." required>
							</div>
					</div>
					<div class="form-group">
				<div class="row">
					<label for="email" class="control-label col-sm-2">${str_email}
					</label>
					<div class="col-sm-8">
						<input type="email" name="user_email1" class="form-control" id="email1"
							placeholder="Enter email" required>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-md btn-secondary" 
						onclick="EmailCheck(inputform.email1.value)">${btn_confirm_smtp}</button>
						<input type="hidden" name="confirm" value="0">
					</div>
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
					
				<div class="col-lg-12 text-center mt-1 mb-1">
					<button type="submit" class="btn btn-md btn-secondary">
					회원 가입
					</button>
					<button type="button" class="btn btn-md btn-secondary" onclick="toMain()">
					가입 취소
					</button>
				</div>
				<br><br><br><br><br><br><br>
		</form>
		</div>