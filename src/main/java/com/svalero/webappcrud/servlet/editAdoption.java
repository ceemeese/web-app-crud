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

import static com.svalero.webappcrud.util.ErrorUtils.sendError;
import static com.svalero.webappcrud.util.ErrorUtils.sendMessage;

@WebServlet("/edit-adoption")
public class editAdoption extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;

            int adoptionID = 0;
            if (request.getParameter("adoptionID") != null) {
                adoptionID = Integer.parseInt(request.getParameter("adoptionID"));
            }

            String infoAdoption = request.getParameter("infoAdoption");
            int userID = Integer.parseInt(request.getParameter("userID"));
            int catID = Integer.parseInt(request.getParameter("catID"));
            int statusAdoptionID = Integer.parseInt(request.getParameter("statusAdoptionID"));
            Date dateAdoption = Date.valueOf(LocalDate.now());

            Database.connect();
            if (adoptionID == 0) {
                int affectedRows = Database.jdbi.withExtension(AdoptionDao.class, dao -> dao.addAdoption(dateAdoption, infoAdoption, userID, catID, statusAdoptionID));
                Database.close();
                sendMessage("Adopción registrada", response);
            } else {
                final int finalID = adoptionID;
                int affectedRows = Database.jdbi.withExtension(AdoptionDao.class,
                        dao -> dao.updateAdoption(infoAdoption, userID, catID, statusAdoptionID, finalID));
                Database.close();
                sendMessage("Adopción modificada correctamente", response);

            }

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

}
