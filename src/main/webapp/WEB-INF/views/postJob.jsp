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
<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">

</head>

<body>
<div class="postJob-wrapper">
		<div id="main-container">

			<div>
				<div class=" navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i class="fas fa-home"></i>
						Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${username}">
							<i class="fas fa-clipboard"></i> Post a new job
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${username}">
						<i class='fas fa-clipboard'></i> Jobs available
					</a>
					
					<sec:authorize access='hasAuthority("Employer")'>
						<a href="/springNaukriAssignment/postedJobs?username=${username}">
						<i class="fas fa-clipboard"></i>my postings</a>
					</sec:authorize>


					

					<form:form action="logout" method="POST" id="last-tag" >
						<input type="submit" value="logout">
					</form:form>

				</div>
			</div>

			<div>

<h2>			Welcome  ${username}!
</h2>
			

				
						<div class="form" id="form">

					
							<div class="page1">

								<h1 class="title">Post a Job</h1>

								<form:form action="process-jobposting" method="POST"
									modelAttribute="postedJobs">

									<form:input path="employerUsername" value="${username}"
										disabled="true" />
									<form:hidden path="employerUsername" value="${username}" />

									<form:input path="CompanyName" placeholder="Company Name"
										required="true" />
									<form:input path="position" placeholder="role in company"
										required="true" />
									<form:textarea path="Description" placeholder="Description"
										required="true" rows="6"/>
										<br/>
										<br/>

									<input type="submit" value="Post!">
								</form:form>

							</div>
						</div>
					</div>

				</div>
			

		</div>
</body>

</html>