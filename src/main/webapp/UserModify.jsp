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
	String u_pw=loginUser.getU_pw();
	String u_addr=loginUser.getU_addr();
	%>
	
	 	<form class="boad-content1" action="UserModifyCon" method="post">
   
   			 아이디<%=u_id %>
   
            <div class="boad-content1-input1">
                <span class="boad-content1-span">배송지 변경</span>
                <input type="text" name="addr"  value=<%=u_addr%>>
            </div>    
    
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">비밀번호 변경</span>
                <input type="text" name="pw"  value=<%=u_pw%>>
            </div>
            
            <div class="boad-content1-submit">
                <input type="submit" value="회원정보 변경">
            </div>

        </form>
</body>
</html>