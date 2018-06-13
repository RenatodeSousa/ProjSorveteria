package br.com.projsorveteria.model;

public class Pedido {

	
	private int id;
	private String nomeCliente;
	private Mesa mesa;
	private Produto produto;
	
	
	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto string) {
		this.produto = string;
	}

	public Mesa getMesa() {
		return mesa;
	}

	public void setMesa(Mesa mesa) {
		this.mesa = mesa;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public void setMesa(int id_mesa) {
	this.id = id_mesa;
		
	}

	public void setProduto(String string) {
		// TODO Auto-generated method stub
		
	}

	
	
}
