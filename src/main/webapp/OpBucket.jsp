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
  	String u_id=loginUser.getU_id();
	
  	//로그인한 회원의 장바구니 정보 불러오기
  	List<ProductVO> Bvo = new ProductDAO().OpBucket(u_id);
	%>
	
	<%
	//장바구니에 저장된 상품 띄우기
	for(int i=0; i<Bvo.size(); i++){%>
	 	<img src="./OverseasProd/<%=Bvo.get(i).getProd_title()%>" alt=""></a>
		<%=Bvo.get(i).getProd_name() %>
		<%=Bvo.get(i).getProd_price() %>
		<input type="number" min="1" max="9999" name="amount" value=<%=Bvo.get(i).getAmount()%>>
	<%}%>
	


	 
</body>
</html>