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
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
</head>
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
							<i class="fas fa-clipboard"></i> Post a new Jobs
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-clipboard'></i>  Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="square"></i> my postings</a>
					</sec:authorize>



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
								href="/springNaukriAssignment/candidateList?username=${username}&id=${jobs.id}">
								<i class="fas fa-clipboard"></i>
								Candidates</a>
								<p/>
								<a 
								href="/springNaukriAssignment/deleteJob?username=${username}&id=${jobs.id}">
								<i class="fas fa-trash"></i>
								Delete</a>
								<a 
								href="/springNaukriAssignment/updateJobPosting?username=${username}&id=${jobs.id}">
								<i class="fas fa-clipboard"></i>
								Update</a>
							</td>

						</sec:authorize>
						
						
					</tr>
				</c:forEach>

			</table>


		</div>
	</div>


</body>
</html>