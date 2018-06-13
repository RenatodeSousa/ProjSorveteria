<%@page import="br.com.projsorveteria.db.PedidoDB"%>  
<jsp:useBean id="p" class="br.com.projsorveteria.model.Pedido"></jsp:useBean>  
<jsp:setProperty property="*" name="p"/>  
<%  
PedidoDB.apagar(p);  
response.sendRedirect("ConsultarPedido.jsp");  
%>  