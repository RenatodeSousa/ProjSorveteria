<%@page import="br.com.projsorveteria.db.FuncionarioDB"%>  
<%@page import="br.com.projsorveteria.model.Funcionario"%> 

<%  
String  nome =request.getParameter("nome");
String  telefone =request.getParameter("telefone");
String  endereco =request.getParameter("endereco");
String  cargo =request.getParameter("cargo");
String  login =request.getParameter("login");
String  senha =request.getParameter("senha");

Funcionario f = new Funcionario();

f.setNome(nome);
f.setTelefone(telefone);
f.setEndereco(endereco);
f.setCargo(cargo);
f.setLogin(login);
f.setSenha(senha);

FuncionarioDB.alterar(f);  
response.sendRedirect("ConsultarFuncionario.jsp");  
%>  