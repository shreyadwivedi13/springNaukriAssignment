<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Job</title>
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
</head>
<body>

	<div id="page">
		<div id="update-container">

			<div>
				<div class=" navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}">
							<i class="fas fa-clipboard"></i> Post Jobs
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-clipboard'></i> all jobs
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-clipboard"></i> My postings</a>
					</sec:authorize>



					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			<div>

			Welcome
			

				<div id="dets">
					<div class="box2">
						<div class="form" id="form">

							<div class="page1">

								<h1 class="title">Post a Job</h1>

								<form:form action="processPostUpdate/?username=${username}" method="POST"
									modelAttribute="postedJobs">

									<form:hidden path="employerUsername" value="${username}"/>
									<form:hidden path="id" value="${jobid}" />

									<form:input path="CompanyName" placeholder="Company Name"
										default = "${companyName}" required="true" />
									<form:input path="role" placeholder="role"
										default = "${role}" required="true" />
									<form:textarea path="Description" placeholder="Description"
										default = "${description}" required="true" />
									<p />
									<p />

									<input type="submit" value="Post Job">
								</form:form>

							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		</div>
</body>
</html>