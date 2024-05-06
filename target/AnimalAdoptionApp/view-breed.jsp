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
            int breedID = Integer.parseInt(request.getParameter("id"));

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
                                <img class="card-img img-fluid rounded-start" src="./gato.jpg" alt="gato">
                            </div>
                            <div class="col-6 col-md-7">
                                <div class="card-body d-flex flex-column">
                                   <div class="h-100">
                                       <h2 class="card-title"><%= breed.getName() %></h2>
                                       <p class="card-text mb-1"><strong>Descripción: </strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dolorem eveniet facilis maiores reprehenderit veritatis vitae voluptatibus. Est, quibusdam rem</p>
                                   </div>
                                    <div>
                                        <button type="button" class="btn btn-dark">
                                            <i class="bi bi-pencil"></i>
                                            Editar
                                        </button>
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


