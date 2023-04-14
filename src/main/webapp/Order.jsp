<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/order.css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
  	String u_id=loginUser.getU_id();
  	
  	//주문내역 정보 받아오기 
	String main_prod_name= (String)request.getAttribute("main_prod_name"); //대표 상품명
	int total_amount = (int)request.getAttribute("total_amount"); // 총 상품 수량
	int amount = total_amount-1;
	int paid_amount = (int)request.getAttribute("paid_amount"); //  총 결제 금액
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


			<div class="quick_wrap pf fc ac">
				<ul class="quick">
					<li><a href="Bucket.jsp"><img src="img/bucket.png"></a></li>
					<li><a href="WishList.jsp"><img src="img/heart.png"></a></li>
					<li><a href="OrderList.jsp"><img src="img/mypage.png"></a></li>
					<li><a href="Center.jsp"><img src="img/center.png"></a></li>
				</ul>
			</div>
		</nav>

		<section class="bucket_wrap fc">
			<div class="bucket fc">
				<div class="bucket_info fb">
					<ul class="cart">
						<li>
							<img src="img/cart_icon1.png">
							<p>CART</p>
						</li>
						<li>장바구니</li>
					</ul>
					<!-- cart end -->
					<ul class="arrow">
						>
					</ul>
					<ul class="order">
						<li>
							<img src="img/order_icon2.png">
							<p>ORDER</p>
						</li>
						<li>주문서작성</li>
					</ul>
					<!-- order end -->
					<ul class="arrow">
						>
					</ul>
					<ul class="complete">
						<li>
							<img src="img/complete_icon1.png">
							<p>COMPLETE</p>
						</li>
						<li>주문완료</li>
					</ul>
					<!-- complete end -->
				</div>
				<!-- bucket_info end -->

				<div class="order_wrap">
					<h4 class="f">주문/배송정보<span class="underline"></span></h4>
					<div class="order1 f">
					<ul class="order_title">
						<li>받으실 분</li>
						<li>배송지 확인</li>
						<li>휴대폰 번호</li>
						<li>총 결재 금액</li>
					</ul>
					
				<form action="PayCon" method="post">
					<ul class="order_input">
						<li><input type="text" name="recipient"></li>
						<li><input type="text" name="phone"></li>
						<li><input type="text" name="address"></li>
						<li><%=main_prod_name %>외 <%=amount%>개 <%=paid_amount%>원</li>
					</ul>
						<input hidden name="main_prod_name" value="<%=main_prod_name %>">
		  				<input hidden name="total_amount" value="<%=total_amount%>">
  		  				<input hidden name="paid_amount" value="<%=paid_amount %>">
					</div>
				</div>

					<div class="pay_wrap fc">
						<ul class="fc ae">
							<li><input type="submit" value="결제하기"></li>
						</ul>
					</div>
				</form>
				
		</div>
			
			</div>
			<!-- bucket end -->
		</section>
	</div>
	<!-- wrap end -->

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
	
</body>
</html>