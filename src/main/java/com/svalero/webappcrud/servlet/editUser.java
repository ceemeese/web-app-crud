package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.Database;
import com.svalero.webappcrud.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

import static com.svalero.webappcrud.util.ErrorUtils.sendError;
import static com.svalero.webappcrud.util.ErrorUtils.sendMessage;

@WebServlet("/edit-user")
public class editUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;

            int userID = 0;
            if (request.getParameter("userID") != null) {
                userID = Integer.parseInt(request.getParameter("userID"));
            }

            String username = request.getParameter("username");
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String address = request.getParameter("address");
            String mobile = request.getParameter("mobile");
            Date register = Date.valueOf(LocalDate.now());
            String role = request.getParameter("role");

            Database.connect();
            if (userID == 0) {
                int affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.addUser(username, pass, email, name, surname, address, mobile, register, role));
                Database.close();
                sendMessage("Nuevo usuario registrado correctamente", response);
            } else {
                final int finalID = userID;
                int affectedRows = Database.jdbi.withExtension(UserDao.class, dao -> dao.updateUser(username, email, name, surname, address, mobile, role, finalID));
                Database.close();
                sendMessage("Usuario modificado correctamente", response);
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
            sendError("El nombre es un campo obligatorio", response);
            hasErrors = true;
        }

        if (request.getParameter("pass").isBlank()) {
            sendError("La contraseña es un campo obligatorio", response);
            hasErrors = true;
        }

        if (request.getParameter("email").isBlank()) {
            sendError("El email es un campo obligatorio", response);
            hasErrors = true;
        }

        return hasErrors;
    }

}
