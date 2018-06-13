package br.com.projsorveteria.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.projsorveteria.model.Produto;
import br.com.projsorveteria.util.ConnectionFactory;


public class ProdutoDB {
	static Connection con;
	PreparedStatement ps;
	
	public ProdutoDB() {
		con = ConnectionFactory.getConnection();
	}

	public boolean insert(Produto produto) {
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into tb_produto (nome, sabor ,valor)");
			sb.append(" values (?,?,?)");
			
			ps = con.prepareStatement(sb.toString());
			
			ps.setString(1, produto.getNome());
			ps.setString(2, produto.getSabor());
			ps.setDouble(3,  produto.getValor());
			ps.execute();
			
			return true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static Produto getRecordById(int id){  
	    Produto  produto = null;  
	    try{  
	        
	        PreparedStatement ps=con.prepareStatement("select * from tb_produto a where a.id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	produto = new Produto();
	        	produto.setId(rs.getInt("a.id"));
				produto.setNome(rs.getString("a.nome"));
				produto.setSabor(rs.getString("a.sabor"));
				produto.setValor(rs.getDouble("a.valor"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return produto;  
	}  
	
public List<Produto> all(){
		
		List<Produto> lstProduto= new ArrayList<>();
		
		String sql = "SELECT  id, NOME, SABOR, VALOR FROM TB_PRODUTO";
		
	try {
		ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Produto produto = new Produto();
			produto.setId(rs.getInt("id"));
			produto.setNome(rs.getString("nome"));
			produto.setSabor(rs.getString("sabor"));
			produto.setValor(rs.getDouble("valor"));
			
			lstProduto.add(produto);
									
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	return lstProduto;
	}

public static int alterar(Produto produto) throws SQLException {

	  int status=0;  
	try {

		PreparedStatement stmt = con
				.prepareStatement("UPDATE TB_PRODUTO SET nome=?, sabor=?, valor=? WHERE id=?");

		stmt.setString(1, produto.getNome());
		stmt.setString(2, produto.getSabor());
		stmt.setDouble(3, produto.getValor());
		stmt.setInt(   4, produto.getId());
       
      
		status = stmt.executeUpdate();

	} catch (SQLException e) {
		System.err.println(e.toString());
	} finally {

		con.close();

	}
	return status;
}

public static int apagar(Produto p){  
    int status=0;  
    try{   
        PreparedStatement ps=con.prepareStatement("delete from tb_produto where id=?");  
        ps.setInt(1,p.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}  

}