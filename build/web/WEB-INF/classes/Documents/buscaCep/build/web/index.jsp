<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="stylesheet" href="./assets/css/estilo.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <title>LOGIN</title>
</head>
<body>

     <main class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh;">
               
          <section class="w-100 d-flex justify-content-evenly align-items-center" id="section-main">
               
               <div class="d-flex justify-content-center align-items-center" id="div-img">
                    <img src="./assets/img/banner4.jpg" alt="banner de fundo" class="img-fluid ">
               </div>


               <div class="d-flex justify-content-center align-items-center flex-column" id="div-main-form">

                   <div class="d-flex justify-content-center align-items-center" id="div-title">
                         <h1 class="display-1 text-primary fw-bold">Login</h1>
                   </div>

                   <div class="d-flex justify-content-center align-items-center w-100">
                    
                         <form action="./Controller" class="d-flex justify-content-center align-items-center flex-column gap-4 w-100  fst-italic">

                             <input type="hidden" name="action" value="login">
                             
                              <div class="form-group" id="div-input-nome">
                                   <label for="nome" class="form-label fs-5">Nome</label>
                                   <input type="text" name="nome" id="nome" class="form-control p-3 w-100" maxlength="255" placeholder="Informe seu nome"  required>
                               </div>
                               
                               <div class="form-group " id="div-input-senha">
                                   <label for="senha" class="form-label fs-5">Senha</label>
                                   <input type="password" name="senha" id="senha" class="form-control p-3 w-100" maxlength="255" placeholder="Informe sua senha" required>
                               </div>
                               

                              <div class="form-group d-flex justify-content-center align-items-center w-100 ">
                                   <p>Não possui uma conta ainda? <a href="./views/cadastrar.jsp" class="fw-bold">Cadastrar-se</a></p>
                              </div>

                              
                              <div class="form-group d-flex justify-content-center align-items-center w-100 gap-3">
                                   <button type="submit" class="btn btn-primary fw-bold text-uppercase p-3 w-50">Entrar</button>
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