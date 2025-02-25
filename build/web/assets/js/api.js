$(document).ready(function() {
    // Função para buscar o CEP
    function buscarCep() {
        const cep = $('#cep').val().replace(/\D/g, ''); // Remover qualquer caractere não numérico

        if (cep === "") {
            alert("Por favor, insira um CEP.");
            return;
        }

        // Verifica se o CEP tem o formato correto
        if (!/^\d{8}$/.test(cep)) {
            alert("CEP inválido. O CEP deve conter 8 dígitos.");
            return;
        }

        // Chama a API ViaCEP
        $.getJSON(`https://viacep.com.br/ws/${cep}/json/`, function(data) {
            if (data.erro) {
                alert("CEP não encontrado.");
                $('#resultado').html("");  // Limpa o resultado se o CEP não for encontrado
                return;
            }

            // Exibe as informações do CEP
            $('#resultado').html(`
                <h5>Endereço encontrado:</h5>
                <p><strong>Logradouro:</strong> ${data.logradouro}</p>
                <p><strong>Bairro:</strong> ${data.bairro}</p>
                <p><strong>Cidade:</strong> ${data.localidade}</p>
                <p><strong>Estado:</strong> ${data.uf}</p>
            `);
        }).fail(function() {
            alert("Erro ao buscar o CEP.");
            $('#resultado').html("");  // Limpa o resultado em caso de falha na requisição
        });
    }

    // Evento de clique no botão "Buscar"
    $('#buscar').click(function(event) {
        event.preventDefault();  // Previne o comportamento padrão do formulário (não recarregar a página)
        buscarCep();
    });

    // Função para limpar os resultados
    $('#limpar').click(function() {
        $('#cep').val("");
        $('#resultado').html("");
    });
});
