<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
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
   
   //로그인한 회원의 장바구니 수량 불러오기
	   int Bsize = 0 ;
	   
	  if(loginUser!=null) {
	     String u_id=loginUser.getU_id();
	       List<ProductVO> Bvo = new ProductDAO().Bucket(u_id);
	     
	      if(Bvo!=null){
	         Bsize=Bvo.size();   
	      }
	  }

	//로그인한 회원의 위시리스트 수량 불러오기
	  int Wsize = 0 ;
	    
	    if(loginUser!=null) {
	       String u_id=loginUser.getU_id();
	       List<ProductVO> Wvo = new ProductDAO().WishList(u_id);
	       
	      if(Wvo!=null){
	         Wsize=Wvo.size();   
	      }
	    }
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
               
               <%// 게시판 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li class="point"><a href="LoginCheck.jsp">게시판</a><span class="underline line7 none"></span></li>
               <%}else {%>
                  <li class="point"><a href="Board.jsp">게시판</a><span class="underline line7 none"></span></li>
               <%} %>
               
               <%// 관리자에게만 보이는 구매대행 상품등록 페이지
               if(loginUser != null){
                  if(loginUser.getU_id().equals("admin")){%>
                     <li class="point"><a href="OverseasProd.jsp">상품등록</a><span class="underline line7 none"></span></li>
                  <%} %>
               <%}%>
            </ul>
            </div>
            
         <div class="quick_wrap pf fc ac">
            <ul class="quick">
            
               <%//장바구니 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/bucket.png"></a></li>
               <%}else {
                  //장바구니 담아놓은 상품이 있는지 확인하기(만약 없다면 NoBucket.jsp로 이동)
                  if(Bsize>0){%>
                     <li><a href="Bucket.jsp"><img src="img/bucket.png"><span class="sub_cnt"><%=Bsize%></span></a></li>
                  <%} else{%>
                     <li><a href="NoBucket.jsp"><img src="img/bucket.png"><span class="sub_cnt"><%=Bsize%></span></a></li>
                  <%}%>
               <%}%>
               
               <%//위시리스트 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/heart.png"></a></li>
               <%}else {%>
                  <li><a href="WishList.jsp"><img src="img/heart.png"><span class="sub_cnt"><%=Wsize%></span></a></li>
               <%} %>
               
               <%//마이페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/mypage.png"></a></li>
               <%}else {%>
                  <li><a href="OrderList.jsp"><img src="img/mypage.png"></a></li>
               <%} %>
               
               <%//고객센터 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/center.png"></a></li>
               <%}else {%>
                  <li><a href="Center.jsp"><img src="img/center.png"></a></li>
               <%} %>
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
						
								
					<% // 가격 천다위 쉼표로 나타내기 
					
					int price = Pvo.getProd_price();
				    DecimalFormat formatter = new DecimalFormat("#,###");
				    String Prod_price = formatter.format(price);%>
						
						<li><%=Prod_price%>원</li>
					</ul>
					
					<%if(Pvo.getProd_check().equals("0")){%>
						<div class="info_wrap">
							<h5 class="fb ac"><p>통관번호</p><span><%=Pvo.getCustoms_clearance_num()%></span></h5>
							<ul class="delivery_info">
								<li></li>
							</ul>
						</div>
					<%} else{%>
						<div class="info_wrap">
							<h5 class="fb ac"><p>배송비</p><span>3,000원</span></h5>
							<ul class="delivery_info">
								<li></li>
							</ul>
						</div>
					<%}%>
					<!-- info_tit end -->

					<div class="cnt_wrap">
						<%if(Pvo.getProd_check().equals("0")){%>
							<h5 class="fb ac"><p>상품수량 & 인원수</p></h5>
						<%} else{%>
							<h5 class="fb ac"><p>상품수량</p></h5>
						<%}%>
						<ul class="pro_cnt fb ac">
							<li class="f">
									<form action="AmountCheckCon" method="post">
										<input type="number" value="1" min="1" max="10" class="cnt" id="quantity" name="amount" onfocus="this.blur()">
										<input hidden name="prod_num" value="<%=Pvo.getProd_num()%>">
							</li>
							
							<%if(Pvo.getProd_check().equals("0")){%>
								<li class="person"><span><%=Pvo.getBuyer_cnt()%></span> / <%=Pvo.getNumber_of_people()%>명</li>
							<%} else{%>
								<li class="person"></li>
							<%}%>
						</ul>
					</div>
					<!-- cnt_wrap end -->

					<div class="price_wrap">
							<ul class="price1 fb">
								<li>총 상품금액</li>
								<li id="totalPrice1"><%=Prod_price%>원</li>
							</ul>
							<ul class="price2 fb">
								<li>총 합계금액</li>
								<li id="totalPrice2"><%=Prod_price%>원</li>
							</ul>
					</div>
					<!-- price_wrap end -->

					<div class="buy_wrap fb">
						<ul class="fb">
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
				
				<%for(int i=0; i<Rvo.size(); i++){ %>
				<div class="review_txt_wrap">
				<ul class="review_txt fb">
					<li><%=Rvo.get(i).getU_ID() %></li>
					<li><%=Rvo.get(i).getREVIEW_CONTENT() %></li>
					
					<li class="fc">
						<ul class="star fc">
							<%for(int j=0; j<Rvo.get(i).getREVIEW_RATINGS(); j++){%>
								<li>★</li>
							<%} %>
						<li class="black">&nbsp;&nbsp;<%=Rvo.get(i).getREVIEW_RATINGS()%></li>
						<li class="black">점</li>
						</ul>
					</li>
					
					<%				
					Timestamp reviewTimestamp = Rvo.get(i).getREVIEW_DATE(); 
 					Date reviewDate = new Date(reviewTimestamp.getTime());
 					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
 					String ReviewDate = dateFormat.format(reviewDate); 
 					%>
							<li class="black"><%=ReviewDate%></li>
				</ul>
			</div>
		<%}%>
			
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
		
		<div class="f_box">
			<ul class="f1 f">
				<li><a href="of_use.html">이용약관</a></li>
				<li><a href="privacy.html"><span class="bar">|</span>개인정보 처리방침<span class="bar">|</span></a></li>
				<li><a href="Email.html">이메일 무단 수집 거부</a></li>
			</ul>
			<ul class="f2 f">
				 <li>회사명 : (주)위드뮬</li>
					<li><span class="bar">|</span>사업장주소 : 광주광역시 동구 예술길 31-15<span class="bar">|</span></li>
					<li>대표번호 : 062-655-1616</li>
			</ul>
			<ul class="f3">
					<li class="f_copylaw">쇼핑몰의 모든 제작물의 저작권은 (주)위드뮬 에 있으며, 무단복제나 도용은 저작권법(97조5항)에 의해 금지되어 있습니다.</li>
					<li class="f_copy">Copyright. (c) 2021. <span>withmule</span>. All rights reserved</li>
			</ul>
		</div>

		<div class="chat_wrap pf">
			<ul class="chat fc ac">
				<li><a class="fc ac" href="Center.jsp"><img src="img/chatbot.png"></a></li>
			</ul>
		</div>
	</footer>
   
   
    <script>
	  $( document ).ready( function() {     
	    $( '#quantity' ).change( function() {
	      let a = $( '#quantity' ).val();
	      let ab = (a * <%=Pvo.getProd_price()%>).toLocaleString() + " 원";
	      $( '#totalPrice1' ).text( ab );
	    } );
	  } );
	</script>



    
     <script>
      $( document ).ready( function() {     
        $( '#quantity' ).change( function() {
          let a = $( '#quantity' ).val();
          let ab = (a * <%=Pvo.getProd_price()%>).toLocaleString() + " 원";
          $( '#totalPrice2' ).text( ab );
        } );
      } );
    </script>
   
   
</body>
</html>