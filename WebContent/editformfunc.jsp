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
<title>Editar  Funcionários</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Editar  Funcionários</h1>

<%  
String id=request.getParameter("id");  
Funcionario f =FuncionarioDB.getRecordById(Integer.parseInt(id));  
%>  

<div class="col-sm 3" align="center">
<form action="editfunc.jsp" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<input type="hidden" name="id" value="<%=f.getId() %>"/>

Nome<br>
<input type="text" id= "nome"  name= "nome" value="<%= f.getNome()%>"/><br>  
</div>
<div class= "form-group">
Telefone<br>
<input type="text" id= "telefone"  name= "telefone" value="<%= f.getTelefone()%>"/><br>
</div>
<div class= "form-group">
Endereco<br>
<input type="text" id= "endereco"  name= "endereco" value="<%= f.getEndereco()%>"/><br>
</div>
<div class= "form-group">
Cargo<br>
<input type="text" id= "cargo"  name= "cargo" value="<%= f.getCargo()%>"/><br>
</div>

<div class= "form-group">
Login<br>
<input type="text" id= "login"  name= "login" value="<%= f.getLogin()%>"/><br>
</div>
<div class= "form-group">
Senha<br>
<input type="text" id= "senha"  name= "senha" value="<%= f.getSenha()%>"/><br>
</div>
<input type= "submit" class="btn btn-primary" value= "Alterar"/>
<a href="ConsultarFuncionario.jsp"class="btn btn-primary">Voltar</a>
</div>
</form>
</div>
</body>
</html>