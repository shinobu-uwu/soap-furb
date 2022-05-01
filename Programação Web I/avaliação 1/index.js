if (document.cookie.includes('username')) {
    let params = document.cookie.split(';');
    let username = params[0].split('=')[1];
    document.getElementById('user-login').innerHTML = `<p class="m-lg-0" style="padding-right: 12px;">${username}</p> 
        <a href="cadastro.html"><img width="50" height="50" src="avatar.webp" alt="Avatar do usuário" class="img-fluid img-thumbnail"></a>`
}
