<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
  <head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
    <!-- Bootstrap core CSS -->
	 <!-- Custom style for this template -->
	<script src="${project}script.js"></script>
	<script src="${project}aws-sdk-2.897.0.min.js"> </script>
<style>
@import url(http://weloveiconfonts.com/api/?family=fontawesome);
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

* {
  box-sizing: border-box;
}

html {
  height: 100%;
}

body {
  background-color: #151515;
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}

a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

button {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}




input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


h3 {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}

.site__container {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
  padding: 3rem 0;
}

.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form button[type="button"],.form input[type="number"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form input[type="number"],
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"],
.form--login button[type="button"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #1C1C1C;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"],.form input[type="number"], .form--login input[type="password"] {
  background-color: #2E2E2E;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login .form input[type="number"]:focus,input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #2E2E2E;
}

.form--login input[type="submit"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #AC58FA;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}



.form--login button[type="button"] {
  border-radius: 0.15rem;
  padding: 1rem;
}

.form button[type="button"] {
  width: 100%;
}

.form--login button[type="button"] {
  background-color: #AC58FA;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}

.form--login button[type="button"]:focus, .form--login input[type="button"]:hover {
  background-color: #AC58FA;
}


.align {
  -webkit-box-align: center;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
}

.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

 input[type='radio']:checked:before {
  	background:#606468;
  }
  
</style>
</head>

<body class="align" style="padding-top: 20px;margin-right: 160px; color:white;">
   <div class="site__container">
      <div class="grid__container">
         <h1 style="padding-left: 160px;padding-bottom: 20px;">Sign Up</h1>
         <form class="form form--login" name="joinform" method="post" role="form" action="svc_join_pro.go" onsubmit="return inputcheck()" style="width: 440px;">
            <div class="form__field">
               <label class="fontawesome-user" for="login__username"><span class="hidden">UserID</span></label>
               <input style="color:white;" type="text" name="user_id" maxlength="20" class="form__input" id="id_val" placeholder="UserID" maxlength="20" required autofocus onkeyup="IdCheck()">
            </div>
            <h4  id="IdCheckMessagegg"></h4>
            <div class="form__field">
               <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white;" type="password" class="form__input" id="userPassword1" name="user_pw" maxlength="20" placeholder="Password" maxlength="30" required onkeyup="passwordCheckFunction()">
            </div>
            <div class="form__field">
               <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white;" type="password" class="form__input" id="userPassword2"placeholder="RePassowrd" name="repasswd" maxlength="20" required onkeyup="passwordCheckFunction()">
            </div>
            <h4 style="color: red;" id="passwordCheckMessage"></h4>
            <div class="form__field">
               <label class="fontawesome-user" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white; "type="text" class="form__input" name="user_name" id="user_name" placeholder="Name" required>
            </div>
            <br>
            <div class="col-sm-10">
               <label class="form-check-label" for="gridRadios1" style="color:white;padding-right: 78px; padding-left:78px;"> ??????</label>&nbsp;&nbsp;	
               <input class="form__input" type="radio" name="user_corp" id="gridRadios1" value="1" checked > 
               &nbsp;&nbsp;&nbsp;
               <label class="form-check-label" for="gridRadios2" style="color:white;padding-right: 78px; padding-left:78px;">?????? </label>&nbsp;&nbsp;
               <input class="form__input" type="radio" name="user_corp" id="gridRadios2" value="2"> 
            </div>
            <br>
            <br>
            <div class="form__field">
               <label class="fontawesome-user" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white;" name="user_addr" id="user_add" type="text" class="form__input" placeholder="Address" required>
               &nbsp;&nbsp;&nbsp; <button class="form__input" type="button" onclick="sample4_execDaumPostcode()">????????????</button>
            </div>
            <div class="form__field">
               <label class="fontawesome-user" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white;" id="cus_address2" name="user_addr2" type="text" class="form__input" placeholder="Detailed Address" required>
            </div>
            <div class="form__field">
               <label class="fontawesome-user" for="login__password"><span class="hidden">Password</span></label>
               <input style="color:white;" id="user_email"  name="user_email" type="text" class="form__input" placeholder="Email" required>
            </div>
            <div class="form__field">
               <button type="button" onclick="emailAuthentic()" value="???????????????">???????????????</button>
               <input type="hidden" id="ccccc" name="confirm" value="0">
            </div>
            <div class="form__field">
               <input style="color:white;" type="text" style="width:100px;" class="form__input" name="cus_tel1" id="cus_tel1" maxlength="3" placeholder="Phone" required>-<input style="color:white;" type="text" style="width:100px;" class="form__input" name="cus_tel2" id="cus_tel2" maxlength="4" placeholder="Phone" required>-<input style="color:white;" type="text" style="width:100px;" class="form__input" name="cus_tel3" id="cus_tel3" maxlength="4" placeholder="Phone" required>						
            </div>
            <div class="form__field">
               <button type="button" class="btn btn-md btn-secondary" onclick="AWScheck()">?????? ?????? ??????</button>
               <input type="hidden" id="a" name="a" >
               <input type="hidden" id="b" name="b" >
               <input type="hidden" id="c" name="c" >
               <input type="hidden" id="user_charn" name="user_charn" >
            </div>
            <div class="form__field">
               <input type="submit" value="?????? ??????">&nbsp;	&nbsp;			
               <button type="button" class="btn btn-lg btn-secondary btn-block" onclick="location='login.go'">??????</button>
            </div>
         </form>
      </div>
   </div>
</body>
<script>


function emailAuthentic(){
	var url="emailCheck.go?email="+joinform.user_email.value;
	window.open(url, "b", "width=600,height=300,scrollbars=yes,resizeable=no,left=150,top=150") 
}


$(function() {
    $( "#testDatepicker").datepicker({
    });
});
//????????? ???????????? ??????
$('#cus_email2').change(function(){
   $("#cus_email2 option:selected").each(function () {
		
		if($(this).val()== '0'){ //??????????????? ??????
			 $("#cus_email3").val('');                        //??? ?????????
			 $("#cus_email3").attr("disabled",false); //?????????
		}else{ //??????????????? ????????????
			 $("#cus_email3").val($(this).text());      //????????? ??????
			 $("#cus_email3").attr("disabled",true); //????????????
		}
   });
});


function sample4_execDaumPostcode() {  //?????? ?????? api
    new daum.Postcode({
        oncomplete: function(data) {
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

            // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var fullRoadAddr = data.roadAddress; // ????????? ?????? ??????
            var extraRoadAddr = ''; // ????????? ????????? ?????? ??????

            // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
            // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
            if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // ???????????? ??????, ??????????????? ?????? ????????????.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // ?????????, ?????? ????????? ????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // ?????????, ?????? ????????? ????????? ?????? ?????? ????????? ????????? ????????????.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
            //document.getElementById('sample4_postcode').value = data.zonecode; //5?????? ??????????????? ??????
            //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('user_add').value = data.jibunAddress;
            self.close();

            
        }
    }).open();
}
</script>
</html>
