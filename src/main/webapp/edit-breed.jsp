<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.*" %>
<%@ page import="com.svalero.webappcrud.domain.Breed" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script type="text/javascript">
    $(document).ready(function() {
        $("form").on("submit", function(event) {
            event.preventDefault();
            var formValue = $(this).serialize();
            $.post("edit-breed", formValue, function(data) {
                $("#result").html(data);
            });
        });
    });
</script>

<%
    int id;
    Breed breed = null;
    if (request.getParameter("id") == null) {
        id = 0;
    } else {
        id = Integer.parseInt(request.getParameter("id"));
        Database.connect();
        breed = Database.jdbi.withExtension(BreedDao.class, dao-> dao.getBreed(id));
    }
%>

<main>
    <section class="py-5 text-center container">
        <% if (id == 0) { %>
        <h1>Registro de raza</h1>
        <% } else { %>
        <h1>Modificar raza</h1>
        <% } %>
    </section>

    <section class="container">
        <form class="" action="" method="post" content="text/html" enctype="multipart/form-data" >
            <div class="row">
                <div class="form-group col-md-6">
                    <label class="form-label" for="name">Nombre</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Nombre"
                        <% if (id != 0 ) { %> value=" <%= breed.getName() %>"<% } %>>
                </div>
            </div>
            <div class="form-group mt-1">
                <label class="form-label" for="description">Descripción</label>
                <textarea class="form-control" name="description" id="description" rows="2"><%if(id != 0){%><%=breed.getDescription()%><%}%></textarea>

            </div>

            <button type="submit" class="btn btn-success mt-3">Enviar</button>
        </form>
        <br/>
        <div id="result"></div>
    </section>
</main>


<%@include file="includes/footer.jsp"%>


