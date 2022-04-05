<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>
<% ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>) request.getAttribute("contatos"); %>

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
	<div class="container">
		<h2>Agenda de Contatos</h2>
		
		<div class="div-btn">
		     <a href="novo.html">
			     <span></span>
			     <span></span>
			     <span></span>
			     <span></span>
			     Criar novo contato
		     </a>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Fone</th>
					<th id="acao" class="acao">Ações</th>
				</tr>
			</thead>
			<tbody>
				<% for(int i = 0; i < lista.size(); i++){ %> 
				<tr>
					<td><%=lista.get(i).getId()%></td>
					<td><%=lista.get(i).getNome()%></td>
					<td><%=lista.get(i).getEmail()%></td>
					<td><%=lista.get(i).getFone()%></td>
					<td class="acao">
						<a href="select?id=<%=lista.get(i).getId()%>">
							<i class="fa-solid fa-pen"></i>
						</a>
						<a href="javascript: confirmar(<%=lista.get(i).getId()%>)">
							<i class="fa-regular fa-trash-can"></i>
						</a>
					</td>
				</tr>
				<% } %>				
			</tbody>
		</table>
	</div>
	
	<script src="scripts/confirmador.js"></script>
	
</body>
</html>