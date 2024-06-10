<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.domain.User" %>
<%@ page import="com.svalero.webappcrud.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script>
    $(document).ready(function(){
        $("#search-input").focus()
    });
</script>

<main>
    <%
        if (!role.equals("admin")) {
            response.sendRedirect("/webapp");
        }
    %>

    <section class="py-5 text-center container">
        <h1>Usuarios</h1>
        <div class="row py-lg-1">
            <div class="col-lg-6 col-md-8 mx-auto">
                <form id="search-form" method="GET" action="">
                    <div class="">
                        <input type="text" name="search" class="form-control" id="search-input" placeholder="Buscar">
                        <button class="btn btn-dark my-2" type="submit" id="search-button">Buscar</button>
                    </div>
                </form>
            </div>
        </div>



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
                    String search = "";
                    if (request.getParameter("search") != null) {
                        search = request.getParameter("search");
                    }


                    Database.connect();
                    List<User> users = null;
                    if (search.isEmpty()) {
                        users = Database.jdbi.withExtension(UserDao.class, UserDao::getAllUsers);
                    } else {
                        final String searchTerm = search;
                        users = Database.jdbi.withExtension(UserDao.class, dao->dao.findUsers(searchTerm));
                    }

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


