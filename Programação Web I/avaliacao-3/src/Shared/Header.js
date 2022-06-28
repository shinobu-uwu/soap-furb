import {Container, Nav, Navbar} from "react-bootstrap";
import {useState} from "react";
import avatar from '../avatar.webp';

export default function Header() {
    const [user, setUser] = useState();

    return (
        <header>
            <Navbar bg="dark" expand="lg">
                <Container>
                    <Navbar.Brand className="text-white" href="/"><b>Piróquitos</b></Navbar.Brand>
                </Container>
                <Container className="text-white justify-content-end" id="user-login">
                    {getUser(user)}
                </Container>
            </Navbar>
        </header>
    );
}

function getUser(user) {
    if (user) {
        return (
            <>
                <p className="m-lg-0">{user}</p>
                <a href="/cadastro">
                    <img width="50" height="50" src={avatar} alt="Avatar do usuário"
                         className="img-fluid img-thumbnail"/>
                </a>
            </>
        );
    }
    return <Nav.Item className="m-lg-0">Usuário não autenticado</Nav.Item>;
}