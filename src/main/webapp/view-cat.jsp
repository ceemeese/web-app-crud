<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="com.svalero.webappcrud.domain.Cat" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.CatDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>


<main>
    <section class="py-5 text-center container">
        <h1>Miembro de la familia</h1>
    </section>
        <%
            int catID = Integer.parseInt(request.getParameter("id"));

           Database.connect();
           Cat cat = Database.jdbi.withExtension(CatDao.class, dao-> dao.getCat(catID));
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
                                       <h3 class="card-title">En adopción </h3>
                                       <h2 class="card-title"><%= cat.getName() %></h2>
                                       <p class="card-text mb-1"><strong>Descripción: </strong> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus dolorem eveniet facilis maiores reprehenderit veritatis vitae voluptatibus. Est, quibusdam rem</p>
                                       <p class="card-text mb-1"><strong>Color: </strong><%= cat.getColorID().getName() %></p>
                                       <p class="card-text mb-1"><strong>Edad: </strong><%= cat.getAge() %></p>
                                       <p class="card-text mb-1"><strong>Raza: </strong><%= cat.getBreedID().getName() %></p>
                                       <p class="card-text mb-1"><strong>Sexo: </strong><%= cat.getGenderID().getName()%></p>
                                       <p class="card-text mb-1"><strong>Localización: </strong><%= cat.getLocation()%></p>
                                       <p class="ccard-text mb-1"> <strong>Edad: </strong> <%= cat.getAge() %></p>
                                   </div>
                                    <div>
                                        <button type="button" class="btn btn-dark">
                                            <i class="bi bi-chat-left-heart-fill me-1"></i>
                                            Adoptame!
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


