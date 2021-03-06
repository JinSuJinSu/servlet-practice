<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.poscoict.guestbook01.dao.GuestbookDao" %>
<%@ page import="com.poscoict.guestbook01.vo.GuestbookVo" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook01/add.jsp" method="post">
	<table border=1 width=500>
		<tr>
			<td>이름</td><td><input type="text" name="name"></td>
			<td>비밀번호</td><td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td colspan=4><textarea name="message" cols=60 rows=5></textarea></td>
		</tr>
		<tr>
			<td colspan=4 align=right><input type="submit" value="등록"></td>
		</tr>
	</table>
	</form>
	<br>
	<table width=510 border=1>
<%
	GuestbookDao dao = new GuestbookDao();
	List<GuestbookVo> list = dao.findAll();
	for(GuestbookVo vo : list){
%>
		<tr>
			<td>[<%= list.indexOf(vo)+1 %>]</td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="/guestbook01/deleteform.jsp?no=<%= vo.getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4>
				<%= vo.getMessage().replaceAll("\\n","<br>") %>
			</td>
		</tr>
<%
	}	
%>
		
	</table>
</body>
</html>