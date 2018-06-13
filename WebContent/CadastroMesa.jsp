<%@page import="br.com.projsorveteria.model.Mesa"%>
<%@page import="br.com.projsorveteria.db.MesaDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastro de Mesas</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Cadastro de Mesas</h1>

<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<div class="col-sm 3" align= "center">
<form action= "ControllerMesa" method ="post">

<div class= "form-group">
Quantidade de Lugares<br>
<input type= "text" id= "qtd_lugar" name="qtd_lugar" /><br><br>
</div>

<input type="submit" class="btn btn-primary" value= "Salvar"/>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</form>
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Quantidades de lugares</th>
     
    </tr>
  </thead>
  <tbody>
  <% for(Mesa mesa: new MesaDB().all() ) {%>
    <tr>
      <td ><%= mesa.getId() %></td>
      <td><%= mesa.getQtd_lugar() %></td>
      
      <%} %>
      
    </tr>
    
        
  </tbody>
</table>

</div>

</body>
</html>