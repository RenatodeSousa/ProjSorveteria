<%@page import="br.com.projsorveteria.db.MesaDB"%>
<%@page import="br.com.projsorveteria.model.Mesa"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Mesa</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Consultar Mesa</h1>



<div class="col-sm 3" align="center">
<form action="ControllerMesa" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
 
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Quantidades de lugares</th>
       <th scope="col">Edição</th>
      <th scope="col">Exclusão</th>
     
    </tr>
  </thead>
  <tbody>
  <% for(Mesa mesa: new MesaDB().all() ) {%>
    <tr>
      <td ><%= mesa.getId() %></td>
      <td><%= mesa.getQtd_lugar() %></td>
      <td><a href="editformmesa.jsp?id=<%= mesa.getId() %>">Alterar</a></td>  
      <td><a href="deletemesa.jsp?id=<%= mesa.getId() %>">Apagar</a></td>
      
      <%} %>
      
    </tr>  
  </tbody>
</table>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</body>
</html>