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

    public void Editar(Empresa empresa, String nome) throws ParametroInvalidoException {
        if (nome.isEmpty()) {
            throw new ParametroInvalidoException();
        }

        empresa.setNome(nome);
    }

    public void Delete(Empresa empresa) {
        empresas.remove(empresa);
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
