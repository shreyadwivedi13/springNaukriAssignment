<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user Login</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
</head>
<body>
	<div id="page">

		<div id="box1">
			<div id="form">

				<h2 id="text">
					Welcome 
					</h2>

				<div id="header">
					<span>Please signup or login as user to acess the job portal</span>
				</div>
			</div>


			<div id="dets">
				<div class="box2">
					<div class="login">

						<div class="page1">

							<h1 class="title">Login details:</h1>
							<form:form method="POST" action="process-login">
								<input type="text" name="username" placeholder="Username"
									required />
								<input type="password" name="password" placeholder="Password"
									required />
								<input type="submit" value="Login" />
							</form:form>
							<br />
							<p />

							<c:if test="${param.error != null}">
								<i style="color: red">Invalid username or password</i>
							</c:if>

							<c:if test="${param.logout != null}">
								<i style="color: red">You are logged out</i>
							</c:if>
							<br />
							<p />

							<a href="/springNaukriAssignment/">Signup?</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>