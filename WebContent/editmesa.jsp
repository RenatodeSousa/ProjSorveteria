<%@page import="br.com.projsorveteria.db.MesaDB"%>  
<%@page import="br.com.projsorveteria.model.Mesa"%> 

<%  
int qtd_lugar = Integer.parseInt( request.getParameter("qtd_lugar"));
Mesa mesa = new Mesa();
mesa.setQtd_lugar(qtd_lugar);
MesaDB.alterar(mesa);  
response.sendRedirect("ConsultarMesa.jsp");  
%>  