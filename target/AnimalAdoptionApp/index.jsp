<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.svalero.webappcrud.domain.Cat" %>
<%@ page import="com.svalero.webappcrud.dao.CatDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.Database" %>

<%@include file="includes/header.jsp"%>

<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Asociación Felina Patitas y Bigotes</h1>
                <p class="lead text-body-secondary">Facilitamos la adopción responsable de gatitos rescatados, fomentando valores de cuidado animal y solidaridad en la comunidad..</p>
                <p>
                    <a href="edit-cat.jsp" class="btn btn-dark my-2">Añadir gatito</a>
                </p>
            </div>
        </div>
    </section>


    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    Database.connect();
                    List<Cat> cats = Database.jdbi.withExtension(CatDao.class, dao-> dao.getAllCats());
                    for (Cat cat : cats) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                            <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                        </svg>
                        <div class="card-body">
                            <p class="card-text"> <%= cat.getName() %> </p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="view-cat.jsp?id=<%= cat.getCatID()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                                    <a href="#" type="button" class="btn btn-sm btn-outline-secondary">Editar</a>
                                    <a href="remove-cat?id=<%= cat.getCatID()%>" type="button" class="btn btn-sm btn-outline-danger">Eliminar</a>
                                </div>
                                <small class="text-body-secondary"> <%= cat.getName() %> </small>
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