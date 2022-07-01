import {Button, ButtonToolbar, Container, Form, FormControl, FormGroup} from "react-bootstrap";
import {useState} from "react";
import {Cadastro} from './Modelos/Cadastro';

export default function Cadastro2() {
    const [cadastro, setCadastro] = useState(new Cadastro());

    const lidaRequisicao = () => {
        fetch('https://bu.furb.br/mcardoso/progWeb/apiRestAval.php/cadastro/')
            .then(r => {
                if (r.status !== 200) {
                    return;
                }
                return r.json()
            })
            .then(json => console.log(json))
    }

    return (<Form>
            <Container>
                <FormGroup className="mb-3">
                    <Form.Label>Id</Form.Label>
                    <FormControl type="text" id="id" required></FormControl>
                </FormGroup>
                <Button onClick={lidaRequisicao}>Enviar</Button>
            </Container>
        </Form>
    );
}