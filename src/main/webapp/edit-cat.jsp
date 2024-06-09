<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page import="com.svalero.webappcrud.domain.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script>
    $(document).ready(function() {
        $("#edit-button").click(function (event) {
            event.preventDefault();
            const form = $("#edit-form")[0];
            const data = new FormData(form);

            $("#edit-button").prop("disabled", true);

            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "edit-cat",
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {
                    $("#result").html(data);
                    $("#edit-button").prop("disabled", false);
                },
                error: function (error) {
                    $("#result").html(error.responseText);
                    $("#edit-button").prop("disabled", false);
                }
            });
        });
    });
</script>

<%
    if (!role.equals("admin")) {
        response.sendRedirect("/webapp");
    }

    int catID;
    Cat cat = null;
    if (request.getParameter("catID") == null) {
        catID = 0;
    } else {
        catID = Integer.parseInt(request.getParameter("catID"));
        Database.connect();
        cat = Database.jdbi.withExtension(CatDao.class, dao-> dao.getCat(catID));
    }
%>

<main>
    <section class="py-5 text-center container">
        <% if (catID == 0) { %>
            <h1>Registrar nuevo miembro</h1>
        <% } else { %>
            <h1>Modificar miembro</h1>
        <% } %>
    </section>

    <section class="container">
        <form class="" method="post" enctype="multipart/form-data" id="edit-form" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="name">Nombre</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre"<% if (catID != 0 ) { %> value="<%= cat.getName()%><%}%>">
                </div>
                <div class="form-group col-md-6">
                    <label class="form-label" for="age">Edad</label>
                    <input type="text" name="age" class="form-control" id="age" placeholder="Años"<% if (catID != 0 ) { %> value="<%= cat.getAge()%><%}%>">
                </div>
            </div>
            <div class="form-group mt-1">
                <label class="form-label" for="description">Descripción</label>
                <textarea class="form-control" name="description" id="description" rows="2"><% if (catID != 0) { %> <%= cat.getDescription() %><% } %></textarea>
            </div>
            <div class="col">
                <label for="image2" class="form-label">Foto</label>
                <input type="file" name="image2" class="form-control" id="image2"<% if (catID != 0 ) { %> value="<%= cat.getImage()%><%}%>">
            </div>
            <div class="row mt-1">
                <div class="col">
                    <label class="form-label" for="gender">Sexo</label>
                    <select id="gender" name="gender" class="form-control">
                        <%
                            Database.connect();
                            List<Gender> genders = Database.jdbi.withExtension(GenderDao.class, GenderDao::getAllGenders);
                            Database.close();
                            for (Gender gender : genders) {
                        %>
                        <option value="<%= gender.getGenderID()%>"><%= gender.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col">
                    <label class="form-label" for="breed">Raza</label>
                    <select id="breed" name="breed" class="form-control">
                        <%
                            Database.connect();
                            List<Breed> breeds = Database.jdbi.withExtension(BreedDao.class, BreedDao::getAllBreeds);
                            Database.close();
                            for (Breed breed : breeds) {
                        %>
                            <option value="<%=breed.getBreedID()%>"><%=breed.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col">
                    <label class="form-label" for="color">Color</label>
                    <select id="color" name="color" class="form-control">
                        <%
                            Database.connect();
                            List<Color> colors = Database.jdbi.withExtension(ColorDao.class, ColorDao::getAllColors);
                            Database.close();
                            for (Color color : colors) {
                        %>
                        <option value="<%=color.getColorID()%>"><%=color.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="col">
                    <label class="form-label" for="state">Estado</label>
                    <select id="state" name="state" class="form-control">
                        <%
                            Database.connect();
                            List<State> states = Database.jdbi.withExtension(StateDao.class, StateDao::getAllStates);
                            Database.close();
                            for (State state : states) {
                        %>
                        <option value="<%=state.getStateID()%>"><%=state.getName()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col">
                    <label class="form-label" for="location">Localización</label>
                    <textarea class="form-control" name="location" id="location" rows="1"><%if(catID != 0){%><%=cat.getLocation()%><%}%></textarea>
                </div>
            </div>
            <input type="submit" value="Enviar" id="edit-button" class="btn btn-success mt-3"/>
            <input type="hidden" name="catID" value="<%= catID %>">
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


