package com.svalero.webappcrud.servlet;

import com.svalero.webappcrud.dao.UserDao;
import com.svalero.webappcrud.dao.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/remove-user")
public class removeUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int userID = Integer.parseInt(request.getParameter("id"));

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.removeUser(userID));

            response.sendRedirect("view-users.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
