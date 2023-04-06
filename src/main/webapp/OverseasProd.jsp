<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form class="boad-content1" action="OpCon" method="post"  enctype="multipart/form-data" >
   
            <div class="boad-content1-input1">
                <span class="boad-content1-span">상품명</span>
                <input type="text" name="prodName">
            </div>    
            
            <div class="boad-content1-input1" >
           		 <span class="boad-content1-span">상품 카테고리</span>
                <select class="boad-content1-select" name ="prodCate" >
            		<option>TV&리모컨</option>
            		<option>PC&ACC</option>
            		<option>게임&콘솔</option>
            		<option>빔프로젝트&스피커</option>
            	</select>
            </div>      
    
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 가격</span>
                <input type="text" name="prodPrice">
            </div>
         
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 대표 사진</span>
                 <input type="file" name="prodTitle">
                </div>
                
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 상세 이미지1</span>
                <input type="file" name="prodImg1">
            </div>
            
              <div class="boad-content1-input1"> 
                <span class="boad-content1-span">상품 상세 이미지2</span>
                <input type="file" name="prodImg2">
            </div>
            
            <div class="boad-content1-input2"> 
                <span class="boad-content1-span">상품 설명</span>
                <textarea cols="30" rows="20" style="resize: none;" name="prodDesc"></textarea>
            </div>
            
            <div class="boad-content1-input1"> 
                <span class="boad-content1-span">인원수</span>
                <input type="text" name="numOfPeople">
            </div>
            
             <div class="boad-content1-input1"> 
                <span class="boad-content1-span">통관번호</span>
                <input type="text" name="customsClearanceNum">
            </div>
            
             <div class="boad-content1-input1"> 
                <span class="boad-content1-span">반품기간</span>
                <input type="date" name="ReturnPeriod">
            </div>
            
            
            <div class="boad-content1-submit">
                <input type="submit" value="상품등록">
            </div>
            

        </form>
</body>
</html>