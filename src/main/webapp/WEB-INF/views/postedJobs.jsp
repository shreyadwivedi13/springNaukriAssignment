<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Posted Jobs</title>
<link href="<c:url value="./template/css/style.css" />" rel="stylesheet">
</head>
<body>

	<div id="main">

		<div id="searchUser-container">

			<div>

				<div class="navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}">
							<i class="fas fa-sticky-note"></i> Post a new Jobs
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-list'></i>  Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-check-square"></i> posted by me</a>
					</sec:authorize>


s
					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			
			<table id="displayTable"
				style="margin-top: auto; margin-bottom: auto;">
				<tr class="header">
					<th>ID</th>
					<th>position</th>
					<th>CompanyName</th>
					<th>Job Description</th>
					<th>EmployerUsername</th>
			
					<sec:authorize access='hasAuthority("Employer")'>
						<th>Action</th>
					</sec:authorize>
				</tr>

				<c:forEach items="${postedJobs}" var="jobs">
					<tr>
						<td>${jobs.id}</td>
						<td>${jobs.position}</td>
						<td>${jobs.companyName}</td>
						<td>${jobs.description}</td>
						<td>${jobs.employerUsername}</td>
						

						<sec:authorize access='hasAuthority("Employer")'>
							<td><a
								href="/springNaukriAssignmentr/candidateList?username=${username}&id=${jobs.id}&name=${jobs.companyName}">
								Candidates</a>
								<p/>
								<a
								href="/springNaukriAssignment/deleteJob?username=${username}&id=${jobs.id}">
								Delete</a>
							</td>

						</sec:authorize>
						
						
					</tr>
				</c:forEach>

			</table>


		</div>
	</div>


</body>
</html>