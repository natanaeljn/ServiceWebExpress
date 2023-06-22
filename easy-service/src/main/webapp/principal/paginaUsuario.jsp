<%@page import="model.ModelPessoa"%>
<%@page import="model.ModelPrestador"%>
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
							<li class="nav-item"><a class="nav-link" href="#!"> <i
									class="fas fa-user me-1 text-gray fw-normal"></i>Pagina do
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
							<p class="text-muted small text-uppercase mb-2">Bem Vindo
								usuario</p>
							<h1 class="h2 text-uppercase mb-3">Edite e atualize seus
								dados</h1>
							<a class="btn btn-dark"
								href="<%=request.getContextPath()%>/ServletRegistro?acao=paginaHome">ServiceWebExpress</a>
						</div>
					</div>
				</div>
			</section>

			<form action="<%=request.getContextPath()%>/ServletUsuario"
				method="post" id="formUser">
				<input type="hidden" name="acao" id="acao" value=" ">
				<div class="row gy-3">
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="id"></label>
						<input class="form-control form-control-lg" type="hidden" id="id"
							name="id" value="${pessoalogada.id}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="codigo"></label>
						<input class="form-control form-control-lg" type="hidden"
							id="codigo" name="codigo" value="${pessoalogada.codigo}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="nome">Nome</label>
						<input maxlength="40" class="form-control form-control-lg"
							type="text" id="nome" name="nome" placeholder="Nome Completo"
							value="${pessoalogada.nome}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="cpf">CPF</label>
						<input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="11" class="form-control form-control-lg" type="number"
							id="cpf" name="cpf" placeholder="00000000000 sem os  pontos"
							value="${pessoalogada.cpf}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="cnpj">Cnpj</label>
						<input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="14" class="form-control form-control-lg" type="number"
							id="cnpj" name="cnpj" placeholder="nao obrigatorio"
							value="${pessoalogada.cnpj}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="cep">Cep</label>
						<input maxlength="9" onblur="pesquisaCep();"
							class="form-control form-control-lg" type="text" id="cep"
							name="cep" value="${pessoalogada.cep}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="logradouro">Logradouro
						</label> <input maxlength="40" class="form-control form-control-lg"
							type="text" id="logradouro" name="logradouro"
							placeholder="nao obrigatorio" value="${pessoalogada.logradouro}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="bairro">Bairro</label>
						<input maxlength="40" class="form-control form-control-lg"
							type="text" id="bairro" name="bairro"
							value="${pessoalogada.bairro}">
					</div>

					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="address">Municipio
						</label> <input maxlength="40" class="form-control form-control-lg"
							type="text" id="municipio" name="municipio"
							value="${pessoalogada.municipio}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="uf">Uf
						</label> <input maxlength="2" class="form-control form-control-lg"
							type="text" id="uf" name="uf" value="${pessoalogada.uf}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="numero">Numero</label>
						<input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="9" class="form-control form-control-lg" type="number"
							id="numero" name="numero" value="${pessoalogada.numero}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="complemento">Complemento</label>
						<input maxlength="40" class="form-control form-control-lg"
							type="text" id="complemento" name="complemento"
							value="${pessoalogada.complemento}">
					</div>

					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="ddd">DDD
							do numero</label> <input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="2" class="form-control form-control-lg" type="number"
							id="ddd" name="ddd" placeholder="47" value="${pessoalogada.dd}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="telefoneUm">Numero
							Principal</label> <input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="9" class="form-control form-control-lg" type="number"
							id="telefoneUm" name="telefoneUm"
							value="${pessoalogada.telefoneUm}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase"
							for="telefoneDois">Numero Secundario</label> <input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="9" class="form-control form-control-lg" type="number"
							id="telefoneDois" name="telefoneDois"
							value="${pessoalogada.telefoneDois}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="whatsapp">Contato
							para o whattsapp seria o telefone principal (digite 1) ou
							secundario(2)</label> <input
							oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
							maxlength="1" class="form-control form-control-lg" type="number"
							id="whatsapp" name="whatsapp" value="${pessoalogada.whatsapp}">
					</div>
					<div class="col-lg-12">
						<label class="form-label text-sm text-uppercase" for="url">Url</label>
						<input maxlength="100" class="form-control form-control-lg"
							type="text" id="url" name="url"
							placeholder="Linkedin ou redes sociais"
							value="${pessoalogada.url}">
					</div>
					<div class="col-lg-12">
						<label class="form-label text-sm text-uppercase" for="email">Email</label>
						<input maxlength="100" class="form-control form-control-lg"
							type="email" id="email" name="email"
							placeholder="exemplo@hotmail.com" value="${pessoalogada.email}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="senha">Senha</label>
						<input maxlength="20" class="form-control form-control-lg"
							type="password" id="senha" name="senha"
							value="${pessoalogada.senha}">
					</div>
					<div class="col-lg-6">
						<label class="form-label text-sm text-uppercase" for="tipo"></label>
						<input class="form-control form-control-lg" type="hidden"
							id="tipo" name="tipo" value="${pessoalogada.tipo}">
					</div>



					<div class="col-lg-12 form-group">
						<button class="btn btn-dark" type="submit">Salvar
							alteraçoes</button>
						<button type="button"
							class="btn btn-warning waves-effect waves-light"
							onclick="criarDelete();">Deletar Conta</button>
					</div>
				</div>
				<span>${msg}</span>

			</form>


			<form action="<%=request.getContextPath()%>/ServletPrestador"
				method="post" id="formPrestador">

				<div class="col-lg-6">
					<button class="btn btn-link text-dark p-0 shadow-0" type="button"
						data-bs-toggle="collapse" data-bs-target="#alternateAddress">
						<div class="form-check">
							<input class="form-check-input" id="alternateAddressCheckbox"
								type="checkbox"> <label class="form-check-label"
								for="alternateAddressCheckbox">Voçe presta algum
								Serviço?</label>
						</div>
					</button>
				</div>
				<div class="collapse" id="alternateAddress">
					<div class="row gy-3">
						<div class="col-12 mt-4"></div>

						<div class="col-lg-6">
							<label class="form-label text-sm text-uppercase" for="id">
							</label> <input readonly="readonly" class="form-control form-control-lg"
								type="hidden" id="id" name="id">
						</div>

						<div class="col-lg-6">
							<label class="form-label text-sm text-uppercase"
								for="codigoPessoa"> </label> <input
								class="form-control form-control-lg" type="hidden"
								id="codigoPessoa" name="codigoPessoa"
								value="${pessoalogada.codigo}">
						</div>




						<div class="form-group form-default form-static-label">
							<label class="float-label">Selecione o tipo de Serviço:</label> <select
								class="form-control" aria-label="Default select example"
								name="codigoItem">
								<option disabled="disabled">Selecione o Serviço</option>
								<option value="000100010001"
									<%ModelPrestador modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000100010001")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Alvenaria</option>
								<option value="000100010002"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000100010002")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Construção</option>
								<option value="000100010002"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000100010002")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Azulejista</option>
								<option value="000100010002"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000100010002")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Porcelanato
									Liquido</option>
								<option value="000200020001"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000200020001")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Manicure</option>
								<option value="000200020002"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000200020002")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Pedicure</option>
								<option value="000200020003"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000200020003")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Podologia</option>
								<option value="000200020004"
									<%modelPrestador = (ModelPrestador) request.getAttribute("modelPrestador");

if (modelPrestador != null && modelPrestador.getCodigoItem().equals("000200020004")) {
	out.print("  ");
	out.print("selected=\"selected\"");
	out.print("  ");

}%>>Nail
									Designer</option>


							</select>



							<div class="col-lg-12 form-group">
								<button class="btn btn-dark" type="submit">Salvar
									alteraçoes</button>
							</div>
							<span class="form-bar">${msg}</span>

						</div>






					</div>
				</div>
















			</form>


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
						<h6 class="text-uppercase mb-3">Company</h6>
						<ul class="list-unstyled mb-0">
							<li><a class="footer-link" href="#!">What We Do</a></li>
							<li><a class="footer-link" href="#!">Available Services</a></li>
							<li><a class="footer-link" href="#!">Latest Posts</a></li>
							<li><a class="footer-link" href="#!">FAQs</a></li>
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
					document.body
							.insertBefore(div, document.body.childNodes[0]);
				}
			}
			// this is set to BootstrapTemple website as you cannot 
			// inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
			// while using file:// protocol
			// pls don't forget to change to your domain :)
			injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

			function criarDelete() {
				if (confirm('Deseja realmente excluir este usuario?')) {
					document.getElementById("formUser").method = 'get';
					document.getElementById("acao").value = 'deletar';
					document.getElementById("formUser").submit();
				}
			}
		</script>
		<script type="text/javascript">
			function pesquisaCep() {
				var cep = $("#cep").val();
				$.getJSON("https://viacep.com.br/ws/" + cep
						+ "/json/?callback=?", function(dados) {
					if (!("erro" in dados)) {
						$("#cep").val(dados.cep);
						$("#logradouro").val(dados.logradouro);
						$("#bairro").val(dados.bairro);
						$("#municipio").val(dados.localidade);
						$("#uf").val(dados.uf);

					}

				});

			}
		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
			integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
			crossorigin="anonymous">
	</div>
</body>
</html>