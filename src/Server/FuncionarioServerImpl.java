package Server;

import Exceptions.ParametroInvalidoException;
import Ponto.Empresa;
import Ponto.Funcionario;
import Ponto.FuncionarioControle;

public class FuncionarioServerImpl implements FuncionarioServer {

    @Override
    public void criar(String nomeFuncionario) throws ParametroInvalidoException {

    }

    @Override
    public Empresa ler(String nomeFuncionario) throws Exception {
        return null;
    }

    @Override
    public void atualizar(Funcionario funcionario, String nome) throws ParametroInvalidoException {

    }

    @Override
    public void deletar(Funcionario funcionario) {

    }
}
