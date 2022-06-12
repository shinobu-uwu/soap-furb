document.getElementById('autenticar').onclick = (e) => {
    e.preventDefault();

    let login = document.getElementById('login').value;
    let senha = document.getElementById('senha').value;

    if (!login || !senha) {
        document.getElementById('alerta').innerHTML = '<div class="alert alert-danger">Usuário ou senha inválido</div>';
        return;
    }

    document.cookie = `username=${login};`;
    window.location.href = 'index.html'
};
