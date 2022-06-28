import {Container, Navbar, Nav, NavDropdown} from "react-bootstrap";
import homeCenter from './home-center.webp';

export default function Home() {
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Container className="justify-content-center">
                    <Nav.Link href="/Home" className="p-3">Home</Nav.Link>
                    <Nav.Link href="#" className="p-3">Produtos</Nav.Link>
                    <NavDropdown title="Quem somos">
                        <NavDropdown.Item href="#">Filiais</NavDropdown.Item>
                        <NavDropdown.Item href="#">Parceiros</NavDropdown.Item>
                        <NavDropdown.Item href="#">Gerentes</NavDropdown.Item>
                    </NavDropdown>
                    <Nav.Link href="/Login" className="p-3">Login</Nav.Link>
                    <Nav.Link href="/Cadastro" className="p-3">Cadastro de produtos</Nav.Link>
                    <Nav.Link href="/Cadastro2" className="p-3">CADASTRO2</Nav.Link>
                </Container>
            </Navbar>
            <div className="px-4 pt-5 my-5 text-center">
                <h1 className="display-4 fw-bold">Supermercado Piróquitos</h1>
                <div className="col-lg-6 mx-auto">
                    <p className="lead mb-4">O mercado Piróquitos tem como missão servir os melhores preços para os
                        melhores produtos
                        disponíveis. Para nós o cliente é sempre a prioridade.</p>
                </div>
                <div className="overflow-hidden">
                    <div className="container px-5">
                        <img src={homeCenter} className="img-fluid border rounded-3 mb-4" alt="Example image"
                             width="1000"
                             height="447" loading="lazy"></img>
                    </div>
                </div>
            </div>
        </>
    );
}