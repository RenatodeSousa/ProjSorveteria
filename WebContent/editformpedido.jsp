<%@page import="br.com.projsorveteria.model.Pedido"%>
<%@page import="br.com.projsorveteria.db.PedidoDB"%>
<%@page import="br.com.projsorveteria.db.MesaDB"%>
<%@page import="br.com.projsorveteria.model.Mesa"%>
<%@page import="br.com.projsorveteria.db.ProdutoDB"%>
<%@page import="br.com.projsorveteria.model.Produto"%>
<%@page import="br.com.projsorveteria.db.CidadeDB"%>
<%@page import="br.com.projsorveteria.model.Cidade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Pedido</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Editar Pedido</h1>

<%  
String id=request.getParameter("id");  
Pedido p =PedidoDB.getClienteSelecionado(Integer.parseInt(id));  
%>  

<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<div class="col-sm 3" align= "center">
<form action= "editpedido.jsp" method ="post">

<div class= "form-group">
Nome do cliente<br>
<input type= "text" id= "nome_cliente" name="nome_cliente" value="<%=p.getNomeCliente() %>"/><br><br>
</div>

<div class="form-group">
    <label for="selectMesa">Mesa</label>
    <select  class="form-control" id="selectMesa" name= "selectMesa">
    <option>Selecione a Mesa</option>
     <%for (Mesa mesa : new MesaDB().all()){ %>
      <option value="<%= mesa.getId()%>"><%= mesa.getId() %></option>
     <% } %>
    </select>
  </div>
<div class="form-group">
    <label for="selectProduto">Produtos</label>
    <select  class="form-control" id="selectProduto" name= "selectProduto">
    <option>Selecione os Produtos</option>
     <%for (Produto produto : new ProdutoDB().all()){ %>
      <option value="<%= produto.getId()%>"><%= produto.getNome() %></option>
     <% } %>
    </select>
  </div>
<br><br>
<input type="submit" class="btn btn-primary" value= "Alterar"/>
<a href="Gerente.jsp" class="btn btn-primary">Voltar</a>
</form>
</div>
</body>
</html>