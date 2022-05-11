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
		<div class="container">
			<form:form method="POST" modelAttribute="appliedJobs">
				<h1>Apply for ${companyName}</h1>
							jobid:
								<form:input path="id" value="${id}" disabled="true" />
				<br>
					candidate Username:
					<form:input path="candidateUsername" value="${username}"
					disabled="true" />
				
				<br>
				<a
					href="/springNaukriAssignment/process-jobApply?username=${username}&id=${id}&companyName=${companyName}">apply
					job</a>
					<br>
					<br>
				<a href="/springNaukriAssignment/jobList?username=${username}">
					<i class='fas fa-clipboard'></i> other jobs?
				</a>
			</form:form>

		</div>

	
</body>
</html>