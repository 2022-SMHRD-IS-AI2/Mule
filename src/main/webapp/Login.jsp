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
	<link rel="stylesheet" href="css/login.css">
</head>

<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	
	
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
                     <li><a href="Bucket.jsp"><img src="img/bucket.png"><%=Bsize%></a></li>
                  <%} else{%>
                     <li><a href="NoBucket.jsp"><img src="img/bucket.png"><%=Bsize%></a></li>
                  <%}%>
               <%}%>
               
               <%//위시리스트 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/heart.png"></a></li>
               <%}else {%>
                  <li><a href="WishList.jsp"><img src="img/heart.png"><%=Wsize%></a></li>
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