<%@page import="br.com.projsorveteria.db.ProdutoDB"%>  
<jsp:useBean id="p" class="br.com.projsorveteria.model.Produto"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
<%  
ProdutoDB.apagar(p);  
response.sendRedirect("ConsultarProdutos.jsp");  
%>  