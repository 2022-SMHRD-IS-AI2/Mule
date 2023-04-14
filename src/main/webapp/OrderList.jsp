<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
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
	<link rel="stylesheet" href="css/mypage_check.css">
</head>
<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
  	String u_id=loginUser.getU_id();
	
  	//로그인한 회원의 주문내역 불러오기
  	List<ProductVO> Pvo = new ProductDAO().orderList(u_id);
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
							<img src="img/check_icon1.png">
							<p>CHECK</p>
						</li>
						<li>주문/배송조회</li>
					</ul>
					<!-- check end -->
		
					<ul class="sell" onclick="location.href='SalesList.jsp'">
						<li>
							<img src="img/sell.png">
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

				<div class="check_wrap">
					<h4 class="f">주문/배송조회 내역<span class="underline"></span></h4>
					<ul class="check_title fb">
						<li>구매날짜</li>
						<li>상품명/옵션</li>
						<li>상품금액/수량</li>
						<li>주문상태</li>
						<li>확인/리뷰</li>
					</ul>
					
				<% if(Pvo.size()>0){
	 				for (int i = 0; i < Pvo.size(); i++) {
	 				
	 					Timestamp orderTimestamp = Pvo.get(i).getOrder_date(); // 주문일자 정보를 Timestamp 타입으로 받아옴
	 					Date orderDate = new Date(orderTimestamp.getTime()); // Timestamp에서 Date로 변환
	 					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	 					String OrderDate = dateFormat.format(orderDate); // 날짜 포맷을 적용한 문자열을 생성
	 					
	 					// 가격 천다위 쉼표로 나타내기 
						int price = Pvo.get(i).getProd_price();
					    DecimalFormat formatter = new DecimalFormat("#,###");
					    String Prod_price = formatter.format(price);
	 				%>
	 				
					<ul class="check_list fb">
						<li><%=OrderDate%></li>
						<li class="f ac"><span>	<img src="./Prod/<%= Pvo.get(i).getProd_title() %>"></span>
						<p><%=Pvo.get(i).getProd_name()%></p></li>
						<li><%=Prod_price%>원 /<%=Pvo.get(i).getAmount()%>개</li>
						
					   <% // 상품 배송상태/ 결제상태/ 반품여부 확인
						if(Pvo.get(i).getDelivery_progress().equals("N")){%>
				 			<li>상품준비중</li>
				 			<li></li>
				 		<%}else if(Pvo.get(i).getDelivery_progress().equals("Y")){%>
				 			<li>배송완료</li>
				 			
				 			<%//결제확정 여부 검사
				 			if(Pvo.get(i).getPayment_status().equals("Y")){%>
				 				<%if(Pvo.get(i).getReview_status().equals("N")){%>
							 			<form action="Review.jsp">
						            		<input hidden name="prod_num" value="<%=Pvo.get(i).getProd_num()%>">
						            		<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
						            		<li><button class=rbtn type="submit">리뷰작성하기</button></li>
						            	</form>
			            		<%}else if(Pvo.get(i).getReview_status().equals("Y")){%>
			            			<li>리뷰작성완료</li>
			            		<%}%>
			            		
				 		    <%}else if(Pvo.get(i).getReturn_status().equals("Y")){%>
				 				<li>반품처리</li>
				 			<%}else if(Pvo.get(i).getUsedprod_status().equals("Y")){%>
				 				<li>중고거래처리</li>
				 			<%}else{%>
						 		<li class="check_menu_wrap">
									<span class="check_menu">구매확정하기<span>
										<ul class="check_sub none">
											<p class="triangle"></p>
								 				<form action="UsedprodStatusCon">
							            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
							            			<button type="submit"><li>중고판매하기</li></button>
							            		</form>
							            		
							            		<form action="ReturnStatusCon">
							            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
							            			<li><button type="submit">반품신청하기</button></li>
							            		</form>
							            		
							            		<form action="PaymentStatusCon">
							            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
							            			<li><button type="submit">구매확정하기</button></li>>
							            		</form>
										</ul>
									</li>
								 		<%} //배송완료시 사용자가 선택할 수 있는 이벤트 else문 끝%>
								 	<%} // 배송완료 검사 else if문 끝%>
								</ul>
								 <%} //주문내역 출력 for문 끝%>
							  <%} //주문내역 존재 확인 if문 끝%>
							  </div>
				<!-- check_wrap -->

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