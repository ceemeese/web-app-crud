package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.AdoptionDao;
import com.svalero.webappcrud.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/remove-adoption")
public class removeAdoption extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int adoptionID = Integer.parseInt(request.getParameter("adoptionID"));

        HttpSession currentSession = request.getSession();
        if (currentSession.getAttribute("role") != null) {
            if (!currentSession.getAttribute("role").equals("admin")) {
                response.sendRedirect("/webapp");
            }
        }

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(AdoptionDao.class,
                    dao -> dao.removeAdoption(adoptionID));

            response.sendRedirect("view-adoptions.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
