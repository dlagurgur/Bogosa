<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="setting.jsp"%>
<%@include file="header.jsp"%>
<script src="${project}script.js"></script>
<script src="./jquery-3.3.1.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="cus/cus_cart/cus_cart_script.js"></script>

<!-- Descriptor Jumbotron -->
		<div class="jumbotron mt-1 bg-white">
			<h1 class="display-5 text-center font-weight-bold text-dark pt-4 bg-white">주문</h1>
		</div>
		

<div class="container">
<form class="form-vertical" name="cus_pay_form" method='post' action='order_insert_pro.go' onsubmit="return cus_pay_check();">
	<div id="cus_pay_row" class="row">
		<div id="cus_pay_col" class="col">
		<div id="cus_info">
			<div class="form-group row">
				<div class="col">
					<h4>아이디</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${userDto.user_id}" readonly>
				</div>
				<input type="hidden" name="user_id" id="user_id" value="${userDto.user_id}"><br>
			</div>
			
			<div class="form-group row">
				<div class="col">
					<h4>주문자</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${userDto.user_name}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<h4>이메일</h4>
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${userDto.user_email}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					
					<h4>전화번호</h4> 
				</div>
				<div class="col">
					<input class="form-control" type="text" value="${userDto.user_phone}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col">
					<h4>주문받을 주소</h4>
				</div>
				<div class="col">
					<input class="btn btn-md btn-secondary" type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기">
					&nbsp;
					<input class="btn btn-md btn-secondary" type="button" id="currentLocation" onclick="setCurrentLocation()" value="현재 주소">
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<input class="form-control" type="text" name="user_addr" id="user_addr"  value="${userDto.user_addr}">
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<h4>주문 받을 상세 주소</h4>
				</div>
			</div>
			<div class="form-group row">
				<div class="col">
					<input class="form-control" type="text" name="user_addr2" id="user_addr2" value="${userDto.user_addr2}">
				</div>
			</div>

		
		<div id="cus_pay_col" class="col">
			<div class="row">
				<div class="col">
					<h4>주문하신 상품</h4>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="row" id="ordered_menus"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
						<input class="btn btn-md btn-secondary" type="submit" value="주문" style="width:300px;">
						&nbsp;
						<input class="btn btn-md btn-secondary" type="reset" value="닫기" style="width:200px;">
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</form>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84ade146f4c88c0cf4ae826cc2f4eec8&libraries=services"></script>



<script>
setMenusForPay('sessionStorage');


$(document).ready(function(){
    $("#currentLocation").click(function(){
    });
});






function sample4_execDaumPostcode() {
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

            document.getElementById('user_addr').value = data.jibunAddress;
            self.close();

        }
    }).open();
    
    
}

function setCurrentLocation() {
	//현재 위치 찾기
	function success(pos) {
	  var crd = pos.coords;

	  //console.log('Your current position is:');
	  //console.log('Latitude : ' + crd.latitude);
	  //console.log('Longitude: ' + crd.longitude);
	  //console.log('More or less ' + crd.accuracy + ' meters.');
	  
	  var geocoder = new daum.maps.services.Geocoder();

	  var coord = new daum.maps.LatLng(crd.latitude, crd.longitude);
	  var callback = function(result, status) {
	      if (status === daum.maps.services.Status.OK) {
	          document.getElementById('user_addr').value = result[0].address.address_name;
	      }
	  };

	  geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	  
	};

	function error(err) {
	  console.warn('ERROR(' + err.code + '): ' + err.message);
	};

	navigator.geolocation.getCurrentPosition(success, error);
		
	
}

//주문표 출력
function setMenus(storageLocation){
	var storageLoc=eval(storageLocation);
	var orderDetail = JSON.parse(storageLoc.getItem("order"));
	
	var total_pay = 0;
    
    var x = "";
    x+=	'<div class="container">';
    x+= 	'<table class="table table-sm table-hover text-center">';
    x+=			'<thead>'
    x+= 			'<tr>';
    x+=					'<th scope="col">';
    x+=						'제품명';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'가격';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'수량';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'삭제';
    x+=					'</th>';
    x+= 			'</tr>';
    x+= 		'</thead>';
    x+= 		'<tbody>';    
    
    for(i in orderDetail){
    	x+= 		'<tr>';
    	x+=				'<td>';
    	x+=					orderDetail[i].product_name;
    	x+=				'</td>';
    	x+=				'<td>';
    	x+=					orderDetail[i].product_price;
    	x+=				'</td>';
    	x+=				'<td>';
    	x+=					orderDetail[i].product_qnt;
    	x+=				'</td>';
    	x+=				'<td>';
    	x+=					'<button type="button" class="btn btn-warning btn-sm" value="삭제" onclick="deleteMenu('+i+')">';
    	x+=				'</td>';
    	x += 			'<input type="hidden" id="menu_id" name="product_id" value="'+orderDetail[i].product_id+'">';
    	x += 			'<input type="hidden" id="order_qnt" name="product_qnt" value="'+orderDetail[i].product_qnt+'">';
    	x += 			'<input type="hidden" id="ordered_menus" name="product_menus" value="'+orderDetail+'">';
    	
    	total_pay +=orderDetail[i].product_price*orderDetail[i].product_qnt;
    	x+= 		'</tr>';
    }
    x+= 		'</tbody>';
    x+=		'</table>';
    x+=	'</div>';
    x+="전체 가격 : "+ total_pay+"원<br>";
    
    document.getElementById("ordered_menus").innerHTML = x;
} 

//주문표 출력
function setMenusForPay(storageLocation){
	var storageLoc=eval('sessionStorage');
	var orderDetail = JSON.parse(storageLoc.getItem("order"));
	var total_pay = 0;
    var x = "";
    x+=	'<div class="container">';
    x+= 	'<table class="table table-sm table-hover text-center">';
    x+=			'<thead>'
    x+= 			'<tr>';
    x+=					'<th scope="col">';
    x+=						'제품명';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'가격';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'수량';
    x+=					'</th>';
    x+=					'<th scope="col">';
    x+=						'전체 가격 ';
    x+=					'</th>';
    x+= 			'</tr>';
    x+= 		'</thead>';
    x+= 		'<tbody>';    

    for(i in orderDetail){
    	x+=			'<tr>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_name;
    	x+=		 		'</td>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_price;
    	x+=					'원';
    	x+=		 		'</td>';
    	x+=		 		'<td>';
    	x+=					orderDetail[i].product_qnt;
    	x+=					'개';
    	x+=		 		'</td>';
    	
		
    	x += '<input type="hidden" id="menu_id" name="product_id" value="'+orderDetail[i].product_id+'">';
    	x += '<input type="hidden" id="order_qnt" name="product_qnt" value="'+orderDetail[i].product_qnt+'">';
    	x += '<input type="hidden" id="ordered_menus" name="ordered_menus" value="'+orderDetail+'">';
    	
    	total_pay +=orderDetail[i].product_price*orderDetail[i].product_qnt;
    }
    x+=		 		'<td>';
	x+=					total_pay;
	x+=					'원';
	x+=		 		'</td>';
    x+=		 	'</tr>';
    x+= '</table>';
    document.getElementById("ordered_menus").innerHTML = x;
} 

//주문표 삭제
function deleteMenu(index){
	
	var order = JSON.parse(localStorage.getItem("order"));
	
	if(order.length==1){
		localStorage.removeItem("order")
	}else{
		delete order[index];
		//order = JSON.stringify(order);
		var neworder =[];
		for(var i=0; i<order.length;i++){
			if(i==index){
				
			}else{
				neworder.push(order[i]);
			}
		}
		
		neworder = JSON.stringify(neworder);
		
		localStorage.setItem("order",neworder);
	}
	
	setMenus('localStorage');
}



</script>