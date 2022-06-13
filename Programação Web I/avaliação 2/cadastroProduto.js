function getProduto() {
    return {
        codigoBarras: document.getElementById('codigo-barras').value,
        nome: document.getElementById('nome').value,
        marca: document.getElementById('marca').value,
        quantidade: document.getElementById('quantidade').value
    };
}

function cadastrarProduto() {
    const produto = getProduto();
    localStorage.setItem(produto.codigoBarras, JSON.stringify(produto));
    const bodyTabela = document.getElementById('produtos');

    // Colocamos o id da tr como o código de barras para conseguirmos achar para excluir e editar o registro
    bodyTabela.innerHTML += `
        <tr id="${produto.codigoBarras}">
            <td>${produto.codigoBarras}</td>
            <td>${produto.nome}</td>
            <td>${produto.marca}</td>
            <td>${produto.quantidade}</td>
            <td><button class="btn btn-success" onclick="editarProduto('${produto.codigoBarras}')"></button></td>
            <td><button class="btn btn-danger" onclick="excluirProduto('${produto.codigoBarras}')"></button></td>
        </tr>
    `;
}

function editarProduto(codigoBarras) {
    let tableRow = document.getElementById(codigoBarras);
    const produto = getProduto();

    tableRow.id = produto.codigoBarras;
    tableRow.innerHTML = `
        <td>${produto.codigoBarras}</td>
        <td>${produto.nome}</td>
        <td>${produto.marca}</td>
        <td>${produto.quantidade}</td>
        <td><button class="btn btn-success" onclick="editarProduto('${produto.codigoBarras}')"></button></td>
        <td><button class="btn btn-danger" onclick="excluirProduto('${produto.codigoBarras}')"></button></td>
    `;
}

function excluirProduto(codigoBarras) {
    localStorage.removeItem(codigoBarras);
    document.getElementById(codigoBarras).remove();
}

const bodyTabela = document.getElementById('produtos');
for (let i = 0; i < localStorage.length; i++) {
    const produto = JSON.parse(localStorage.getItem(localStorage.key(i)));
    bodyTabela.innerHTML += `
        <tr id="${produto.codigoBarras}">
            <td>${produto.codigoBarras}</td>
            <td>${produto.nome}</td>
            <td>${produto.marca}</td>
            <td>${produto.quantidade}</td>
            <td><button class="btn btn-success" onclick="editarProduto('${produto.codigoBarras}')"></button></td>
            <td><button class="btn btn-danger" onclick="excluirProduto('${produto.codigoBarras}')"></button></td>
        </tr>
    `;
}
