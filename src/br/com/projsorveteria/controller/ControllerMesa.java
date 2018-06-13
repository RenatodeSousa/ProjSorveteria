package br.com.projsorveteria.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projsorveteria.db.MesaDB;
import br.com.projsorveteria.model.Mesa;

@WebServlet("/ControllerMesa")
public class ControllerMesa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ControllerMesa() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		int qtd_lugar = Integer.parseInt( request.getParameter("qtd_lugar"));
		
		Mesa mesa = new Mesa();
		mesa.setQtd_lugar(qtd_lugar);
		
		if (new MesaDB().insert(mesa)) {
			request.setAttribute("msg","Registro inserido com sucesso");
			request.getRequestDispatcher("CadastroMesa.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("msg","Erro ao inserir Registro");
			request.getRequestDispatcher("CadastroMesa.jsp").forward(request, response);
		}
	}
}