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
	
  	//로그인한 회원의 장바구니 정보 불러오기
  	List<ProductVO> Wvo = new ProductDAO().WishList(u_id);
  	
  	
  	//위시리스트 출력
  	for(int i=0; i<Wvo.size(); i++){%>
		
		<%=i+1%>
		<img src="./Prod/<%= Wvo.get(i).getProd_title() %>" alt="">
		<%=Wvo.get(i).getProd_name() %>
  		<%=Wvo.get(i).getProd_price() %>
  		<a href="ProdDetail.jsp?prod_num=<%=Wvo.get(i).getProd_num()%>">찜 상품 보러가기</a>
  		
  	<%}%>
  	

	
	
</body>
</html>