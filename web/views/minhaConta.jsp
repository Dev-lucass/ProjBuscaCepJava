<%@page import="DTO.UserDTO"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Tabela Responsiva</title>
     <!-- Bootstrap CSS -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light bg-gradient">

     <div class="container mt-5">
          <h1 class="text-center mb-4 text-uppercase">Minha Conta</h1>

          <% 
            // Obtém o ID do usuário da sessão
            Integer idUsuario = (Integer) session.getAttribute("idUsuario");
            
            if (idUsuario == null) {
                // Caso o ID não esteja na sessão, redireciona para o login
                response.sendRedirect("./index.jsp");
                return;
            }
            
            UserDAO userDAO = new UserDAO();
            UserDTO user = userDAO.buscarPorId(idUsuario); 
            
            if (user != null) { 
          %>
          
          <div class="table-responsive">
               <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                         <tr class="text-center">
                              <th>NOME</th>
                              <th>SENHA</th>
                              <th>OPÇÕES</th>
                         </tr>
                    </thead>
                    <tbody>
                         <tr class="text-center">
                              <td><%= user.getNome() %></td>
                              <td><%= user.getSenha() %></td> <!-- Evitando exibir senha diretamente -->
                              <td class="d-flex justify-content-center align-items-center gap-2">
                                <a href="atualizarDados.jsp?id=<%= user.getId() %>" class="btn btn-primary btn-sm">Atualizar</a>
                                 
                                <form action="../Controller">
                                    <input type="hidden" name="action" value="deletar">
                                    <input type="hidden" name="id" value="<%= user.getId() %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Deletar</button>
                                </form>
                              </td>
                         </tr>
                    </tbody>
               </table>
          </div>
          
          <% } else { %>
               <tr>
                    <td colspan="3" class="text-center text-danger">Usuário não encontrado.</td>
               </tr>
          <% } %>

     </div>
     
     <div class="d-flex justify-content-center align-items-center w-100 mt-4">
         <a href="buscaCep.jsp" class="btn btn-dark text-uppercase px-4 py-3">Voltar para tela anterior</a>
     </div>

     <!-- Bootstrap JS -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
