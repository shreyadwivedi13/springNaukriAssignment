<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>helooo</title>
</head>

<link href="<c:url value="./static/styles.css" />" rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css">
</head>
<body>
	<div id="userInfo-wrapper">
		<!-- box div at the center of page with glassify effect -->
		<div id="main-container">
			

				<!-- div contaning navbar to navigate across the dashboard -->
				<div class="navbar" id="navbar">

					<a href="/springNaukriAssignment/welcome"> <i
						class="fas fa-home"></i> Home
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postJob?username=${portalUser.username}">
							<i class="fas fa-clipboard"></i> Post Jobs
						</a>
					</sec:authorize>

					<a
						href="/springNaukriAssignment/jobList?username=${portalUser.username}">
						<i class='fas fa-clipboard'></i> All Jobs
					</a>

					<sec:authorize access='hasAuthority("Employer")'>
						<a
							href="/springNaukriAssignment/postedJobs?username=${portalUser.username}&id=${portalUser.id}">
							<i class="fas fa-clipboard"></i>My postings
						</a>
					</sec:authorize>
				
					
					<!-- logouts the users by destroying current user instance in local storage and redirectiong to index.html -->

					<form:form action="logout" method="POST" id="last-tag" >
						<input type="submit" value="logout">
					</form:form>

				</div>
			

			<!-- dashboard contents -->
			<div id="dashboard-welcome">


				welcome ${portalUser.name} <br />
			

				Name : ${portalUser.name}<br /> Email : ${portalUser.email}<br />
				Username : ${portalUser.username}<br /> Role : ${portalUser.role}<br />

			</div>
		</div>

	</div>
</body>

</html>