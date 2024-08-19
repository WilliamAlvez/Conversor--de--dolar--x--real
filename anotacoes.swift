// JavaScript - Curso 

// Variaveis:
let / var / const 
exemplo:
let idade = 90

// String todo nome que fica entre ""
exemplo:
let nome = "William"

// console.log: para ver as informacoes no console

//  Boolean
let logado = true / false 

// array e objetos:
let ingrediente1 = ["farinha","agua","sal","corante"]

// => arrow function:
=>

// // if: se
//  else: se nao for 

 let idade = 18
 let nome = "joao"
 let logado = false
 let ingrediente1 = ["farinha","agua","sal","corante"]

 if (nome == "William") {
     console.log("mensagem especial")
 } else {
     console.log("mensagem normal")
 }

// para somar:

function somar (a, b) {
    let resultado = a + b
    return resultado 
}

let x = somar(15, 5)
let y = somar(2, 8)

// loop

 let lista = [10, 20, 30, 40]

for(let item of lista) {
    console.log(item)
}

// caixa de alerta
alert("opa, aqui está um aviso!")  aviso de alerta

// um evento de clique
let botao = document.querySelector("#botao")

botao.addEventListener("click", () => {
    avisar()
})

click = evento de click
mouseover = evento de passar o mouse encima.

// evento para saber quantas vezes foi digitado em cada campo.

let usdInput = document.querySelector("#usd")
let brlInput = document.querySelector("#brl")

usdInput.addEventListener("keyup", () => {
    console.log(usdInput.value)
})

brlInput.addEventListener("keyup", () => {
    console.log("apertou no campo BRL")
})

// para registrar os valores que estao sendo digitando no campo.

usdInput.addEventListener("keyup", () => {
    console.log(usdInput.value)
})


// Função para buscar o valor do dólar atualizado
async function getDollarRate() {
    try {
        let response = await fetch('https://api.exchangerate-api.com/v4/latest/USD');
        let data = await response.json();
        console.log('Resposta da API:', data); // Adiciona este log para inspecionar a resposta completa
        return data.rates.BRL; // Retorna a taxa de câmbio do dólar para o real
    } catch (error) {
        console.error('Erro ao buscar a taxa de câmbio:', error);
        return dolar; // Retorna o valor padrão em caso de erro
    }
}

usdInput.value = "1,00";

async function initConversion() {
    dolar = await getDollarRate();
    console.log(`Valor do dólar obtido: R$ ${dolar}`);
    convert("usd-to-brl");
}

// significados

let =
var = Variaveis
const =
String = ""
Boolean = true / false
array = []
arrow function = =>
== = igual
!= = diferente
> = maior
< = menor
>= = maior/igual
<= = menor/igual
value = valor
if = se
else = se nao for
function = funcao
querySelector = selecionar
addEventListener = adicionar evento
parseFloat = 
replace = trocar
formatCurrency = formatar