<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body class="form-control-plaintext" color="blue">

<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>

<form action= "ControllerLogin" method="post">
<form action= "ControllerLogin/redirecionar" method="post">
<div class="col-sm 3" align="center">
<div class= "form-group">
<label >Login</label><br>
<input type= "text" id= "login" name="login" ><br>
</div>
<div class= "form-group">
<label >Senha</label><br>
<input type= "password" id= "senha" name="senha" ><br><br>
</div>
<input type= "submit" class="btn btn-primary" value= "Login">
</div>
</form>
</form>

</body>
</html>