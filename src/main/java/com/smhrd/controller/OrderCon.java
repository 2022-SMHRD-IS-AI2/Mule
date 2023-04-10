package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.OrderDAO;
import com.smhrd.model.OrderVO;
import com.smhrd.model.UserVO;


public class OrderCon extends HttpServlet {
   private static final long serialVersionUID = 1L;


   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	   request.setCharacterEncoding("UTF-8");
		
	   
      HttpSession session = request.getSession();
      UserVO loginUser=(UserVO)session.getAttribute("loginUser"); 
      
      String u_id=loginUser.getU_id();
      String main_prod_name = request.getParameter("main_prod_name");
      System.out.println("이름"+main_prod_name);
      int total_amount = Integer.parseInt(request.getParameter("total_amount"));
      System.out.println("수량"+total_amount);
      int paid_amount = Integer.parseInt(request.getParameter("_totalAmount"));
      System.out.println("결제액"+paid_amount);
      String[] cnts = request.getParameterValues("cnt[]");
      String[] prodNums = request.getParameterValues("prodNum[]");
      
      
      
      for (int i = 0; i < cnts.length; i++) { // 배열 크기만큼 반복
          int num= Integer.parseInt(cnts[i]);
          int prodNum = Integer.parseInt( prodNums[i]);
         
             OrderVO O_vo = new OrderVO(prodNum,u_id,num);   
             int O_cnt = new OrderDAO().orderUpload(O_vo);
             

               
             if(O_cnt>0) {
               System.out.println("주문내역 업로드 완료");
             }else {
                System.out.println("주문내역 업로드 실패");
                  
              }
         
      }
      
          RequestDispatcher dispatcher = request.getRequestDispatcher("Order.jsp");
       
           request.setAttribute("main_prod_name", main_prod_name);
           request.setAttribute("total_amount", total_amount);
           request.setAttribute("paid_amount", paid_amount);
            
           dispatcher.forward(request, response);
      
      
   }

}