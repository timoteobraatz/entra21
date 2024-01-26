async function Logar()
    {
        let resultado = document.querySelector("#resultados")
        let auxU = document.getElementById("name_login").value
        let auxS = document.getElementById("senha_login").value
        let obj = 
        {
            username: auxU,
            password: auxS
        }
        if(auxU != "" && auxS != "")
        {
            fetch('http://localhost:5171/api/Users',
            {
                method: "POST",
                headers: {'Content-Type' : 'application/json'},
                body: JSON.stringify(obj)
            })
            .then(data => data.json())
            .then(resp => {
                localStorage.setItem('token', resp.token)
            })
        }
        if(localStorage.getItem("token") === null){
        resultado.innerHTML = "Login realizado com sucesso!"
    }
    }