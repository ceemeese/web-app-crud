<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="com.svalero.webappcrud.domain.Breed" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.BreedDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>


<main>
    <section class="py-5 text-center container">
        <h1>Raza</h1>
    </section>
        <%
            int breedID = Integer.parseInt(request.getParameter("breedID"));

           Database.connect();
           Breed breed = Database.jdbi.withExtension(BreedDao.class, dao-> dao.getBreed(breedID));
        %>

    <div class="cream-bg">
        <div class="container">
            <div class="row g-5 justify-content-evenly">
                <div class="col lg-6">
                    <div class="card">
                        <div class="row g-0">
                            <div class="col-6 col-md-5">
                                <img class="card-img img-fluid rounded-start" src=../webapp_pictures/<%= breed.getImage() %> alt="gato">
                            </div>
                            <div class="col-6 col-md-7">
                                <div class="card-body d-flex flex-column">
                                   <div class="h-100">
                                       <h2 class="card-title"><%= breed.getName() %></h2>
                                       <p class="card-text mb-1"><strong>Descripción: </strong> <%= breed.getDescription() %> </p>
                                   </div>
                                    <div>
                                        <%
                                            if (role.equals("admin")) {
                                        %>
                                        <a href="edit-breed.jsp?breedID=<%= breed.getBreedID() %>" type="button" class="btn btn-sm btn btn-outline-secondary">Editar</a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<%@include file="includes/footer.jsp"%>


