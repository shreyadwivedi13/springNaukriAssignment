<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user Login</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
</head>
<body>


	<div id="box1" class="container">
		<div class="row">
			<div id="text">

				<h1 id="header">Welcome!</h1>

				<p class="registration-description">Log in to find jobs/employees!</P>
			</div>





			<form:form method="POST" action="process-login" class="login-form">
						<h2 class="title">Login details:</h2>
			
				<input type="text" name="username" placeholder="Username" required />
				<input type="password" name="password" placeholder="Password"
					required />
				<input type="submit" value="Login" />
							<a href="/springNaukriAssignment/">Signup?</a>
								<br />
			<p />

			<c:if test="${param.error != null}">
				<i style="color: red">Invalid username or password</i>
			</c:if>

			<c:if test="${param.logout != null}">
				<i style="color: red">You are logged out</i>
			</c:if>
			<br />
				
			</form:form>
		
			<p />

		</div>
	</div>

</body>
</html>