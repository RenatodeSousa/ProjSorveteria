package br.com.projsorveteria.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projsorveteria.db.FuncionarioDB;


@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ControllerLogin() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://respostas.guj.com.br/2396-validacao-de-login-e-senha-apenas-com-servlet-e-jsp
		
		String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        // Login e senha corretos

          try {
			if (redirecionar(login, senha)) { 
			   request.getRequestDispatcher("Gerente.jsp").forward(request, response);
			 } else {
					request.getRequestDispatcher("Garcon.jsp").forward(request, response);
			       }
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}


	private boolean redirecionar(String login, String senha) throws SQLException {
		// TODO Auto-generated method stub
		Boolean b = true;
		FuncionarioDB banco = new FuncionarioDB() ;
		 if (banco.retornaFunc(login, senha) != null) {
			 String cargo = banco.retornaFunc(login, senha);
				if (cargo.equals("Gerente") || cargo.equals("gerente")){
					b = true;
				}
				else {
					b = false;
				}
		 }
		return b;
	}
}
