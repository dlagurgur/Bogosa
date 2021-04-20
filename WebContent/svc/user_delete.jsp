<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/Muhan/cus/cus_theme.css">


<style>
#a{
	margin-top:100px; 
}
</style>				
		<!-- Container -->
		<div class="container max-auto"  id="a" style="width:1000px;">
			
			
			<form method="post" name="modify_info_form" action="deletePro.go">
			 <div class="row">
			 	<h3 class="text-muted">회원탈퇴</h3>&nbsp;&nbsp;
				<input class="form-control col-5" type="password" name="user_pw" placeholder="비밀번호를 입력하세요">&nbsp;&nbsp;
				<button type="submit" class="btn btn-md btn-secondary">삭제</button>&nbsp;
				<button type="button" class="btn btn-md btn-secondary"
				onclick="location='myPage.go'">취소</button>
			</div>	
				
			 </form>
			
			</div>
			
		
			<!-- Footer - No Scroll -->
			