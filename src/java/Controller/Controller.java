package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.UserDAO;
import DTO.UserDTO;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");

        try {
            if (action != null) {
                if (action.equals("criar")) {
                    criarUsuario(request, response);
                } else if (action.equals("atualizar")) {
                    atualizarUsuario(request, response);
                } else if (action.equals("deletar")) {
                    deletarUsuario(request, response);
                } else if (action.equals("login")) {
                    loginUsuario(request, response); 
                } else {
                    response.getWriter().println("<h1>Ação inválida!</h1>");
                }
            }
        } catch (Exception e) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, e);
            response.getWriter().println("<h1>Erro: " + e.getMessage() + "</h1>");
        }
    }

    private void criarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");

        if (nome == null || nome.isEmpty() || senha == null || senha.isEmpty()) {
            response.getWriter().println("<script>alert('Nome e senha são obrigatórios!')</script>");
            return;
        }

        UserDAO userDAO = new UserDAO();
        userDAO.criarUsuario(nome, senha);

        response.sendRedirect("./index.jsp");
    }

    private void atualizarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");

        if (nome == null || nome.isEmpty() || senha == null || senha.isEmpty()) {
            response.getWriter().println("<script>alert('Nome e senha são obrigatórios para atualizar!')</script>");
            return;
        }

        UserDAO userDAO = new UserDAO();

        try {
            userDAO.atualizarUsuario(id, nome, senha);

            response.sendRedirect("./views/minhaConta.jsp");
        } catch (Exception e) {
            response.getWriter().println("<h1>Erro ao atualizar usuário: " + e.getMessage() + "</h1>");
        }
    }

    private void deletarUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO userDAO = new UserDAO();

        try {
            boolean deletado = userDAO.deletarUsuario(id); // Aqui chamamos o método do DAO para deletar o usuário

            if (deletado) {
                // Redireciona para a página index.jsp após a exclusão
                response.sendRedirect("./index.jsp");
            } else {
                response.getWriter().println("<script>alert('Erro ao deletar o usuário!')</script>");
            }
        } catch (Exception e) {
            response.getWriter().println("<h1>Erro ao deletar usuário: " + e.getMessage() + "</h1>");
        }
    }

private void loginUsuario(HttpServletRequest request, HttpServletResponse response) throws Exception {
    // Verifica se o usuário já está logado
    HttpSession session = request.getSession(false);  // Não cria uma nova sessão, só obtém a existente

   

    String nome = request.getParameter("nome");
    String senha = request.getParameter("senha");

    if (nome == null || nome.isEmpty() || senha == null || senha.isEmpty()) {
        response.getWriter().println("<script> alert('Nome e senha são obrigatórios!') </script>");
        return;
    }

    UserDAO userDAO = new UserDAO();
    UserDTO usuario = userDAO.realizarLogin(nome, senha);  // Agora você recebe um UserDTO

    if (usuario != null) {
        // Armazena o ID do usuário na sessão
        session = request.getSession();  // Cria uma nova sessão, se necessário
        session.setAttribute("idUsuario", usuario.getId());

        // Redireciona para a página desejada após o login
        response.sendRedirect("./views/buscaCep.jsp");
    } else {
       response.getWriter().println("<script>alert('Nome de usuário ou senha incorretos!'); location.href='./index.jsp';</script>");
;
    }
}


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controller Servlet para gerenciar usuários";
    }
}
