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
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
  	String u_id=loginUser.getU_id();

	%>
	
	 <form class="input2" action="OrderCon" method="post">
                <span>받는분</span>
                <div class="inputs phone">
                    <input type="text" placeholder="받는분" name="recipient">
                </div>
                <span>전화번호</span>
                <div class="inputs phone">
                    <input type="text" placeholder="전화번호" name="phone">
                </div>
                <span>배송지</span>
                <div class="inputs phone">
                    <input type="text" placeholder="배송지" name="address">
                </div>

	<%
	
		 String prod_name = request.getParameter("prod_name");
	 	 int amount = Integer.parseInt(request.getParameter("amount"));
		 int amount_paid = Integer.parseInt(request.getParameter("amount_paid"));
	 
	%>

		  <input hidden name="prod_name" value="<%=prod_name %>">
		  <input hidden name="amount" value="<%=amount%>">
  		  <input hidden name="paid_amount" value="<%=amount_paid %>">
  		  
          <input type="submit" value="결제하기">
        </form>
</body>
</html>