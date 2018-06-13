package br.com.projsorveteria.model;

public class Produto {
	
	private int id;
	private String nome;
	private String sabor;
	private double valor;
	public Produto(String produto) {
		// TODO Auto-generated constructor stub
	}
	public Produto() {
		
	}
	public Produto(int idProduto) {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSabor() {
		return sabor;
	}
	public void setSabor(String sabor) {
		this.sabor = sabor;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	

}
