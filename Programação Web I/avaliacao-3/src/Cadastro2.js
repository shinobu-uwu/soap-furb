import {Alert, Button, Col, Form, FormControl, FormGroup, Row, Table} from "react-bootstrap";
import {useState} from "react";
import {Cadastro} from './Modelos/Cadastro';


export default function Cadastro2() {
    const [cadastro, setCadastro] = useState(new Cadastro());
    const [status, setStatus] = useState();

    return (<>
        <h1>Consulta</h1>
        <div className="w-50 mx-auto">
            {status === undefined ? <></> : <Alert variant={status.status === 'Ok' ? 'success' : 'danger'}>
                {status.mensagem}
            </Alert>}
            <Form>
                <FormGroup className="mb-3">
                    <Form.Label>Id</Form.Label>
                    <FormControl type="text" id="id" required></FormControl>
                </FormGroup>
                <Button onClick={async () => setCadastro(await getCadastro(document.getElementById('id').value))}>
                    Enviar
                </Button>
            </Form>
        </div>
        {cadastro.id === undefined ? <></> : <Table borderless className="mt-3">
            <thead>
            <tr>
                <th>Nome</th>
                <th>Email</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>{cadastro.getNome()}</td>
                <td>{cadastro.getEmail()}</td>
                <td><Button variant="danger"
                            onClick={async () => setStatus(await getExclusao(cadastro.id))}>Exclusão</Button></td>
            </tr>
            </tbody>
        </Table>}
        <h1 className="mt-3">Inserção</h1>
        <div className="w-50 mx-auto">
            <Form onSubmit={async (e) => setStatus(await insereCadastro(e))}>
                <Row className="mt-3">
                    <Col>
                        <Form.Label>Id</Form.Label>
                        <Form.Control required name="id" type="text"></Form.Control>
                    </Col>
                    <Col>
                        <Form.Label> Nome</Form.Label>
                        <Form.Control required name="nome" type="text"></Form.Control>
                    </Col>
                </Row>
                <Row className="mt-3">
                    <Col>
                        <Form.Label> Departamento</Form.Label>
                        <Form.Control required name="departamento" type="text"></Form.Control>
                    </Col>
                    <Col>
                        <Form.Label> Endereco</Form.Label>
                        <Form.Control required name="endereco" type="text"></Form.Control>
                    </Col>
                </Row>
                <Row className="mt-3">
                    <Col>
                        <Form.Label>Email</Form.Label>
                        <Form.Control required name="email" type="email"></Form.Control>
                    </Col>
                </Row>
                <Button variant="success" className="mt-3" type="submit">Inserir</Button>
            </Form>
        </div>
    </>);
}

async function getCadastro(id) {
    const response = await fetch(`https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/${id}`)
    const json = await response.json();

    return new Cadastro(json.id, json.nome, json.departamento, json.endereco, json.email);
}

async function getExclusao(id) {
    const response = await fetch(`https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/${id}`, {method: 'DELETE'},)

    return await response.json();
}

async function insereCadastro(e) {
    e.preventDefault();

    const cadastro = new Cadastro(e.target.id.value, e.target.nome.value, e.target.departamento.value, e.target.endereco.value, e.target.email.value);
    const response = await fetch('https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/', {
        method: 'PUT', headers: {
            'Content-Type': 'application/json'
        }, body: JSON.stringify(cadastro)
    });

    return await response.json();
}