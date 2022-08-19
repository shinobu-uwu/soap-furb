package Ponto;

public class FuncionarioControle {

	public void CriarFuncionario(String nome, Empresa empresa) {
		empresa.addFuncionario(new Funcionario(nome));
	}

	public void Editar(Funcionario funcionario, String nome) {
		funcionario.setNome(nome);
	}

	public void Delete(Empresa empresa, Funcionario func) {
		empresa.RemoveFuncionario(func);
	}

	public Funcionario Ler(String nome, Empresa emp) throws Exception {
		for (Funcionario func : emp.getFuncionarios()) {
			if(func.getNome().equals(nome)) {
				return func;
			}
		}
		throw new Exception();
	}
}
