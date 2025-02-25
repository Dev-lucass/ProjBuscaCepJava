
// FORM
$("#form-avaliar").on("submit", (event) => {
     event.preventDefault();
 
     // Verifica se a opção selecionada é "Selecione uma opção"
     if ($("#floatingSelect").val() === "Selecione uma opção") {
         // Se for, exibe o alerta de erro
         $("#alerta-avaliar").removeClass("d-none");
         $("#alerta-avaliar").text("Por favor, selecione uma opção válida!");
         $("#alerta-avaliar").addClass("alert alert-danger text-center");
 
         // Esconde o alerta após 3000ms (3 segundos)
         setTimeout(() => {
             $("#alerta-avaliar").removeClass("alert alert-danger text-center").addClass("d-none");
         }, 2000);

     } else {
         // Se a opção não for "Selecione uma opção", limpa os campos e exibe o sucesso
         $("#avaliar").val('');
         $("#floatingSelect").prop('selectedIndex', 0);  // Isso faz o select voltar para "Selecione uma opção"
 
         // Exibe o alerta de sucesso
         $("#alerta-avaliar").removeClass("d-none");
         $("#alerta-avaliar").text("Avaliação enviada com sucesso!");
         $("#alerta-avaliar").addClass("alert alert-success text-center");
 
   
         setTimeout(() => {
             $("#alerta-avaliar").addClass("d-none");
         }, 1500);
     }
 });
 
 