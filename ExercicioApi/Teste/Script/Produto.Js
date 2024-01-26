async function cadastrarP(){
    let auxA = document.getElementById("descricao").value
    let auxS = document.getElementById("preco").value
    let auxD = document.getElementById("estoque").value
    let auxF = document.getElementById("categoria").value

    let obj = 
    {
        descricao: auxA,
        preco: auxS,
        estoque: auxD,
        categoria: auxF
    }
    if(auxA != "" && auxS !="" && auxD != "" && auxF != "")
    {
        await fetch('http://localhost:5171/api/Produtos',
        {
            method: "POST",
            headers: {'Authorization': 'Bearer ' + token,'Content-Type' : 'application/json'},
            body: JSON.stringify(obj)
        })

    }
}


function carregar() {
    produto = ''
    tabela = document.getElementsByTagName("tbody")[0]
    tabela.innerHTML = ''
    fetch('http://localhost:5171/api/Produtos')
    .then(data => {
        return data.json();
    })
    .then(post => {
        post.forEach(element => {
            produto = `<tr>
                <td>${element.id}</td>
                <td>${element.descricao}</td>
                <td>${element.estoque}</td>
                <td>${element.preco}</td>
                <td>${JSON.stringify(element.categoria)}</td>
                </tr>`
            tabela.innerHTML += produto
        
        });
    });   
    let table = document.getElementById("tabela")
    table.removeAttribute("hidden")
    console.log(produto)
}