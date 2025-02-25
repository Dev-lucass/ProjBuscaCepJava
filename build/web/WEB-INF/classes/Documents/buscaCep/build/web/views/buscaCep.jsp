<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <title>CONSULTE COM SEU CEP </title>


    </head>

    <body>

        <main class="d-flex justify-content-center align-items-center bg-light bg-gradient" id="main"
              style="height: 100vh;">
            <div class="container d-flex justify-content-center align-items-center flex-column">

                <!--TITLE AND BUTTON DARK MODE-->
                <div class="row w-100 p-3">
                    <div class="col-12 d-flex justify-content-between align-items-center">
                        <!-- Botão de menu lateral -->
                        <button class="btn btn-link p-3" type="button" data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu">
                            <svg xmlns="http://www.w3.org/2000/svg" id="nav-bar" width="30" height="30"
                                 fill="currentColor" class="bi bi-list text-dark" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M2 2h12a1 1 0 0 1 0 2H2a1 1 0 0 1 0-2zm0 6h12a1 1 0 0 1 0 2H2a1 1 0 0 1 0-2zm0 6h12a1 1 0 0 1 0 2H2a1 1 0 0 1 0-2z" />
                            </svg>
                        </button>

                        <!-- Título -->
                        <h1 class="display-3 text-primary text-center flex-grow-1" id="title">Consulte dados com seu
                            CEP</h1>

                        <!-- Switch de Dark Mode -->
                        <div class="form-check form-switch fs-4">
                            <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                        </div>

                        <!-- Ícone de lua -->
                        <div class="d-flex justify-content-end align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" id="icon" height="30"
                                 fill="currentColor" class="bi bi-circle-half" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 0 8 1zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16" />
                            </svg>
                        </div>
                    </div>
                </div>

                <!--FORM CEP-->
                <div class="row w-100 justify-content-center">
                    <div class="col-12 col-sm-8 col-md-6 col-lg-5">
                        <form  class="form-group p-3">
                            <label for="cep" class="form-label p-3 fs-5" id="label">Informe seu CEP</label>

                            <div class="input-group">
                               <input id="cep" type="text" class="form-control p-4" placeholder="Pesquisar..." aria-label="Pesquisar" list="cep-suggestions" required>

                                <button id="buscar" class="btn btn-primary" type="submit" style="width: 25%;">Buscar</button>

                            </div>

                            <datalist id="cep-suggestions">
                                <option value="12345">
                                <option value="67890">
                                <option value="11111">
                                <option value="22222">
                                <option value="33333">
                            </datalist>

                            <div class="d-flex justify-content-center align-items-center mt-5">
                                <button type="reset" class="btn btn-danger p-3 text-light" style="width: 100%;"
                                        id="limpar">Limpar</button>
                            </div>

                        </form>
                        
                          <!-- Div para exibir os resultados -->
                           <div id="resultado" class="mt-5"></div>

                    </div>
                </div>
            </div>
        </main>

        <!-- Offcanvas Menu -->
        <div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1"
             id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasMenuLabel">Menu</h5>
                <button type="button" id="btn-close" class="btn-close" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
            </div>
            <div class="offcanvas-body d-flex justify-content-center align-items-center w-100 ">

                <ul class="list-group w-100 mt-3">
                    <a href="../views/minhaConta.jsp" class="text-decoration-none">

                         <li class="list-group-item list-group-item-action p-5  fw-bold" id="list">
                          
                              <span class="me-5">
                                   <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                        class="bi bi-person-fill-gear" viewBox="0 0 16 16">
                                        <path
                                             d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4m9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382zM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0" />
                                   </svg>
                              </span>
     
                              minha conta

                         </li>
                         
                    </a>

                    <li class="list-group-item list-group-item-action p-5 " id="list">
                        <span class="me-4"><svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16" />
                            <path
                                d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
                            </svg>
                        </span>


                        <button class="btn btn-primary w-50" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"
                                id="button-sobre">
                            Sobre
                        </button>

                        <!-- Conteúdo colapsável -->
                        <div class="collapse mt-3" id="collapseExample">
                            <div class="card card-body border-1 border border-light" id="sobre">
                                Bem-vindo ao nosso site! Aqui, você pode consultar rapidamente informações de
                                endereços, bairros, cidades e estados com base no CEP fornecido. Nosso objetivo é
                                tornar a busca por dados de localização mais simples e eficiente para você.
                            </div>
                        </div>


                    <li class="list-group-item list-group-item-action p-5 " id="list">

                        <p id="alerta-avaliar"></p>

                        <div class="d-flex justify-content-start align-items-center w-100 gap-4">

                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                 class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                            <path
                                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
                            </svg>

                            <button class="btn btn-primary w-50" id="button-avaliar" type="button"
                                    data-bs-toggle="collapse" data-bs-target="#menu" aria-expanded="false"
                                    aria-controls="menu">
                                Avaliar
                            </button>

                        </div>

                        <form id="form-avaliar">

                            <div class="collapse mt-3" id="menu">
                                <div class="card card-body border-1 border border-light" id="menu-avaliar">

                                    <div class="form-floating">
                                        <select class="form-select" id="floatingSelect"
                                                aria-label="Floating label select example">
                                            <option selected>Selecione uma opção</option>
                                            <option value="1">Ótimo</option>
                                            <option value="2">bom</option>
                                            <option value="3">Ruim</option>
                                        </select>
                                        <label for="floatingSelect">
                                            <img src="../assets/img/star.png" alt="estrela"
                                                 style="width: 20px; height: 20px;">
                                            <img src="../assets/img/star.png" alt="estrela"
                                                 style="width: 20px; height: 20px;">
                                            <img src="../assets/img/star.png" alt="estrela"
                                                 style="width: 20px; height: 20px;">
                                            <img src="../assets/img/star.png" alt="estrela"
                                                 style="width: 20px; height: 20px;">
                                            <img src="../assets/img/star.png" alt="estrela"
                                                 style="width: 20px; height: 20px;">
                                        </label>
                                    </div>

                                    <!-- Mensagem de avaliação fora do select -->
                                    <div class="form-group mt-3" id="menu">
                                        <label for="avaliar">Avaliar:</label>
                                        <input type="search" id="avaliar" class="form-control" maxlength="100"
                                               placeholder="Deixe sua avaliação" required>
                                    </div>

                                    <!-- Botão de enviar -->
                                    <div class="mt-3">
                                        <button type="submit" class="btn btn-primary">Enviar Avaliação</button>
                                    </div>
                                    </form>

                        
                                    <a href="../logout" class="text-danger text-decoration-none">
                                           <li class="list-group-item list-group-item-action p-5 text-danger fw-bold" id="list">
                                                    <span class="me-5">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
                                                        <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15zM11 2h.5a.5.5 0 0 1 .5.5V15h-1zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1"/>
                                                        </svg>

                                                    </span>

                                                    Logout
                                                </li>
                                    </a>
                                 
                                </div>
                            </div>
                    </li>
                </ul>
            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <script src="../assets/js/darkMode.js"></script>
        <script src="../assets/js/formAvaliar.js"></script>
        <script src="../assets/js/sair.js"></script>
        <script src="../assets/js/config.js"></script>
        <script src="../assets/js/api.js" ></script>
    </body>

</html>