<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>apply job</title>
</head>
<body>
	<div id="main"></div>
	<div id=" container">
		<div id="form" <h2>welcome!</h2>>
			<div>
<div id="form-details">
<div class="box">
<form:form action="process-apply" method="POST" modelAttribute="appliedJobs">
<h3>Apply for ${companyName}</h3>
jobid:
<form:input path="jobid" value="${jobid }" disabled="true"/>
candidate Username:
<form:input path="candidateUsername" value="${username}" disable="true" />
<p>apply job .jsp</p>
<input type ="submit" value="apply">
<a href="/springNaukriAssignment/jobList?username=${username}">jobs list?</a>
</form:form>
</div></div>
	</div>
	</div>
	</div>
</body>
</html>