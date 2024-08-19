let usdInput = document.querySelector("#usd");
let brlInput = document.querySelector("#brl");

let dolar = 5.1; // Valor padrão, caso a API não funcione

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

// Eventos para atualizar a conversão com base nos inputs
usdInput.addEventListener("keyup", () => {
    convert("usd-to-brl");
});

brlInput.addEventListener("keyup", () => {
    convert("brl-to-usd");
});

usdInput.addEventListener("blur", () => {
    usdInput.value = formatCurrency(usdInput.value);
});

brlInput.addEventListener("blur", () => {
    brlInput.value = formatCurrency(brlInput.value);
});

// Função para formatar valores monetários
function formatCurrency(value) {
    let fixedValue = fixValue(value);
    let options = {
        useGrouping: false,
        minimumFractionDigits: 2
    };
    let formatter = new Intl.NumberFormat("pt-BR", options);
    return formatter.format(fixedValue);
}

// Função para ajustar o valor para conversão
function fixValue(value) {
    let fixedValue = value.replace(",", ".");
    let floatValue = parseFloat(fixedValue);
    if (isNaN(floatValue)) {
        floatValue = 0;
    }
    return floatValue;
}

// Função para converter entre USD e BRL
function convert(type) {
    if (type === "usd-to-brl") {
        let fixedValue = fixValue(usdInput.value);
        let result = fixedValue * dolar;
        result = result.toFixed(2);
        brlInput.value = formatCurrency(result);
    }

    if (type === "brl-to-usd") {
        let fixedValue = fixValue(brlInput.value);
        let result = fixedValue / dolar;
        result = result.toFixed(2);
        usdInput.value = formatCurrency(result);
    }
}

// Inicializa a conversão com o valor atualizado do dólar
initConversion();