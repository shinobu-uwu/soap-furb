import {Container, Form, FormGroup} from "react-bootstrap";

export default function Login() {
    return (
        <>
            <div id="alerta">

            </div>
            <Form>
                <Container>
                    <FormGroup className="mb-3">
                        <Form.Label>Login</Form.Label>
                        <Form.Control type="text" required id="login"/>
                    </FormGroup>
                    <FormGroup className="mb-3">
                        <Form.Label>Senha</Form.Label>
                        <Form.Control type="password" required id="senha"/>
                    </FormGroup>
                    <button type="submit" className="btn btn-primary" id="autenticar">Autenticar</button>
                </Container>
            </Form>
        </>
    )
}