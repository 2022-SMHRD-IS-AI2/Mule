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

</body>
</html>