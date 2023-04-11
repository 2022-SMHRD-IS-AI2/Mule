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
<title>Insert title here</title>
</head>
<body>

<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
	String u_id=loginUser.getU_id();

	//로그인한 회원의 주문내역 불러오기
	List<ProductVO> Pvo = new ProductDAO().salesList(u_id);

		for(int i=0; i<Pvo.size(); i++){ %>
		<%=Pvo.get(i).getProd_name() %>
		<%=Pvo.get(i).getProd_price()%>
		 <a href="ProdDetail.jsp?prod_num=<%=Pvo.get(i).getProd_num()%>">내 상품 보러가기</a>
		<img src="./Prod/<%=Pvo.get(i).getProd_title()%>" alt="">
		<%=Pvo.get(i).getBuyer_cnt()%>
		
    <%} %>
</body>
</html>