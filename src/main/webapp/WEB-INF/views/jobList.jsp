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
<title>all jobs available</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"></head>
<body>

	<div id="page">

		<div id="searchBar">

			<div>

				<div class="navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}">
						   <i class="fas fa-clipboard"></i> Post a new Job
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class="fas fa-clipboard"></i> Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}&id=${id}">
						<i class="fas fa-clipboard"></i>My postings</a>
					</sec:authorize>



					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			
			<table id="displayTable"
				style="margin-top: auto; margin-bottom: auto;">
				<tr class="headers">
					<th>Job Id</th>
					<th>position</th>
					<th>CompanyName</th>
					<th>Job Description</th>
					<th>EmployerUsername</th>
					
					<sec:authorize access='hasAuthority("candidate")'>
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
								href="/springNaukriAssignment/applyJob?username=${username}&id=${jobs.id}&companyName=${jobs.companyName}">Apply</a>
							</td>

						</sec:authorize>
						
						
					</tr>
				</c:forEach>

			</table>


		</div>
	</div>


</body>
</html>