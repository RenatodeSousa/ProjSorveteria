<%@page import="br.com.projsorveteria.db.MesaDB"%>  
<jsp:useBean id="m" class="br.com.projsorveteria.model.Mesa"></jsp:useBean>  
<jsp:setProperty property="*" name="m"/>  
<%  
MesaDB.apagar(m);  
response.sendRedirect("ConsultarMesa.jsp");  
%>  