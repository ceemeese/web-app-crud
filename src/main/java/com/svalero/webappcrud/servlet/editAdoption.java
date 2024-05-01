package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.AdoptionDao;
import com.svalero.webappcrud.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/edit-adoption")
public class editAdoption extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;

            String infoAdoption = request.getParameter("infoAdoption");
            int userID = Integer.parseInt(request.getParameter("userID"));
            int catID = Integer.parseInt(request.getParameter("catID"));
            int statusAdoptionID = Integer.parseInt(request.getParameter("statusAdoptionID"));
            Date dateAdoption = Date.valueOf(LocalDate.now());

            Database.connect();
            int affectedRows = Database.jdbi.withExtension(AdoptionDao.class, dao -> dao.addAdoption(dateAdoption, infoAdoption, userID, catID, statusAdoptionID));
            Database.close();

            sendMessage("Adopción registrada", response);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            sendError("Se ha producido un error", response);
        } catch (SQLException e) {
            e.printStackTrace();
            sendError("Se ha producido un error durante la ejecución de la consulta", response);
        } catch (Exception e) {
            e.printStackTrace();
            sendError(e.getMessage(), response);
        }
    }

    private boolean hasValidationErrors(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean hasErrors = false;

        if (request.getParameter("userID").isBlank()) {
            sendError("Es obligatorio indicar un usuario", response);
            hasErrors = true;
        }

        if (request.getParameter("catID").isBlank()) {
            sendError("Es obligatorio indicar un gato", response);
            hasErrors = true;
        }

        return hasErrors;
    }

    private void sendError(String message, HttpServletResponse response) throws IOException {
        response.getWriter().println("<div class='alert alert-danger' role='alert'>" + message + "</div>");
    }

    private void sendMessage(String message, HttpServletResponse response) throws IOException {
        response.getWriter().println("<div class='alert alert-success' role='alert'>" + message + "</div>");
    }

}
