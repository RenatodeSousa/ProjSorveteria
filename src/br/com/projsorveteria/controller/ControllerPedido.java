package br.com.projsorveteria.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projsorveteria.db.MesaDB;
import br.com.projsorveteria.db.PedidoDB;
import br.com.projsorveteria.db.ProdutoDB;
import br.com.projsorveteria.model.Mesa;
import br.com.projsorveteria.model.Pedido;
import br.com.projsorveteria.model.Produto;


@WebServlet("/ControllerPedido")
public class ControllerPedido extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ControllerPedido() {
        super();
     
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  nome =request.getParameter("nome_cliente");
		int  idMesa =Integer.parseInt(request.getParameter("selectMesa"));
		int  idProduto =Integer.parseInt(request.getParameter("selectProduto"));
		Produto p = ProdutoDB.getRecordById(idProduto);
		Mesa m = MesaDB.getRecordById(idMesa);
		
		Pedido pedido = new Pedido();
		pedido.setNomeCliente(nome);
		pedido.setMesa(m);
		pedido.setProduto(p);	
		
		if (new PedidoDB().insert(pedido) && new PedidoDB().geraComanda(pedido )) {
			request.setAttribute("msg","Registro e Comanda inseridos com sucesso");
			request.getRequestDispatcher("CadastroPedido.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("msg","Erro ao inserir Registro");
			request.getRequestDispatcher("CadastroPedido.jsp").forward(request, response);
		}
	}
}
