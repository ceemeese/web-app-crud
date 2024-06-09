package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.Database;
import com.svalero.webappcrud.dao.UserDao;
import com.svalero.webappcrud.domain.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static com.svalero.webappcrud.util.ErrorUtils.sendError;

@WebServlet("/login")
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;


            String username = request.getParameter("username");
            String password = request.getParameter("password");


            Database.connect();
                User user = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.getUserLog(username, password));

                if (user != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("role", user.getRole());
                    response.getWriter().print("ok");

                } else {
                    sendError("El usuario no existe", response);
                }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            sendError("Se ha producido un error", response);
        } catch (SQLException e) {
            e.printStackTrace();
            sendError("Se ha producido un error durante la ejecución de la consulta", response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError("Se ha producido una excepción", response);
        }
    }

    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean hasErrors = false;

        if (request.getParameter("username").isBlank()) {
            sendError("El usuario no puede estar vacío", response);
            hasErrors = true;
        }

        if (request.getParameter("password").isBlank()) {
            sendError("La contraseña no puede estar vacía", response);
            hasErrors = true;
        }

        return hasErrors;
    }

}
