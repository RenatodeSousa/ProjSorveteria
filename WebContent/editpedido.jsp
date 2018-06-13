<%@page import="br.com.projsorveteria.db.PedidoDB"%>  
<%@page import="br.com.projsorveteria.model.Pedido"%> 
<%@page import="br.com.projsorveteria.db.ProdutoDB"%>  
<%@page import="br.com.projsorveteria.model.Produto"%> 
<%@page import="br.com.projsorveteria.db.MesaDB"%>  
<%@page import="br.com.projsorveteria.model.Mesa"%> 

<%  

int  idMesa =Integer.parseInt(request.getParameter("selectMesa"));
int  idProduto =Integer.parseInt(request.getParameter("selectProduto"));
Produto p = ProdutoDB.getRecordById(idProduto);
Mesa m = MesaDB.getRecordById(idMesa);

Pedido pedido = new Pedido();
pedido.setMesa(m);
pedido.setProduto(p);	

PedidoDB.alterar(pedido);  
response.sendRedirect("ConsultarPedido.jsp");  
%>  