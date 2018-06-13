<%@page import="br.com.projsorveteria.db.CidadeDB"%>
<%@page import="br.com.projsorveteria.model.Cidade"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Cidade</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Consultar Cidade</h1>



<div class="col-sm 3" align="center">
<form action="ControllerCidade" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
 
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Nome</th>
      <th scope="col">Edição</th>
      <th scope="col">Exclusão</th>
    
    </tr>
  </thead>
  <tbody>
  <% for(Cidade cidade: new CidadeDB().all() ) {%>
    <tr>
      <td ><%= cidade.getId() %></td>
      <td><%= cidade.getNome() %></td>
      <td><a href="editformcid.jsp?id=<%= cidade.getId() %>">Alterar</a></td>  
      <td><a href="deletecidade.jsp?id=<%= cidade.getId() %>">Apagar</a></td>
    
      <%} %>
      
    </tr>   
  </tbody>
</table>
</div>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</body>


</html>