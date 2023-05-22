<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


<title>Inicio</title>
<style type="text/css">
form {
	position: absolute;
	top: 50%;
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
	top: 70%;
	left: 33%;
	font-size: 15px;
	color: #41464b;
    background-color: #e2e3e5;
    border: #d3d6d8;
    
}
img{
width: 300px; 
position:relative;
top: 110px;
right: 1%;
}
</style>

</head>
<body>

<h5>Bem vindo ao EasyService </h5>

<div class="text-center">
  <img src="<%= request.getContextPath() %>/images/EasyService.jpg" class="img" alt="...">
</div>

<form action="<%=request.getContextPath() %>/ServletLogin" method="post" class="row g-3 needs-validation" novalidate>
		<input type="hidden" value="<%=request.getParameter("url")%>"
			name="url">

		<div class="col-mb-3">
			<label class="form-label">Login:</label> 
			<input class="form-control" name="Login" type="text" required="required">
			<div class="invalid-feedback">
			      Campo Obrigatório 
			</div>
		</div>

		<div class="col-mb-3">
			<label class="form-label">Senha:</label> 
			<input class="form-control" name="senha" type="password" required="required">
			<div class="invalid-feedback">
			      Campo Obrigatório 
			</div>
		</div>

		
			<input type="submit" value="Acessar" class="btn btn-primary">
			<input type="submit" value="Registrar" class="btn btn-primary" name="url">
			
			
		     
		   
		     
		     
		     
		


	</form>
	<form action="<%=request.getContextPath() %>/ServletLogin" method="get" class="row g-3 needs-validation" novalidate>
		<input type="submit" value="Registrar" name="telaRegistro" />
		</form>
	
	<h3>${msg}</h3>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript">


	function registro(){
		document.getElementById("formPessoa").method = 'get';
		document.getElementById("acao").value = 'registrarNovo';
		
	}




</script>

</body>
</html>