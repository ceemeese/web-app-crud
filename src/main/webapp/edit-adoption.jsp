<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page import="com.svalero.webappcrud.domain.Cat" %>
<%@ page import="com.svalero.webappcrud.domain.User" %>
<%@ page import="com.svalero.webappcrud.domain.State" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-adoption", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>
    <section class="py-5 text-center container">
        <h1>Formulario de registro de adopciones</h1>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="infoAdoption">Información de la adopcion</label>
                    <textarea type="text" rows="2" name="infoAdoption" class="form-control" id="infoAdoption" placeholder="Información de la adopción..."> </textarea>
                </div>
            </div>
            <div class="col">
                <label class="form-label" for="catID">Gato</label>
                <select id="catID" name="catID" class="form-control">
                    <%
                        Database.connect();
                        List<Cat> cats = Database.jdbi.withExtension(CatDao.class, CatDao::getAllCats);
                        Database.close();
                        for (Cat cat : cats) {
                    %>
                    <option value="<%= cat.getCatID() %>"><%= cat.getName() %></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="col">
                <label class="form-label" for="userID">Usuario</label>
                <select id="userID" name="userID" class="form-control">
                    <%
                        Database.connect();
                        List<User> users = Database.jdbi.withExtension(UserDao.class, UserDao::getAllUsers);
                        Database.close();
                        for (User user : users) {
                    %>
                    <option value="<%= user.getUserID() %>"><%= user.getUsername() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="col">
                <label class="form-label" for="statusAdoptionID">Estado de la adopcion</label>
                <select id="statusAdoptionID" name="statusAdoptionID" class="form-control">
                    <%
                        Database.connect();
                        List<State> states = Database.jdbi.withExtension(StateDao.class, StateDao::getAllStates);
                        Database.close();
                        for (State state : states) {
                    %>
                    <option value="<%= state.getStateID() %>"><%= state.getName() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


