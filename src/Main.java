import Server.EmpresaServerImpl;

import javax.xml.ws.Endpoint;

public class Main {
    public static void main(String[] args) throws Exception {
        System.out.println("Iniciando o servidor");
        Endpoint.publish(
                "http://127.0.0.1:9876/empresa",
                new EmpresaServerImpl()
        );
    }
}