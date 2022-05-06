<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Job List</title>
<link href="<c:url value="./template/css/style.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
</head>
<body>

	<!-- main div covers entire page -->
	<div id="main">

		<!-- box div at the center of page with glassify effect -->
		<div id="searchUser-container">

			<div>

				<!-- div contaning navbar to navigate across the dashboard -->
				<div class="navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}&email=${email}">
							<i class="fas fa-sticky-note"></i> Post Jobs
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}&email=${email}">
						<i class='fas fa-list'></i> All Jobs
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}&email=${email}&id=${id}">
						<i class="fas fa-check-square"></i> My Jobs</a>
					</sec:authorize>


					<!-- logouts the users by destroying current user instance in local storage and redirectiong to index.html -->

					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			
			<table id="displayTable"
				style="margin-top: auto; margin-bottom: auto;">
				<tr class="header">
					<th>Job Id</th>
					<th>position</th>
					<th>CompanyName</th>
					<th>Job Description</th>
					<th>EmployerUsername</th>
					
					<sec:authorize access='hasAuthority("Job Seeker")'>
						<th>Action</th>
					</sec:authorize>
				</tr>

				<c:forEach items="${listJobs}" var="jobs">
					<tr>
						<td>${jobs.id}</td>
						<td>${jobs.position}</td>
						<td>${jobs.companyName}</td>
						<td>${jobs.description}</td>
						<td>${jobs.employerUsername}</td>
						

						<sec:authorize access='hasAuthority("candidate")'>
							<td><a
								href="/springNaukriAssignment/applyJob?username=${username}&id=${jobs.id}&jobName=${jobs.position}">Apply</a>
							</td>

						</sec:authorize>
						
						
					</tr>
				</c:forEach>

			</table>


		</div>
	</div>


</body>
</html>