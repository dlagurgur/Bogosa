<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<%@include file="script.js" %>
    
<h2>cus_delete_info_pro.jsp</h2>
<c:if test="${result eq 0}">
	<script type="text/javascript">
		alert( "실패" );
	</script>
	<meta http-equiv="refresh" content="0; url=myPage.go">
</c:if>
<c:if test="${result eq 1}">
	${sessionScope.cus_id = null}
	<script type="text/javascript">
		alert( "탈퇴되셧습니다." );
		sessionStorage.removeItem('user_id');
	</script>
	<meta http-equiv="refresh" content="0; url=login.go">
</c:if>


