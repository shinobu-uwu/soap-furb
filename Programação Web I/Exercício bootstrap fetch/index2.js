function getCards() {
    fetch('https://jsonplaceholder.typicode.com/users')
        .then(response => response.json())
        .then(users => {
            console.log(users);
            let i = 0;
            let row = document.createElement('div');
            row.classList.add('row');
            row.classList.add('m-3');
            for (const user of users) {
                if (i === 3) {
                    document.getElementById('principal').appendChild(row);
                    row = document.createElement('div');
                    row.classList.add('row');
                    row.classList.add('m-3');
                    i = 0;
                }
                row.innerHTML += `
                    <div class="col-md-3 card text-center m-3">
                        <div class="card-header">
                            ${user.username}
                        </div>
                        <div class="card-body">
                            <a href="mailto:${user.email}" class="btn btn-primary">${user.email}</a>
                        </div>
                    </div>`;
                i++;
            }
        });
}

getCards();