<%@page import="br.com.projsorveteria.db.ProdutoDB"%>  
<%@page import="br.com.projsorveteria.model.Produto"%> 

<%  

String  nome =request.getParameter("nome");
String  sabor =request.getParameter("sabor");
double  valor =Double.parseDouble(request.getParameter("valor"));

Produto produto = new Produto();

produto.setNome(nome);
produto.setSabor(sabor);
produto.setValor(valor);

ProdutoDB.alterar(produto);  
response.sendRedirect("ConsultarProdutos.jsp");  
%>  