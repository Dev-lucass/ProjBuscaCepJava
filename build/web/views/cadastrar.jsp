<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="../assets/css/estilo.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <title>Cadastrar-se</title>
</head>
<body>

     <main class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh;">
               
          <section class="w-100 d-flex justify-content-center align-items-center" id="section-main">
               
               <div class="d-flex justify-content-center align-items-center flex-column" id="div-main-form">

                   <div class="d-flex justify-content-center align-items-center" id="div-title">

                         <div class="d-flex justify-content-center align-items-center">
                              <a href="../index.jsp">
                                   <svg xmlns="http://www.w3.org/2000/svg" width="40" height="50" fill="currentColor" class="bi bi-arrow-left text-primary" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
                                      </svg>
                                  </a> 
                         </div>

                         <div class="d-flex justify-content-center align-items-center" id="title">
                              <h1 class="display-2 text-primary fw-bold">Cadastre-se</h1>
                         </div>
                   </div>

                   <div class="d-flex justify-content-center align-items-center w-100">
                    
                       <form action="../Controller" method="post" class="d-flex justify-content-center align-items-center flex-column gap-4 w-100  fst-italic">
                           
                           <input type="hidden" name="action" value="criar">

                           <div class="form-group" id="div-input-nome">
                                   <label for="nome" class="form-label fs-5">Nome</label>
                                   <input type="text" id="nome" name="nome" class="form-control p-3 w-100" maxlength="255" placeholder="Informe seu nome"  required>
                               </div>
                               
                               <div class="form-group " id="div-input-senha">
                                   <label for="senha" class="form-label fs-5">Senha</label>
                                   <input type="password" id="senha" name="senha" class="form-control p-3 w-100" maxlength="255" placeholder="Informe sua senha" required>
                               </div>
                               

                              <div class="form-group d-flex justify-content-center align-items-center gap-3" id="buttons">
                                   <button type="reset" class="btn btn-danger fw-bold text-uppercase p-3">Limpar</button>
                                   <button type="submit" class="btn btn-primary fw-bold text-uppercase p-3">Cadastrar</button>
                              </div>

                         </form>
                   </div>
               </div>

          </section>

     </main>


     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
   
</body>
</html>