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

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>소비자 구매패턴 분석을 활용한 해외구매대행 플랫폼 MULE</title>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/center.css">
</head>
<body>

	<%
	// 로그인한 회원 불러오기
	UserVO loginUser=(UserVO)session.getAttribute("loginUser");
	
	
    //로그인한 회원의 장바구니 수량 불러오기
	    int Bsize = 0 ;
	    
	   if(loginUser!=null) {
	      String u_id=loginUser.getU_id();
	        List<ProductVO> Bvo = new ProductDAO().Bucket(u_id);
	      
	       if(Bvo!=null){
	          Bsize=Bvo.size();   
	       }
	   }
   
     //로그인한 회원의 위시리스트 수량 불러오기
	   int Wsize = 0 ;
	     
	     if(loginUser!=null) {
	        String u_id=loginUser.getU_id();
	        List<ProductVO> Wvo = new ProductDAO().WishList(u_id);
	        
	       if(Wvo!=null){
	          Wsize=Wvo.size();   
	       }
	     }
     
	%>

	  <div class="back_wrap pf">
      <div class="line_left pf"></div>
      <div class="line_right pf"></div>
      <div class="withmule pf"><img src="img/width_back.png"></div>
   </div>

   <div class="wrap">
      <header class="header fb ae">
         <div class="logo pf">
            <a href="Main.jsp">
               <img src="img/logo.png">
            </a>
         </div>
         <!-- logo end  -->

         <div class="join_wrap pa">
            <ul class="join fb ac">
               <li><img src="img/dod.jpg"></li>
                  <%if(loginUser != null){%>
                     <li><a href="LogoutCon">Logout</a></li>
                  <%}else{%>
                     <li><a href="Login.jsp">Login</a></li>
                  <%} %>
               <li><a href="Join.jsp">Join</a></li>
            </ul>
         </div>
      </header>

      <nav class="banner fb">
         <div class="menu_wrap pf">
            <ul class="abroad_menu">
               <h2>해외 구매대행<span class="underline line"></span></h2>
               <li class="point">상품목록<span class="underline line1 none"></span>
                  <ul>
                     <li><a href="Abroad1.jsp">TV&리모컨</a><span class="underline line2 none"></span></li>
                     <li><a href="Abroad2.jsp">PC모니터</a><span class="underline line3 none"></span></li>
                     <li><a href="Abroad3.jsp">마우스&키보드</a><span class="underline line4 none"></span></li>
                     <li><a href="Abroad4.jsp">빔프로젝터&스피커</a><span class="underline line5 none"></span></li>
                  </ul>
               </li>
               <li class="point"><a href="UsedProdMain.jsp">중고거래</a><span class="underline line6 none"></span></li>
               
               <%// 게시판 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li class="point"><a href="LoginCheck.jsp">게시판</a><span class="underline line7 none"></span></li>
               <%}else {%>
                  <li class="point"><a href="Board.jsp">게시판</a><span class="underline line7 none"></span></li>
               <%} %>
               
               <%// 관리자에게만 보이는 구매대행 상품등록 페이지
               if(loginUser != null){
                  if(loginUser.getU_id().equals("admin")){%>
                     <li class="point"><a href="OverseasProd.jsp">상품등록</a><span class="underline line7 none"></span></li>
                  <%} %>
               <%}%>
            </ul>
            </div>
            
         <div class="quick_wrap pf fc ac">
            <ul class="quick">
            
               <%//장바구니 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/bucket.png"></a></li>
               <%}else {
                  //장바구니 담아놓은 상품이 있는지 확인하기(만약 없다면 NoBucket.jsp로 이동)
                  if(Bsize>0){%>
                     <li><a href="Bucket.jsp"><img src="img/bucket.png"><span class="sub_cnt"><%=Bsize%></span></a></li>
                  <%} else{%>
                     <li><a href="NoBucket.jsp"><img src="img/bucket.png"><span class="sub_cnt"><%=Bsize%></span></a></li>
                  <%}%>
               <%}%>
               
               <%//위시리스트 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/heart.png"></a></li>
               <%}else {%>
                  <li><a href="WishList.jsp"><img src="img/heart.png"><span class="sub_cnt"><%=Wsize%></span></a></li>
               <%} %>
               
               <%//마이페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/mypage.png"></a></li>
               <%}else {%>
                  <li><a href="OrderList.jsp"><img src="img/mypage.png"></a></li>
               <%} %>
               
               <%//고객센터 페이지 클릭시 로그인여부 체크(로그인 안했을 시 로그인 페이지로 넘기기)
               if(loginUser==null) {%>
                  <li><a href="LoginCheck.jsp"><img src="img/center.png"></a></li>
               <%}else {%>
                  <li><a href="Center.jsp"><img src="img/center.png"></a></li>
               <%} %>
            </ul>
         </div>
      </nav>

			<div class="center_wrap fc ac">
				<div class="center">
					<div class="center_tit">CHATBOT</div>
					<div class="chatting_wrap">
						<div class="chatting">
							<div class="chat_mule send_wrap">
								<ul class="char f">
									<li class="fc ac"><img src="img/chatbot_1.png"></li>
									<li class="fc ac">with &nbsp;<span> MULE</span></li>
								</ul>
								<div class="chat_sandbox">
									<ul class="chat_bubble">
										<li><img class="" src="img/chat_tr.png"></li>
									</ul>
									<div class="chat_txtbox">
										<ul class="chat_txt">
											<li class="f chat_maintxt ae"><img
												src="img/chat_logo.png"><span>해외 구매대행 사이트 챗봇
													서비스 입니다.</span></li>
											<li class="chat_subtxt">궁금한 분야를 선택하거나 챗봇 width MULE에
												키워드로 질문하면 답변해 드려요.</li>
										</ul>
										<ul class="chat_btn fa">
											<li><a onclick="customsClearance()"><button>해외 통관번호 안내/조회</button></a></li>
											<li><a onclick="directPurchaseTariff()"><button>직구상품 관세 조회하기</button></a></li>
											<li><a onclick="OverseasDirectPurchaseDeliveryInformation()"><button>해외직구 배송안내</button></a></li>
											<li><a onclick="deliveryInquiry()"><button>상품 배송조회</button></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<form action="">
						<div class="chat_submit fc ac">
							<ul class="f">
								<li><input id="textMessage" type="text"></li>
								<li><button onclick="sendMessage(event)">전송</button></li>
							</ul>
						</div>
					</form>

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





	<script type="text/javascript">
		var message = document.getElementById("textMessage");

	
		
		function sendMessage(event) {			
			event.preventDefault();

			answerYesBtn();
		}

		function createChatQuestionbox() {
			// div.chatting 요소를 찾아옴
			var chattingDiv = document.querySelector('.chatting');

			// div.chat_questionbox 요소를 생성
			var questionboxDiv = document.createElement('div');
			questionboxDiv.className = 'chat_questionbox';

			// ul.chat_questiotxt 요소를 생성
			var ulElement = document.createElement('ul');
			ulElement.className = 'chat_questiotxt fe';

			// li 요소를 생성하여 ul 요소에 추가
			var liElement = document.createElement('li');
			var liText = document.createTextNode(message.value);
			liElement.appendChild(liText);
			ulElement.appendChild(liElement);

			// ul 요소를 questionboxDiv에 추가
			questionboxDiv.appendChild(ulElement);

			// questionboxDiv를 chattingDiv에 추가
			chattingDiv.appendChild(questionboxDiv);
		}

		
		
		
		
		//호출 시 answerText, answerButton 확인하고 isBtnRequired로 true, false로 버튼 생성 여부 정하세요
		function createChatAnswerbox(answerText, isBtnRequired, answerButton){
			
				  // div.chatting 요소 생성
				  var chattingDiv = document.createElement('div');
				  chattingDiv.className = 'chatting';

				  // ul.char.f 요소 생성
				  var ulChar = document.createElement('ul');
				  ulChar.className = 'char f';
				  ulChar.innerHTML = `
				    <li class="fc ac"><img src="img/chatbot_1.png"></li>
				    <li class="fc ac">with &nbsp;<span> MULE</span></li>
				  `;
				  chattingDiv.appendChild(ulChar);

				  // div.chat_sandbox 요소 생성
				  var chatSandboxDiv = document.createElement('div');
				  chatSandboxDiv.className = 'chat_sandbox';

				  // ul.chat_bubble 요소 생성
				  var ulChatBubble = document.createElement('ul');
				  ulChatBubble.className = 'chat_bubble';
				  ulChatBubble.innerHTML = `<li><img class="" src="img/chat_tr.png"></li>`;
				  chatSandboxDiv.appendChild(ulChatBubble);

				  // div.chat_txtbox 요소 생성
				  var chatTxtBoxDiv = document.createElement('div');
				  chatTxtBoxDiv.className = 'chat_txtbox';

				  // ul.chat_txt 요소 생성
				  var ulChatTxt = document.createElement('ul');
				  ulChatTxt.className = 'chat_txt';
				  
				  
				  
				  
				  ulChatTxt.innerHTML = getChatTxtContent(answerText);
				  
				  chatTxtBoxDiv.appendChild(ulChatTxt);
				  chatSandboxDiv.appendChild(chatTxtBoxDiv);
				  chattingDiv.appendChild(chatSandboxDiv);

				  // div.chatting을 div.chatting 요소가 들어갈 부모 요소에 추가
				  var parentElement = document.querySelector('.chatting'); // 부모 요소의 선택자에 따라 수정
				  parentElement.appendChild(chattingDiv);
				

				    // 답변에 버튼 필요할 경우 호출

				    if (isBtnRequired) {
     				    var btnDataArray = answerButton;
        
        				// 이 부분까지 세트
        				var ulChatBtn = createChatBtn(btnDataArray);
        				chatTxtBoxDiv.appendChild(ulChatBtn);
        				///~~~~
    				}
				    
					
					
				    chatSandboxDiv.appendChild(chatTxtBoxDiv);
				    chattingDiv.appendChild(chatSandboxDiv);

				    // div.chatting을 div.chatting 요소가 들어갈 부모 요소에 추가
				    var parentElement = document.querySelector('.chatting'); // 부모 요소의 선택자에 따라 수정
				    parentElement.appendChild(chattingDiv);
				}
			
		
		
		

		    
		    
			function answerButton() {
				var button = basicButton;

				if (message.value.includes("상품 배송조회") || message.value.includes("배송")){
					button = deliveryInquiryButton;
				} else if (message.value.includes("관세")){
					button = directPurchaseTariffButton;
				} else if (message.value.includes("가입") || message.value.includes("로그인") || message.value.includes("ID") || message.value.includes("PW") || message.value.includes("아이디") || message.value.includes("비밀번호") || message.value.includes("비번") || message.value.includes("패스워드") || message.value.includes("수정") || message.value.includes("탈퇴")){
					button = keyWord1Button;
				} else if (message.value.includes("반품") || message.value.includes("환불") || message.value.includes("배송") || message.value.includes("조회") || message.value.includes("결제") || message.value.includes("이체") || message.value.includes("카드") || message.value.includes("페이") || message.value.includes("중고") || message.value.includes("상품등록")){
					includedText = keyWord3Button;
				} else {
					button = basicButton;
				}

				return button;
			};    
		    
		    
		    
		function getChatTxtContent() {
			var includedText = textFail;
			if (message.value.includes("통관	") || message.value.includes("관세") || message.value.includes("세금") || message.value.includes("신고") || message.value.includes("부가세")){
				includedText = customClearanceText;
			} else if (message.value.includes("택배 운송장 조회")){
				includedText = inquiryOfCourierWayBillText;
			} else if (message.value.includes("상품 배송조회")){
				includedText = deliveryInquiryText;
			} else if (message.value.includes("배송조회 경로")){
				includedText = searchShippingRouteText;
			} else if (message.value.includes("목록통관")){
				includedText = listClearanceText;
			} else if (message.value.includes("해외직구 배송안내")){
				includedText = OverseasDirectPurchaseDeliveryInformationText;
			} else if (message.value.includes("수입신고")){
				includedText = importDeclarationText;
			} else if (message.value.includes("관세") || message.value.includes("해외상품 예상 관세 금액 조회하기")){
				includedText = directPurchaseTariffText;
			} else if (message.value.includes("배송")){
				includedText = deliveryText;
			} else if (message.value.includes("회원가입")){
				includedText = howToSignUpText;
			} else if (message.value.includes("로그인") || message.value.includes("ID") || message.value.includes("PW") || message.value.includes("아이디") || message.value.includes("비밀번호") || message.value.includes("비번") || message.value.includes("패스워드")){
				includedText = howToLogInText;
			} else if (message.value.includes("수정") || message.value.includes("탈퇴")){
				includedText = howToProfileText;
			} else if (message.value.includes("정품")){
				includedText = genuineText;
			} else if (message.value.includes("AS") || message.value.includes("as") || message.value.includes("a/s") || message.value.includes("A/S") || message.value.includes("불량") || message.value.includes("하자") || message.value.includes("분실") || message.value.includes("누락") || message.value.includes("파손")){
				includedText = ASText;
			} else if (message.value.includes("반품") || message.value.includes("환불")){
				includedText = howToRefundText;
			} else if (message.value.includes("배송") || message.value.includes("조회")){
				includedText = howToDeliveryTrackingText;
			} else if (message.value.includes("결제") || message.value.includes("이체") || message.value.includes("카드") || message.value.includes("페이")){
				includedText = howToPaymentText;
			} else if (message.value.includes("중고") || message.value.includes("상품등록")){
				includedText = howToUsedGoodsText;
			} else {
				includedText = textFail;
			}
			var answerText = `<li class="f chat_maintxt ae"><img src="img/chat_logo.png"><span>`+includedText+`</span></li>`; 
			return answerText;
		}
		
		
		
				// 답변에 버튼 필요할 경우 호출 true false로
		function createChatBtn(btnDataArray) {
    		var ulChatBtn = document.createElement('ul');
    		ulChatBtn.className = 'chat_btn fa';
    		var btnHTML = '';
    		for (var i = 0; i < btnDataArray.length; i++) {
    			if (btnDataArray[i].href) {
        	btnHTML += `<li><a href="${btnDataArray[i].href}" target="_blank"><button>${btnDataArray[i].text}</button></a></li>`;
    		} else if (btnDataArray[i].onclick){
        	btnHTML += `<li><a onclick="${btnDataArray[i].onclick}"><button>${btnDataArray[i].text}</button></a></li>`;    			
    		}
			
    	}
    		ulChatBtn.innerHTML = btnHTML;
    		return ulChatBtn;
		}
		
		var customClearanceText = "통관 안내창입니다.</span></li><li class='chat_answertxt'>개인 통관은 본인 사용목적으로 소량 수입되는 화물로,<br> 받는 사람의 개인통관고유부호가 필요합니다.<br> <br> <a href='https://unipass.customs.go.kr/csp/persIndex.do', target='_blank'>해외통관번호 안내/조회 바로가기</a><br> <br> 해외통관번호 안내/조회 관련 링크도 같이 제공됩니다.";	  
		var deliveryText = "■ 배송 관련 안내창입니다.</span></li><li class = 'chat_answertxt'><br>마이페이지 > 주문/배송조회<br><br>※ 출고 후 송장 조회까지는 평일 기준 1일 소요됩니다. <br><br>※ 해외에서 이미 출고된 상품의 취소는 불가하니 신중한 구매 부탁드립니다.<br><br>■ 택배 운송장 조회<br><a href='https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp', target='_blank'>우체국택배 배송조회 바로가기</a><br><br>배송 관련 링크도 같이 제공됩니다.";
		var directPurchaseTariffText = "관세란</span></li><li class = 'chat_answertxt'>외국에서 수입되거나 외국으로 수출되는 상품이 관세영역을 통과할 때 <br>부과되는 조세를 말합니다. <br><br>일반적으로 관세라 함은 수입하는 상품에 부과하는 수입관세를 의미합니다.<br><br><a href='https://www.customs.go.kr/kcs/ad/tax/BuyTaxCalculation.do', target = '_blank'>직구상품 관세 조회하기</a><br><br>관련 링크도 같이 제공됩니다.";
		var listClearanceText = "■ 목록통관</span></li><li class = 'chat_answertxt'><br>물품가격 미화 150달러 이하(미국은 200달러 이하)는 목록통관 대상이며, <br>해당 금액 초과 시에는 수입신고 대상입니다.";
		var importDeclarationText = "■ 수입신고</span></li><li class = 'chat_answertxt'><br>물품가격 미화 150달러이하는 면세통관되며, 미화 150달러 초과 시에는 공제없이<br>총과세가격(물품가격+운임+보험료 등)에 대해 과세합니다.<br><br>※ 자진 신고를 통해 관세 감면을 받을 수 있으며 <br>품목분류에 따라 세율은 달라지고, 기타 세율 종류에 따라 세액은 달라질 수 있습니다.";
		var OverseasDirectPurchaseDeliveryInformationText = "■ 해외직구 배송안내 관련 안내창입니다.</span></li><li class = 'chat_answertxt'>해외구매대행 특성상 배송기간은 <br>최소 14일에서 21일까지 걸릴 수 있습니다.<br><br>※ 150$ 이상 구매할 경우 관세가 부과 될 수 있습니다.<br>관세 관련 자세한 사항은 예상 관세 금액 조회 이용 바랍니다.<br><br>※ 해외에서 이미 출고된 상품의 취소는 불가하니 신중한 구매 부탁드립니다.<br><br><a href='', target='_blank'>해외직구배송안내 바로가기</a><br><br> 관련 링크도 같이 제공됩니다.";
		var deliveryInquiryText = "상품 배송조회 관련 안내창입니다.</span></li>"
		var searchShippingRouteText = "■ 배송조회 경로</span></li><li class = 'chat_answertxt'><br>마이페이지 > 주문/배송조회<br><br>※ 출고 후 송장 조회까지는 평일 기준 1일 소요됩니다. <br><br>※ 해외에서 이미 출고된 상품의 취소는 불가하니 신중한 구매 부탁드립니다.";
		var inquiryOfCourierWayBillText = "■ 택배 운송장 조회</span></li><li class = 'chat_answertxt'><br><a href='https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp', target = '_blank'>우체국택배 배송조회 바로가기</a><br>";
		var howToSignUpText = "회원가입은 세 가지 방법이 있습니다. 아래 내용을 확인해 주세요.</span></li><li class = 'chat_answertxt'><br><br>■ 일반가입<br>로그인 > 회원가입 선택 > 회원 정보 입력 후 가입이 가능하다.<br><br>■ 카카오 계정을 통한 가입<br>로그인 페이지 > 카카오 로그인 추가 정보 입력 후 가입이 가능하다.<br><br>■ 네이버 계정을 통한 가입<br>로그인 페이지 > 네이버 로그인 추가 정보 입력 후 가입이 가능하다.<br><br><a href='login.html', target='_blank'>회원가입하러가기</a><br><br> 관련 링크도 같이 제공됩니다.";
		var howToLogInText = "SNS로그인은 두 가지 방법이 있습니다. 아래 내용을 확인해 주세요.</span></li><li class = 'chat_answertxt'><br><br>■ 카카오 계정을 통한 가입<br>로그인 페이지 > 카카오 로그인 추가 정보 입력 후 가입이 가능하다.<br><br>■ 네이버 계정을 통한 가입<br>로그인 페이지 > 네이버 로그인 추가 정보 입력 후 가입이 가능하다.<br><br><a href='login.html', target='_blank'>sns로그인하러가기</a><br><br>관련 링크도 같이 제공됩니다.";
		var howToFindIDPWText = "로그인 화면에서 아이디 찾기/비밀번호 찾기를 통해 확인 가능합니다.</span></li><li class = 'chat_answertxt'><br><br><a href='login.html', target = '_blank'>아이디/비밀번호 찾으러가기</a><br><br>관련 링크도 같이 제공됩니다.";
		var howToProfileText = "회원정보 수정/탈퇴는 마이페이지에서 직접 신청해주셔야 합니다.</span></li><li class = 'chat_answertxt'><br><br>마이페이지 > 회원정보 수정 / 회원탈퇴<br><br>※ 진행 중인 주문 건이 있는 경우, 탈퇴가 가능하지 않습니다.<br><br><a href='mypage_member.html', target = '_blank'>회원 정보 수정 및 탈퇴 바로가기</a><br><br>관련 링크도 같이 제공됩니다.";
		var genuineText = "정품</span></li><li class = 'chat_answertxt'><br>모든 제품은 브랜드 본사 혹은 정식 수입업체나 정품 병행수입 업체를 통해<br>정식 계약을 맺고 판매하고 있습니다.<br><br>위와 같은 절차에도 구매한 상품이 가품으로 판명될 경우 <br>해당 상품 구매가격의 스토어 상품은 100%를 보상해드립니다.<br><br>※일부 브랜드의 경우 본사에서 제공하는 보증서가 동봉됩니다.";
		var ASText = "아래 내용 확인해 주세요</span></li><li class = 'chat_answertxt'><br><br>■ 상품 파손<br>택배 박스, 제품 포장재 등을 받은 상태 그대로 보관 후 접수해 주세요.<br>※ 상태 그대로를 보관 하지 않으면 파손 사고 접수 시 확인이 가능하지 않습니다. <br><br>■ 상품&구성품 누락 <br>브랜드 및 상품에 따라 출고지가 다르기 때문에<br>여러 개 상품을 주문한 경우에는 각각 배송이 됩니다.<br><br>1. 주문내역조회에서 배송 진행 상황을 확인해 주세요. <br>2. 배송조회에서도 배송완료로 확인 되고 상품이 따로 배송 되지 않았다면<br>해당 택배사또는 배송기사님께 문의해 주세요.<br><br>■ 상품 분실<br>배송완료로 나오는데 아직 상품을 받지 못했을 경우<br>배송 상황에 따라 배송완료로 확인될 수 있습니다. <br><br>■ 배송 기사가 상품을 아직 보유하고 있는 경우<br>보유여부는 택배사 또는 배송기사분에게 확인해 주세요.<br><br>■ 경비실, 문 앞, 택배 보관함 등에 위탁 장소에 배송하는 경우<br>다시 한번 상품이 있는지 확인해 주세요.<br><br>■ 배송 완료로 먼저 처리 후 현재 배송 중일 경우<br>배송중으로 배송기사분에게 확인해 주세요.<br><br>■ 송장번호를 잘못 입력 한 경우<br>배송 지역이 다르게 확인될 수 있어 택배사를 통해 송장번호 확인해 주세요.";
		var howToRefundText = "■ 반품/환불 접수 경로</span></li><li class = 'chat_answertxt'><br><br>마이페이지 > 주문/배송 조회 > 구매확정하기 > 반품요청 또는 중고거래 중 선택 <br><br>※ 모니터의 해상도나 사이즈 측정방법에 따라 상세페이지와 약간 차이가<br>발생 할 수 있고 해당 경우는 불량(하자)이 아닙니다. <br><br>※ 제품에 사용 흔적, 오염, 세탁, 케이스(포장) 손상, 라벨 제거, 사은품 사용 등의<br>사유 시 반품이 가능하지 않습니다.<br><br>※ 상품 검수 시 불량(하자)이 아닌 경우 반품 관련 배송비 관세/통관 비용이 청구 됩니다.<br><br>※ 불량, 오배송인 경우 교환 요청해 주세요.<br><br><a href='mypage_check.html', target = '_blank'>반품/환불하기 바로가기</a><br><br>키워드+  관련 링크도 같이 제공됩니다.";
		var howToDeliveryTrackingText = "■ 배송조회 경로</span></li><li class = 'chat_answertxt'><br><br>마이페이지 > 주문/배송조회<br><br>※ 출고 후 송장 조회까지는 평일 기준 1일 소요됩니다. <br><br>※ 해외에서 이미 출고된 상품의 취소는 불가하니 신중한 구매 부탁드립니다.<br><br>■ 택배 운송장 조회<br><a href='https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp', target='_blank'>우체국택배 배송조회 바로가기</a><br><br>키워드+ 관련 링크도 같이 제공됩니다.";
		var howToPaymentText = "주문서 작성 후 결제 항목에서 선택이 가능합니다.</span></li><li class = 'chat_answertxt'><br><br>■ 일반 결제 신용카드, 가상계좌, 계좌이체, Apple pay, 휴대폰결제, 토스 페이,<br> 카카오 페이, 네이버 페이, 페이코 결제가 있습니다.<br><br><a href='bucket.html' target='_blank'>결제하러가기</a><br><br>키워드+ 관련 링크도 같이 제공됩니다.";
		var howToUsedGoodsText = "■ 중고거래 상품등록</span></li><li class = 'chat_answertxt'><br><br>마이페이지 > 주문/배송조회 > 구매확정하기 > 중고거래하기 <br><br>※ 중고거래 상품은 자사에서 구매한 제품만 등록이 가능합니다.<br><br><a href='product_regi.html', target='_blank'>중고거래 바로가기</a><br><br>키워드+ 관련 링크도 같이 제공됩니다.";
		var textFail = "죄송합니다 내용을 이해하지 못했어요.</span></li>";	  
		var emptyText = "</span></li>"
		
		
		    var basicButton = [
    			{ onclick: 'customsClearance()', text: '해외통관번호 안내/조회' },
				{ onclick: 'directPurchaseTariff()', text: '해외상품 예상 관세 금액 조회하기' },
				{ onclick: 'OverseasDirectPurchaseDeliveryInformation()', text: '해외직구 배송안내' },
				{ onclick: 'deliveryInquiry()', text: '상품 배송조회' }
				];

		    var deliveryInquiryButton = [
    			{ onclick: 'searchShippingRoute()', text: '배송조회 경로' },
				{ onclick: 'inquiryOfCourierWayBill()', text: '택배 운송장 조회' }
				];
		    var directPurchaseTariffButton = [
    			{ onclick: 'listClearance()', text: '목록통관' },
				{ onclick: 'importDeclaration()', text: '수입신고' }
				];
		    var keyWord1Button = [
    			{ onclick: 'howToSignUp()', text: '회원가입' },
				{ onclick: 'howToLogIn()', text: 'SNS로그인하기' },
				{ onclick: 'howToFindIDPW()', text: 'ID/PW 찾기' },
				{ onclick: 'howToProfile()', text: '회원정보 수정/탈퇴' }
				];			
		    var keyWord3Button = [
    			{ onclick: 'howToRefund()', text: '반품/환불하기' },
				{ onclick: 'howToDeliveryTracking()', text: '배송조회하기' },
				{ onclick: 'howToPayment()', text: '통합결제하기' },
				{ onclick: 'howToUsedGoods()', text: '중고거래하기' }
				];		
		    
		
		
		
 		function directPurchaseTariff(){
			message.value = "해외상품 예상 관세 금액 조회하기";
			answerNoBtn();
		} 
 		
 		function customsClearance(){
 			message.value = "해외통관번호 안내/조회";
 			answerNoBtn();
 		}
 		
 		function listClearance(){
 			message.value = "목록통관";
 			answerNoBtn();
 		}
 		function importDeclaration(){
 			message.value = "수입신고";
 			answerNoBtn();
 		}
 		
 		function OverseasDirectPurchaseDeliveryInformation(){
 			message.value = "해외직구 배송안내";
 			answerNoBtn();
 		}
 		
 		function deliveryInquiry(){
 			message.value = "상품 배송조회";
 			answerYesBtn();
 		}
 		
 		function searchShippingRoute(){
 			message.value = "배송조회 경로";
 			answerNoBtn();
 		}
 		
 		function inquiryOfCourierWayBill(){
 			message.value = "택배 운송장 조회";
 			answerNoBtn();
 		}
 		
		function howToSignUp(){
			message.value = "회원가입";
			answerYesBtn();
		}
 		
 		function howToLogIn(){
 			message.value = "로그인";
 			answerYesBtn();
 		}
 		
 		function howToFindIDPW(){
 			message.value = "ID/PW 찾기";
 			answerYesBtn();
 		}
 		
 		function howToProfile(){
 			message.value = "회원정보 수정/탈퇴";
 			answerYesBtn();
 		}
 		
 		function howToRefund(){
 			message.value = "반품/환불하기";
 			answerYesBtn();
 		}
 		
 		function howToDeliveryTracking(){
 			message.value = "배송조회하기";
 			answerYesBtn();
 		}
 		
 		function howToPayment(){
 			message.value = "통합결제하기";
 			answerYesBtn();
 		}
 		
 		function howToUsedGoods(){
 			message.value = "중고거래하기";
 			answerYesBtn();
 		}
 		
 		
 		
 		
 		
 		// 답변에 버튼 필요할경우
 		function answerYesBtn(){
			createChatQuestionbox();
			var button = answerButton(button);
			createChatAnswerbox(message, true, button);
			scrollToBottomSlowly();
			message.value = "";
 		}
 		
 		// 답변에 버튼 필요하지 않을 경우
 		function answerNoBtn(){
			createChatQuestionbox();
			createChatAnswerbox(message, false);
			scrollToBottomSlowly();
			message.value = "";
 		}
 		
			  
			function scrollToBottomSlowly() {
				  var chattingWrap = document.querySelector('.chatting_wrap');
				  var scrollHeight = chattingWrap.scrollHeight;
				  var scrollTop = chattingWrap.scrollTop;
				  var scrollStep = 10; // 고정된 스크롤 속도로 설정
				  
				  function scrollToBottomStep() {
				    scrollTop += scrollStep;
				    chattingWrap.scrollTop = scrollTop;
				    
				    if (scrollTop < scrollHeight) {
				      setTimeout(scrollToBottomStep, 10);
				    }	
				  }
				  
				  scrollToBottomStep();
				}
			
			</script>



</body>
</html>
</body>
</html>