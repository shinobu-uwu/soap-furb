package Server;

import Exceptions.ParametroInvalidoException;
import Ponto.Empresa;
import Ponto.EmpresaControle;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService(name = "empresa", endpointInterface = "Server.EmpresaServer")
public class EmpresaServerImpl implements EmpresaServer {
    private EmpresaControle empresaControle = new EmpresaControle();

    @Override
    public void criar(String nomeEmpresa) throws ParametroInvalidoException {
        empresaControle.CriarEmpresa(nomeEmpresa);
    }

    @Override
    public Empresa ler(String nomeEmpresa) throws Exception {
        return empresaControle.Ler(nomeEmpresa);
    }

    @Override
    public void atualizar(Empresa empresa, String nome) throws ParametroInvalidoException {
        empresaControle.Editar(empresa, nome);
    }

    @Override
    public void deletar(Empresa empresa) {
        empresaControle.Delete(empresa);
    }
}
