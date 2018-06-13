<%@page import="br.com.projsorveteria.db.CidadeDB"%>  
<%@page import="br.com.projsorveteria.model.Cidade"%> 

<%  
String  nome =request.getParameter("nome");
Cidade cidade = new Cidade();
cidade.setNome(nome);

CidadeDB.alterar(cidade);  
response.sendRedirect("ConsultarCidade.jsp");  
%>  