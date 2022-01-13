<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.poscoict.guestbook.dao.GuestbookDao" %>
<%@ page import="com.poscoict.guestbook.vo.GuestbookVo" %>
    
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	System.out.println(no);
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
			response.sendRedirect("/guestbook01/index.jsp");
		}	
	}
	else{
%>
	<h1>비밀번호 똑바로 입력하세요 뭐하십니까</h1>

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