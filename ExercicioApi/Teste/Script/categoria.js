async function cadastrarC(){
    let auxS = document.getElementById("nome").value

    let obj = 
    {
        nome: auxS
      
    }
    if(auxS !="")
    {
        await fetch('http://localhost:5171/api/Categorias',
        {
            method: "POST",
            headers: {'Authorization': 'Bearer ' + token,'Content-Type' : 'application/json'},
            body: JSON.stringify(obj)
        })

    }
}