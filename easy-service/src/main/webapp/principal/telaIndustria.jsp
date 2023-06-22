<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>ServiceWebExpress</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
								href="<%=request.getContextPath()%>/ServletRegistro?acao=paginaHome">Home</a>
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

		<div class="container">
			<!-- HERO SECTION-->
			<section class="py-5 bg-light">
				<div class="container">
					<div class="row px-4 px-lg-5 py-lg-4 align-items-center">
						<div class="col-lg-6">
							<h1 class="h2 text-uppercase mb-0">Todas as Categorias de
								Serviços presentes em nossa plataforma</h1>
						</div>
						<div class="col-lg-6 text-lg-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-lg-end mb-0 px-0 bg-light">
									<li class="breadcrumb-item"><a class="text-dark"
										href="<%=request.getContextPath()%>/ServletRegistro?acao=paginaHome">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Categorias</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</section>
			<section class="py-5">
				<div class="container p-0">
					<div class="row">
						<!-- SHOP SIDEBAR-->
						<div class="col-lg-3 order-2 order-lg-1">
							<h5 class="text-uppercase mb-4">Categorias</h5>
							<div class="py-2 px-4 bg-dark text-white mb-3">
								<strong class="small text-uppercase fw-bold">Construção
									Civil</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaAlvenaria">Alvenaria</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaConstrucao">Construção</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaAzulejista">Azulejista</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaPorcelanato">Porcelanato
										Liquido</a></li>

							</ul>
							<div class="py-2 px-4 bg-light mb-3">
								<strong class="small text-uppercase fw-bold">Saude e
									Estetica</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaManicure">Manicure</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaPedicure">Pedicure</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaPodologia">Podologia</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaNailDesigner">Nail
										Designer</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaQuiropraxia">Quiropraxia</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaCabeleleiro">Cabeleleiro</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaMassagem">Massagem</a></li>
							</ul>
							<div class="py-2 px-4 bg-light mb-3">
								<strong class="small text-uppercase fw-bold">Pets</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal mb-5">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaBanho">Banho
										e Tosa </a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaWalker">Dog
										Walker</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaVeterinaria">Medicina
										Veterinaria</a></li>
							</ul>
							<div class="py-2 px-4 bg-light mb-3">
								<strong class="small text-uppercase fw-bold">Veiculos</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal mb-5">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaMecanica">Mecanica
								</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaEletrica">Auto
										Eletrica</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaBorracharia">Borracharia</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaLavacao">Lavaçao</a></li>
							</ul>
							<div class="py-2 px-4 bg-light mb-3">
								<strong class="small text-uppercase fw-bold">Programação</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal mb-5">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaFront">Front-End
								</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaBack">Back-End</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaFull">Full-Stack</a></li>

							</ul>
							<div class="py-2 px-4 bg-light mb-3">
								<strong class="small text-uppercase fw-bold">Industria</strong>
							</div>
							<ul
								class="list-unstyled small text-muted ps-lg-4 font-weight-normal mb-5">
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaMetalurgica">Metalurgia</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaCeramica">Ceramica</a></li>
								<li class="mb-2"><a class="reset-anchor"
									href="<%=request.getContextPath()%>/ServletListagem?acao=paginaArtesanal">Artesanal</a></li>

							</ul>
							<h6 class=></h6>
							<div class=>
								<div id="range"></div>
								<div class="row pt-2">
									<div class="col-6">
										<strong class="small fw-bold text-uppercase"></strong>
									</div>
									<div class="col-6 text-end">
										<strong class="small fw-bold text-uppercase"></strong>
									</div>
								</div>
							</div>
							<h6 class="text-uppercase mb-3"></h6>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-4"></div>
							<h6 class="text-uppercase mb-3"></h6>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
							<div class="form-check mb-1"></div>
						</div>
						<!-- SHOP LISTING-->
						<div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
							<div class="row mb-3 align-items-center">
								<div class="col-lg-6 mb-2 mb-lg-0">
									<p class="text-sm text-muted mb-0"></p>
								</div>
								<div class="col-lg-6">
									<ul
										class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
										<li class="list-inline-item text-muted me-3"><a
											class="reset-anchor p-0" href="#!"><i
												class="fas fa-th-large"></i></a></li>
										<li class="list-inline-item text-muted me-3"><a
											class="reset-anchor p-0" href="#!"><i class="fas fa-th"></i></a></li>
										<li class="list-inline-item"></li>
									</ul>
								</div>
							</div>
							<div class="row">
								<!-- PRODUCT-->
								<div class="col-lg-4 col-sm-6">
									<div class="product text-center">
										<div class="mb-3 position-relative">
											<div class="badge text-white bg-"></div>
											<a class="d-block"
												href="<%=request.getContextPath()%>/ServletListagem?acao=paginaMetalurgica"><img
												class="img-fluid w-100" src="images/meta.jpg" alt="..."></a>
											<div class="product-overlay"></div>
										</div>
										<h6>
											<a class="reset-anchor" href="detail.html">Metalurgica</a>
										</h6>
									</div>
								</div>
								<!-- PRODUCT-->
								<div class="col-lg-4 col-sm-6">
									<div class="product text-center">
										<div class="mb-3 position-relative">
											<div class="badge text-white bg-"></div>
											<a class="d-block"
												href="<%=request.getContextPath()%>/ServletListagem?acao=paginaCeramica"><img
												class="img-fluid w-100" src="images/cera.jpg" alt="..."></a>
											<div class="product-overlay"></div>
										</div>
										<h6>
											<a class="reset-anchor" href="detail.html">Ceramica</a>
										</h6>
									</div>
								</div>
								<!-- PRODUCT-->
								<div class="col-lg-4 col-sm-6">
									<div class="product text-center">
										<div class="mb-3 position-relative">
											<div class="badge text-white bg-"></div>
											<a class="d-block"
												href="<%=request.getContextPath()%>/ServletListagem?acao=paginaArtesanal"><img
												class="img-fluid w-100" src="images/artesanal.jpg" alt="..."></a>
											<div class="product-overlay"></div>
										</div>
										<h6>
											<a class="reset-anchor" href="detail.html">Artesanal</a>
										</h6>
									</div>
								</div>




								<!-- PAGINATION
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center justify-content-lg-end">
                    <li class="page-item mx-1"><a class="page-link" href="#!" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                    <li class="page-item mx-1 active"><a class="page-link" href="#!">1</a></li>
                    <li class="page-item mx-1"><a class="page-link" href="#!">2</a></li>
                    <li class="page-item mx-1"><a class="page-link" href="#!">3</a></li>
                    <li class="page-item ms-1"><a class="page-link" href="#!" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                  </ul>
                </nav>
                -->
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
							<li><a class="footer-link" href="#!"></a></li>
						</ul>
					</div>
				</div>
				<div class="border-top pt-4"
					style="border-color: #1d1d1d !important">
					<div class="row">
						<div class="col-md-6 text-center text-md-start">
							<p class="small text-muted mb-0">&copy; Desde 2023 mudando
								vidas</p>
						</div>
						<div class="col-md-6 text-center text-md-end">
							<p class="small text-muted mb-0">
								ServiceWebExpress<a class="text-white reset-anchor"
									href="https://bootstrapious.com/p/boutique-bootstrap-e-commerce-template"></a>
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
		<!-- Nouislider Config
      <script>
      
        var range = document.getElementById('range');
        noUiSlider.create(range, {
            range: {
                'min': 0,
                'max': 2000
            },
            step: 5,
            start: [100, 1000],
            margin: 300,
            connect: true,
            direction: 'ltr',
            orientation: 'horizontal',
            behaviour: 'tap-drag',
            tooltips: true,
            format: {
              to: function ( value ) {
                return '$' + value;
              },
              from: function ( value ) {
                return value.replace('', '');
              }
            }
        });
        
      </script>
      -->
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
					document.body
							.insertBefore(div, document.body.childNodes[0]);
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