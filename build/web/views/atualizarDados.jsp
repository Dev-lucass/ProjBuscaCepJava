<%@page import="DTO.UserDTO"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Atualizar Dados</title>
     <link rel="stylesheet" href="../assets/css/estilo.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
    // Pegando o ID da URL com segurança
    int userId = 0;
    try {
        userId = Integer.parseInt(request.getParameter("id"));
    } catch (NumberFormatException e) {
%>
        <script>
            alert("ID inválido!");
            window.location.href = "minhaConta.jsp";
        </script>
<%
        return;
    }

    // Buscando o usuário no banco
    UserDAO userDAO = new UserDAO();
    UserDTO user = userDAO.buscarPorId(userId);

    // Verificando se o usuário existe
    if (user == null) {
%>
        <script>
            alert("Usuário não encontrado!");
            window.location.href = "minhaConta.jsp";
        </script>
<%
        return;
    }
%>

<main class="container-fluid d-flex justify-content-center align-items-center" style="height: 100vh;">
     <section class="w-100 d-flex justify-content-center align-items-center" id="section-main">
          <div class="d-flex justify-content-center align-items-center flex-column" id="div-main-form">
              <div class="d-flex justify-content-center align-items-center" id="div-title">
                    <div class="d-flex justify-content-center align-items-center">
                        <a href="../views/minhaConta.jsp">
                              <svg xmlns="http://www.w3.org/2000/svg" width="40" height="50" fill="currentColor" class="bi bi-arrow-left text-primary" viewBox="0 0 16 16">
                                   <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
                                 </svg>
                             </a> 
                    </div>
                    <div class="d-flex justify-content-center align-items-center" id="title">
                         <h1 class="display-2 text-primary fw-bold">Atualize seus dados</h1>
                    </div>
              </div>

              <div class="d-flex justify-content-center align-items-center w-100">
                    <form action="../Controller" method="POST" class="d-flex justify-content-center align-items-center flex-column gap-4 w-100  fst-italic">
                         <!-- ID oculto para envio -->
                         <input type="hidden" name="id" value="<%= user.getId() %>">
                          <input type="hidden" name="action" value="atualizar">
                         
                         <div class="form-group" id="div-input-nome">
                              <label for="nome" class="form-label fs-5">Nome</label>
                              <input type="text" name="nome" id="nome" class="form-control p-3 w-100" maxlength="255" value="<%= user.getNome() %>" required>
                          </div>

                          <div class="form-group" id="div-input-senha">
                              <label for="senha" class="form-label fs-5">Nova senha</label>
                              <input type="text" name="senha" id="senha" class="form-control p-3 w-100" maxlength="255" value="<%= user.getSenha() %>" required>
                          </div>

                          <div class="form-group d-flex justify-content-center align-items-center gap-3" id="buttons">
                              <button type="reset" class="btn btn-danger fw-bold text-uppercase p-3">Limpar</button>
                              <button type="submit" class="btn btn-primary fw-bold text-uppercase p-3">Atualizar</button>
                         </div>
                    </form>
              </div>
          </div>
     </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
