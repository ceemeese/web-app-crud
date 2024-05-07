<%@ page import="com.svalero.webappcrud.domain.State" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.domain.Color" %>
<%@ page import="com.svalero.webappcrud.domain.Breed" %>
<%@ page import="com.svalero.webappcrud.domain.Gender" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-cat", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<main>
    <section class="py-5 text-center container">
        <h1>Formulario de registro</h1>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="name">Nombre</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre">
                </div>
                <div class="form-group col-md-6">
                    <label class="form-label" for="age">Edad</label>
                    <input type="number" name="age" class="form-control" id="age" placeholder="Años">
                </div>
            </div>
            <div class="form-group mt-1">
                <label class="form-label" for="description">Descripción</label>
                <textarea class="form-control" name="description" id="description" rows="2"></textarea>
            </div>
            <div class="col">
                <label for="image2" class="form-label">Foto</label>
                <input type="file" name="image2" class="form-control" id="image2">
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
                        <option value="<%= gender.getGenderID() %>"><%= gender.getName() %></option>
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
                        <option value="<%= breed.getBreedID() %>"><%= breed.getName() %></option>
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
                        <option value="<%= color.getColorID() %>"><%= color.getName() %></option>
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
                        <option value="<%= state.getStateID() %>"><%= state.getName() %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="row mt-1">
                <div class="col">
                    <label class="form-label" for="location">Localización</label>
                    <textarea class="form-control" name="location" id="location" rows="1"></textarea>
                </div>

            </div>
            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


