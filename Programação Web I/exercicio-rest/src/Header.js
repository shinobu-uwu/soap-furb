import {Navbar, Container} from "react-bootstrap";

export function Header() {
    return (
        <Navbar bg="dark" expand="lg">
            <Container>
                <Navbar.Brand className="text-white" href="#home">Exercício REST</Navbar.Brand>
            </Container>
        </Navbar>
    );
}