<%@page import="model.ModelPessoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ServiceWebExpress</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- gLightbox gallery-->
<link rel="stylesheet" href="vendor/glightbox/css/glightbox.min.css">
<!-- Range slider-->
<link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
<!-- Choices CSS-->
<link rel="stylesheet"
	href="vendor/choices.js/public/assets/styles/choices.min.css">
<!-- Swiper slider-->
<link rel="stylesheet" href="vendor/swiper/swiper-bundle.min.css">
<!-- Google fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
<!-- theme stylesheet-->
<link rel="stylesheet" href="css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="images/logoInicial.jpg">
</head>
<body>
	<div class="page-holder">
		<!-- navbar-->
		<header class="header bg-white">
			<div class="container px-lg-3">
				<nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0">
					<a class="navbar-brand"
						href="<%=request.getContextPath()%>/ServletRegistro?acao=paginaHome"><span
						class="fw-bold text-uppercase text-dark">ServiceWebExpress</span></a>
					<button class="navbar-toggler navbar-toggler-end" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto">
							<li class="nav-item">
								<!-- Link-->
								<a class="nav-link active"
								href="<%=request.getContextPath()%>/ServletListagem?acao=paginaHome">Home</a>
							</li>



							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="pagesDropdown" href="#"
								data-bs-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Categorias</a>
								<div class="dropdown-menu mt-3 shadow-sm"
									aria-labelledby="pagesDropdown">
									<a class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catConstrucao">Construção
										Civil</a><a class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catSaude">Saude
										e estetica</a><a class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catPets">Pets</a><a
										class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catVeiculos">Veiculos</a>
									<a class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catProgramacao">Programação</a>
									<a class="dropdown-item border-0 transition-link"
										href="<%=request.getContextPath()%>/ServletListagem?acao=catInd">Industria</a>
								</div></li>
						</ul>
						<ul class="navbar-nav ms-auto">

							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/ServletLogin?acao=logout">
									<i class="fas fa-user me-1 text-gray fw-normal"></i>Logout
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/ServletUsuario?acao=paginaUsuario">
									<i class="fas fa-user me-1 text-gray fw-normal"></i>Pagina do
									Usuario
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</header>

		<!-- HERO SECTION-->
		<div class="container">
			<section
				class="hero pb-3 bg-cover bg-center d-flex align-items-center"
				style="background: url(img/bannercerto.png)">
				<div class="container py-5">
					<div class="row px-4 px-lg-5">
						<div class="col-lg-6">
							<p class="text-muted small text-uppercase mb-2"></p>
							<h1 class="h2 text-uppercase mb-3">Lista de Prestadores</h1>
							<a class="btn btn-dark"
								href="<%=request.getContextPath()%>/ServletRegistro?acao=paginaHome">ServiceWebExpress</a>
						</div>
					</div>
				</div>
			</section>

			<div class="col-lg-6">
				<label class="form-label text-sm text-uppercase" for="ddd"></label>
				<input disabled="disabled" maxlength="2"
					class="form-control form-control-lg" type="hidden" id="ddd"
					name="ddd" value=<%=request.getAttribute("item")%>>
			</div>



			<div style="height: 300px; overflow: scroll;">
				<table class="table" id="tabelaresultadosview">
					<thead>
						<tr>
							<th scope="col">Codigo</th>
							<th scope="col">Nome</th>
							<th scope="col">CPF</th>
							<th scope="col">Municipio</th>
							<th scope="col">Codigo Do item</th>
							<th scope="col">Ver</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items='${modelPessoa}' var='ml'>
							<tr>
								<td><c:out value="${ml.id}"></c:out></td>
								<td><c:out value="${ml.nome}"></c:out></td>
								<td><c:out value="${ml.cpf}"></c:out></td>
								<td><c:out value="${ml.municipio}"></c:out></td>
								<td><c:out value='<%=request.getAttribute("item")%>'></c:out>
								</td>
								<td><a class="btn btn-outline-secondary"
									href="<%= request.getContextPath() %>/ServletListagem?acao=buscarEditar&id=${ml.id}&itemCerto='<%= request.getAttribute("item")%>'">Ver</a>
								</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>


				<!-- SERVICES-->
				<section class="py-5 bg-light">
					<div class="container">
						<div class="row text-center gy-3">
							<div class="col-lg-4">
								<div class="d-inline-block">
									<div class="d-flex align-items-end">
										<svg class="theme-line-35">
                      <use xlink:href="#dollar-badge-1"></use></svg>
										</svg>
										<div class="text-start ms-3">
											<h6 class="text-uppercase mb-1">Anuncio Gratuito</h6>
											<p class="text-sm mb-0 text-muted">Faça seu resgistro de
												graça sem custos</p>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="d-inline-block">
									<div class="d-flex align-items-end">


										<div class="text-start ms-3">
											<h6 class="text-uppercase mb-1"></h6>
											<p class="text-sm mb-0 text-muted"></p>

										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4">
								<div class="d-inline-block">
									<div class="d-flex align-items-end">
										<svg class="theme-line-2">
                      <use xlink:href="#chats-1"></use></svg>
										</svg>
										<div class="text-start ms-3">
											<h6 class="text-uppercase mb-1">Entre em contato com o
												suporte</h6>
											<p class="text-sm mb-0 text-muted">(047) 988984373</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- NEWSLETTER-->
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
							<h6 class="text-uppercase mb-3">Social media</h6>
							<ul class="list-unstyled mb-0">
								<li><a class="footer-link" href="#!">Twitter</a></li>
								<li><a class="footer-link" href="#!">Instagram</a></li>
								<li><a class="footer-link" href="#!">Tumblr</a></li>

							</ul>
						</div>
					</div>
					<div class="border-top pt-4"
						style="border-color: #1d1d1d !important">
						<div class="row">
							<div class="col-md-6 text-center text-md-start">
								<p class="small text-muted mb-0">&copy; Desde 2023 mudando
									Vidas</p>
							</div>
							<div class="col-md-6 text-center text-md-end">
								<p class="small text-muted mb-0">
									ServiceWebExpress <a class="text-white reset-anchor"
										href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template">Bootstrapious</a>
								</p>
								<!-- If you want to remove the backlink, please purchase the Attribution-Free License. See details in readme.txt or license.txt. Thanks!-->
							</div>
						</div>
					</div>
				</div>
			</footer>
			<!-- JavaScript files-->
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="vendor/glightbox/js/glightbox.min.js"></script>
			<script src="vendor/nouislider/nouislider.min.js"></script>
			<script src="vendor/swiper/swiper-bundle.min.js"></script>
			<script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
			<script src="js/front.js"></script>
			<script>
				// ------------------------------------------------------- //
				//   Inject SVG Sprite - 
				//   see more here 
				//   https://css-tricks.com/ajaxing-svg-sprite/
				// ------------------------------------------------------ //
				function injectSvgSprite(path) {

					var ajax = new XMLHttpRequest();
					ajax.open("GET", path, true);
					ajax.send();
					ajax.onload = function(e) {
						var div = document.createElement("div");
						div.className = 'd-none';
						div.innerHTML = ajax.responseText;
						document.body.insertBefore(div,
								document.body.childNodes[0]);
					}
				}
				// this is set to BootstrapTemple website as you cannot 
				// inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
				// while using file:// protocol
				// pls don't forget to change to your domain :)
				injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');
			</script>
			<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
			<link rel="stylesheet"
				href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
				integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
				crossorigin="anonymous">
		</div>
</body>
</html>