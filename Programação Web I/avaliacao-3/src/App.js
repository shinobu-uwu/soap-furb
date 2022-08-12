import './App.css';
import {BrowserRouter, Route} from "react-router-dom";
import Home from "./Home";
import Cadastro from "./Cadastro";
import {Routes} from "react-router";
import Header from "./Shared/Header";
import Footer from "./Shared/Footer";
import Login from "./Login";
import Relatorio from "./Relatorio";
import Cadastro2 from "./Cadastro2";
import {Container} from "react-bootstrap";

function App() {
    return (
        <div className="App">
            <Header/>
            <Container className="mt-4">
                <BrowserRouter>
                    <Routes>
                        <Route path="/" element={<Home/>}/>
                        <Route path="/cadastro" element={<Cadastro/>}/>
                        <Route path="/login" element={<Login/>}/>
                        <Route path="/cadastro2" element={<Cadastro2/>}/>
                        <Route path="/relatorio" element={<Relatorio/>}/>
                    </Routes>
                </BrowserRouter>
            </Container>
            <Footer/>
        </div>
    );
}

export default App;
