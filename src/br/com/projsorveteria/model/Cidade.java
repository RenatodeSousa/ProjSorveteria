package br.com.projsorveteria.model;

public class Cidade {

	private int id;
	private String nome;
	private int qtdHabitantes;
	
	public Cidade(){}
	
	public Cidade(String nome) {
		this.nome = nome;
		
	}

	public Cidade (int id, String nome) {
		this.id = id;
		this.nome = nome;
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
	public int getQtdHabitantes() {
		return qtdHabitantes;
	}
	public void setQtdHabitantes(int qtdHabitantes) {
		this.qtdHabitantes = qtdHabitantes;
	}
	
}
