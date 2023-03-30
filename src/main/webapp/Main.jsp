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
<title>Insert title here</title>
</head>
<body>


<%
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 

	if(loginUser != null){%>
		<%=loginUser.getU_name()%>님 환영합니다<br>
     	<a href="LogoutCon">로그아웃</a>
	<%}else{%>
		로그아웃 상태
	<%} %>
	
	<a href="OverseasProd.jsp">상품등록</a>
	
	<%List<ProductVO> OPvo = (new ProductDAO()).OPshow(); %>
	
	<%for(int i=0; i<OPvo.size(); i++){ %>
		<%=OPvo.get(i).getProd_num() %>
		<%=OPvo.get(i).getProd_name() %>
		<%=OPvo.get(i).getProd_cate() %>
		<%=OPvo.get(i).getProd_price()%>
		<img src="./OverseasProd/<%=OPvo.get(i).getProd_title()%>" alt="">
		<img src="./OverseasProd/<%=OPvo.get(i).getProd_img1()%>" alt="">
		<img src="./OverseasProd/<%=OPvo.get(i).getProd_img2()%>" alt="">
		<%=OPvo.get(i).getProd_desc()%>
		<%=OPvo.get(i).getLikes()%>
		<%=OPvo.get(i).getViews()%>
		<%=OPvo.get(i).getProd_date() %>
		<%=OPvo.get(i).getNumber_of_people()%>
		<%=OPvo.get(i).getSeller_id()%>
		<%=OPvo.get(i).getProd_check()%>
		<%=OPvo.get(i).getReturn_period()%>
    <%} %>
</body>
</html>