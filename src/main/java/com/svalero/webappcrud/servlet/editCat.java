package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.CatDao;
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

import static com.svalero.webappcrud.util.ErrorUtils.sendError;
import static com.svalero.webappcrud.util.ErrorUtils.sendMessage;

@WebServlet("/edit-cat")
@MultipartConfig
public class editCat extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        try {
            if (hasValidationErrors(request, response))
                return;


            int catID = 0;
            if (request.getParameter("catID") != null) {
                catID = Integer.parseInt(request.getParameter("catID"));
            }


            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String description = request.getParameter("description");
            Part picturePart = request.getPart("image2");
            int gender = Integer.parseInt(request.getParameter("gender"));
            int breed = Integer.parseInt(request.getParameter("breed"));
            int color = Integer.parseInt(request.getParameter("color"));
            int state = Integer.parseInt(request.getParameter("state"));
            String location = request.getParameter("location");


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
            if (catID == 0) {
                int affectedRows = Database.jdbi.withExtension(CatDao.class,
                        dao -> dao.addCat(name, age, description, finalFileName, gender, breed, color, state, location));
                Database.close();
                sendMessage("Nuevo miembro registrado correctamente", response);
            } else {
                final int finalID = catID;
                int affectedRows = Database.jdbi.withExtension(CatDao.class,
                        dao -> dao.updateCat(name, age, description, finalFileName, gender, breed, color, state, location, finalID));
                Database.close();
                sendMessage("Miembro modificado correctamente", response);
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

        if (request.getParameter("age").isBlank()) {
            sendError("La edad es un campo obligatorio", response);
            hasErrors = true;
        }

        return hasErrors;
    }

}
