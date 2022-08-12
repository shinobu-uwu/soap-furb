import {Container, Form, FormGroup} from "react-bootstrap";
import Cookies from "js-cookie";

export default function Login() {
    return (
        <>
            <div id="alerta"></div>
            <Form className="w-50 mx-auto">
                <Container>
                    <FormGroup className="mb-3">
                        <Form.Label>Login</Form.Label>
                        <Form.Control type="text" required id="login"/>
                    </FormGroup>
                    <FormGroup className="mb-3">
                        <Form.Label>Senha</Form.Label>
                        <Form.Control type="password" required id="senha"/>
                    </FormGroup>
                    <button type="submit" className="btn btn-primary" id="autenticar" onClick={autenticar}>Autenticar</button>
                </Container>
            </Form>
        </>
    )
}

function autenticar(e) {
    e.preventDefault();

    let login = document.getElementById('login').value;
    let senha = document.getElementById('senha').value;

    if (!login || !senha) {
        document.getElementById('alerta').innerHTML = '<div class="alert alert-danger">Usuário ou senha inválido</div>';
        return;
    }

    Cookies.set('username', login);
    window.location.href = '/';
}
