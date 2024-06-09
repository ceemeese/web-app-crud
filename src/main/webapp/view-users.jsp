<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.domain.User" %>
<%@ page import="com.svalero.webappcrud.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<main>
    <%
        if (!role.equals("admin")) {
            response.sendRedirect("/webapp");
        }
    %>

    <section class="py-5 text-center container">
        <h1>Usuarios</h1>



        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Fecha registro</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    Database.connect();
                    List<User> users = Database.jdbi.withExtension(UserDao.class, UserDao::getAllUsers);
                    for (User user : users) {
                %>
                <tr>
                    <td> <%= user.getUsername() %> </td>
                    <td> <%= user.getName()%> </td>
                    <td> <%= user.getSurname()%> </td>
                    <td> <%= user.getRegister()%> </td>
                    <td><a href="view-user.jsp?userID=<%= user.getUserID()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                        <a href="edit-user.jsp?userID=<%= user.getUserID()%>" type="button" class="btn btn-sm btn-outline-secondary">Editar</a>
                        <a href="remove-user?userID=<%= user.getUserID()%>" type="button" class="btn btn-sm btn-outline-danger">X</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <a href="edit-user.jsp" class="btn btn-dark my-2">Añadir usuario</a>


    </section>


</main>


<%@include file="includes/footer.jsp"%>


