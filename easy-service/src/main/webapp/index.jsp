<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">


<title>ServiceWebExpress</title>
<style type="text/css">
#formUser {
	position: fixed;
	top: -40%;
	left: 33%;
	right: 33%;
}

button {
	width: 600px;
}

form {
	position: absolute;
	top: 30%;
	left: 33%;
	right: 33%;
}

h5 {
	position: absolute;
	top: 10%;
	left: 42%;
}

h3 {
	position: absolute;
	top: 55%;
	left: 33%;
	font-size: 15px;
	color: #41464b;
	background-color: #e2e3e5;
	border: #d3d6d8;
}

img {
	width: 300px;
	position: relative;
	top: -90px;
	right: 1%;
}
</style>

</head>
<body>
	<div class="page-holder">
		<!-- navbar-->
		<header class="header bg-white">
			<div class="container px-lg-3">
				<nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0">
					<a class="navbar-brand" href="index.jsp"><span
						class="fw-bold text-uppercase text-dark">Bem Vindo ao
							ServiceWebExpress</span></a>
					<button class="navbar-toggler navbar-toggler-end" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto">
							<li class="nav-item"></li>



						</ul>
						<ul class="navbar-nav ms-auto">


							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/ServletLogin?acao=registrar">
									<i class="fas fa-user me-1 text-gray fw-normal"></i>Faça seu
									Cadastro
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header>





		<div class="text-center">
			<img src="<%=request.getContextPath()%>/images/logoInicial.jpg"
				class="img" alt="...">
		</div>

		<form action="<%=request.getContextPath()%>/ServletLogin"
			method="post" id="formPessoa" name="formPessoa"
			class="row g-3 needs-validation" novalidate>
			<input type="hidden" value="<%=request.getParameter("url")%>"
				name="url">


			<div class="col-mb-3">
				<label class="form-label">Login:</label> <input class="form-control"
					name="Login" type="text" required="required">
				<div class="invalid-feedback">Campo Obrigatório</div>
			</div>

			<div class="col-mb-3">
				<label class="form-label">Senha:</label> <input class="form-control"
					name="senha" type="password" required="required">
				<div class="invalid-feedback">Campo Obrigatório</div>
			</div>


			<input type="submit" value="Acessar" class="btn btn-primary">
			<!--  
			<input type="submit" value="Registrar" class="btn btn-dark" onclick="registro()">
			<button type="button" class="btn btn-dark" onclick="registro();">Dark</button>
			-->








		</form>

		<div>
			<form class="form-material" enctype="multipart/form-data"
				action="<%=request.getContextPath()%>/ServletLogin" method="get"
				id="formUser">
				<input type="hidden" name="acao" id="registrar" value="registrar">



				<div class="form-group form-default form-static-label">
					<button id="botaoRegistro" class="btn btn-dark"
						<a href="<%=request.getContextPath()%>/ServletLogin?acao=registrar"></a>>Registro</button>
				</div>

			</form>
		</div>


		<h3>${msg}</h3>



		<section class="py-5">
			<div class="container p-0">
				<div class="row gy-3">
					<div class="col-lg-6"></div>
					<div class="col-lg-6">
						<form action="#">
							<div class="input-group"></div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer class="bg-dark text-white">
		<div class="container py-4">
			<div class="row py-5">
				<div class="col-md-4 mb-3 mb-md-0">
					<h6 class="text-uppercase mb-3">Colaboradores</h6>
					<ul class="list-unstyled mb-0">
						<li><a class="footer-link" href="#!">Ana Caroline</a></li>
						<li><a class="footer-link" href="#!">Clarice Barros</a></li>
						<li><a class="footer-link" href="#!">Dario Junior</a></li>
						<li><a class="footer-link" href="#!">Vitor</a></li>
						<li><a class="footer-link" href="#!">Natanael</a></li>
					</ul>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<h6 class="text-uppercase mb-3"></h6>
					<ul class="list-unstyled mb-0">
						<li><a class="footer-link" href="#!"></a></li>
						<li><a class="footer-link" href="#!"></a></li>
						<li><a class="footer-link" href="#!"></a></li>
						<li><a class="footer-link" href="#!"></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h6 class="text-uppercase mb-3">Social Media</h6>
					<ul class="list-unstyled mb-0">
						<li><a class="footer-link" href="#!">Twitter</a></li>
						<li><a class="footer-link" href="#!">Instagram</a></li>
						<li><a class="footer-link" href="#!">Tumblr</a></li>

					</ul>
				</div>
			</div>
			<div class="border-top pt-4" style="border-color: #1d1d1d !important">
				<div class="row">
					<div class="col-md-6 text-center text-md-start">
						<p class="small text-muted mb-0">&copy; Desde 2023 mudando
							vidas</p>
					</div>
					<div class="col-md-6 text-center text-md-end">
						<p class="small text-muted mb-0">
							ServiceWebExpress <a class="text-white reset-anchor"
								href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template"></a>
						</p>
						<!-- If you want to remove the backlink, please purchase the Attribution-Free License. See details in readme.txt or license.txt. Thanks!-->
					</div>
				</div>
			</div>
		</div>
	</footer>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>



	<script type="text/javascript">
		function registro() {
			if (document.getElementById("url").value = 'null') {
				document.getElementById("formPessoa").method = 'post';
				document.getElementById("url").value = 'registrar';
			}
		}
	</script>

</body>
</html>