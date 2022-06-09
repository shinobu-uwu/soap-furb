function Header() {
    return (
        <>
            <header>
                <nav className="navbar navbar-dark bg-dark navbar-expand-lg navbar-light">
                    <div className="container-fluid">
                        <a className="navbar-brand text-white" href="/"><b>Piróquitos</b></a>
                    </div>
                    <div className="container-fluid text-white justify-content-end" id="user-login">
                        <p className="m-lg-0">Usuário não autenticado</p>
                    </div>
                </nav>
            </header>
        </>
    );
}

export default Header;