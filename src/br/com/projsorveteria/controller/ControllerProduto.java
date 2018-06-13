package br.com.projsorveteria.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projsorveteria.db.ProdutoDB;
import br.com.projsorveteria.model.Produto;



@WebServlet("/ControllerProduto")
public class ControllerProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ControllerProduto() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String  nome =request.getParameter("nome");
		String  sabor =request.getParameter("sabor");
		double  valor =Double.parseDouble(request.getParameter("valor"));
		
		Produto produto = new Produto();
		produto.setNome(nome);
		produto.setSabor(sabor);
		produto.setValor(valor);
		
	
		if (new ProdutoDB().insert(produto)) {
			request.setAttribute("msg","Produto registrado com sucesso");
			request.getRequestDispatcher("CadastroProduto.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("msg","favor preencher corretamente os dados do Produto");
			request.getRequestDispatcher("CadastroProduto.jsp").forward(request, response);
		}
	}	
}
		

