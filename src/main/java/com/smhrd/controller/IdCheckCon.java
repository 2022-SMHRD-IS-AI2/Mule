package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.UserDAO;


public class IdCheckCon extends HttpServlet {
   private static final long serialVersionUID = 1L;

   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
	  request.setCharacterEncoding("UTF-8");
	   
      String IdCheck= request.getParameter("IdCheck");
      System.out.println(IdCheck);
      UserDAO dao = new UserDAO();
      
      boolean check = dao.idCheck(IdCheck);
      
      System.out.println(check);
      
      PrintWriter out = response.getWriter();
      out.print(check);
      
   }

}
