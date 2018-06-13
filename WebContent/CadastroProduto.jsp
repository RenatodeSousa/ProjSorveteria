<%@page import="br.com.projsorveteria.model.Produto"%>
<%@page import="br.com.projsorveteria.db.ProdutoDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Produtos</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Cadastro de Produtos</h1>

<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<div class="col-sm 3" align= "center">
<form action= "ControllerProduto" method ="post">

<div class= "form-group">
Nome do Produto<br>
<input type= "text" id= "nome" name="nome" /><br><br>
</div>
<div class= "form-group">
Sabor<br>
<input type= "text" id= "sabor" name="sabor" /><br><br>
</div>
<div class= "form-group">
Valor do Produto<br>
<input type= "text" id= "valor" name="valor" /><br><br>
</div>
<br>
<input type="submit" class="btn btn-primary" value= "Salvar"/>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</form>
<br>
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">id</th>
      <th scope="col">Nome</th>
      <th scope="col">Sabor</th>
      <th scope="col">Valor</th>
    </tr>
  </thead>
  <tbody>
  <% for(Produto produto: new ProdutoDB().all() ) {%>
    <tr>
      <td ><%= produto.getId() %></td>
      <td><%= produto.getNome() %></td>
      <td><%= produto.getSabor() %></td>
      <td><%= produto.getValor() %></td>
 <%} %>
      
    </tr>   
  </tbody>
</table>
</div>
</body>
</html>