<%@page import="br.com.projsorveteria.db.ProdutoDB"%>
<%@page import="br.com.projsorveteria.model.Produto"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Produtos</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Consultar Produtos</h1>



<div class="col-sm 3" align="center">
<form action="ControllerProduto" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
 
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">id</th>
      <th scope="col">Nome</th>
      <th scope="col">Sabor</th>
      <th scope="col">Valor</th>
      <th scope="col">Edição</th>
      <th scope="col">Exclusão</th>
    
    </tr>
  </thead>
  <tbody>
  <% for(Produto produto: new ProdutoDB().all() ) {%>
    <tr>
      <td ><%= produto.getId() %></td>
      <td><%= produto.getNome() %></td>
      <td><%= produto.getSabor() %></td>
      <td><%= produto.getValor() %></td>
      <td><a href="editformprod.jsp?id=<%= produto.getId() %>">Alterar</a></td>  
      <td><a href="deleteprod.jsp?id=<%= produto.getId() %>">Apagar</a></td>
      <%} %>
      
    </tr>   
  </tbody>
</table>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</body>
</html>