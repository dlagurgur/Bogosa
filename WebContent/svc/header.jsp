<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
	<meta name="author" content="">
	<link rel="icon" href="${project}img/logo_c.png">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link href="https://vjs.zencdn.net/7.10.2/video-js.css" rel="stylesheet" />
	<script src="https://vjs.zencdn.net/7.8.2/video.min.js"></script>
	<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/5.15.0/videojs-contrib-hls.min.js"></script>
	<script id="config1" src="${project}script.js"></script>
	<script src="${project}script.js"></script>
	<script src="${project}aws-sdk-2.897.0.min.js"></script>
	<script src="https://player.live-video.net/1.2.0/amazon-ivs-player.min.js"></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
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
			
			.form input[type="password"], .form input[type="text"], .form input[type="submit"], .form input[type="number"] {
			  width: 100%;
			}
			.form--login {
			  color: #606468;
			}
			.form--login label,
			.form input[type="number"],
			.form--login input[type="text"],
			.form--login input[type="password"],
			.form--login input[type="submit"] {
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
			
			.card{
			background-color: bg-black;
			}
			
	        body{
	            background-color: #212529;
	        }
	        .list-group-item {
	            background-color: #47474c6e;
	        }
	        a { text-decoration:none }
	        #sidebar {
	            width: 300px;
	            position: fixed;
	            top: 70;
	            left: -230px;
	            height: 100%;
	            z-index: 999;
	            background: #333;
	            color: #fff;
	            transition: all 0.3s;
	        }
	        #sidebar.active {
	            left: 0;
	            top:70;
	        }
	
	        .overlay {
	            position: fixed;
	            width: 100vw;
	            height: 100vh;
	            background: rgba(0, 0, 0, 0);
	            z-index: 998;
	            display: none;
	        }
	        
	        #video{
            width: 960px;
            height: 540px;
            margin:0 auto; 
        	}
	
	        #main{
	            transition: all 0.3s;
	        }
	
	        input[id="menuicon"]{
	        display: none;
	        }
	        input[id="menuicon"] + label{
	            display: block;
	            width: 36px;
	            height: 24px;
	            position: relative;
	            cursor: pointer;
	        }
	
	        input[id="menuicon"] + label span {
	            display: block;
	            position: absolute;
	            width: 100%;
	            height: 3px;
	            border-radius: 18px;
	            background: rgb(214, 179, 238);
	            transition: all .35s;
	        }
	
	        input[id="menuicon"] + label span:nth-child(1) {
	            top:0;
	        }
	        input[id="menuicon"] + label span:nth-child(2) {
	            top: 50%;
	            transform: translateY(-50%);
	        }
	        input[id="menuicon"] + label span:nth-child(3) {
	            bottom: 0;
	        }
	
	        input[id="menuicon"]:checked + label span:nth-child(1) {
	            top:50%;
	            transform: translateY(-50%) rotate(45deg);
	        }
	
	        input[id="menuicon"]:checked + label span:nth-child(2) {
	            opacity: 0;
	        }
	
	        input[id="menuicon"]:checked + label span:nth-child(3) {
	            bottom:50%;
	            transform: translateY(50%) rotate(-45deg);
	        }
	        
	        .insert-label{
			    color: white;
			    background-color: #6b48af;
			}
	        
    </style>

    <title>BOGOSA</title>
    
  </head>

  <body>
  <c:if test="${sessionScope.user_id eq null}">

                                       <!--Nav-Bar when session exist-->

      <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
          <div class="container-fluid" style="
          background-color: #47474c6e;">
              <a class="navbar-brand fs-2 mr-5 ml-5 text-center" href="product_main.go?menu_category=0"><img
                  src="${project}img/BOGOSA.jpg" width="40" height="40"
                  class="d-inline-block align-top">&nbsp;&nbsp;BOGOSA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item mr-1">
                      <a class="nav-item text-white fw-bold" href="product_main.go?menu_category=0">라이브 쇼핑</a>&nbsp;&nbsp;&nbsp;&nbsp;
                  </li>
  
                  <li class="nav-item mr-1">
                      <a class="nav-item text-white fw-bold" href="trailer_main.go">라이브 예정</a>
                  </li>
                  <li class="nav-item mr-1" style="margin-left:30px;">
                      <input type="checkbox" name="" id="menuicon">
                      <label for="menuicon">
                          <span></span>
                          <span></span>
                          <span></span>
                      </label>
                  </li> 
                   
              </ul>
              
              <form class="d-flex text-center col-7"  name="serch_trip" method="post" action="search.go">
                  <select class="form-select-small text-white border-0 mr-5"name="search_type" style="border-radius: 7px;height: 40px;margin-right: 20px;background-color: #323438;">
                      <option value="name">작성자</option>
                      <option value="title">제목</option>
                      <option value="product_detail">내용</option>
                  </select>
                <input style="color:white;" class="form-control form-control-sm bg-dark border-white me-2 ml-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light border-0" type="submit">Search</button>
              </form>
            </div>
            <div class="col-3"></div>
            <div class= "float-end">
              <button class="btn btn-sm text-white" type="button" style="width: 66px; height:40px; background-color: #ac40b9;
              border: none;" onclick="location='login.go'">Sign-in</button>  
              <button class="btn btn-sm text-white" type="button" style="width: 66px; height:40px; background-color: #6833d0;
              border: none;"  onclick="location='join.go'">Sign-up</button>
            </div>
          </div>
        </nav>
        <div id="wrap">
          <nav id="sidebar">
              <div class="panel panel-info my-3">
                  <div class="panel-heading">
                    <h4 class="panel-title text-white text-center mx-auto py-2" style="
                    background-color: #6b5a79;
                    margin-bottom: 16px;
                ">ON-AIR 구매</h4> 
                  </div>
                  <!-- 사이드바 메뉴목록1 -->
                  <ul class="list-group list-group-flush">
                      <li class="list-group-item text-white">
                          <a class="text-white p-3" href="product_main.go?menu_category=1">가전디지털</a>
                      </li>
              
                      <li class="list-group-item  text-white">
                          <a class="text-white p-3" href="product_main.go?menu_category=2">식품</a>
                      </li>
                      <li class="list-group-item  text-white">
                          <a class="text-white p-3" href="product_main.go?menu_category=3">주방용품</a>
                      </li>
                      <li class="list-group-item  text-white">
                          <a  class="text-white p-3" href="product_main.go?menu_category=4">생활용품</a>
                      </li>
                      <li class="list-group-item  text-white">
                          <a class="text-white p-3" href="product_main.go?menu_category=5">의류</a>
                      </li>
                      <li class="list-group-item  text-white">
                          <a  class="text-white p-3"href="product_main.go?menu_category=6">취미</a>
                      </li>
                      <li class="list-group-item text-white">
                          <a class="text-white p-3" href="product_main.go?menu_category=7">스포츠/레저</a>
                      </li>
                  </ul>
              </div>             
          </nav>

          <div class="overlay"></div>
          </div>
  
        <div id="main" class="row" style="margin-top: 70px; margin-left:70px">  	      
  </c:if>



  <c:if test="${sessionScope.user_id ne null}">
  
                                         <!--Nav-Bar when session is null-->

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container-fluid" style="
      background-color: #47474c6e;">
          <a class="navbar-brand fs-2 mr-5 ml-5 text-center" href="product_main.go?menu_category=0"><img
              src="${project}img/BOGOSA.jpg" width="40" height="40"
              class="d-inline-block align-top">&nbsp;&nbsp;BOGOSA</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item mr-1">
                  <a class="nav-item text-white fw-bold" href="product_main.go?menu_category=0">라이브 쇼핑</a>&nbsp;&nbsp;&nbsp;&nbsp;
              </li>

              <li class="nav-item mr-1">
                  <a class="nav-item text-white fw-bold" href="trailer_main.go">라이브 예정</a>
              </li>
              <li class="nav-item mr-1" style="margin-left:30px; margin-right:30px;">
                  <input type="checkbox" name="" id="menuicon">
                  <label for="menuicon">
                      <span></span>
                      <span></span>
                      <span></span>
                  </label>
              </li>
              
              <c:if test="${Product_dto.user_id eq sessionScope.user_id}">
					<li>
						<form class="form form--login" action="product_detaile_delete.go" role="form">
							<input type="hidden" name="product_id" value="${Produt_dto.product_id}">
							<input type="hidden" name="trailer_id" value="${Produt_dto.trailer_id}">
							<button type="submit" class="btn btn-sm btn-danger p-0">방송종료</button>
						</form>
					</li>
				</c:if>
                  
          </ul>
          
          <form class="d-flex text-center col-7"  name="serch_trip" method="post" action="search.go">
              <select class="form-select-small text-white border-0 mr-5"name="search_type" style="border-radius: 7px;height: 40px;margin-right: 20px;background-color: #323438;">
                  <option value="name">작성자</option>
                  <option value="title">제목</option>
                  <option value="product_detail">내용</option>
              </select>
            <input style="color:white;" class="form-control form-control-sm bg-dark border-white me-2 ml-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light border-0" type="submit">Search</button>
          </form>
        </div>
        <div class="col-3"></div>
        <div class= "float-end">
          <button class="btn btn-sm text-white" type="button" style="width: 66px; height:40px; background-color: #ac40b9;
          border: none;" onclick="location='myPage.go'">MyPage</button>  
          <button class="btn btn-sm text-white" type="button" style="width: 66px; height:40px; background-color: #6833d0;
          border: none;"  onclick="location='logout.go'">logOut</button>
        </div>
      </div>
    </nav>
      
      <div id="wrap">
        <nav id="sidebar">
            <!-- 패널 타이틀1 -->
            <div class="panel panel-info my-3">
                <div class="panel-heading">
                  <h4 class="panel-title text-white text-center mx-auto py-2" style="
                  background-color: #6b5a79;
                  margin-bottom: 16px;
                 ">ON-AIR 구매</h4> 
                </div>
                <!-- 사이드바 메뉴목록1 -->
                <ul class="list-group list-group-flush">
                    <li class="list-group-item text-white">
                        <a class="text-white p-3" href="product_main.go?menu_category=1">가전디지털</a>
                    </li>
            
                    <li class="list-group-item  text-white">
                        <a class="text-white p-3" href="product_main.go?menu_category=2">식품</a>
                    </li>
                    <li class="list-group-item  text-white">
                        <a class="text-white p-3" href="product_main.go?menu_category=3">주방용품</a>
                    </li>
                    <li class="list-group-item  text-white">
                        <a  class="text-white p-3" href="product_main.go?menu_category=4">생활용품</a>
                    </li>
                    <li class="list-group-item  text-white">
                        <a class="text-white p-3" href="product_main.go?menu_category=5">의류</a>
                    </li>
                    <li class="list-group-item  text-white">
                        <a  class="text-white p-3"href="product_main.go?menu_category=6">취미</a>
                    </li>
                    <li class="list-group-item text-white">
                        <a class="text-white p-3" href="product_main.go?menu_category=7">스포츠/레저</a>
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
                    <!-- 사이드바 메뉴목록3 -->
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item "><a class="text-white p-3" href="trailer_insert.go">LIVE 예고 등록</a></li>
                      <li class="list-group-item "><a class="text-white p-3" href="trailer_select.go">내 LIVE 예고 목록</a></li>
                    </ul>
              </div>  
        </nav>
        <div class="overlay"></div>
      </div>

      <div id="main" class="row" style="margin-top: 70px; margin-left:70px">

</c:if>
