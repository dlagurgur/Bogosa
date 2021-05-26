<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="${project}img/logo_c.png">

    <!-- Bootstrap CSS -->


    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
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

    <title>BOGOSA</title>
    
    <style>
        body{
            background-color: #212529;
            padding-top:70px;
        }
        .list-group-item {
            background-color: #47474c6e;
        }
        a { text-decoration:none }
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
      <!--nav-bar-->
      
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid" style="
        background-color: #47474c6e;">
            
          <a class="navbar-brand fs-2 mr-5 ml-5 text-center" href="product_main.go?menu_category=0"><img
            src="${project}img/BOGOSA.jpg" width="40" height="40"
            class="d-inline-block align-top">&nbsp;&nbsp;BOGOSA</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div style="width: 70px;"></div>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-item text-white fw-bold" href="product_main.go?menu_category=0">라이브 쇼핑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>

                <li class="nav-item">
                    <a class="nav-item text-white fw-bold" href="trailer_main.go">라이브 예정</a>
                </li>      
            </ul>
            <form class="d-flex text-center col-7">
                <select class="mr-5"name="search_type" style="border-radius: 7px;height: 42px;">
                    <option value="name">작성자</option>
                    <option value="title">제목</option>
                    <option value="product_detail">내용</option>
                </select>
              <input class="form-control me-2 ml-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
          <div class="col-3"></div>
          <div class= "float-end">
            <button class="btn btn-primary" type="button" style="background-color: #ac40b9;
            border: none;" onclick="location='login.go'">Sign-in</button>  
            <button class="btn btn-primary" type="button"  onclick="location='join.go'">Sign-up</button>
          </div>
          
            
            
          </div>
 
      </nav>
      <div class="row">
      	<div class="col-2 fixed-top" style="top: 70px; height:100%">
        <!-- 사이드 바 메뉴-->
          <!-- 패널 타이틀1 -->
        <div class="panel panel-info my-3">
            <div class="panel-heading">
              <h4 class="panel-title text-white text-center my-3 py-2" style="
              background-color: #6b5a79;
          ">ON-AIR 구매</h4>
            </div>
            <!-- 사이드바 메뉴목록1 -->
            <ul class="list-group list-group-flush">
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=0">전체 상품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=1">가전디지털</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=2">식품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=3">주방용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a  class="text-white p-3" href="product_main.go?menu_category=4">생활용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=5">의류</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a  class="text-white p-3"href="product_main.go?menu_category=6">취미</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=7">스포츠/레저</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
            </ul>
        </div>

          
    	  </div>
	      <div class="col-10" style="top: 70px;margin-left: 296px; padding-left:50px; padding-right:50px; height:100%;">
	      <!-- 
	      </div>
      </div>

      
  </body>
  -->
</c:if>
  <c:if test="${sessionScope.user_id ne null}">
  <body>
      <!--nav-bar-->
      
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container-fluid" style="
        background-color: #47474c6e;">
            
          <a class="navbar-brand fs-2 mr-5 ml-5 text-center" href="product_main.go?menu_category=0"><img
            src="${project}img/BOGOSA.jpg" width="40" height="40"
            class="d-inline-block align-top" style="z-index:999;">&nbsp;&nbsp;BOGOSA</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div style="width: 70px;"></div>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-item text-white fw-bold" href="product_main.go?menu_category=0">라이브 쇼핑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>

                <li class="nav-item">
                    <a class="nav-item text-white fw-bold" href="trailer_main.go">라이브 예정</a>
                </li>
              
            </ul>
            <form class="d-flex text-center col-7" name="serch_trip" method="post" action="search.go">
                <select class="mr-5"name="search_type" style="border-radius: 7px;height: 42px;" >
                    <option value="name">작성자</option>
                    <option value="title">제목</option>
                    <option value="product_detail">내용</option>
                </select>
              <input class="form-control me-2 ml-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
          </div>
          <div class="col-3"></div>
          <div class= "float-end">
            <button class="btn btn-primary" type="button" style="background-color: #ac40b9;
            border: none;" onclick="location='myPage.go'">MyPage</button>
            <button class="btn btn-primary" type="button"  onclick="location='logout.go'">logout</button>

          </div>
          
            
            
          </div>
      </nav>
      
      <div class="row">
      	  <div class="col-2 fixed-top" style="top: 70px;">
        <!-- 사이드 바 메뉴-->
          <!-- 패널 타이틀1 -->
        <div class="panel panel-info my-3">
            <div class="panel-heading">
              <h4 class="panel-title text-white text-center my-3 py-2" style="
              background-color: #6b5a79;
          ">ON-AIR 구매</h4>
            </div>
            <!-- 사이드바 메뉴목록1 -->
            <ul class="list-group list-group-flush">
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=0">전체 상품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=1">가전디지털</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=2">식품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=3">주방용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a  class="text-white p-3" href="product_main.go?menu_category=4">생활용품</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=5">의류</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item  text-white">
                    <a  class="text-white p-3"href="product_main.go?menu_category=6">취미</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
                <li class="list-group-item text-white">
                    <a class="text-white p-3" href="product_main.go?menu_category=7">스포츠/레저</a>&nbsp;&nbsp;&nbsp;&nbsp;
                </li>
            </ul>
        </div>

          <!-- 패널 타이틀2 -->
        <div class="panel panel-default my-3">
          <div class="panel-heading">
            <h4 class="panel-title text-white text-center my-3 py-2" style="
              background-color: #6b5a79;
          ">ON-AIR 판매</h4>
          </div>
            <!-- 사이드바 메뉴목록2 -->
              <ul class="list-group list-group-flush">
                <li class="list-group-item "><a class="text-white p-3" href="product_insert.go">LIVE로 판매하기</a></li>
                <li class="list-group-item "><a class="text-white p-3" href="Order_confirmation.go">판매내역</a></li>
                <li class="list-group-item "><a class="text-white p-3" href="Order_history_select.go">주문내역</a></li>
              </ul>
        </div>   
        
         <!-- 패널 타이틀3 -->
         <div class="panel panel-default my-3">
            <div class="panel-heading">
              <h4 class="panel-title text-white text-center my-3 py-2" style="
                background-color: #6b5a79;
            ">LIVE 예고</h4>
            </div>
              <!-- 사이드바 메뉴목록2 -->
                <ul class="list-group list-group-flush">
                  <li class="list-group-item "><a class="text-white p-3" href="trailer_insert.go">LIVE 예고 등록</a></li>
                  <li class="list-group-item "><a class="text-white p-3" href="trailer_select.go">내 LIVE 예고 목록</a></li>
                </ul>
          </div>  
          
        </div> 
	      <div class="col-10" style="top: 70px;margin-left: 296px; padding-left:50px; padding-right:50px; height:100%;">
	      <!-- 
	      </div>
      </div>

      
  </body>
  -->
</c:if>
