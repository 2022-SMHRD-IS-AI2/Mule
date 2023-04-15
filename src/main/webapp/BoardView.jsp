<%@page import="com.smhrd.model.BoardCommentDAO"%>
<%@page import="com.smhrd.model.BoardCommentVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.smhrd.model.BoardDAO"%>
<%@page import="com.smhrd.model.BoardVO"%>
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
	<link rel="stylesheet" href="css/board_view.css">
</head>
<body>
<div class="back_wrap pf">
	<div class="line_left pf"></div>
	<div class="line_right pf"></div>
	<div class="withmule pf"><img src="img/width_back.png"></div>
</div>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");

	//해외 공구 상품 불러오기
	List<ProductVO> Pvo = (new ProductDAO()).OPshow(); 
	
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
  	
    // 사용자가 클릭한 상품의 대한 상품 상세페이지 상품번호를 이용하여 받아오기
    int B_num = Integer.parseInt(request.getParameter("B_num"));
    
    // 해당 개시글 불러오기
    BoardVO bvo = new BoardDAO().DetailBoardShow(B_num);
    // 해당 게시글에 대한 게시글 댓글 불러오기
   	List<BoardCommentVO> Cvo = new BoardCommentDAO().showCmt(B_num);
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
					<%}else {%>
						<li><a href="Bucket.jsp"><img src="img/bucket.png"><%=Bsize%></a></li>
					<%} %>
					
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

			<!-- BoardView페이지 시작 -->
			<div class="board_wrap">
				<ul class="category fc">
					<li>게시판</li>
				</ul>
				<div class="board_view_wrap">
					<div class="board_view">
						<div class="title">
							<%=bvo.getB_name()%>
						</div>
						
						<div class="info">
							<dl>
								<dt>번호</dt>
								<dd><%=bvo.getB_num()%></dd>
							</dl>
							<dl>
								<dt>작성자</dt>
								<dd><%=loginUser.getU_nick()%></dd>
							</dl>
							<dl>
							<%Timestamp boardTimestamp = bvo.getB_date(); // 주문일자 정보를 Timestamp 타입으로 받아옴
		 					Date boardDate = new Date(boardTimestamp.getTime()); // Timestamp에서 Date로 변환
		 					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 					String BoardDate = dateFormat.format(boardDate); // 날짜 포맷을 적용한 문자열을 생성 %>
								
								<dt>작성일</dt>
								<dd><%=BoardDate%></dd>
							</dl>
						</div>
						
						<div class="cont_wrap f">
							<div class="cont_img fc">
								<img src="./BoardIMG/<%=bvo.getB_img()%>">
							</div>
							 <div class="cont">
									<%=bvo.getB_content()%>
							</div>
						</div>
					</div>

					<!-- 댓글 보이는 부분 -->

					<div class="cmmt_tit">
						댓글
					</div>

					<div class="cmmt_wrap">
						<%for(int i =0; i<Cvo.size(); i++) {%>
							<ul class="comment_view f ac">
								<li class="c_id"><%=Cvo.get(i).getU_id()%></li>
								<li class="c_commt fb"><span class="cmmt_txt"><%=Cvo.get(i).getBoard_cmt_content()%></span></li>
									
								<%Timestamp cmtTimestamp = bvo.getB_date(); // 주문일자 정보를 Timestamp 타입으로 받아옴
			 					Date cmtDate = new Date(boardTimestamp.getTime()); // Timestamp에서 Date로 변환
			 					String CmtDate = dateFormat.format(cmtDate); // 날짜 포맷을 적용한 문자열을 생성 %>
								<li class="c_date"><%=cmtDate%></li>
							</ul>
						<%}%>
						
					</div>
					<!-- 댓글 보이는 부분 끝 -->

					<!-- 댓글 작성란 -->
					<div class="board_view_comment f">
						<form action="BoardCommentCon" method="POST">
							<ul class="comment fb ac">
								<li class="c_id"><%=loginUser.getU_nick()%></li>
									<li class="c_commt">
										<input type="text" placeholder="댓글을 입력하세요." name="cmt">
			  							<input hidden name="Bnum" value="<%=bvo.getB_num()%>">
										<button type="submit">등록</button>
									</li>
							</ul>												
						</form>
					</div>
					<!-- 댓글 작성란 끝 -->

					<div class="bt_wrap fc">
						<a href="Board.jsp" class="on">목록</a>
						<!-- <a href="edit.html">수정</a> -->
					</div>
				</div>
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