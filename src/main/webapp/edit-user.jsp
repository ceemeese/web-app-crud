<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page import="com.svalero.webappcrud.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-user", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<%
    int userID;
    User user = null;
    if (request.getParameter("userID") == null) {
        userID = 0;
    } else {
        userID = Integer.parseInt(request.getParameter("userID"));
        Database.connect();
        user = Database.jdbi.withExtension(UserDao.class, dao-> dao.getUser(userID));
    }
%>

<main>
    <section class="py-5 text-center container">
        <% if (userID == 0) { %>
        <h1>Registro de usuario</h1>
        <% } else { %>
        <h1>Modificar usuario</h1>
        <% } %>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="username">Usuario</label>
                    <input type="text" name="username" class="form-control" id="username" placeholder="Usuario"<% if (userID != 0 ) { %> value="<%= user.getUsername()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="pass">Contrasena</label>
                    <input type="password" name="pass" class="form-control" id="pass" placeholder="Contraseña">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="email" >Email</label>
                    <input type="email" name="email" class="form-control" id="email" placeholder="Email" aria-describedby="emailHelp"<% if (userID != 0 ) { %> value="<%= user.getEmail()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="name">Nombre</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre"<% if (userID != 0 ) { %> value="<%= user.getName()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="surname">Apellido</label>
                    <input type="text" name="surname" class="form-control" id="surname" placeholder="Apellido"<% if (userID != 0 ) { %> value="<%= user.getSurname()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="address">Dirección</label>
                    <input type="text" name="address" class="form-control" id="address" placeholder="Dirección"<% if (userID != 0 ) { %> value="<%= user.getAddress()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="mobile">Teléfono de contacto</label>
                    <input type="tel" name="mobile" class="form-control" id="mobile" placeholder="Teléfono de contacto"<% if (userID != 0 ) { %> value="<%= user.getMobile()%><%}%>">
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="role">Rol</label>
                    <input type="text" name="role" class="form-control" id="role" placeholder="Rol de usuario"<% if (userID != 0 ) { %> value="<%= user.getRole()%><%}%>">
                </div>
            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
            <input type="hidden" name="userID" value="<%= userID %>">
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


