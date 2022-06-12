function cadastrarProduto() {
    let codigoBarras = document.getElementById('codigo-barras').value;
    let produto = {
        nome: document.getElementById('nome').value,
        marca: document.getElementById('marca').value,
        quantidade: document.getElementById('quantidade').value
    };

    localStorage.setItem(codigoBarras, JSON.stringify(produto));
    let bodyTabela = document.getElementById('produtos');
    bodyTabela.innerHTML += `
        <td>${codigoBarras}</td>
        <td>${produto.nome}</td>
        <td>${produto.marca}</td>
        <td>${produto.quantidade}</td>
    `;
}
