import {Container, Nav, Navbar} from "react-bootstrap";
import {useEffect, useState} from "react";
import avatar from '../avatar.webp';
import Cookies from 'js-cookie';

export default function Header() {
    const [usuario, setUsuario] = useState();
    useEffect(() => setUsuario(Cookies.get('username')), []);

    return (
        <header>
            <Navbar bg="dark" expand="lg">
                <Container>
                    <Navbar.Brand className="text-white" href="/"><b>Piróquitos</b></Navbar.Brand>
                </Container>
                <Container className="text-white justify-content-end" id="user-login">
                    {getUserComponent(usuario)}
                </Container>
            </Navbar>
        </header>
    );
}

function getUserComponent(user) {
    if (!user) {
        return <Nav.Item>Usuário não autenticado</Nav.Item>
    }

    return (
        <>
            <p className="m-lg-0" style={{paddingRight: 12 + 'px'}}>{user}</p>
            <a href="/Login">
                <img width="50" height="50" src={avatar} alt="Avatar do usuário" className="img-fluid img-thumbnail"/>
            </a>
        </>
    );
}
