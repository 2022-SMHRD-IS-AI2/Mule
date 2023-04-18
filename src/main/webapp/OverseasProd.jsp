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
	<link rel="stylesheet" href="css/product_regi.css">
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
			
			
			<form class="boad-content1" action="OpCon" method="post"  enctype="multipart/form-data" >
			<div class="product_wrap">				
				<div id="container">
					<div class="cs_title">
						<h3>상품등록</h3>
						<div class="base_info_regi">
							<table border="0" cellpadding="0" cellspacing="0">
								
								<tbody>
									<tr>
										<td>
											<div class="prodName">
												<div class="boad-content1-input1">
													<span class="regi">상품코드</span>
													<input type="text" name="prodNum">
												</div>
											</div>
										</td>
									</tr>


									<tr>
										<td>
											<div class="prodName">
												<div class="boad-content1-input1">
													<span class="regi">상품명</span>
													<input type="text" name="prodName">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodCate">
												<div class="boad-content1-input1">
													<span class="regi">상품카테고리</span>
													<select class="regi-select" name="prodCate">
														<option>TV&리모컨</option>
														<option>PC모니터</option>
														<option>마우스&키보드</option>
														<option>빔프로젝터&스피커</option>
													</select>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodPrice">
												<div class="boad-content1-input1">
													<span class="regi">상품가격</span>
													<input type="text" name="prodPrice">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodTitle">
												<div class="boad-content1-input1">
													<span class="regi">상품대표사진</span>
													<input type="file" name="prodTitle">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodImg1">
												<div class="boad-content1-input1">
													<span class="regi">상품상세이미지1</span>
													<input type="file" id="input-file" name="prodImg1">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodImg1">
												<div class="boad-content1-input1">
													<span class="regi">상품상세이미지2</span>
													<input type="file" id="input-file" name="prodImg2">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodOfPeople">
												<div class="boad-content1-input1">
													<span class="regi">인원수</span>
													<input type="text" name="numOfPeople">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="customsClearanceNum">
												<div class="boad-content1-input1">	
													<span class="regi">통관번호</span>
													<input type="text" name="customsClearanceNum">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="ReturnPeriod">
												<div class="boad-content1-input1">
													<span class="regi">반품기간</span>
													<input type="date" name="ReturnPeriod">
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="prodDesc">
												<div class="boad-content1-input2">
													<span class="regi">상품설명</span>
													<textarea cols="30" rows="20" style="resize: none;" name="prodDesc"></textarea>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="pr_btn_wrap">
												<ul>
													<li>
														<button type="submit" class="btn regi full">등 록</button>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
        </form>	
		
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