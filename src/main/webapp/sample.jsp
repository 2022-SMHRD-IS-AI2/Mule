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
	UserVO loginUser=(UserVO)session.getAttribute("loginMember"); 
%>

	<%=loginUser.getU_name()%>님 환영합니다
</body>
</html>