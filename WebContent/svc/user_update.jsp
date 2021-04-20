<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="setting.jsp"%>
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
<style>
	#a{
		margin-top:50px;
	}
</style>
</head>
<article class="container">
      
        <div class="mx-auto" style="width: 700px" id="a">
      

     <form class="form-horizontal" name="joinform" method="post" action="updatePro.go" onsubmit="return modifyCheck()">
     			
        		<h2 class="text-left text-dark" >내 정보수정</h2>
        		<br><br>  		
		        <div class="form-group row">
		        
					<label for="nickname" class="col-sm-3 col-form-label">아이디</label>
					<div class="col-sm-8"><input class="form-control" type="text" value="${userDto.user_id}" readonly></div>
					
				</div>
		        
		         <div class="form-group row">
					<label for="nickname" class="col-sm-3 col-form-label">이름</label>
					<div class="col-sm-8"><input class="form-control" type="text" value="${userDto.user_name}" readonly></div>
				</div>
		        
		        
		        <div class="form-group row">
		         	 <label class="col-sm-3 col-form-label">비밀번호</label>   <!--    password     -->
		         	 
		        		<div class="col-sm-8">
		         		 <input class="form-control" name="user_pw" id="password" type="password" value="${userDto.user_pw }" placeholder="변경할 비밀번호 입력 ">
		        		</div>
		        </div>
		        
		        
		          		          
		        <div class="form-group row">
		           <label for="inputNickname" class="col-sm-3 col-form-label">배달지 주소</label>   <!--    Address     -->
		           
		          	<div class="col-sm-8 row">
		            	&nbsp;&nbsp;&nbsp;<input class="form-control col-sm-8 "  name="user_addr" id="cus_address" type="text" placeholder="주소" value="${userDto.user_addr}">
							            	
		            	<span style="float:right">
		            	&nbsp;<button class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()" >주소검색</button>
		            	</span>
		            	
		            </div>
		            
		        </div>
		         
		        
		          <div class="form-group row">
		          	<label  for="inputNickname" class="col-sm-3 col-form-label">상세주소</label>
		       			<div class="col-sm-8 text-right">
		         		 <input class="form-control" name="user_addr2" id="cus_address2" type="text"  placeholder="상세주소를 입력하세요" value="${userDto.user_addr2 }" >
		        		</div>
		         </div>
		        
		        		     
            	<div class="form-group row">
					<label class="col-sm-3 col-form-label">이메일
					</label>
					<div class="col-sm-8">
					 <input class="form-control" name="email" type="text" value="${userDto.user_email}" readonly>
					 </div>
				</div>
		        
		      		             
		        <div class="form-group row">                                        
		            <label class="col-sm-3 col-form-label" for="inputNumber">휴대폰번호</label>           <!--    Telephone     -->
		              <div class="col-sm-6">
		                <div class="input-group">
		                
							 <c:if test="${userDto.user_phone == null eq null or userDto.user_phone eq ''}">
								<input class="form-control" type="text" name="tel1" maxlength="3" style="width: 27px">
								- <input class="form-control" type="text" name="tel2" maxlength="4" style="width: 33px">
								- <input class="form-control" type="text" name="tel3" maxlength="4" style="width: 33px">
							</c:if>
							<c:if test="${userDto.user_phone ne null and userDto.user_phone ne ''}">
								<c:set var="t" value="${fn:split(userDto.user_phone, '-')}"/>
								<input class="form-control" type="text" name="tel1" maxlength="3" style="width: 27px"
									value="${t[0]}">
								- <input class="form-control" type="text" name="tel2" maxlength="4" style="width: 33px"
									value="${t[1]}">
								- <input class="form-control" type="text" name="tel3" maxlength="4" style="width: 33px"
									value="${t[2]}">
							</c:if> 
								
		                </div>
		              </div>
		        </div>
		        
		        <div class="form-group">
		          <div class="col-sm-12 text-center">
		            <button class="btn btn-lg btn-secondary btn-block" type="submit">정보수정</button>
		            <button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='myPage.go'">취소</button>
		          </div>
		        </div>
		        
        </form>
     
          <hr>
        </div>
        
      </article>


</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
            document.getElementById('cus_address').value = data.jibunAddress;
            self.close();

            
        }
    }).open();
}

</script>
<script>
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
</script>
<script>
function modifyCheck(){
	if((!joinform.passwd.value)){
		alert("비밀번호를 입력하세요")
		return false;
	}

	if(! joinform.address2.value){
		alert("상세주소를 입력하세요")
		return false;
	}
	if( (!joinform.tel1.value)||(!joinform.tel1.value)||(!joinform.tel1.value)){
		alert("전화번호를 입력하세요")
		return false;
	}
	
}
</script>