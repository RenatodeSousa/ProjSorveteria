package br.com.projsorveteria.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import br.com.projsorveteria.model.Mesa;
import br.com.projsorveteria.model.Pedido;
import br.com.projsorveteria.util.ConnectionFactory;

public class PedidoDB {
	
	static Connection con;
	PreparedStatement ps;
	
	public PedidoDB() {
		con = ConnectionFactory.getConnection();
	}

	public boolean insert(Pedido pedido) {
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into tb_pedido (nome_cliente, id_mesa, produto)");
			sb.append(" values (?,?,?)");
			
			ps = con.prepareStatement(sb.toString());
			
			ps.setString(1, pedido.getNomeCliente());
			ps.setInt(2, pedido.getMesa().getId());
			ps.setString(3, pedido.getProduto().getNome());
			
			ps.execute();
			return true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}
	
public boolean geraComanda(Pedido pedido) {
		
		try {
			StringBuilder sb = new StringBuilder();
			sb.append(" insert into tb_comanda (id_produto, id_pedido)");
			sb.append(" values (?,?)");
			ps = con.prepareStatement(sb.toString());
			
			ps.setInt(1, pedido.getProduto().getId());
			ps.setInt(2, pedido.getId());
			
			ps.execute();
			return true;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return false;
	}

public static Pedido getClienteSelecionado(int id){  
    Pedido  pedido = null;  
    try{  
        
        PreparedStatement ps=con.prepareStatement("select * from tb_pedido a where a.id=?");  
        ps.setInt(1,id);  
        ResultSet rs=ps.executeQuery();  
        while(rs.next()){  
        	pedido = new Pedido();
			pedido.setId(rs.getInt("A.id"));
			pedido.setNomeCliente(rs.getString("A.nome_cliente"));
        }  
    }catch(Exception e){System.out.println(e);}  
    return pedido;  
}  

	public List<Pedido> all() {

		List<Pedido> lstpedido = new ArrayList<>();

		String sql = "SELECT  A.ID, A.NOME_CLIENTE, A.ID_MESA, A.PRODUTO,M.QTD_LUGAR  FROM TB_PEDIDO A, TB_MESA M WHERE A.ID_MESA = M.ID_MESA ";

		try {
			ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Pedido pedido = new Pedido();
				pedido.setId(rs.getInt("A.id"));
				pedido.setNomeCliente(rs.getString("A.nome_cliente"));
				pedido.setMesa(new Mesa(rs.getInt("A.id_mesa")));
				pedido.getMesa().setQtd_lugar(rs.getInt("M.qtd_lugar"));
				pedido.setProduto(rs.getString("A.produto"));
				
				lstpedido.add(pedido);
			}
		
	} catch (SQLException e) {
		e.printStackTrace();
	}	
	return lstpedido;
	}
	
	public static int alterar(Pedido pedido) throws SQLException {

		  int status=0;  
		try {

			PreparedStatement stmt = con
					.prepareStatement("UPDATE tb_pedido SET id_mesa=?, produto=? WHERE id=?");

			stmt.setInt(   1, pedido.getMesa().getId());
			stmt.setString(   2, pedido.getProduto().getNome());
			stmt.setInt(   3, pedido.getId());
			
			status = stmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.toString());
		} finally {

			con.close();

		}
		return status;
	}
	
	public static int apagar(Pedido p){  
	    int status=0;  
	    try{   
	        PreparedStatement ps=con.prepareStatement("delete from tb_pedido where id=?");  
	        ps.setInt(1,p.getId());  
	        status=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}  
}
