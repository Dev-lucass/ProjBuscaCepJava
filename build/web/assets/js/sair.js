$("#button-avaliar").text("Avaliar");

$("#button-avaliar").on("click", () => {
     $("#button-avaliar").toggleClass("bg-danger border-0")

    if($("#button-avaliar").text() === "Avaliar"){
        $("#button-avaliar").text("Sair");
    }else{
        $("#button-avaliar").text("Avaliar");
    }
});

// config

$("#button-config").text('Config');

$("#button-config").on("click", () => {
     $("#button-config").toggleClass("bg-danger border-0")

    if($("#button-config").text() === "Config"){
        $("#button-config").text("Sair");
    }else{
        $("#button-config").text("Config");
    }
});



$("#button-sobre").text('Sobre');

$("#button-sobre").on("click", () => {
     $("#button-sobre").toggleClass("bg-danger border-0")

    if($("#button-sobre").text() === "Sobre"){
        $("#button-sobre").text("Sair");
    }else{
        $("#button-sobre").text("Sobre");
    }
});



