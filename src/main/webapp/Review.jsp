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
		int prod_num = Integer.parseInt(request.getParameter("prod_num")); 
		int order_num = Integer.parseInt(request.getParameter("order_num")); 
		%>

       <form method="post" action="ReviewCon">
            <fieldset>
             	<legend>별점</legend>
              		<input type="radio" name="rating" value="1" id="rate1"><label for="rate1">⭐</label>
                    <input type="radio" name="rating" value="2" id="rate2"><label for="rate2">⭐</label>
                    <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                    <input type="radio" name="rating" value="4" id="rate4"><label for="rate4">⭐</label>
                    <input type="radio" name="rating" value="5" id="rate5"><label for="rate5">⭐</label>
            </fieldset>
               
    <!-- 별점! ! ! -->

    <div class="contrv">
 	<textarea placeholder="리뷰 작성해주세요." name="review_content"></textarea>
    <input hidden name="prod_num" value="<%=prod_num%>">
    <input hidden name="order_num" value="<%=order_num%>">
    </div>
     <input type="submit" value="등록">
      </form>
</body>
</html>