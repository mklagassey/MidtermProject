<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="css/home.css" rel="stylesheet" id="bootstrap-css">

<title>BuckIt, The #1 Bucket-List</title>
</head>
<body class="homebg">
<!-- NavBar Start -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
		<a class="navbar-brand" href="home.do">BuckIt List</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
						href="navi.do?userSelect=explore">Explore</a></li>
				<li class="nav-item">
					<div class="dropdown">
						<c:if test='${not empty loggedInUser}'>
							<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> My Bucket </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="navi.do?userSelect=userBucket">My
									Bucket List</a>
								<a class="dropdown-item" href="newbucketitem.do"> Add New
									Bucket List Item </a>
							</div>
						</c:if>
					</div>
				</li>
			</ul>
			<c:if test='${not empty loggedInUser}'>
				<div class=justify-content: flex-end>
					<div class="dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">
							<img src="${sessionScope.loggedInUser.imageUrl}"
								alt="Profile Picture" class="avatar" class="nav-item dropdown">
						</a>

						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdown">
							<c:if test='${loggedInUser.role == "admin"}'>
								<a class="dropdown-item" href="adminHome.do">Admin Home</a>
							</c:if>
							<a class="dropdown-item" href="navi.do?userSelect=settings">Settings</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="logout.do">Log out</a>
						</div>
					</div>
				</div>
			</c:if>
		</div>

	</nav>
<!-- NavBar End -->
	
	<div id="content">
		<div class="heading d-flex justify-content-center ">
			<h1>Make Every Day a BuckIt Day</h1>
		</div>
		<!-- <p>${DEBUG}</p> -->
		<div class="container sign-in-card">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3>Sign In</h3>

						<c:if
							test='${loginResult == "No user found with the supplied username and password"}'>
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								No account was found with the provided Username and Password.
								Please try again.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>
						<c:if
							test='${loginResult == "User is not currently active"}'>
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								This account is currently locked.
								Please contact support.
								<button type="button" class="close" data-dismiss="alert"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
						</c:if>

					</div>
					<div class="card-body">
						<form action="login.do" method="POST">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input name="username" type="text" class="form-control"
									placeholder="username">

							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input name="password" type="password" class="form-control"
									placeholder="password">
							</div>
							<!-- <div class="row align-items-center remember">
								<input type="checkbox">
								Remember Me
								This doesn't actually do anything
							</div> -->
							<div class="form-group">
								<input type="submit" value="Login"
									class="btn float-right login_btn">
							</div>
						</form>
					</div>
					<div class="card-footer">
						<div class="d-flex justify-content-center links">
							Don't have an account?
							<a href="register.do">Sign Up</a>
						</div>
						<!-- <div class="d-flex justify-content-center">
								<a href="#">Forgot your password?</a>
							</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>