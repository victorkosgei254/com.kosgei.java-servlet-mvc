<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signin</title>
<link rel="stylesheet" type="text/css" href="resources/css/signin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</head>

<body class="container">
	<h1>Signin Page</h1>
	<p>${errorMsg}</p>
	<form action="/com.kosgei.webapp/signin" method="post">
		<div class="login">
			<label for="username" id="usernameInput" test="username">Username</label>
			<input type="text" placeholder="enter your username" name="username" />
			<label for="password" id="passwordInput" test="username">Password</label>
			<input type="password" placeholder="enter your password"
				name="password" test="passwordField" />
		</div>
		<input type="submit" name="submit" value="login" test="submitButton">
	</form>
</body>
</html>