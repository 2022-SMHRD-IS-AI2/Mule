<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
	<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/joinus.css">
	<script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
</head>
<body>
	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	%>

	<div class="back_wrap pf">
		<div class="line_left pf"></div>
		<div class="line_right pf"></div>
		<div class="withmule pf"><img src="img/width_back.png"></div>
	</div>

	<div class="wrap">
		<header class="header fb ae">
			<div class="logo pf">
				<a href="Main.jsp">
					<img src="img/logo.png">
				</a>
			</div>
			<!-- logo end  -->

			<div class="join_wrap pa">
				<ul class="join fb ac">
					<li><img src="img/dod.jpg"></li>
						<%if(loginUser != null){%>
							<li><a href="LogoutCon">Logout</a></li>
						<%}else{%>
							<li><a href="Login.jsp">Login</a></li>
						<%} %>
					<li><a href="Join.jsp">Join</a></li>
				</ul>
			</div>
		</header>

		<nav class="banner fb">
			<div class="menu_wrap pf">
				<ul class="abroad_menu">
					<h2>해외 구매대행<span class="underline line"></span></h2>
					<li class="point">상품목록<span class="underline line1 none"></span>
						<ul>
							<li><a href="Abroad1.jsp">TV&리모컨</a><span class="underline line2 none"></span></li>
							<li><a href="Abroad2.jsp">PC모니터</a><span class="underline line3 none"></span></li>
							<li><a href="Abroad3.jsp">마우스&키보드</a><span class="underline line4 none"></span></li>
							<li><a href="Abroad4.jsp">빔프로젝터&스피커</a><span class="underline line5 none"></span></li>
						</ul>
					</li>
					<li class="point"><a href="UsedProdMain.jsp">중고거래</a><span class="underline line6 none"></span></li>
					<li class="point"><a href="Board.jsp">게시판</a><span class="underline line7 none"></span></li>
					<%if(loginUser != null){
						if(loginUser.getU_id().equals("admin")){%>
							<li class="point"><a href="OverseasProd.jsp">상품등록</a><span class="underline line7 none"></span></li>
						<%} %>
					<%}%>
				</ul>
				</div>
				
				<div class="joinus_wrap">
					<div class="join_tit">
						<h4>기본정보<span class="line"></span></h4>
					</div>
					
						<form action="JoinCon" method="post">
							<div class="join_wrap">
								<ul class="info">
									<li class="f ac pr"><span>아이디</span><input type="text" name="id" id="dcid">
									<button type="button"class="pa" id= "IdCheck">중복확인하기</button></li>
									<br><h6 id="resultCheck"></h6>
									<li class="f ac"><span>비밀번호</span><input type="password" name="pw"></li>
									<li class="f ac"><span>이름</span><input type="text" name="name"></li>
									<li class="f ac"><span>닉네임</span><input type="text" name="nick"></li>
									<li class="f ac"><span>주소</span><input type="text" name="address"></li>
									<li class="f ac"><span>휴대폰번호</span><input type="text" name="tel" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></li>
								</ul>
								<ul class="info2 fb ac">
									<li class="f ac"><p>성별</p>&nbsp;<input type="radio" name="gender">여성&nbsp;&nbsp;&nbsp;<input type="radio" name="gender"> 남성</li>
									<li class="f ac"><p>나이</p><input type="number" min="1" max="99" value="20" name="age"></li>
									<li class="f ac"><p>직업</p>
									<select name="job" id="">
										<option>선택하기</option>
										<option>전문직</option>
										<option>공무원</option>
										<option>프리랜서</option>
										<option>자영업</option>
										<option>종교인</option>
										<option>주부</option>
										<option>학생</option>
										<option>기타</option>
									</select>
									</li>
								</ul>
								</form>
								<ul class="join_btn">
									<li><button type="submit" >JOIN US</button></li>
									<li><button>CANCLE</button></li>
								</ul>
							</div>
						</form>

					</div>

			<div class="quick_wrap pf fc ac">
				<ul class="quick">
					<li><a href="Bucket.jsp"><img src="img/bucket.png"></a></li>
					<li><a href="WishList.jsp"><img src="img/heart.png"></a></li>
					<li><a href="OrderList.jsp"><img src="img/mypage.png"></a></li>
					<li><a href="Center.jsp"><img src="img/center.png"></a></li>
				</ul>
			</div>
		</nav>
		
			<div class="sns_wrap pf">
				<ul class="sns fa">
					<li><a href=""><img src="img/twiter.png"></a></li>
					<li><a href=""><img src="img/ins.png"></a></li>
					<li><a href=""><img src="img/tube.png"></a></li>
				</ul>
			</div>
			
			<div class="chat_wrap pf">
				<ul class="chat fc ac">
					<li><a class="fc ac" href=""><img src="img/chatbot.png"></a></li>
				</ul>
			</div>


	</div>
	<!-- wrap end -->
	
       <script>
       		let button = document.querySelector("#IdCheck");
      	 	console.log("버튼제대로눌림")
            	function checkE(){
               	var IdCheck = $('#dcid').val()
               	console.log(IdCheck)
               
               $.ajax({
                 		 // 어디로 요청할 것인지??
                        url : 'IdCheckCon',
                        // 요청데이터(jsaon형태, {key, value})
                        data : {'IdCheck': IdCheck},
                        // 요청방식
                        type: 'get',
                        // 요청-응답
                        success : function(data){
                           if(data =='true'){
                              $('#resultCheck').text('사용할 수 없는 아이디')
                           }else {
                              $('#resultCheck').text('사용할 수 있는 아이디')
                           }
                        },
                        error : function(){
                           alert("통신실패")
                        }                    
               	})              
            }
            
            button.addEventListener('click',checkE)
         </script>
</body>
</html>