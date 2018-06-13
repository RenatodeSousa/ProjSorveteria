package br.com.projsorveteria.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.projsorveteria.db.FuncionarioDB;
import br.com.projsorveteria.model.Cidade;
import br.com.projsorveteria.model.Funcionario;



@WebServlet("/ControllerFuncionario")
public class ControllerFuncionario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ControllerFuncionario() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String  nome =request.getParameter("nome");
		String  telefone =request.getParameter("telefone");
		String  endereco =request.getParameter("endereco");
		String  cargo =request.getParameter("cargo");
		String  login =request.getParameter("login");
		String  senha =request.getParameter("senha");
		
		Funcionario funcionario = new Funcionario();
		
		funcionario.setNome(nome);
		funcionario.setTelefone(telefone);
		funcionario.setEndereco(endereco);
		funcionario.setCargo(cargo);
		funcionario.setLogin(login);
		funcionario.setSenha(senha);
		
   
		if (new FuncionarioDB().insert(funcionario)) {
			request.setAttribute("msg","Registro inserido com sucesso");
			request.getRequestDispatcher("CadastroFuncionario.jsp")
			.forward(request, response);
		}else {
			request.setAttribute("msg","Erro ao inserir Registro");
			request.getRequestDispatcher("CadastroFuncionario.jsp").forward(request, response);
		}
		
		
	}
}
		

