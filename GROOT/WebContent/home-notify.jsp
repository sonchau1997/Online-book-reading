<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Notify</title>
</head>
<body>
	<%!String notify;%>
	<%
		notify = (String) request.getAttribute("notify");
	%>
	<p><%= notify %></p>
	<br>
	<a href="<%= request.getContextPath() %>/introduction.jsp">Trở về</a>
</body>
</html>