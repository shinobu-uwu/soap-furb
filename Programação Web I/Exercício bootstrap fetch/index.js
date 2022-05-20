function getCards() {
    fetch('https://jsonplaceholder.typicode.com/photos')
        .then(resposta => resposta.json())
        .then(cards => {
            let i = 0;
            let row = document.createElement('div');
            row.classList.add('row');
            row.classList.add('m-3');
            
            for (const card of cards) {
                if (i === 4) {
                    document.getElementById('principal').appendChild(row) ;
                    row = document.createElement('div');
                    row.classList.add('row');
                    row.classList.add('m-3');
                    i = 0;
                }
                if (card.albumId === 1) {
                    row.innerHTML += `
                        <div class="col-md-3">
                            <div class="card bg-dark text-white">
                                <img src="${card.thumbnailUrl}" class="card-img" alt="...">
                                <div class="card-img-overlay">
                                    <h5 class="card-title">${card.title}</h5>
                                </div>
                            </div>
                        </div>`;
                    i++;
                }
            }
        });
}

getCards();