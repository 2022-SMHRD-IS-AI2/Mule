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
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 

	if(loginUser != null){%>
		<%=loginUser.getU_name()%>님 환영합니다<br>
     	<a href="LogoutCon">로그아웃</a>
	<%}else{%>
		로그아웃 상태
	<%} %>
	
	<a href="OverseasProd.jsp">상품등록</a>
   	<a href="Bucket.jsp">장바구니</a>
   
	<%List<ProductVO> Pvo = (new ProductDAO()).OPshow(); %>
	
	<%for(int i=0; i<Pvo.size(); i++){ %>
		<%=Pvo.get(i).getProd_name() %>
		<%=Pvo.get(i).getProd_price()%>
		 <a href="ProdDetail.jsp?prod_num=<%=Pvo.get(i).getProd_num()%>">
		<img src="./Prod/<%=Pvo.get(i).getProd_title()%>" alt=""></a>
		<%=Pvo.get(i).getNumber_of_people()%>
    <%} %>
    
	
    
</body>
</html>