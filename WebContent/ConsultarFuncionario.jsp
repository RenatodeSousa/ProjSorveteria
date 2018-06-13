<%@page import="br.com.projsorveteria.db.FuncionarioDB"%>
<%@page import="br.com.projsorveteria.model.Funcionario"%>
<%@page import="br.com.projsorveteria.db.CidadeDB"%>
<%@page import="br.com.projsorveteria.model.Cidade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Funcionários</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Consultar Funcionarios</h1>



<div class="col-sm 3" align="center">
<form action="ControllerFuncionario" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
 
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">Id</th> 
      <th scope="col">Nome</th>
      <th scope="col">Telefone</th>
      <th scope="col">Endereco</th>
      <th scope="col">Cargo</th>
      <th scope="col">Login</th>
      <th scope="col">Senha</th>
      <th scope="col">Edição</th>
      <th scope="col">Exclusão</th>
     
      
    </tr>
  </thead>
  <tbody>
  <% for(Funcionario funcionario: new FuncionarioDB().all() ) {%>
    <tr>
      <td ><%= funcionario.getId() %></td>
      <td><%= funcionario.getNome() %></td>
       <td><%= funcionario.getTelefone() %></td>
       <td><%= funcionario.getEndereco() %></td>
       <td><%= funcionario.getCargo() %></td>
       <td><%= funcionario.getLogin() %></td>
       <td><%= funcionario.getSenha() %></td>
       <td><a href="editformfunc.jsp?id=<%= funcionario.getId() %>">Alterar</a></td>  
       <td><a href="deletefunc.jsp?id=<%= funcionario.getId() %>">Apagar</a></td>
      
      <%} %>
      
    </tr>
  </tbody>
</table>
</div>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</form>
</body>
</html>