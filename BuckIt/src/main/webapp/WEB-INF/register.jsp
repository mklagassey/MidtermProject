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
<link rel="stylesheet" href="css/utility.css">

<link href="css/home.css" rel="stylesheet" id="bootstrap-css">


<title>Registration form</title>
</head>

<body>
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

	<div class="container" id="register-content">
		<h1>Please complete registration information below:</h1>
		<c:if test='${usernameTaken == "true"}'>
			<div class="alert alert-danger alert-dismissible fade show"
				role="alert">
				Please Try Again. That username already exists!
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</c:if>
		<form class="needs-validation" action="registrationinfo.do"
			method="POST" novalidate>
			<input type="hidden" name="role" value="user">
			<input hidden="true" type="text" name="imageUrl" id="imageResultURL"
				value="#"></input>



			<!-- First row -->
			<div class="form-row">




				<div class="col-md-4 mb-3">
					<label for="validationCustom01">First name</label>
					<input type="text" class="form-control" id="validationCustom01"
						name="firstName" placeholder="First name" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
				<div class="col-md-4 mb-3">
					<label for="validationCustom02">Last name</label>
					<input type="text" class="form-control" id="validationCustom02"
						name="lastName" placeholder="Last name" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
			</div>

			<!-- The left column where the photo upload buttons go -->
			<div class="column">

				<!-- Upload image input-->
				<div
					class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm">
					<input id="upload" type="file" onchange="readURL(this);"
						class="form-control border-0">
					<label id="upload-label" for="upload"
						class="font-weight-light text-muted">Upload your photo</label>
					<div class="input-group-append">
						<label for="upload" class="btn btn-light m-0 rounded-pill px-4">
							<i class="fa fa-cloud-upload mr-2 text-muted"></i><small
							class="text-uppercase font-weight-bold text-muted">Choose
								file</small>
						</label>
					</div>
				</div>

				<!-- Uploaded image area-->
				<p class="font-italic text-black text-center">Your image will
					appear here.</p>
				<div class="image-area mt-4">
					<img id="imageResult" src="#" alt=""
						class="img-fluid rounded shadow-sm mx-auto d-block">
					<!-- 						<input hidden type="text" name="imageURL" value="#"></input>
 -->
				</div>
			</div>

			<!-- Second row -->
			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="validationCustom03">Email</label>
					<input type="email" class="form-control" id="validationCustom03"
						name="email" placeholder="bob@giraffe.com" required>
					<div class="invalid-feedback">Please provide a valid email
						address.</div>
				</div>
			</div>

			<!-- Third row -->

			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustomUsername">Username</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupPrepend">@</span>
						</div>
						<input type="text" minlength="3" class="form-control"
							id="validationCustomUsername" name="username"
							placeholder="minimum 3 characters"
							aria-describedby="inputGroupPrepend" required>
						<div class="invalid-feedback">Please choose a username.</div>
					</div>
				</div>
				<div class="col-md-3 mb-3">
					<label for="validationCustom05">Password</label>
					<input type="password" class="form-control" id="validationCustom05"
						name="password" placeholder="password" required>
					<div class="invalid-feedback">Password must be least 7
						characters with 1 uppercase and 1 special character (!@#$%^&*).</div>
				</div>
			</div>

			<!-- Legalese and submit -->
			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						name="legal" id="invalidCheck" required>
					<label class="form-check-label" for="invalidCheck"> Agree
						to terms and conditions </label>
					<div class="invalid-feedback">You must agree before
						submitting.</div>
				</div>
			</div>

			<button class="btn btn-primary" type="submit">Submit form</button>
		</form>

	</div>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>

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
	<script src="javascript/picpicker.js"></script>

</body>
</html>