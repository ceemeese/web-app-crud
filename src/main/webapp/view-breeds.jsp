<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.svalero.webappcrud.domain.Breed" %>
<%@ page import="com.svalero.webappcrud.dao.BreedDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.Database" %>

<%@include file="includes/header.jsp"%>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Razas</h1>
                <p class="lead text-body-secondary">Tarjeta de presentación felina: es la etiqueta que lleva puesta, con su propio estilo de pelo, color y personalidad</p>
                <p>
                    <a href="edit-breed.jsp" class="btn btn-dark my-2">Añadir raza</a>
                </p>
            </div>
        </div>
    </section>
    
    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    Database.connect();
                    List<Breed> breeds = Database.jdbi.withExtension(BreedDao.class, dao-> dao.getAllBreeds());
                    for (Breed breed : breeds) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src=../webapp_pictures/<%= breed.getImage() %> width="100%" height="225">
                        <div class="card-body">
                            <p class="card-text"> <%= breed.getName() %> </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="view-breed.jsp?breedID=<%= breed.getBreedID()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                                    <a href="edit-breed.jsp?breedID=<%= breed.getBreedID() %>" type="button" class="btn btn-sm btn btn-outline-secondary">Editar</a>
                                    <a href="remove-breed?breedID=<%= breed.getBreedID()%>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</main>

<%@include file="includes/footer.jsp"%>