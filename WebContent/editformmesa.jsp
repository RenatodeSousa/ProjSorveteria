<%@page import="br.com.projsorveteria.db.MesaDB"%>
<%@page import="br.com.projsorveteria.model.Mesa"%>
<%@page import="br.com.projsorveteria.db.CidadeDB"%>
<%@page import="br.com.projsorveteria.model.Cidade"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Editar Mesa</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Editar Mesa</h1>

<%  
String id=request.getParameter("id");  
Mesa f =MesaDB.getRecordById((Integer.parseInt(id)));  
%>  

<div class="col-sm 3" align="center">
<form action="editmesa.jsp" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<input type="hidden" name="id" value="<%=f.getId() %>"/>
<div class= "form-group">
Quantidade de Lugares<br>
<input type= "text" id= "qtd_lugar" name="qtd_lugar" value="<%=f.getQtd_lugar() %>"/><br><br>
</div>

</form>
<input type= "submit" class="btn btn-primary" value= "Alterar"/>
<a href="ConsultarMesa.jsp"class="btn btn-primary">Voltar</a>
</div>
</body>
</html>