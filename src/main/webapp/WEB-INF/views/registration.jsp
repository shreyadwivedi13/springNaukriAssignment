<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>registration</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
<script src="./static/validation.js"></script>
</head>
<body>


	<!-- main div covers entire page -->


	<div id="box1" class="container">
		<div class="row">
			<div id="text">

				<h1 id="header">Welcome!</h1>



				<p class="registration-description">Please signup or login to
					access the job portal</p>

			</div>

			<form:form action="save" method="post" modelAttribute="portalUser" class="signup-form"
				onsubmit="return validateForm()">
			<h2 class="title">Register</h2>
	
			
					<form:input path="name" placeholder="Full Name" required="true"
						oninput="validateFullName()" id="full_name" />
				


				<div id="emailDiv">
					<form:input path="email" placeholder="Email" id="email"
						name="email" oninput="validateEmail()" required="true" />
					<div class="error" id="emailError">
						<form:errors path="email" cssStyle="color:#ff3860"></form:errors>
					</div>
				</div>

				
					<form:input path="username" placeholder="Username" required="true"
						oninput="validateUsername()" />
					<c:if test="${param.exists != null}">
						<i style="color: red">Username Already Exists</i>
					</c:if>
				
				<div id="passwordDiv">
					<form:password path="password" id="password" name="password"
						placeholder="Password" oninput="validatePassword()"
						required="true" />
					<div id="passwordError" class="error">
						<form:errors path="password" cssStyle="color:#ff3860"></form:errors>
					</div>
				</div>
						
					Please select the user role:	
					<form:select path="role" required="true">
					<option value="" disabled selected>Choose User Type</option>
					<form:option value="Candidate"></form:option>
					<form:option value="Employer"></form:option>
				</form:select>

				<p />
				<p />

				<input type="submit" value="Register" class="button">
					<a href="/springNaukriAssignment/login-form">Already have an
				account login</a>
			</form:form>

		



		</div>
	</div>
</body>
</html>