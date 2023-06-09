package com.smhrd.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.ProductDAO;
import com.smhrd.model.ProductVO;
import com.smhrd.model.UserVO;


public class UsedProdCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		

		HttpSession session = request.getSession();
		UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
	  	
	  	String seller_id=loginUser.getU_id();

		// MultipartRequest에서 필요한 매개변수 설정
		// 1.모든 요청의 청보가 담겨있는 request객체
		// 2.업로드 된 파일(이미지)을 저장할 경로
		String path =request.getServletContext().getRealPath("./Prod");
		System.out.println(path);
		System.out.println(request.getContextPath());
		System.out.println(request.getServletPath());
		
		// 3.파일의 max size
		int maxSize = 10*1024*1024;
		// 4.인코딩 방식
		String encoding = "UTF-8";
		// 5. 중복제거
		 DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		//파일 업로드 -> MultiPartRequest -> cos.jar
		MultipartRequest multi = new MultipartRequest(request, path, maxSize,encoding,rename);
		
		//DB에 저장하기 위해서 등록한 상품정보 가져오기
		String prod_Name=multi.getParameter("prodName"); //상품명
		String price= multi.getParameter("prodPrice"); 	//상품가격
		int prod_Price=Integer.parseInt(price);
		String prod_Title= multi.getFilesystemName("prodTitle"); //썸네일
		String prod_Img1= multi.getFilesystemName("prodImg1"); //이미지(제작과정 이미지 파일)
		String prod_Img2= multi.getFilesystemName("prodImg2"); //이미지(제작과정 이미지 파일)
		String prod_Desc= multi.getParameter("prodDesc"); //상품설명
		String Return_Period= multi.getParameter("ReturnPeriod"); //반품기간	
		String buy_date= multi.getParameter("buyDate"); //구매일자	
		
		ProductVO vo= new ProductVO(
				prod_Name,prod_Price,prod_Title,prod_Img1,prod_Img2,
				prod_Desc,seller_id,Return_Period,buy_date); 
		
		int cnt = new ProductDAO().UPupload(vo);
		
		if(cnt>0) {
			System.out.println("중고거래 상품 업로드 성공");
			response.sendRedirect("UsedProdMain.jsp");
			
		}else {
			System.out.println("중고거래 상품 업로드 실패");
		}
	}
	
	
	
	

}


