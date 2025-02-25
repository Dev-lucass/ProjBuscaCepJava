package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogoutController", urlPatterns = {"/logout"})
public class Logout extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtém a sessão existente (não cria uma nova)
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalida a sessão, ou seja, faz logout
            session.invalidate();
        }

        // Redireciona para a página inicial após o logout
        response.sendRedirect("./index.jsp");
    }
}
