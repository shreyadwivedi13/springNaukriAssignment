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
	<div id="page">

		<div id="box1">
			<div id="text">

				<h2 id="header">Welcome!</h2>

				<div id="info">
					<span>Please signup or login to access the job portal</span>
				</div>
			</div>


			<div id="dets">
				<div class="box2">
					<div class="form" id="form">

						<div class="page1">
							<h1 class="title">Register</h1>
							<form:form action="save" method="post"
								modelAttribute="portalUser" onsubmit="return validateForm()">

								<div class=" input-control">
									<form:input path="name" placeholder="Full Name" required="true"
										oninput="validateFullName()" id="full_name" />
								</div>


								<div id="emailDiv" class="input-control">
									<form:input path="email" placeholder="email" id="email"
										name="email" oninput="validateEmail()" required="true" />
									<div class="error" id="emailError">
										<form:errors path="email" cssStyle="color:#ff3860"></form:errors>
									</div>
								</div>

								<div class=" input-control">
								<form:input  path="username"
									placeholder="Username" required="true"  oninput="validateUsername()" />
								<c:if test="${param.exists != null}">
									<i style="color: red">Username Already Exists</i>
								</c:if>
								</div>
								<div id="passwordDiv" class="input-control">
									<form:password path="password" id="password" name="password"
										placeholder="Password" oninput="validatePassword()"
										required="true" />
									<div id="passwordError" class="error">
										<form:errors path="password" cssStyle="color:#ff3860"></form:errors>
									</div>
								</div>
						
					Please Select the userType	
					<form:select path="role" required="true">
									<option value="" disabled selected>Choose User Type</option>
									<form:option value="Candidate"></form:option>
									<form:option value="Employer"></form:option>
								</form:select>

								<p />
								<p />

								<input type="submit" value="Register" class="button">
							</form:form>

							<a href="/springNaukriAssignment/login-form">Already have an
								account login</a>

						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

</body>
</html>