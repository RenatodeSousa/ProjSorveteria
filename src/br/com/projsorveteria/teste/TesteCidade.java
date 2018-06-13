package br.com.projsorveteria.teste;

import br.com.projsorveteria.db.CidadeDB;
import br.com.projsorveteria.model.Cidade;

public class TesteCidade {

	 public static void main(String[] args) {
		
		
		 Cidade c = new Cidade();
		 
			c.setNome("Taquaritinga");
			c.setQtdHabitantes(2000);
			
			if(new CidadeDB().insert(c)) {
				System.out.println("registro inserido ");
			
			}else {
				System.out.println("erro ao inserir o registro");
			}
	}
	
	
}
