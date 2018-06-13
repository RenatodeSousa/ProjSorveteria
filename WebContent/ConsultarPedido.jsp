<%@page import="br.com.projsorveteria.db.PedidoDB"%>
<%@page import="br.com.projsorveteria.model.Pedido"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultar Pedidos</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Consultar Pedidos</h1>



<div class="col-sm 3" align="center">
<form action="ControllerPedido" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
 
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      
      <th scope="col">Id</th>
      <th scope="col">Nome do Cliente</th>
       <th scope="col">Numero da Mesa</th>
        <th scope="col">Quantidade de lugar</th>
        <th scope="col">produto</th>
          <th scope="col">Edi��o</th>
      <th scope="col">Exclus�o</th>
        
    
    </tr>
  </thead>
  <tbody>
  <% for(Pedido pedido: new PedidoDB().all() ) {%>
    <tr>
      <td ><%= pedido.getId() %></td>
      <td><%= pedido.getNomeCliente() %></td>
      <td><%= pedido.getMesa().getId() %></td>
      <td><%= pedido.getMesa().getQtd_lugar() %></td>
      <td><%= pedido.getProduto() %></td>
   
       <td><a href="editformpedido.jsp?id=<%= pedido.getId() %>">Alterar</a></td>  
      <td><a href="deletepedido.jsp?id=<%= pedido.getId() %>">Apagar</a></td>
      
      <%} %>
      
    </tr> 
  </tbody>
</table>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</body>
</html>