<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body class="container">
	<div>
		<jsp:include page="header.jsp" />
		<h1>${msg}</h1>
	</div>

	<div class="marketplace">
		<%
		for (int i = 0; i < 20; i++) {
		%>
		<div class="item" height="20px" ,widht="20px" ,color=red>
			<h2> Blog article </h2>
			<hr/>
			<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions <span>Read more...</span></p>
		</div>
		<%
		}
		%>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>