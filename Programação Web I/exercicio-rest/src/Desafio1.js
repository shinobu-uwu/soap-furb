import {Button, Col, Container, Form, Row, Table} from "react-bootstrap";
import {useState} from "react";

export function Desafio1() {
    const [post, setPost] = useState({userId: '', title: '', body: ''});

    const pesquisar = (id) => {
        fetch(`https://jsonplaceholder.typicode.com/posts/${id}`)
            .then(response => response.json())
            .then(json => setPost(json));
    };

    const enviarAlteracoes = async (id) => {
        const responsePut = await fetch(`https://jsonplaceholder.typicode.com/posts/${id}`, {
            method: 'PUT',
            body: JSON.stringify(post),
            headers: {
                'Content-Type': 'application/json'
            },
        });
        const json = await responsePut.json();
        document.getElementById('body-tabela').innerHTML += `
            <tr>
                <td>${json.id}</td>
                <td>${json.userId}</td>
                <td>${json.title}</td>
                <td>${json.body}</td>
            </tr>
        `;
    };

    return (
        <>
            <Container>
                <Form>
                    <Form.Group className="m-3">
                        <Row>
                            <Col>
                                <Form.Label>Id</Form.Label>
                                <Form.Control id="id-pesquisa" type="number"></Form.Control>
                            </Col>
                            <Col>
                                <Button onClick={() => pesquisar(document.getElementById('id-pesquisa').value)}>
                                    Pesquisar
                                </Button>
                            </Col>
                        </Row>
                        <Row>
                            <Col>
                                <Form.Label>UserId</Form.Label>
                                <Form.Control value={post.userId} type="number" onChange={(e) => setPost({
                                    userId: e.target.value,
                                    title: post.title,
                                    body: post.body
                                })}></Form.Control>
                                <Form.Label>Title</Form.Label>
                                <Form.Control value={post.title} type="text" onChange={(e) => setPost({
                                    userId: post.userId,
                                    title: e.target.value,
                                    body: post.body
                                })}></Form.Control>
                            </Col>
                            <Col>
                                <Form.Label>Body</Form.Label>
                                <Form.Control value={post.body} as="textarea" rows={4} onChange={(e) => setPost({
                                    userId: post.userId,
                                    title: post.title,
                                    body: e.target.value
                                })}></Form.Control>
                            </Col>
                        </Row>
                        <Button className="mt-3"
                                onClick={() => enviarAlteracoes(document.getElementById('id-pesquisa').value)}>
                            Enviar alterações
                        </Button>
                    </Form.Group>
                </Form>
            </Container>
            <Container>
                <Table striped bordered hover>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>UserId</th>
                        <th>Title</th>
                        <th>Body</th>
                    </tr>
                    </thead>
                    <tbody id="body-tabela"></tbody>
                </Table>
            </Container>
        </>
    );
}