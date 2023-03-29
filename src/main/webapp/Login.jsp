<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

     	<form action="loginCon" method="post">
			<li><input type="text"  placeholder="Email을 입력하세요" name="email" ></li>
			<li><input type="password"  placeholder="PW를 입력하세요" name="pw" ></li>
			<li><input type="submit" value="LogIn" class="button fit"></li>
		</form>
					
     <a href="LogoutCon">로그아웃</a>
</body>
</html>