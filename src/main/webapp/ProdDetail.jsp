<%@page import="com.smhrd.model.UserVO"%>
<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewVO"%>
<%@page import="com.smhrd.model.BucketDAO"%>
<%@page import="com.smhrd.model.BucketVO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/detail.css">
	<script
	src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
	<script src="js/detail_scroll.js" defer></script>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
   	<% 
 	// 로그인한 회원 불러오기
 	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
   
   // 사용자가 클릭한 상품의 대한 상품 상세페이지 상품번호를 이용하여 받아오기
   String prod_num = request.getParameter("prod_num");
   ProductVO Pvo = new ProductDAO().ShowProdDetail(prod_num);
   
   // 해당 상품의 리뷰내용 불러오기 
   List<ReviewVO> Rvo = new ReviewDAO().showReview(prod_num);
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

		<section class="detail_wrap fa" id="scroll">
			<div class="detail">
				<div class="detail_title fb">
					<div class="dt_img">
					<ul class="fc ac">
						<li class="fc ac"><img src="./Prod/<%=Pvo.getProd_title()%>"></li>
					</ul>
					<ul class="mini_img f ac">
						<li class="fc ac"><img src="./Prod/<%=Pvo.getProd_title()%>"></li>
					</ul>
				</div>
					<div class="dt_info" id="lnb">
					<ul class="info_tit">
						<%if(Pvo.getProd_check().equals("0")){%>
							<li><span>[<%=Pvo.getProd_cate()%>]</span>
						<%} else{%>
							<li><span>[중고상품]</span>
						<%}%>
						<%=Pvo.getProd_name()%></li>
						<li><%=Pvo.getProd_desc()%></li>
						<li><%=Pvo.getProd_price()%>원</li>
					</ul>
					<div class="info_wrap">
						<h5 class="fb ac"><p>배송안내</p><span><img src="img/detail_btn.png"></span></h5>
						<ul class="delivery_info">
							<li></li>
						</ul>
					</div>
					<!-- info_tit end -->

					<div class="cnt_wrap">
						<h5 class="fb ac"><p>상품수량 & 인원수</p></h5>
						<ul class="pro_cnt fb ac">
							<li class="f">
									<form action="AmountCheckCon" method="post">
										<input type="number" value="1" min="1" max="10" class="cnt" id="quantity" name="amount" onfocus="this.blur()">
										<input hidden name="prod_num" value="<%=Pvo.getProd_num()%>">
							</li>
							<li class="person"><span><%=Pvo.getBuyer_cnt()%></span> / <%=Pvo.getNumber_of_people()%>명</li>
						</ul>
					</div>
					<!-- cnt_wrap end -->

					<div class="price_wrap">
							<ul class="price1 fb">
								<li>총 상품금액</li>
								<li id="totalPrice1"><%=Pvo.getProd_price()%>원</li>
							</ul>
							<ul class="price2 fb">
								<li>총 합계금액</li>
								<li id="totalPrice2"><%=Pvo.getProd_price()%>원</li>
							</ul>
					</div>
					<!-- price_wrap end -->

					<div class="buy_wrap fc">
						<ul class="fb">
		  					  <li>BUY NOW</li>
							  <li><button type="submit">ADD CART</button></li>
						</form>
							<li><a href="WishListCheckCon?prod_num=<%=Pvo.getProd_num()%>">WISH LIST</li></a>
						</ul>
					</div>
				</div>
				<!-- dt_info end -->
			</div>
			<!-- detail_title end -->

				<div class="detail_contents">
					<div class="dc_title">
						<h3>Detail</h3>
					</div>
 					<img src="./Prod/<%=Pvo.getProd_img1()%>">
 					<img src="./Prod/<%=Pvo.getProd_img2()%>">
				</div>
			</div>
			<!-- detail end -->
		</section>

		<nav class="review_wrap">
			<div class="review">
				<h1> REVIEW <span class="line"></span></h1>
				<ul class="review_tit fb">
					<li>작성자</li>
					<li>상품 구매 후기</li>
					<li>평점</li>
					<li>등록일</li>
				</ul>

				<div class="review_txt_wrap">
				<ul class="review_txt fb">
					<li>zzung_712</li>
					<li>여기는 구매 상품후기를 작성하는 공간 입니다.</li>
					<li>
							<ul class="star fc">
								<li>★</li>
								<li>★</li>
								<li>★</li>
								<li>★</li>
								<li>★</li>
								<li class="black">&nbsp;&nbsp;5.0</li>
								<li class="black">점</li>
							</ul>
						</li>
							<li>2023-04-06</li>
				</ul>
			</div>
			<!-- review_txt_wrap end -->

			<div></div>
			</div>
			<!-- review end -->
		</nav>

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
   
   
    <script>
      $( document ).ready( function() {     
        $( '#quantity' ).change( function() {
          let a = $( '#quantity' ).val();
          let ab = (a * <%=Pvo.getProd_price()%>) + " 원";
          $( '#totalPrice1' ).text( ab );
        } );
      } );
    </script>
    
     <script>
      $( document ).ready( function() {     
        $( '#quantity' ).change( function() {
          let a = $( '#quantity' ).val();
          let ab = (a * <%=Pvo.getProd_price()%>) + " 원";
          $( '#totalPrice2' ).text( ab );
        } );
      } );
    </script>
   
   
</body>
</html>