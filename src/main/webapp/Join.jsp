<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/joinus.css">
</head>
<body>

<div class="back_wrap pf">
	<div class="line_left pf"></div>
	<div class="line_right pf"></div>
	<div class="withmule pf"><img src="img/width_back.png"></div>
</div>

	<div class="wrap">
		<header class="header fb ae">
			<div class="logo pf">
				<a href="index.html">
					<img src="img/logo.png">
				</a>
			</div>
			<!-- logo end  -->

			<div class="join_wrap pa">
				<ul class="join fb ac">
					<!-- <li><img src="img/dod.jpg"></li>
					<li><a href="login.html">Login</a></li>
					<li><a href="join.html">Join</a></li> -->
				</ul>
			</div>
		</header>

		<nav class="banner fb">
			<div class="menu_wrap pf">
				<ul class="abroad_menu">
					<h2>해외 구매대행<span class="underline line"></span></h2>
					<li class="point">상품목록<span class="underline line1 none"></span>
						<ul>
							<li><a href="abroad1.html">TV&리모컨</a><span class="underline line2 none"></span></li>
							<li><a href="abroad2.html">PC모니터</a><span class="underline line3 none"></span></li>
							<li><a href="abroad3.html">마우스&키보드</a><span class="underline line4 none"></span></li>
							<li><a href="abroad4.html">빔프로젝터&스피커</a><span class="underline line5 none"></span></li>
						</ul>
					</li>
					<li class="point"><a href="used.html">중고거래</a><span class="underline line6 none"></span></li>
					<li class="point"><a href="board.html">게시판</a><span class="underline line7 none"></span></li>
				</ul>
				</div>
				
				<div class="joinus_wrap">
					<div id="container">	
						<div class="cs_box t1 c_join">
							<div class="join_base_wrap">
								<div class="member_cont">	
									<div class="base_info_box">
										<h3>기본정보</h3>
										<div class="base_info_sec">
											<table border="0" cellpadding="0" cellspacing="0">
												<colgruop>
													<col width="25%">
													<col width="75%">
												</colgruop>
												<tbody>
													<tr>
														<td>
															<div class="">
																<button type="button" id= "IdCheck" >중복확인하기</button>
																<!-- <a href="" class="btn floating">중복확인하기</a> -->
																<!-- <div class="pr">
																	<input type="checkbox" name="smsF1" value="y">
																	<label for="smsF1">
																		정보/이벤트 SMS 수신에 동의합니다.
																	</label>
																</div>	 -->
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="id">
																<span class="important" id="dcid" name="id">아이디</span>
																<input type="text">
																</input>
															</div>
														</td>
													</tr>
													<tr>
														<td class="member_password">
															<div class="pw">
																<span class="important">비밀번호</span>
																<input type="password" autocomplete="off" name="pw">
																</input>
															</div>
														</td>
													</tr>
													<tr>
														<td>
															<div class="nick">
																<span class="important">이름</span>
																<input type="text" name="name">
																<!-- <div contenteditable="false">
																</div> -->
															</input>
														</div>
													</td>
												</tr>
												<tr>
													<td class="memeber_nick">
														<div class="nick">
															<span class="important">닉네임</span>
															<input type="text" name="nick">
														</div>
													</td>
												</tr>
												<tr>
													<td class="memeber_address">
														<div class="address">
															<span class="important">주소</span>
															<input type="text" name="address">
														</div>
													</td>
												</tr>
												<tr>
													<td class="member_phone">
														<div class="tell">
													<!-- <input type="text" id="cellPhone" name="cellPhone"
														maxlength="12" data-pattern="gdNum" value readonly>
													</input> -->
															<span class="important">휴대폰번호</span>
															<input type="text" name="tel" maxlength="11">
															</input>
														</div>
													</td>
												</tr>
												<tr>
													<td class="member_gender">
														<div class="gender">
															<span class="important">성별</span>
															<input type="radio" name="gender" value="female">여성
  															<input type="radio" name="gender" value="male">남성
														</div>
													</td>
												</tr>
												<tr>
													<td class="member_age">
														<div class="age">
															<span class="important">나이</span>
															 <input type="number" min="1" max="99" name="age">
														</div>
													</td>
												</tr>
												<tr>
													<td class="member_job">
														<div class="job">
															<span class="important">직업</span>
															    <select name ="job" >
	            														<option>전문직</option>
	            														<option>공무원</option>
													            		<option>프리랜서</option>
													            		<option>자영업</option>
													            		<option>종교인</option>
													            		<option>주부</option>
													            		<option>학생</option>
													            		<option>기타</option>
            													</select>
														</div>
													</td>
												</tr>
												
												<!-- <li></li> -->
												</tbody>
											</table>
										</div>
									</div>
									<div class="cj_btn btn_wrap">
										<ul>
											<li>
												<button type="button" class="btn big full t1 js_btn_join" value="회원가입">JOIN</button>
											</li>
											<li>
												<button type="button" class="btn big full">CANCEL</button>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>	
					</div>
				</div>

			<div class="quick_wrap pf fc ac">
				<ul class="quick">
					<li><a href="bucket.html"><img src="img/bucket.png"></a></li>
					<li><a href="heart.html"><img src="img/heart.png"></a></li>
					<li><a href="mypage_check.html"><img src="img/mypage.png"></a></li>
					<li><a href="center.html"><img src="img/center.png"></a></li>
				</ul>
			</div>
		</nav>
		
			<div class="sns_wrap pf">
				<ul class="sns fa">
					<li><a href=""><img src="img/twiter.png"></a></li>
					<li><a href=""><img src="img/ins.png"></a></li>
					<li><a href=""><img src="img/tube.png"></a></li>
				</ul>
			</div>
			
			<div class="chat_wrap pf">
				<ul class="chat fc ac">
					<li><a class="fc ac" href=""><img src="img/chatbot.png"></a></li>
				</ul>
			</div>


	</div>
	<!-- wrap end -->
	
      <form class="input2" action="JoinCon" method="post">
       
        </form>
            
            
       <script>
       		let button = document.querySelector("#IdCheck");
      	 	console.log("버튼제대로눌림")
            	function checkE(){
               	var IdCheck = $('#dcid').val()
               	console.log(IdCheck)
               
               $.ajax({
                 		 // 어디로 요청할 것인지??
                        url : 'IdCheckCon',
                        // 요청데이터(jsaon형태, {key, value})
                        data : {'IdCheck': IdCheck},
                        // 요청방식
                        type: 'get',
                        // 요청-응답
                        success : function(data){
                           if(data =='true'){
                              $('#resultCheck').text('사용할 수 없는 아이디')
                           }else {
                              $('#resultCheck').text('사용할 수 있는 아이디')
                           }
                        },
                        error : function(){
                           alert("통신실패")
                        }                    
               	})              
            }
            
            button.addEventListener('click',checkE)
         </script>
</body>
</html>