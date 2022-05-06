<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>employer panel, job </title>
<link href="<c:url value=" ./template/css/style.css" />"
	rel="stylesheet">

</head>

<body>
	<div id="main">
		<div id="update-container">

			<div>
				<div class=" navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}">
							<i class="fas fa-sticky-note"></i> Post a new job
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-list'></i> Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-check-square"></i>jobs posted by me</a>
					</sec:authorize>


					

					<form:form action="logout" method="POST" id="last-tag">
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			<div>

			Welcome employer ${username}!
			

				<div id="form-content">
					<div class="flip-container">
						<div class="flipper" id="flipper">

					
							<div class="front">

								<h1 class="title">Post a Job</h1>

								<form:form action="process-postjob" method="POST"
									modelAttribute="postedJobs">

									<form:input path="employerUsername" value="${username}"
										disabled="true" />
									<form:hidden path="employerUsername" value="${username}" />

									<form:input path="CompanyName" placeholder="Company Name"
										required="true" />
									<form:input path="position" placeholder="role in company"
										required="true" />
									<form:textarea path="Description" placeholder="Description"
										required="true" />
										<br/>
										<br/>

									<input type="submit" value="Post!">
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