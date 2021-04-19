<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${project}script.js"></script>
<%@include file="setting.jsp" %>
<html>
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
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.cus_addr2}" readonly></div>
		</div>
	 	
	 	<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">이메일</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_email}" readonly></div>
		</div>
		
		<div class="form-group row">
		       <label for="nickname" class="col-sm-3 col-form-label">전화번호</label>
				<div class="col-sm-8"><input class="form-control" type="text" style="border:0 padding-top:2; text-align:center;" value="${userDto.user_phone}" readonly></div>
		</div>
	 	
			<!-- Fixed Footer: 붙이는 위치가 Scrollable Footer와는 다릅니다! Fixed Footer는 중단 Container 안에 넣어주셔야 합니다. --> 
			
				</form>
				
			</div>
	</article>

</html>