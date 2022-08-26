package Server;

import Exceptions.ParametroInvalidoException;
import Ponto.Empresa;
import Ponto.Funcionario;
import Ponto.FuncionarioControle;

public class FuncionarioServerImpl implements FuncionarioServer {
    private FuncionarioControle funcionarioControle = new FuncionarioControle();

    @Override
    public void criar(Empresa empresa, String nomeFuncionario) throws ParametroInvalidoException {
        funcionarioControle.CriarFuncionario(nomeFuncionario, empresa);
    }

    @Override
    public Empresa ler(String nomeFuncionario) throws Exception {
        funcionarioControle.Ler()
    }

    @Override
    public void atualizar(Funcionario funcionario, String nome) throws ParametroInvalidoException {
        funcionarioControle
    }


    @Override
    public void deletar(Funcionario funcionario) {
        funcionarioControle
    }
}
