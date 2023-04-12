<%@page import="com.smhrd.model.ReviewDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewVO"%>
<%@page import="com.smhrd.model.BucketDAO"%>
<%@page import="com.smhrd.model.BucketVO"%>
<%@page import="com.smhrd.model.ProductVO"%>
<%@page import="com.smhrd.model.ProductDAO"%>
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
   
   // 사용자가 클릭한 상품의 대한 상품 상세페이지 상품번호를 이용하여 받아오기
   String prod_num = request.getParameter("prod_num");
   ProductVO Pvo = new ProductDAO().ShowProdDetail(prod_num);
   
   // 해당 상품의 리뷰내용 불러오기 
   List<ReviewVO> Rvo = new ReviewDAO().showReview(prod_num);
   %>
   
   <img src="./Prod/<%=Pvo.getProd_title()%>" alt=""></a>
   <%=Pvo.getProd_name() %>
   <%=Pvo.getProd_price() %>
   <img src="./Prod/<%=Pvo.getProd_img1()%>" alt=""></a>
   <img src="./Prod/<%=Pvo.getProd_img2()%>" alt=""></a>
   <%=Pvo.getProd_cate()%>
   <%=Pvo.getProd_desc() %>
   <%=Pvo.getViews()%>
   <%=Pvo.getLikes()%>
   <%=Pvo.getCustoms_clearance_num()%>
   <%=Pvo.getReturn_period()%>
   <%=Pvo.getNumber_of_people()%>
   
   <form action="AmountCheckCon" method="post" >
      <input hidden name="prod_num" value="<%=Pvo.getProd_num()%>">
      <input type="number" min="1" max="9999" name="amount" value="1">
      <button type="submit">장바구니 담기</button>
   </form>
   
   <form action="WishListCheckCon" method="post" >
      <input hidden name="prod_num" value="<%=Pvo.getProd_num()%>">
      <button type="submit">찜하기</button>
   </form>
   
   <% //리뷰내용 출력
   
   for(int i=0; i<Rvo.size(); i++){%>
   
   		<%=Rvo.get(i).getU_ID() %>
   		<%=Rvo.get(i).getREVIEW_DATE() %>
   		
   	    <%for(int j=0; j<Rvo.get(i).getREVIEW_RATINGS(); j++){ %>
                 <span>★</span>
              <%} %>
              
   		<%=Rvo.get(i).getREVIEW_RATINGS() %>
   		<%=Rvo.get(i).getREVIEW_CONTENT() %>
	   
   <%}%>
   
</body>
</html>