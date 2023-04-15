<%@page import="java.text.DecimalFormat"%>
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
	<link rel="stylesheet" href="css/bucket.css">
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<body>
	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
  	String u_id=loginUser.getU_id();
	
  	//로그인한 회원의 장바구니 정보 불러오기
  	List<ProductVO> Bvo = new ProductDAO().Bucket(u_id);
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
							<img src="img/cart_icon2.png">
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
							<img src="img/order_icon1.png">
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

				<div class="cart_wrap">
					<ul class="cart_title fb">
						<li>상품/옵션정보</li>
						<li>수량</li>
						<li>상품금액</li>
						<li>합계금액</li>
					</ul>
					
					<% int totalAmount = 0; // 총 결제 금액을 저장할 변수
	
					 if(Bvo.size()>0){
					 	for (int i = 0; i < Bvo.size(); i++) {
						    int amount = Bvo.get(i).getAmount();
						    int price = Bvo.get(i).getProd_price();
						    int totalPrice = amount * price;
						    totalAmount += totalPrice; // 총 결제 금액 계산
						    
							 // 가격 천다위 쉼표로 나타내기 
							 DecimalFormat formatter = new DecimalFormat("#,###");
							 String Prod_price = formatter.format(price);
							 String total_Price = formatter.format(totalPrice);
							 
					%>
					
					<form class="input2" action="OrderCon" method="post">
					<ul class="cart_list fb">
						<li><a href="DeleteBucketCon?prod_num=<%=Bvo.get(i).getProd_num()%>">X</a></li>
						<li class="f ac cart_img"><span><img src="./Prod/<%= Bvo.get(i).getProd_title() %>"></span>
						<%= Bvo.get(i).getProd_name() %></li>
						<li><input type="number" min="1" max="9999" id="cnt<%= i %>" name="cnt[]" value=<%= amount %>></li>
						<li><%=Prod_price%> 원</li>
						<li><span class="totalPrice" id="totalPrice<%= i %>"><%=total_Price%> 원</span></li>
					</ul>
					
					<script>
					  $(document).ready(function() {
					    $('#cnt'+<%= i %>).change(function() {
					      let amount = $('#cnt'+<%= i %>).val();
					      let totalPrice = amount * <%= price %>; // 상품 하나당 총 결제 금액 계산
					      $('#totalPrice'+<%= i %>).text(totalPrice.toLocaleString() + " 원"); // 천단위 쉼표 추가
					      totalAmount = 0; // 총 결제 금액 초기화
					      $('.totalPrice').each(function() {
					        totalAmount += parseInt($(this).text().replace(/,/g, "")); // 총 결제 금액 재계산
					      });
					      $('#totalAmount').text(totalAmount.toLocaleString() + " 원"); // 천단위 쉼표 추가
					      document.getElementById('_totalAmount').value = totalAmount;
					      console.log(document.getElementById('_totalAmount').value);
					    });
					  });
					</script>
		  			
		  			<input hidden name="prodNum[]" value="<%=Bvo.get(i).getProd_num()%>">
		  		<%}%>
		  
					<ul class="cart_total fe">
						<li>총 <span><%=Bvo.size()%></span>개의 상품 금액</li>
						<ul class="fa">
							<li>TOTAL</li>
							<li>=</li>
							
							<% // 가격 천다위 쉼표로 나타내기
							 DecimalFormat formatter = new DecimalFormat("#,###");
							String total_Amount = formatter.format(totalAmount); %>
							
							<li><span id="totalAmount"><%=total_Amount%>원</li>
						</ul>
					</ul>
					
				  <input hidden name="main_prod_name" value="<%=Bvo.get(0).getProd_name() %>">
				  <input hidden name="amount" value="<%=Bvo.size()%>">
				  <input name="_totalAmount" id="_totalAmount" value="<%=totalAmount%>" type="hidden">
				</div>
				<!-- cart_wrap -->

				<div class="order_wrap">
					<ul class="fb ae">
						<li><input type="submit" value="상품 주문 하기"></li>
			<%}%>
			        	</form>	      
						<li><a href="Main.jsp">쇼핑 계속 하기</a></li>
					</ul>
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