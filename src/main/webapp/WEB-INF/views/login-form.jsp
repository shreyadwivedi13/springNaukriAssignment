<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user Login</title>

</head>
<body>
	
	<c:if test = "${param.error != null}">
		<i style="color:red">Invalid username or password</i>	
	</c:if>
	
	<c:if test = "${param.logout != null}">
		<i style="color:red">You are logged out</i>	
	</c:if>
	
	
	<div id="main">


		<div id="box">
			<div id="form">

				<h2 >
					Welcome!
				</h2>

				<div id="form-details">
					<span>Please signup/login to access further</span>
				</div>
			</div>

			<div id="form-content">
				<div class="box">
					<div class="pagelogin" id="Login">
							<h1 class="title">Login</h1>
							<form:form method="POST" action="process-login">
								<input type="text" name="username" placeholder="Username"
									required /> 
								<input type="password" name="password"
									placeholder="Password" required /> 
								<input type="submit"
									value="Login" />
							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>

	


</body>
</html>