<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/mypage_sell.css">
</head>
<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
	String u_id=loginUser.getU_id();

	//로그인한 회원의 주문내역 불러오기
	List<ProductVO> Pvo = new ProductDAO().salesList(u_id);
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

		<section class="mypage_wrap">
			<div class="mypage fc">
				<div class="mypage_info fb">
					<ul class="check" onclick="location.href='OrderList.jsp'">
						<li>
							<img src="img/check_icon.png">
							<p>CHECK</p>
						</li>
						<li>주문/배송조회</li>
					</ul>
					<!-- check end -->
		
					<ul class="sell" onclick="location.href='SalesList.jsp'">
						<li>
							<img src="img/sell_icon1.png">
							<p>SELL</p>
						</li>
						<li>판매내역</li>
					</ul>
					<!-- sell end -->
					
					<ul class="member" onclick="location.href='UserModify.jsp'">
						<li>
							<img src="img/member_icon.png">
							<p>MEMBER</p>
						</li>
						<li>회원정보수정</li>
					</ul>
					<!-- member end -->
				</div>
				<!-- mypage_info end -->

				<div class="sell_wrap">
					<h4 class="f">중고거래 판매 내역<span class="underline"></span></h4>
					<ul class="sell_title fb">
						<li>상품등록날짜</li>
						<li>상품명/옵션</li>
						<li>상품금액</li>
						<li>상품수량</li>
						<li>상품확인</li>
					</ul>
					
					<% if(Pvo.size()>0){
						for(int i=0; i<Pvo.size(); i++){ 
					
						Timestamp prodTimestamp = Pvo.get(i).getProd_date(); // 주문일자 정보를 Timestamp 타입으로 받아옴
	 					Date prodDate = new Date(prodTimestamp.getTime()); // Timestamp에서 Date로 변환
	 					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 					String ProdDate = dateFormat.format(prodDate); // 날짜 포맷을 적용한 문자열을 생성
	 					%>
					
						<ul class="sell_list fb">
							<li><%=ProdDate%></li>
							<li class="f ac"><span><img src="./Prod/<%=Pvo.get(i).getProd_title()%>">
							</span><p><%=Pvo.get(i).getProd_name() %></p></li>
							<li><%=Pvo.get(i).getProd_price()%></li>
							<li><%=Pvo.get(i).getBuyer_cnt()%>개</li>
							<a href="ProdDetail.jsp?prod_num=<%=Pvo.get(i).getProd_num()%>"><li class="gogo"> <span>내상품보러가기</span></li></a>
						</ul>
					    <%} %>
			      <%} %>
					</div>
				<!-- sell_wrap -->

			</div>
			<!-- mypage end -->
		</section>
		<!-- mypage_wrap end -->
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