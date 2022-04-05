<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="img/address-book-regular.svg">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="https://kit.fontawesome.com/20102b8b28.js" crossorigin="anonymous"></script>
	<title>| Agenda de Contatos</title>
</head>
<body>
	<div class="container" id="container-form">
		<h2>Editar contato</h2>
		<form name="form-contato" action="update" autocomplete="off">
			<div class="user-box">
				<input type="text" name="id" required="required" readonly="readonly"
				value="<% out.print(request.getAttribute("id")); %>">
				<label id="label-id">ID</label>
			</div>
			<div class="user-box">
				<input type="text" name="nome" required="required"
				value="<% out.print(request.getAttribute("nome")); %>">
				<label>Nome</label>
			</div>
			<div class="user-box">
				<input type="text" name="email" required="required"
				value="<% out.print(request.getAttribute("email")); %>">
				<label>Email</label>
			</div>
			<div class="user-box">
				<input type="number" name="fone" required="required"
				value="<% out.print(request.getAttribute("fone")); %>">
				<label>Telefone</label>
			</div>
			<div id="div-btn">
				<button type="submit" onclick="validar()">
					<a>	
						<span></span>
						<span></span>
						<span></span>
						<span></span>
						Salvar
					</a>
				</button>
			</div>
		</form>
	  </div>

	<script src="scripts/validador.js"></script>
</body>
</html>