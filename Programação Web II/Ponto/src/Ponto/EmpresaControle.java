package Ponto;

import java.util.ArrayList;

import Exceptions.ParametroInvalidoException;

public class EmpresaControle {
    private static ArrayList<Empresa> empresas = new ArrayList<Empresa>();

    public void CriarEmpresa(String nomeEmpresa) throws ParametroInvalidoException {
        if (nomeEmpresa.isEmpty()) {
            throw new ParametroInvalidoException();
        }

        empresas.add(new Empresa(nomeEmpresa));
    }

    public void Editar(String nomeAntigo, String nome) throws ParametroInvalidoException {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }

        for (Empresa empresa : empresas) {
            if (empresa.getNome().equals(nomeAntigo)) {
                empresa.setNome(nome);
            }
        }
    }

    public void Delete(String nomeEmpresa) {
        empresas.removeIf(empresa -> empresa.getNome().equals(nomeEmpresa));
    }

    public Empresa Ler(String nome) throws Exception {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }

        for (Empresa empresa : empresas) {
            if (empresa.getNome().equals(nome)) {
                return empresa;
            }
        }
        throw new Exception();
    }

    public Empresa[] lerTodas() {
        return empresas.toArray(new Empresa[0]);
    }
}
