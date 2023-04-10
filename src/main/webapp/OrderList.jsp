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
  	List<ProductVO> Pvo = new ProductDAO().orderList(u_id);
  	
  	 if(Pvo.size()>0){
	 	for (int i = 0; i < Pvo.size(); i++) {%>
	 		<%=Pvo.get(i).getOrder_date()%>
	 		<img src="./Prod/<%= Pvo.get(i).getProd_title() %>">
	 		<%=Pvo.get(i).getProd_name()%>
	 		<%=Pvo.get(i).getProd_price()%>
	 		<%=Pvo.get(i).getAmount()%>
	 		<%if(Pvo.get(i).getDelivery_progress().equals("N")){%>
	 			상품준비중
	 		<%}else if(Pvo.get(i).getDelivery_progress().equals("Y")){%>
	 			배송완료
	 			<%if(Pvo.get(i).getPayment_status().equals("Y")){%>
	 				<%if(Pvo.get(i).getReview_status().equals("N")){%>
	 					<form action="Review.jsp">
            				<input hidden name="prod_num" value="<%=Pvo.get(i).getProd_num()%>">
            				<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
            				<button type="submit">리뷰작성하기</button>
            			</form>
            		<%}else if(Pvo.get(i).getReview_status().equals("Y")){%>
            			리뷰작성 완료
            		<%}%>
	 		    <%}else if(Pvo.get(i).getReturn_status().equals("Y")){%>
	 				반품완료
	 			<%}else if(Pvo.get(i).getUsedprod_status().equals("Y")){%>
	 				중고거래처리
	 			<%}else{%>
	 				<form action="UsedprodStatusCon">
            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
            			<button type="submit">중고거래</button>
            		</form>
            		
            		<form action="ReturnStatusCon">
            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
            			<button type="submit">반품</button>
            		</form>
            		
            		<form action="PaymentStatusCon">
            			<input hidden name="order_num" value="<%=Pvo.get(i).getOrder_num()%>">
            			<button type="submit">결제확정</button>
            		</form>
	 		<%}%>
	 	<%}%>
	 <%}%>
  <%}%>
  	
</body>
</html>