package Ponto;

import java.util.ArrayList;

public class EmpresaControle {
	private ArrayList<Empresa> empresas = new ArrayList<Empresa>();

	public void CriarEmpresa(String nomeEmpresa, ArrayList<Funcionario> func) {
		empresas.add(new Empresa(nomeEmpresa, func));
	}
	
	public void Editar(Empresa empresa, String nome) {
		empresa.setNome(nome);
	}
	
	public void Delete(Empresa empresa) {
		empresas.remove(empresa);
	}
	
	public Empresa Ler(String nome) throws Exception {
		for (Empresa empresa : empresas) {
			if(empresa.getNome().equals(nome)) {
				return empresa;
			}
		}
		throw new Exception();
	}
}
