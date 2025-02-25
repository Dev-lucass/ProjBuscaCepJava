$("document").ready(() => {
     $("#flexSwitchCheckDefault").on("click", () => {
          $("#main,#offcanvasMenu,#list,#menu-avaliar,#sobre").toggleClass("bg-dark");
          $("#icon,#label,#title,#nav-bar,#offcanvasMenuLabel,#offCanvasP,#list,#sobre").toggleClass("text-white");
          $("#btn-close").toggleClass("bg-white");
     })
})


