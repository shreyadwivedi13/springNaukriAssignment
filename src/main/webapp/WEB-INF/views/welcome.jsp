<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access = 'hasAuthority("Employer")'>
<a href = "/springNaukriAssignment/postJob?username=${portalUser.username}">Show Employer panel</a>
</sec:authorize>

<a href = "/springNaukriAssignment/jobList?username=${portalUser.username}">Show candidate panel</a>

<form:form action = "logout" method = "POST">
	<input type = "submit" value = "logout">
</form:form>
<h2>welcome ${portalUser.name} <br /></h2>

Name : ${portalUser.name}<br />
Email : ${portalUser.email}<br />
Username : ${portalUser.username}<br />
Role : ${portalUser.role}<br />

</body>
</html>