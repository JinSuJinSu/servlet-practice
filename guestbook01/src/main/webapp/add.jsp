<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.poscoict.guestbook01.dao.GuestbookDao" %>
<%@ page import="com.poscoict.guestbook01.vo.GuestbookVo" %>
    
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
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
			response.sendRedirect("/guestbook01/index.jsp");
			// 이 방법이 더 편한 방법이다. response.sendRedirect(request.getContextPath());
		}
	}
	else{
%>

	<h1>똑바로 입력하세요 뭐하십니까</h1>

<%
	}		
%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>