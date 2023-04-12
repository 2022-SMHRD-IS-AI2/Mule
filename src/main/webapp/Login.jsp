<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/login.css">
</head>
<body>

<div class="back_wrap pf">
	<div class="line_left pf"></div>
	<div class="line_right pf"></div>
	<div class="withmule pf"><img src="img/width_back.png"></div>
</div>

	<div class="wrap">
		<header class="header fb ae">
			<div class="logo pf">
				<a href="index.html">
					<img src="img/logo.png">
				</a>
			</div>
			<!-- logo end  -->

			<!-- <div class="join_wrap pa">
				<ul class="join fb ac">
					<li><img src="img/dod.jpg"></li>
					<li><a href="login.html">Login</a></li>
					<li><a href="joinus.html">Join</a></li>
				</ul>
			</div> -->
		</header>

		<nav class="banner fb">
			<div class="menu_wrap pf">
				<ul class="abroad_menu">
					<h2>해외 구매대행<span class="underline line"></span></h2>
					<li class="point">상품목록<span class="underline line1 none"></span>
						<ul>
							<li><a href="abroad1.html">TV&리모컨</a><span class="underline line2 none"></span></li>
							<li><a href="abroad2.html">PC모니터</a><span class="underline line3 none"></span></li>
							<li><a href="abroad3.html">마우스&키보드</a><span class="underline line4 none"></span></li>
							<li><a href="abroad4.html">빔프로젝터&스피커</a><span class="underline line5 none"></span></li>
						</ul>
					</li>
					<li class="point"><a href="used.html">중고거래</a><span class="underline line6 none"></span></li>
					<li class="point"><a href="board.html">게시판</a><span class="underline line7 none"></span></li>
				</ul>
			</div>
			
			<div class="quick_wrap pf fc ac">
				<ul class="quick">
					<li><a href="bucket.html"><img src="img/bucket.png"></a></li>
					<li><a href="heart.html"><img src="img/heart.png"></a></li>
					<li><a href="my.html"><img src="img/mypage.png"></a></li>
					<li><a href="center.html"><img src="img/center.png"></a></li>
				</ul>
			</div>


			<div class="login_wrap">
				<div class="cs_box t1 c_login">
				   <div class="c1_wrap">
					  <form id="formLogin" method="post" novalidate="novalidate" action="LoginCon"> <!-- **추가** action="" -->
						 <div class="form">
							<div class="f_field">   
							   <div class="ff_wrap">   
								  <label for="loginId">아이디</label>
								  <input type="text" id="loginId" name="id" class="input t1" 
								  required="true" aria-required="true">
							   </div>
							</div>
							   <div class="f_field">
								  <div class="ff_wrap">
									 <label for="loginPwd">비밀번호</label>
									 <input type="password" id="loginPwd" name="pw" class="input t1"
									 required="true" aria-required="true">
								  </div>
							   </div>
							   <div class="f_field">
								  <div class="ff_wrap fb">
									 <div class="c1_checkbox checkbox">
										<input type="checkbox" id="saveId" name="saveId" value="y" checked>
										<label for="saveId">
										   <span>아이디 저장</span>
										</label>
									 </div>
									 <div class="c1_find">
										<ul class="f">
										   <li>
											  <a id="btnFindId">아이디 찾기 / </a>
										   </li>
										   <li>
											  <a id="btnFindPwd">&nbsp;비밀번호 찾기</a>
										   </li>
										</ul>
									 </div>
								  </div>
							   </div>
							   <div class="f_field">
								  <div class="ff_wrap">
									 <button type="submit" class="btn big full t1">LOGIN</button>
								  </div>
							   </div>
							</div>
						</form>							   
							  <div class="f_field">
								  <div class="ff_wrap">
								   <a href="Join.jsp"><button id="btnJoinMember" class="btn big full">JOIN US</button></a>
								  </div>
							   </div>
						 </div>
						 <div class="member_sns_login">
							<a href="#" class="btn_naver_login js_btn_naver_login" data-naver-type="join_method"
							data-naver-url="https://socialmember.godo.co.kr/NaverLogin/naver_api.php?
							mode=login&response_type=code&client_id=aFz5lkO2p3RzDyOOamQy&redirect_uri
							=https%3A%2F%2Fwww.withmeul.com%2F&state=f7582a71e7a7fd98fb552f50b58960e0">
								<!-- <img src="https://withmuel1.cdn-nhncommerce.com/data/skin/front/moment/
								images/common/icon_sns_login_naver.svg" alt="NAVER로 로그인"> -->
								<span>
									<strong>Naver</strong>
									로 로그인
								</span>
							</a>
							<a href="#" class="btn_kakao_login js_btn_kakao_login" data-kakao-type="join_method"
							data-return-url="https://www.withmuel.com/">
								<!-- <img src="https://withmuel1.cdn-nhncommerce.com/data/skin/front/moment/
								images/common/icon_sns_login_kakao.svg" alt="카카오로 로그인"> -->
								<span>
									<strong>Kakao</strong>
									로 로그인
								</span>
							</a>
						 </div>
					  </form>
				   </div>   
				</div>   
			 </div>


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

</body>
</html>