package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.*;
import com.svalero.webappcrud.domain.Breed;
import com.svalero.webappcrud.domain.Color;
import com.svalero.webappcrud.domain.Gender;
import com.svalero.webappcrud.domain.State;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/edit-cat")
public class editCat extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;

            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String description = request.getParameter("description");
            String image = request.getParameter("image2");

            Database.connect();
            Gender genderId = Database.jdbi.withExtension(GenderDao.class, dao -> dao.getIdGender(request.getParameter("gender")));
            int gender = genderId.getGenderID();
            Breed breedId = Database.jdbi.withExtension(BreedDao.class, dao -> dao.getIdBreed(request.getParameter("breed")));
            int breed = breedId.getBreedID();
            Color colorId = Database.jdbi.withExtension(ColorDao.class, dao -> dao.getIdColor(request.getParameter("color")));
            int color = colorId.getColorID();
            State stateId = Database.jdbi.withExtension(StateDao.class, dao -> dao.getIdState(request.getParameter("state")));
            int state = stateId.getStateID();

            String location = request.getParameter("location");

            int affectedRows = Database.jdbi.withExtension(CatDao.class,
                    dao -> dao.addCat(name, age, description, image, gender, breed, color, state, location));
            Database.close();

            sendMessage("Nuevo miembro registrado correctamente", response);
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

        if (request.getParameter("name").isBlank()) {
            sendError("El nombre es un campo obligatorio", response);
            hasErrors = true;
        }

        if (request.getParameter("age").isBlank()) {
            sendError("La edad es un campo obligatorio", response);
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
