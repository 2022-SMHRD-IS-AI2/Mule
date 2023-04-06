package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PayDAO;
import com.smhrd.model.PayVO;
import com.smhrd.model.UserVO;


public class PayCon extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	  request.setCharacterEncoding("UTF-8");
	   
      HttpSession session = request.getSession();
      UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
      
      String u_id=loginUser.getU_id();
      int paid_amount = Integer.parseInt(request.getParameter("paid_amount"));
      String recipient = request.getParameter("recipient");
      String address = request.getParameter("address");
      String phone= request.getParameter("phone");
      int total_amount = Integer.parseInt(request.getParameter("total_amount"));
      String main_prod_name= request.getParameter("main_prod_name");
      
      PayVO vo = new PayVO(u_id,paid_amount,recipient,address,phone,total_amount,main_prod_name);   
      int cnt = new PayDAO().PayUpload(vo);
      
            
      if (cnt> 0) {
         System.out.println("결제내역 업로드 성공");
         
         RequestDispatcher dispatcher = request.getRequestDispatcher("Pay.jsp");
         request.setAttribute("main_prod_name", main_prod_name);
         request.setAttribute("total_amount", total_amount);
         request.setAttribute("paid_amount", paid_amount);
         
         dispatcher.forward(request, response);
         
         
      }else {
         System.out.println("결제내역 업로드 실패");
         response.sendRedirect("Order.jsp");
      }
   
      
   }

}