import './App.css';
import {Header} from "./Header";
import {Desafio1} from "./Desafio1";
import 'bootstrap/dist/css/bootstrap.min.css';
import {Desafio2} from "./Desafio2";

function App() {
    return (
        <>
            <Header/>
            <h1 className="text-center mt-3">Desafio 1</h1>
            <Desafio1/>
            <h1 className="text-center mt-3">Desafio 2</h1>
            <Desafio2/>
        </>
    );
}

export default App;
