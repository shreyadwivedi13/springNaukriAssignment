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

				<div id="form-content">
					<span>Please signup/login to access further</span>
				</div>
			<div id="form-details">
				<div class="container">
					<div class="pagelogin" id="Login">
						 <div class="front">
                            <h1 class="title">Register</h1>
				<form:form action="save" method="post" modelAttribute="customer">
					<form:input path="name" placeholder="Full Name" required="true" />
					<form:input path="email" placeholder="email" required="true" />
					<form:input path="username" placeholder="Username" required="true" />
					<form:errors path="username" cssStyle="color:#ff3860" ></form:errors>
					<form:password path="password" placeholder="Password"
						required="true" />
						
					<form:select path="role" required="true">
						<option value="" disabled selected>Choose User Type</option>
						<form:option value="candidate"></form:option>
						<form:option value="Employer"></form:option>
					</form:select>
					
					<p/> 
					<p/> 
			
					<input type="submit" value="Register">
				</form:form>
				
				<a href = "/springNaukriAssignment/login-form">Already have an account login?</a>

			</div>
					</div>
				</div>
		

	</div>


</body>
</html>