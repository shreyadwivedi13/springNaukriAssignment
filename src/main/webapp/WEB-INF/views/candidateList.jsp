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
						<i class='fas fa-clipboard'></i> Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-clipboard"></i>My Postings</a>
					</sec:authorize>
					<form:form action="logout" method="POST" id="last-tag" <i class="fa-solid fa-power-off"></i>>
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>
				
				<h2>Applications for ${companyName}</h2>
			
			<table id="displayTable" style="margin-top: auto; margin-bottom: auto;">
					<tr>
						<th>Job Id</th>
					 <th>Candidate id</th> 
					 <th>Candidate Username</th>
						
					
					</tr>

					<c:forEach items="${values}" var="jobs">
						<tr>
							<td>${jobs.jobid}</td>
							<td>${jobs.id}</td>
							<td>${jobs.candidateUsername}</td>
							

		

							
						</tr>
					</c:forEach>

				</table>


		</div>
	</div>
</body>
</html>