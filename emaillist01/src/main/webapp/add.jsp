<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.poscoict.emaillist.dao.EmaillistDao" %>
<%@ page import="com.poscoict.emaillist.vo.EmaillistVo" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	String firstName = request.getParameter("fn");
	String lastName = request.getParameter("ln");
	String email = request.getParameter("email");
	
	EmaillistVo vo = new EmaillistVo();
	EmaillistDao dao = new EmaillistDao();
	vo.setFirstName(firstName);
	vo.setLastName(lastName);
	vo.setEmail(email);
	boolean result = dao.insert(vo);
	response.sendRedirect("/emaillist01/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>잘 들어갔습니다.</h2>
</body>
</html>