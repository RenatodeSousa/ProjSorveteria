package br.com.projsorveteria.model;

public class Mesa {

	private int qtd_lugar;
	private int id;
	
	public Mesa(int idMesa) {
		this.id = idMesa;
		
	}
	public Mesa() {
	
	}
	public int getQtd_lugar() {
		return qtd_lugar;
	}
	public void setQtd_lugar(int qtd_lugar) {
		this.qtd_lugar = qtd_lugar;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
}
