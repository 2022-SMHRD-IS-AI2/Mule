<%@page import="java.text.DecimalFormat"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="com.smhrd.model.ReviewVO"%>
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
	<link rel="stylesheet" href="css/abroad.css">
</head>
<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	
	//해외 공구 상품 불러오기
	List<ProductVO> Pvo = (new ProductDAO()).OPshow();
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

		<section class="product_wrap">
			<div class="category_wrap">
				<ul class="category fc">
					<li>TV&리모컨</li>
				</ul>
			</div>
			<!-- category end -->

			<div class="pr_title fb">
				<ul class="pr_txt f">
					<li class="f">
						<img src="img/list.JPG">
						<span>9개</span>의 상품이 있습니다.</li>
				</ul>
				<ul class="pr_list f">
					<li><img src="img/home.JPG"></li>
					<li>></li>
					<li>TV&리모컨</li>
				</ul>
			</div>

			<div class="product fb">
				<div class="cate cate1 f">
				<%for(int i=0; i<Pvo.size(); i++){ 
					if(Pvo.get(i).getProd_cate().equals("TV&리모컨")){%>
				<div class="tv_pro">
					<ul class="p_img fc ac">
						<li><a href="ProdDetail.jsp?prod_num=<%=Pvo.get(i).getProd_num()%>">
							<img src="./Prod/<%=Pvo.get(i).getProd_title()%>" alt=""></a></li>
					</ul>
					<ul class="p_text f ac">
						<li><span><b>[<%=Pvo.get(i).getProd_cate() %>]</b></span>
								  <b><%=Pvo.get(i).getProd_name() %></b></li>
					<li class="fb">
						<ul>
							<% // 가격 천다위 쉼표로 나타내기 
							int price = Pvo.get(i).getProd_price();
						    DecimalFormat formatter = new DecimalFormat("#,###");
						    String Prod_price = formatter.format(price);
							%>
							
							<li><b><%=Prod_price%>원</b></li>
						</ul>
						
						<% //리뷰
						String prod_num=Pvo.get(i).getProd_num(); 
						ReviewVO rvo = new ReviewDAO().avgRating(prod_num);
						  
						if(rvo!=null){
						  float avg = rvo.getAvg_rating();
						  int avg2 = (int) avg;%>
						  
						<ul class="star f">
							  <% for(int j=0; j<avg2; j++){%>
								<li>★</li>
							<%}%>
							<li class="black"><%=avg%></li>
						<%}%>
							<li class="black">점</li>
						</ul>
					</li>
					
						<% // 찜하기, 장바구니
						
						int num = 1; %>
						<ul class="cart fa ae"> 
						<li class="fc ac">
						<span><a href="AmountCheckCon?prod_num=<%=Pvo.get(i).getProd_num()%>&amount=<%=num%>">장바구니&nbsp;</span>
							<img src="img/bucket.png" class="bk1">
							<img src="img/w_bucket.png" class="bk2">
						</a>
						</li>
					
						<li class="fc ac">
							<span><a href="WishListCheckCon?prod_num=<%=Pvo.get(i).getProd_num()%>">찜하기&nbsp; </span>
							<img src="img/heart.png" class="heart heart1">
							<img src="img/w_heart.png" class="heart heart2">
							</a>
						</li>
						
					</ul>
					
					</ul>
				</div>
				<%}%>
			<%}%>	
			<!-- pro end -->

				
		</div>
	<!-- cate1 end -->
			</div>
			<!-- product end -->
		</section>
	</div>
	<!-- wrap end -->

	<footer class="footer fb">
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
	</footer>
</body>
</html>