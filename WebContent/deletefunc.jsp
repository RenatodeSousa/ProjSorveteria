<%@page import="br.com.projsorveteria.db.FuncionarioDB"%>  
<jsp:useBean id="f" class="br.com.projsorveteria.model.Funcionario"></jsp:useBean>  
<jsp:setProperty property="*" name="f"/>  
<%  
FuncionarioDB.apagar(f);  
response.sendRedirect("ConsultarFuncionario.jsp");  
%>  