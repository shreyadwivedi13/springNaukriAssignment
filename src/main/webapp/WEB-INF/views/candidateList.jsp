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
<title>Candidate List</title>
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
							<i class="fas fa-sticky-note"></i> Post a new Job
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/joblist?username=${username}">
						<i class='fas fa-list'></i> Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-check-square"></i> jobs posted by mee</a>
					</sec:authorize>
					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>
				
				<h2>Applications for ${companyName}</h2>
			
			<table id="displayTable" style="margin-top: auto; margin-bottom: auto;">
					<tr>
					 <th>CandidateId</th> 
					 <th>CandidateUsername</th>
						<th>Job Id</th>
					
					</tr>

					<c:forEach items="${values}" var="jobs">
						<tr>
							<td>${jobs.id}</td>
							<td>${jobs.candidateUsername}</td>
							<td>${jobs.jobid}</td>

		

							
						</tr>
					</c:forEach>

				</table>


		</div>
	</div>
</body>
</html>