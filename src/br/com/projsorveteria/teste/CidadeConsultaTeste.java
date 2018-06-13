package br.com.projsorveteria.teste;

import br.com.projsorveteria.db.CidadeDB;
import br.com.projsorveteria.model.Cidade;

public class CidadeConsultaTeste {

	public static void main(String[] args) {
		
		for (Cidade cidade : new CidadeDB().all()) {
			System.out.println("id:"+ cidade.getId());
			System.out.println("nome"+cidade.getNome());
			System.out.println("qtd_habitante"+cidade.getQtdHabitantes());
		}
	}
}
