<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = 'https://code.jquery.com/jquery-3.6.1.min.js'></script>
</head>
<body>
      <form class="input2" action="JoinCon" method="post">
                <span>아이디</span>
                <div class="inputs id">
                <input type="text" placeholder="아이디" id="dcid" name="id">        
            	<button type="button" id= "idCheck" >id체크</button>
            	</div>
            	<h4 id="resultCheck"></h4>
                <span>비밀번호</span>
                <div class="inputs pw">
                    <input type="password" placeholder="비밀번호" name="pw">
                </div>
                <span>이름</span>
                <div class="inputs name">
                    <input type="text" placeholder="이름" name="name">
                </div>
                <span>닉네임</span>
                <div class="inputs nick">
                    <input type="text" placeholder="닉네임" name="nick">
                </div>
                <span>주소</span>
                <div class="inputs adress">
                    <input type="text" placeholder="주소" name="address">
                </div>
                
                <span>전화번호</span>
                <div class="inputs phone">
                    <input type="text" placeholder="전화번호" name="tel">
                </div>

                <div class="inputs signUp">
                    <input type="submit" value="회원가입">
                </div>
        </form>
            
            
       <script>
       		let button = document.querySelector("#idCheck");
      	 	console.log("버튼제대로눌림")
            	function checkE(){
               	var idCheck = $('#dcid').val()
               	console.log(idCheck)
               
               $.ajax({
                 		 // 어디로 요청할 것인지??
                        url : 'idCheckCon',
                        // 요청데이터(jsaon형태, {key, value})
                        data : {'idCheck': idCheck},
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