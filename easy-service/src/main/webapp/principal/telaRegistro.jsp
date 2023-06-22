<%@page import="model.ModelPessoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>

<title>Tela de Registro</title>
<style type="text/css">
form {
	position: absolute;
	top: 30%;
	left: 33%;
	right: 33%;
}

h5 {
	position: absolute;
	top: 25%;
	left: 40%;
}

h3 {
	position: absolute;
	top: 70%;
	left: 33%;
	font-size: 15px;
	color: #41464b;
	background-color: #e2e3e5;
	border: #d3d6d8;
}

img {
	width: 200px;
	position: relative;
	top: -40px;
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
					<a class="navbar-brand"
						href="<%=request.getContextPath()%>/ServletRegistro?acao=voltar"><span
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

		<h5>Entre com seus dados para Registro</h5>

		<form class="form-material" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/ServletRegistro" method="post"
			id="formUser">
			<input type="hidden" name="acao" id="acao" value=" ">

			<div class="form-group form-default form-static-label">
				<input type="text" name="id" id="id" class="form-control"
					readonly="readonly" value="${modelPessoa.id }" placeholder="ID">
				<span class="form-bar"></span>
			</div>



			<div class="form-group form-default form-static-label ">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="6" type="text" name="codigo" id="codigo"
					class="form-control" value="${modelPessoa.codigo }"
					placeholder="codigo de seis numeros"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label ">
				<input maxlength="40" type="text" name="nome" id="nome"
					class="form-control" required="required"
					value="${modelPessoa.nome }" placeholder="Nome"> <span
					class="form-bar"></span>
			</div>


			<div class="form-group form-default form-static-label">
				<input type="radio" name="tipo" checked="checked" value="J"
					<%ModelPessoa modelPessoa = (ModelPessoa) request.getAttribute("modelPessoa");

if (modelPessoa != null && modelPessoa.getTipo().equals("J")) {
	out.print("  ");
	out.print("checked=\"checked\"");
	out.print("  ");

}%>>Juridica</>
				<input type="radio" name="tipo" value="F"
					<%modelPessoa = (ModelPessoa) request.getAttribute("modelPessoa");

if (modelPessoa != null && modelPessoa.getTipo().equals("F")) {
	out.print("  ");
	out.print("checked=\"checked\"");
	out.print("  ");

}%>>Fisica</>
			</div>



			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="11" type="number" name="cpf" id="cpf"
					class="form-control" required="required" autocomplete="off"
					value="${modelPessoa.cpf }" placeholder="Cpf sem a pontuaçao">
				<span class="form-bar"></span>
			</div>
			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="14" type="number" name="cnpj" id="cnpj"
					class="form-control" autocomplete="off"
					value="${modelPessoa.cnpj }" placeholder="Cnpj"> <span
					class="form-bar"></span>
			</div>





			<div class="form-group form-default form-static-label">
				<input maxlength="9" onblur="pesquisaCep();" type="text" name="cep"
					id="cep" class="form-control" required="required"
					value="${modelPessoa.cep}" placeholder="Cep : 000-0000"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="40" type="text" name="logradouro" id="logradouro"
					class="form-control" required="required"
					value="${modelPessoa.logradouro}" placeholder="Logradouro">
				<span class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="40" type="text" name="bairro" id="bairro"
					class="form-control" required="required"
					value="${modelPessoa.bairro}" placeholder="Bairro"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="40" type="text" name="municipio" id="municipio"
					class="form-control" required="required"
					value="${modelPessoa.municipio}" placeholder="Municipio"> <span
					class="form-bar"></span>

			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="2" type="text" name="uf" id="uf"
					class="form-control" required="required" value="${modelPessoa.uf}"
					placeholder="Uf"> <span class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="9" type="text" name="numero" id="numero"
					class="form-control" required="required"
					value="${modelPessoa.numero}" placeholder="Numero"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="40" type="text" name="complemento"
					id="complemento" class="form-control" required="required"
					autocomplete="off" value="${modelPessoa.complemento }"
					placeholder="Complemento(nao Obrigatorio)"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="2" type="number" name="dd" id="dd" class="form-control"
					required="required" autocomplete="off" value="${modelPessoa.dd }"
					placeholder="DDD do numero"> <span class="form-bar"></span>

			</div>

			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="9" type="number" name="telefoneUm" id="telefoneUm"
					class="form-control" required="required" autocomplete="off"
					value="${modelPessoa.telefoneUm }"
					placeholder="Telefone para contato"> <span class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					maxlength="9" type="number" name="telefoneDois" id="telefoneDois"
					class="form-control" autocomplete="off"
					value="${modelPessoa.telefoneDois }"
					placeholder="Telefone secundario"> <span class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input
					oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
					type="number" name="whatsapp" id="whatsapp" class="form-control"
					required="required" autocomplete="off"
					value="${modelPessoa.whatsapp }" maxlength="1"
					placeholder="Selecione 1 (NumeroPrimario) 2(NumeroSecundario)">
				<span class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="100" type="text" name="url" id="url"
					class="form-control" autocomplete="off" value="${modelPessoa.url}"
					placeholder="Rede Social"> <span class="form-bar"></span>
			</div>


			<div class="form-group form-default form-static-label">
				<input maxlength="100" type="email" name="email" id="email"
					class="form-control" required="required"
					value="${modelPessoa.email}" placeholder="Email"> <span
					class="form-bar"></span>
			</div>

			<div class="form-group form-default form-static-label">
				<input maxlength="20" type="password" name="senha" id="senha"
					class="form-control" required="required" autocomplete="off"
					value="${modelPessoa.senha}" placeholder="Senha"> <span
					class="form-bar"></span>
			</div>





			<button type="button" class="btn btn-light" onclick="limparForm();">Limpar</button>

			<button class="btn btn-success">Salvar</button>

			<button type="button" class="btn btn-dark" onclick="voltar();">Voltar
				ao Login</button>

			<span>${msg}</span>

		</form>



		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

		<script type="text/javascript">
			function voltar() {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'voltar';

				document.getElementById("formUser").submit();

			}

			function limparForm() {
				var elementos = document.getElementById("formUser").elements;
				for (p = 0; p < elementos.length; p++) {
					elementos[p].value = ' ';
				}
			}

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
</body>
</html>