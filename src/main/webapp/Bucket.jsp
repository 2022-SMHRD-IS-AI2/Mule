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
	
  	//로그인한 회원의 장바구니 정보 불러오기
  	List<ProductVO> Bvo = new ProductDAO().Bucket(u_id);
	%>
	
	 <form class="input2" action="AmountUpdateCon2" method="post">
       
	<%
	 int totalAmount = 0; // 총 결제 금액을 저장할 변수
	
	 for (int i = 0; i < Bvo.size(); i++) {
		    int amount = Bvo.get(i).getAmount();
		    int price = Bvo.get(i).getProd_price();
		    int totalPrice = amount * price;
		    totalAmount += totalPrice; // 총 결제 금액 계산
	%>
		  <img src="./Prod/<%= Bvo.get(i).getProd_title() %>" alt="">
		  <%= Bvo.get(i).getProd_name() %>
		  <%= price %>
		  <input type="number" min="1" max="9999" id="cnt<%= i %>" name="cnt[]" value=<%= amount %>>
		  
		  <script>
		    $(document).ready(function() {
		      $('#cnt'+<%= i %>).change(function() {
		        let amount = $('#cnt'+<%= i %>).val();
		        let totalPrice = amount * <%= price %>; // 총 결제 금액 계산
		        $('#totalPrice'+<%= i %>).text(totalPrice + " 원"); 
		        totalAmount = 0; // 총 결제 금액 초기화
		        $('.totalPrice').each(function() {
		          totalAmount += parseInt($(this).text()); // 총 결제 금액 재계산
		        });
		        $('#totalAmount').text(totalAmount + " 원"); // 총 결제 금액 출력
		      });
		    });
		  </script>
		  
		  <h3> 결제 금액<span class="totalPrice" id="totalPrice<%= i %>"><%= totalPrice %> 원</span></h3>
		  
		  	  <input hidden name="prodNum[]" value="<%=Bvo.get(i).getProd_num()%>">
		  	 
		<% } %>

		<h3> 총 결제 금액: <span id="totalAmount"><%= totalAmount %> 원</span></h3>
	
		  <input hidden name="prod_name" value="<%=Bvo.get(0).getProd_name() %>">
		  <input hidden name="amount" value="<%=Bvo.size()%>">
		  <input hidden name="paid_amount" value="<%= totalAmount %>">
		  
	         <div class="inputs signUp">
                  <input type="submit" value="주문하기">
             </div>
        </form>
	
	

	 
</body>
</html>