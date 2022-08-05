<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body class="container">
	<jsp:include page="header.jsp" />
	<h1>Welcome</h1>
	<h1>${msg}</h1>

		
	<jsp:include page="footer.jsp" />
</body>
</html>