<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="com.svalero.webappcrud.domain.User" %>
<%@ page import="com.svalero.webappcrud.dao.UserDao" %>
<%@ page import="com.svalero.webappcrud.domain.Adoption" %>
<%@ page import="com.svalero.webappcrud.dao.AdoptionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>


<main>

    <%
        if (!role.equals("admin")) {
            response.sendRedirect("/webapp");
        }
    %>

    <section class="py-5 text-center container">
        <h1>Usuario</h1>
    </section>
        <%
            int userID = Integer.parseInt(request.getParameter("userID"));

           Database.connect();
           User user = Database.jdbi.withExtension(UserDao.class, dao-> dao.getUser(userID));
           Database.close();
        %>

    <div class="container">
        <div id="cardID" class="card" style="width: 20rem;">
            <h4 class="card-header text-center"> <%= user.getUsername() %> </h4>
            <div class="card-body">
                <h5 class="text-center">Datos personales</h5>
                <p class="card-text"> <strong>Nombre: </strong> <%= user.getName() %></p>
                <p class="card-text"> <strong>Apellidos: </strong> <%= user.getSurname() %></p>
                <p class="card-text"> <strong>Dirección: </strong> <%= user.getAddress() %></p>
                <p class="card-text"> <strong>Mail: </strong> <%= user.getEmail() %></p>
                <p class="card-text"> <strong>Teléfono: </strong> <%= user.getMobile() %></p>
                <p class="card-text"> <strong>Fecha Registro: </strong> <%= user.getRegister() %></p>

                <a href="edit-user.jsp?userID=<%= user.getUserID()%>" class="btn btn-dark">Modificar</a>
            </div>
        </div>
    </div>

</main>


<%@include file="includes/footer.jsp"%>


