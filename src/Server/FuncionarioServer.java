package Server;


import Exceptions.ParametroInvalidoException;
import Ponto.Empresa;
import Ponto.Funcionario;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;

@WebService
@SOAPBinding(style = SOAPBinding.Style.RPC)
public interface FuncionarioServer {
    @WebMethod
    void criar(String nomeFuncionario) throws ParametroInvalidoException;

    @WebMethod
    Empresa ler(String nomeFuncionario) throws Exception;

    @WebMethod
    void atualizar(Funcionario funcionario, String nome) throws ParametroInvalidoException;

    @WebMethod
    void deletar(Funcionario funcionario);
}