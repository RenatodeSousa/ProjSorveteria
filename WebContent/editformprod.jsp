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
<title>Editar  Produtos</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Editar Produtos</h1>

<%  
String id=request.getParameter("id");  
Produto f =ProdutoDB.getRecordById((Integer.parseInt(id)));  
%>  

<div class="col-sm 3" align="center">
<form action="editproduto.jsp" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<input type="hidden" name="id" value="<%=f.getId() %>"/>

Nome do Produto<br>

<input type= "text" id= "nome" name="nome" value="<%=f.getNome() %>"/><br><br>
</div>
<div class= "form-group">
Sabor<br>
<input type= "text" id= "sabor" name="sabor" value="<%=f.getSabor() %>" /><br><br>
</div>
<div class= "form-group">
Valor do Produto<br>
<input type= "text" id= "valor" name="valor" value="<%=f.getValor() %>" /><br><br>
</div>
<input type= "submit" class="btn btn-primary" value= "Alterar"/>
<a href="ConsultarProdutos.jsp"class="btn btn-primary">Voltar</a>
</div>
</form>
</div>
</body>
</html>