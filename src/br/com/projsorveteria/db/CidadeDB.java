package br.com.projsorveteria.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projsorveteria.model.Cidade;
import br.com.projsorveteria.util.ConnectionFactory;

public class CidadeDB {
	
	static Connection con;
	PreparedStatement ps;
	
	public CidadeDB() {
		con = ConnectionFactory.getConnection();
	}

	public boolean insert(Cidade cidade) {
		
		try {
			StringBuilder sb = new StringBuilder();//Construtor de strings serve para concatenar as 
			//strings inclusao parte de strings concatenadas
			sb.append(" insert into tb_cidade (nome)");
			sb.append(" values (?)");
			
			ps = con.prepareStatement(sb.toString());
			
			ps.setString(1, cidade.getNome());
			
				
			
			ps.execute();
			
			return true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static Cidade getRecordById(int id){  
	    Cidade  cidade = null;  
	    try{  
	        
	        PreparedStatement ps=con.prepareStatement("select * from tb_cidade a where a.id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	cidade = new Cidade();
				cidade.setId(rs.getInt("id"));
				cidade.setNome(rs.getString("nome"));
	        } 
	    }catch(Exception e){System.out.println(e);}  
	    return cidade;  
	}  

	public List<Cidade> all(){
		
		List<Cidade> lstCidade= new ArrayList<>();
		
		String sql = "SELECT C.id, C.NOME FROM TB_CIDADE C ORDER BY C.NOME";
		
	try {
		ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Cidade cidade = new Cidade();
			cidade.setId(rs.getInt("id"));
			cidade.setNome(rs.getString("nome"));
			
			
			lstCidade.add(cidade);
									
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	return lstCidade;
	}
	
	public boolean excluir(int codigo) throws SQLException {

		try {

			PreparedStatement stmt = con
					.prepareStatement("DELETE FROM TB_CIDADE WHERE ID =?");

			stmt.setInt(1, codigo);

			stmt.execute();
			return true;

		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {

			con.close();

		}
		return false;
	}
	public static int alterar(Cidade cidade) throws SQLException {

		  int status=0;  
		try {

			PreparedStatement stmt = con
					.prepareStatement("UPDATE tb_cidade SET nome=? WHERE id=?");

			stmt.setString(   1, cidade.getNome());
			stmt.setInt(   2, cidade.getId());
	     
			status = stmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {

			con.close();

		}
		return status;
	}
	
	public static int apagar(Cidade m){  
	    int status=0;  
	    try{   
	        PreparedStatement ps=con.prepareStatement("delete from tb_cidade where id=?");  
	        ps.setInt(1,m.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
}
