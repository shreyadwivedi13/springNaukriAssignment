<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>apply job</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
</head>
<body>
	<div id="page"></div>
	<div id="box1">
		<br> <br>


		<div id="dets">
			<div class="page1">
				<form:form action="process-jobApply" method="POST"
					modelAttribute="appliedJobs">
					<h3>Apply for ${companyName}</h3>
jobid:
<form:input path="id" value="${id}" disabled="true" />
					<br>
candidate Username:
<form:input path="candidateUsername" value="${username}" disable="true" />
					<p></p>
					<input type="submit" value="apply">
					<br>
					<br>
					<a href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-clipboard'></i> other jobs?
					</a>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>