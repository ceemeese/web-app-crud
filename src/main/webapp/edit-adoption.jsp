<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page import="com.svalero.webappcrud.domain.*" %>
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

<%
    int adoptionID;
    Adoption adoption = null;
    if (request.getParameter("adoptionID") == null) {
        adoptionID = 0;
    } else {
        adoptionID = Integer.parseInt(request.getParameter("adoptionID"));
        Database.connect();
        adoption = Database.jdbi.withExtension(AdoptionDao.class, dao-> dao.getAdoption(adoptionID));
    }
%>

<main>
    <section class="py-5 text-center container">
        <% if (adoptionID == 0) { %>
        <h1>Registro de adopción</h1>
        <% } else { %>
        <h1>Modificar adopción/h1>
        <% } %>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="form-group col">
                <label class="form-label" for="infoAdoption">Información de la adopcion</label>
                <textarea type="text" rows="2" name="infoAdoption" class="form-control" id="infoAdoption" placeholder="Información de la adopción..."><%if(adoptionID != 0){%><%=adoption.getInfoAdoption()%><%}%></textarea>
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
                        List<StatusAdoption> statusAdoptions = Database.jdbi.withExtension(StatusAdoptionDao.class, StatusAdoptionDao::getAllStatusAdoption);
                        Database.close();
                        for (StatusAdoption statusAdoption : statusAdoptions) {
                    %>
                    <option value="<%= statusAdoption.getStatusAdoptionID() %>"><%= statusAdoption.getName() %></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
            <input type="hidden" name="adoptionID" value="<%= adoptionID %>">
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


