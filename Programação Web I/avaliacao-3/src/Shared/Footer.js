import {Container, Nav} from "react-bootstrap";
import {useState} from "react";

export default function Footer() {

    return (
        <Container>
            <footer className="py-3 my-4">
                <Nav className="justify-content-center border-bottom pb-3 mb-3">
                    <Nav.Item><a href="#" className="nav-link px-2 text-muted">Home</a></Nav.Item>
                    <Nav.Item><a href="#" className="nav-link px-2 text-muted">Produtos</a></Nav.Item>
                    <Nav.Item><a href="#" className="nav-link px-2 text-muted">Quem somos</a></Nav.Item>
                    <Nav.Item><a href="#" className="nav-link px-2 text-muted">Contato</a></Nav.Item>
                </Nav>
                <p className="text-center text-muted">&copy; 2022 Supermercado Piróquitos</p>
                <p className="text-center text-muted">&copy; Autoria de Matheus Filipe dos Santos Reinert</p>
            </footer>
        </Container>
    );
}
