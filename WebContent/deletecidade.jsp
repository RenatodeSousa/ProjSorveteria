<%@page import="br.com.projsorveteria.db.CidadeDB"%>  
<jsp:useBean id="c" class="br.com.projsorveteria.model.Cidade"></jsp:useBean>  
<jsp:setProperty property="*" name="c"/>  
<%  
CidadeDB.apagar(c);  
response.sendRedirect("ConsultarCidade.jsp");  
%>  