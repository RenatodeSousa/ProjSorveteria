package br.com.projsorveteria.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.projsorveteria.model.Mesa;
import br.com.projsorveteria.util.ConnectionFactory;

public class MesaDB {
	static Connection con;
	PreparedStatement ps;
	
	public MesaDB() {
		con = ConnectionFactory.getConnection();
	}

	public boolean insert(Mesa mesa) {
		
		try {
			StringBuilder sb = new StringBuilder();//Construtor de strings serve para concatenar as 
			//strings inclusao parte de strings concatenadas
			sb.append(" insert into tb_mesa (qtd_lugar)");
			sb.append(" values (?)");
			
			ps = con.prepareStatement(sb.toString());
			
			ps.setInt(1, mesa.getQtd_lugar());
						
			ps.execute();
			
			return true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
	
	public static Mesa getRecordById(int id){  
	    Mesa  mesa = null;  
	    try{  
	        
	        PreparedStatement ps=con.prepareStatement("select * from tb_mesa a where a.id_mesa=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	mesa = new Mesa();
				mesa.setId(rs.getInt("a.id_mesa"));
				mesa.setQtd_lugar(rs.getInt("a.qtd_lugar"));
	        }  
	    }catch(Exception e){System.out.println(e);}  
	    return mesa;  
	}  
	
public List<Mesa> all(){
		
		List<Mesa> lstMesa= new ArrayList<>();
		
		String sql = "SELECT A.ID_MESA, A.QTD_LUGAR FROM TB_MESA A";
		
	try {
		ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			
			Mesa mesa = new Mesa();
			mesa.setId(rs.getInt("A.id_mesa"));
			mesa.setQtd_lugar(rs.getInt("A.Qtd_lugar"));	
			lstMesa.add(mesa);							
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	return lstMesa;
	}

public static int alterar(Mesa mesa) throws SQLException {

	  int status=0;  
	try {

		PreparedStatement stmt = con
				.prepareStatement("UPDATE tb_mesa SET  qtd_lugar=? WHERE id_mesa=?");

		stmt.setInt(   1, mesa.getId());
		stmt.setInt(   2, mesa.getQtd_lugar());
     
    
		status = stmt.executeUpdate();

	} catch (SQLException e) {
		System.err.println(e.toString());
	} finally {

		con.close();

	}
	return status;
}
public static int apagar(Mesa m){  
    int status=0;  
    try{   
        PreparedStatement ps=con.prepareStatement("delete from tb_mesa where id_mesa=?");  
        ps.setInt(1,m.getId());  
        status=ps.executeUpdate();  
    }catch(Exception e){System.out.println(e);}  
  
    return status;  
}  

}
