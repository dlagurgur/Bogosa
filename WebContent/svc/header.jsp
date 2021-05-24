<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="${project}img/logo_c.png">
	
	<title>Encore</title>
	
	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" type="text/css"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	<!-- Custom styles for this template -->
	<style>








		body {
			min-height: 75rem;
			padding-top: 4.5rem;
		}		
		a.nav-item {
			color: white;
		}			
		select { 
		width: 100px;
   	 	height: 30px;
    	padding-left: 10px;
    	font-size: 18px;
    	color: #353535;
    	border: 1px solid #006fff;
    	border-radius: 3px;
		}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
	</style>
</head>

<c:if test="${sessionScope.user_id eq null}">
	<body>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-#1C1C1C" style="background-color: #1C1C1C; height: 51px;">
			<a class="navbar-brand" href="product_main.go?menu_category=0"> <img
				src="${project}img/BOGOSA.jpg" width="30" height="30"
				class="d-inline-block align-top"> BOGOSA
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=0">전체 상품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=1">가전디지털</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>

		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=2">식품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=3">주방용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
				<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=4">생활용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
				<li class="nav-item">
			<a class="nav-item " href="product_main.go?menu_category=5">의류</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=6">취미</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
			<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=7">스포츠/레저</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		
		
		<li class="nav-item">
			<a class="nav-item" href="trailer_main.go">라이브 예정</a>
		</li>
				</ul>
				

				<button type="button"  onclick="location='login.go'">로그인</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button"  onclick="location='join.go'">회원가입</button>
				
				
			</div>
		</nav>

		<!-- Bootstrap core JavaScript (**Essential for Toggler action)
	================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
	</body>
</c:if>
<c:if test="${sessionScope.user_id ne null}">
	<body>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-#1C1C1C" style="background-color: #1C1C1C; height: 51px;">
			<a class="navbar-brand" href="product_main.go?menu_category=0"> <img
				src="${project}img/BOGOSA.jpg" width="30" height="30"
				class="d-inline-block align-top"> BOGOSA
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarCollapse" aria-controls="navbarCollapse"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav mr-auto">
					<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=0">전체 상품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=1">가전디지털</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=2">식품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=3">주방용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
				<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=4">생활용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
				<li class="nav-item">
			<a class="nav-item " href="product_main.go?menu_category=5">의류</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=6">취미</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
			<li class="nav-item">
			<a class="nav-item" href="product_main.go?menu_category=7">스포츠/레저</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</li>
		
		
		<li class="nav-item">
			<a class="nav-item" href="trailer_main.go">라이브 예정</a>
		</li>
				</ul>
<form class="form-inline mt-2 mt-md-0 login-section" name="serch_trip" method="post" action="search.go" >		
<div class="box">
  <div class="container-4">
  <select name="search_type">
	<option value="name">작성자</option>
	<option value="product_detail">내용</option>
</select> &nbsp;
    <input type="search" id="search" name="keyword" placeholder="Search..." style="" />
    <button type="submit" class="icon"><i class="fa fa-search"></i></button>
  </div>
</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
</form>
					<form class="form-inline mt-2 mt-md-0 login-section" name="serch_trip" method="post" action="searchTrip.go" >
						<a class="nav-item" href="logout.go">${btn_logout}</a>&nbsp;&nbsp;&nbsp;
						<a  class="fas fa-address-card fa-2x" href="myPage.go" ></a> 
					</form>
					
					
					
					
	
					
					
					
					
					
					
					
					
					
				
			</div>
		</nav>

		<!-- Bootstrap core JavaScript (**Essential for Toggler action)
	================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
	</body>
</c:if>
</html>
