package Cliente;

import Exceptions.ParametroInvalidoException;
import Ponto.Empresa;
import Server.EmpresaServer;

import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

public class EmpresaCliente {
    private final EmpresaServer empresaServer;

    public EmpresaCliente() throws MalformedURLException {
        URL url = new URL("http://127.0.0.1:9876/empresa?wsdl");
        QName qname = new QName("http://Server/", "EmpresaServerImplService");
        Service service = Service.create(url, qname);
        empresaServer = service.getPort(EmpresaServer.class);
    }

    public Empresa lerEmpresa(String nome) throws Exception {
        return empresaServer.ler(nome);
    }

    public void adicionarEmpresa(String nome) throws ParametroInvalidoException {
        empresaServer.criar(nome);
    }

    public Empresa[] lerTodas() {
        return empresaServer.lerTodas();
    }
}
