package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.BreedDao;
import com.svalero.webappcrud.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/edit-breed")
@MultipartConfig
public class editBreed extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;

            int breedID = 0;
            if (request.getParameter("breedID") != null) {
                breedID = Integer.parseInt(request.getParameter("breedID"));
            }

            String name = request.getParameter("name");
            String description = request.getParameter("description");
            Part picturePart = request.getPart("image");

            //IMAGEN EN DISCO
            String imagePath = request.getServletContext().getInitParameter("image-path");
            String fileName = null;
            if (picturePart.getSize() == 0) {
                fileName = "no-image.jpg";
            } else {
                fileName = UUID.randomUUID() + ".jpg";
                InputStream fileStream = picturePart.getInputStream();
                Files.copy(fileStream, Path.of(imagePath + File.separator + fileName));
            }

            Database.connect();
            final String finalFileName = fileName;
            if (breedID == 0) {
                int affectedRows = Database.jdbi.withExtension(BreedDao.class, dao -> dao.addBreed(name, description, finalFileName));
                Database.close();
                sendMessage("Nueva raza registrada correctamente", response);
            } else {
                final int finalID = breedID;
                int affectedRows = Database.jdbi.withExtension(BreedDao.class,
                        dao -> dao.updateBreed(name, description, finalFileName, finalID));
                Database.close();
                sendMessage("Raza modificada correctamente", response);
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

        if (request.getParameter("name").isBlank()) {
            sendError("El nombre es un campo obligatorio", response);
            hasErrors = true;
        }

        if (request.getParameter("description").isBlank()) {
            sendError("La descripción es un campo obligatorio", response);
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
