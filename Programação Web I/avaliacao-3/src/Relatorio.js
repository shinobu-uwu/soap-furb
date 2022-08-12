import {Button, Table} from "react-bootstrap";

export default function Relatorio() {
    return (<Table bordered>
        <thead>
        <tr>
            <th>Código de barras</th>
            <th>Nome do produto</th>
            <th>Nome da marca</th>
            <th>Quantidade em estoque</th>
        </tr>
        </thead>
        <tbody>
        {Object.keys(localStorage).map((key) => {
            const produto = JSON.parse(localStorage.getItem(key));
            return (<tr id={produto.codigoBarras}>
                    <td>{produto.codigoBarras}</td>
                    <td>{produto.nome}</td>
                    <td>{produto.marca}</td>
                    <td>{produto.quantidade}</td>
                </tr>);
        })}
        </tbody>
    </Table>);
}