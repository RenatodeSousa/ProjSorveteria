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
<title>Cadastro  de Funcionarios</title>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<h1 align="center">Cadastro de Funcionarios</h1>



<div class="col-sm 3" align="center">
<form action="ControllerFuncionario" method= "post">

<div class= "form-group">
<%  if (request.getAttribute("msg")!= null) { %>
<p><%=request.getAttribute("msg") %></p>
<%} %>
Nome<br>
<input type="text" id= "nome"  name= "nome"/><br>
</div>
<div class="form-group">
    <label for="selectCidade">Cidade</label>
    <select  class="form-control" id="selectCidade" name= "selectCidade">
    <option>Selecione a Cidade</option>
     <%for (Cidade cidade : new CidadeDB().all()){ %>
      <option value="<%= cidade.getId()%>"><%=cidade.getNome() %></option>
     <% } %>
    </select>
  </div>
<div class= "form-group">
Telefone<br>
<input type="text" id= "telefone"  name= "telefone"/><br>
</div>
<div class= "form-group">
Endereco<br>
<input type="text" id= "endereco"  name= "endereco"/><br>
</div>
<div class= "form-group">
Cargo<br>
<input type="text" id= "cargo"  name= "cargo"/><br>
</div>

<div class= "form-group">
Login<br>
<input type="text" id= "login"  name= "login"/><br>
</div>
<div class= "form-group">
Senha<br>
<input type="number" id= "senha"  name= "senha"/><br>
</div>
<input type= "submit" class="btn btn-primary" value= "salvar"/>
<a href="Gerente.jsp"class="btn btn-primary">Voltar</a>
</div>
</form>
<br>
<table class="table table-hover table-dark">
  <thead>
    <tr>
      <th scope="col">id</th> 
      <th scope="col">Nome</th>
      <th scope="col">Telefone</th>
      <th scope="col">Endereco</th>
      <th scope="col">Cargo</th>
      <th scope="col">login</th>
       <th scope="col">senha</th>
     
      
    </tr>
  </thead>
  <tbody>
  <% for(Funcionario funcionario: new FuncionarioDB().all() ) {%>
    <tr>
      <td ><%= funcionario.getId() %></td>
      <td><%= funcionario.getNome() %></td>
       <td><%= funcionario.getTelefone() %></td>
       <td><%= funcionario.getEndereco() %></td>
       <td><%= funcionario.getCargo() %></td>
       <td><%= funcionario.getLogin() %></td>
       <td><%= funcionario.getSenha() %></td>
      
      <%} %>
      
    </tr>
    
        
  </tbody>
</table>
</div>


</body>
</html>