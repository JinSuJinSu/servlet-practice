package com.poscoict.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poscoict.guestbook.dao.GuestbookDao;
import com.poscoict.guestbook.vo.GuestbookVo;



public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String actionName = request.getParameter("a");
		if("deleteform".equals(actionName)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(request, response);
		}
		else if("delete".equals(actionName)){
			String no = request.getParameter("no");
			String password = request.getParameter("password");
			
			GuestbookVo vo = new GuestbookVo();
			GuestbookDao dao = new GuestbookDao();
			boolean result=false;
			
			int number = Integer.valueOf(no);
			vo = dao.selectOne(number);
			
			if(vo.getPassword().equals(password)){
				// 비밀번호가 같아야만 삭제에 성공한다.
				result=dao.delete(number);
				if(result){
					response.sendRedirect(request.getContextPath() + "/gb");
				}	
			}
			else{
				out.println("<h1>비밀번호 똑바로 입력하세요 뭐하십니까</h1>");
			}
		}

		else if("add".equals(actionName)) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String message = request.getParameter("message");
		
		if(name!=null && password!=null && message!=null && !name.equals("") && !message.equals("") && !password.equals("")){
			GuestbookVo vo = new GuestbookVo();
			GuestbookDao dao = new GuestbookDao();
			vo.setName(name);
			vo.setPassword(password);
			vo.setMessage(message);
			boolean result = dao.insert(vo);
			
			if(result){
				response.sendRedirect(request.getContextPath() + "/gb");
				// 이 방법이 더 편한 방법이다. response.sendRedirect(request.getContextPath());
			}
		}
			else {
				out.println("<h1>똑바로 입력하세요 뭐하십니까");
			}
		}
		else {
			GuestbookDao dao = new GuestbookDao();
			List<GuestbookVo> list = dao.findAll();
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
