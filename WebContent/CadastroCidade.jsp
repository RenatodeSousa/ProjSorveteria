<%@page import="br.com.projsorveteria.model.Cidade"%>
<%@page import="br.com.projsorveteria.db.CidadeDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Cidades</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Cadastro de Cidades</h1>

<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<div class="col-sm 3" align= "center">
<form action= "ControllerCidade" method ="post">

<div class= "form-group">
Nome da Cidade<br>
<input type= "text" id= "nome" name="nome" /><br><br>
</div>

<br>
<input type="submit" class="btn btn-primary" value= "Salvar"/>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</form>
<br>

<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Nome</th>
    
    </tr>
  </thead>
  <tbody>
  <% for(Cidade cidade: new CidadeDB().all() ) {%>
    <tr>
      <td ><%= cidade.getId() %></td>
      <td><%= cidade.getNome() %></td>
    
      <%} %>
      
    </tr>    
  </tbody>
</table>
</div>
</body>
</html>