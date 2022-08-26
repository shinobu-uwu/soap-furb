package Ponto;

import Exceptions.ParametroInvalidoException;

public class FuncionarioControle {
    public void CriarFuncionario(String nome, Empresa empresa) throws ParametroInvalidoException {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }
        empresa.addFuncionario(new Funcionario(nome));
    }

    public void Editar(Funcionario funcionario, String nome) throws ParametroInvalidoException {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }
        funcionario.setNome(nome);
    }

    public void Delete(Empresa empresa, Funcionario func) {
        empresa.RemoveFuncionario(func);
    }

    public Funcionario Ler(String nome, Empresa emp) throws Exception {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }
        for (Funcionario func : emp.getFuncionarios()) {
            if (func.getNome().equals(nome)) {
                return func;
            }

        }
        throw new Exception();
    }
}
