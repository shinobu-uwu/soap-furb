import Cliente.EmpresaCliente;
import Ponto.Empresa;
import Server.EmpresaServerImpl;
import Server.FuncionarioServerImpl;

import javax.xml.ws.Endpoint;

public class Main {
    public static void main(String[] args) throws Exception {
        System.out.println("Iniciando o servidor");
        Endpoint.publish(
                "http://127.0.0.1:9876/empresa",
                new EmpresaServerImpl()
        );

        Endpoint.publish(
                "http://127.0.0.1:9876/funcionario",
                new FuncionarioServerImpl()
        );

        EmpresaCliente cliente = new EmpresaCliente();
        cliente.adicionar("Abc");
        cliente.adicionar("Dfg");
        Empresa empresa1 = cliente.ler("Abc");
        cliente.atualizar(empresa1.getNome(), "Piriquito");
        Empresa empresa2 = cliente.ler("Dfg");
        cliente.deletar(empresa2.getNome());
        Empresa[] empresas = cliente.lerTodas();

        for (Empresa empresa : empresas) {
            System.out.println(empresa.getNome());
        }
    }
}
