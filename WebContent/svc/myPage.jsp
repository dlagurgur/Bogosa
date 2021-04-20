<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
<%@include file="header.jsp" %>
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
<head>
<style>
	#a{
		margin-top:30px;
	}

</style>
</head>
<article class="container">
      
        <div class="mx-auto" style="width: 700px" id="a">

 	<form class="form-horizontal" name="joinform" >
	
    	    <h2 class="text-left text-dark" >${userDto.user_id}님의 정보</h2>
      
        <br><br>
         <div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;" type="text" value="${userDto.user_id}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">이름</label>
				<div class="col-sm-8"><input class="form-control" style="border:0 padding-top:2; text-align:center;"  type="text" value="${userDto.user_name}" readonly></div>
		</div>
		
	 	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">주소</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_addr}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">상세주소</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_addr2}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">이메일</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_email}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">전화번호</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_phone}" readonly></div>
		</div>
		<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='update.go'">${btn_modify}</button>					
					<button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='delete.go'">${btn_user_delete}</button>
				</div>
			</div>
			
	
	 	
				</form>
		
	 
	
				
			</div>
	</article>

</html>