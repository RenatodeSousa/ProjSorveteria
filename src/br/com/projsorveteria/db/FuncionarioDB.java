package br.com.projsorveteria.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.projsorveteria.model.Funcionario;
import br.com.projsorveteria.util.ConnectionFactory;

public class FuncionarioDB {
	static Connection con;
	PreparedStatement ps;

	public FuncionarioDB() {
		con = ConnectionFactory.getConnection();
	}

	public static Funcionario getRecordById(int id){  
	    Funcionario  f = null;  
	    try{  
	        
	        PreparedStatement ps=con.prepareStatement("select * from tb_funcionario a where a.id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	f = new Funcionario();
				f.setId(rs.getInt("A.id"));
				f.setNome(rs.getString("A.nome"));
				f.setTelefone(rs.getString("A.telefone"));
				f.setEndereco(rs.getString("A.endereco"));
				f.setCargo(rs.getString("A.cargo"));
				f.setLogin(rs.getString("A.login"));
				f.setSenha(rs.getString("A.senha"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return f;  
	}  
	  
	public boolean insert(Funcionario funcionario) {

		try {
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into tb_funcionario (nome, telefone ,endereco, cargo, login, senha)");
			sb.append(" values (?,?,?,?,?,?)");

			ps = con.prepareStatement(sb.toString());

			ps.setString(1, funcionario.getNome());
			ps.setString(2, funcionario.getTelefone());
			ps.setString(3, funcionario.getEndereco());
			ps.setString(4, funcionario.getCargo());
			ps.setString(5, funcionario.getLogin());
			ps.setString(6, funcionario.getSenha());

			ps.execute();

			return true;

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return false;
	}

	public List<Funcionario> all() {

		List<Funcionario> lstFuncionario = new ArrayList<>();

		String sql = "SELECT A.NOME, A.ID, A.TELEFONE, A.ENDERECO, A.CARGO, A.LOGIN, A.SENHA FROM TB_FUNCIONARIO A";

		try {
			ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Funcionario funcionario = new Funcionario();
				funcionario.setId(rs.getInt("A.id"));
				funcionario.setNome(rs.getString("A.nome"));
				funcionario.setTelefone(rs.getString("A.telefone"));
				funcionario.setEndereco(rs.getString("A.endereco"));
				funcionario.setCargo(rs.getString("A.cargo"));
				funcionario.setLogin(rs.getString("A.login"));
				funcionario.setSenha(rs.getString("A.senha"));
				lstFuncionario.add(funcionario);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lstFuncionario;
	}

	public String retornaFunc(String login, String senha) throws SQLException {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT cargo FROM tb_funcionario ");
		sql.append("WHERE LOGIN = '" + login + "' AND SENHA = '" + senha + "'");
		
		if (!(login != null && !login.equals("") || (senha != null && !senha.equals("")))) 
			return "";

		ps = con.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			String cargo = rs.getString("cargo");
			if (!(cargo.equals("") || cargo.equals(null)))
				return cargo;
		}
		return "";
	}

	public static int alterar(Funcionario funcionario) throws SQLException {

		  int status=0;  
		try {

			PreparedStatement stmt = con
					.prepareStatement("UPDATE TB_FUNCIONARIO SET nome=?, telefone=?, endereco=?,  cargo=?, login=?, senha=? WHERE id=?");

			stmt.setString(1, funcionario.getNome());
			stmt.setString(2, funcionario.getTelefone());
			stmt.setString(3, funcionario.getEndereco());
			stmt.setString(4, funcionario.getCargo());
			stmt.setString(5, funcionario.getLogin());
			stmt.setString(6, funcionario.getSenha());
			stmt.setInt(7, funcionario.getId());
	         
			status = stmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {

			con.close();

		}
		return status;
	}
	
	public static int apagar(Funcionario f){  
	    int status=0;  
	    try{   
	        PreparedStatement ps=con.prepareStatement("delete from tb_funcionario where id=?");  
	        ps.setInt(1,f.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
}