const bodyTabela = document.getElementById('produtos');
for (let i = 0; i < localStorage.length; i++) {
    const produto = JSON.parse(localStorage.getItem(localStorage.key(i)));
    bodyTabela.innerHTML += `
        <tr id="${produto.codigoBarras}">
            <td>${produto.codigoBarras}</td>
            <td>${produto.nome}</td>
            <td>${produto.marca}</td>
            <td>${produto.quantidade}</td>
        </tr>
    `;
}
