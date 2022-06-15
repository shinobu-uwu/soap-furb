import {Button, Col, Container, Form, FormControl, FormLabel, Row} from "react-bootstrap";

export function Desafio2() {
    return (
        <>
            <Container>
                <Form>
                    <Row>
                        <Col className="m-2">
                            <FormLabel className="m-2">Tente adivinhar o ID do usuário</FormLabel>
                            <FormControl id="id-usuario" className="m-2" type="number"></FormControl>
                            <Button className="m-2" type="button" onClick={async () => {
                                const id = document.getElementById('id-usuario').value;
                                const response = await fetch(`https://bu.furb.br/mcardoso/progWeb/testeApiRest.php/cadastro/${id}`);
                                const json = await response.json();
                                document.getElementById('resposta-json').innerText = JSON.stringify(json, null, 4);
                            }}>Requisição GET
                            </Button>
                            <Button className="m-2" type="button" onClick={async () => {
                                const id = document.getElementById('id-usuario').value;
                                const response = await fetch(`https://bu.furb.br/mcardoso/progWeb/testeApiRest.php/cadastro/${id}`, {method: 'DELETE'});
                                const json = await response.json();

                                if (json.status.includes('<img')) {
                                    document.getElementById('resposta-img').innerHTML = json.status;
                                    document.getElementById('resposta-json').innerHTML = '';
                                } else {
                                    document.getElementById('resposta-json').innerText = JSON.stringify(json, null, 4);
                                    document.getElementById('resposta-img').innerHTML = '';
                                }
                            }}>Requisição DELETE
                            </Button>
                            <Button className="m-2" type="button" onClick={async () => {
                                const id = document.getElementById('id-usuario').value;
                                const cadastro = {
                                    id: id,
                                    nome: "Harry Potter",
                                    departamento: "Aurores",
                                    endereco: "4 Rua dos Alfeneiros",
                                    email: "harry.potter@hogwarts.magic"
                                }
                                const response = await fetch(`https://bu.furb.br/mcardoso/progWeb/testeApiRest.php/cadastro`, {
                                    method: 'PUT',
                                    headers: {
                                        'Content-Type': 'application/json',
                                    },
                                    body: JSON.stringify(cadastro)
                                });
                                const json = await response.json();

                                document.getElementById('resposta-img').innerHTML = '';
                                document.getElementById('resposta-json').innerHTML = '';
                                document.getElementById('resposta-final').innerHTML = json.status;

                            }}>Requisição PUT
                            </Button>
                        </Col>
                        <Col className="m-2">
                            <pre id="resposta-json">
                            </pre>
                            <div id="resposta-img"></div>
                            <div id="resposta-final"></div>
                        </Col>
                    </Row>
                </Form>
            </Container>
        </>
    );
}