<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="com.svalero.webappcrud.domain.Cat" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.dao.CatDao" %>
<%@ page import="com.svalero.webappcrud.domain.Adoption" %>
<%@ page import="com.svalero.webappcrud.dao.AdoptionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>


<main>
    <%
        if (!role.equals("admin")) {
            response.sendRedirect("/webapp");
        }
    %>

    <section class="py-5 text-center container">
        <h1>Adopción</h1>
    </section>
        <%
            int adoptionID = Integer.parseInt(request.getParameter("adoptionID"));

           Database.connect();
           Adoption adoption = Database.jdbi.withExtension(AdoptionDao.class, dao-> dao.getAdoption(adoptionID));
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
                                       <h3 class="card-title"> <%= adoption.getStatusAdoptionID().getName() %></h3>
                                       <h2 class="card-title"><%= adoption.getUserID().getUsername() %></h2>
                                       <p class="card-text mb-1"><strong>Información: </strong> <%= adoption.getInfoAdoption() %></p>
                                       <p class="card-text mb-1"><strong>Fecha adopción: </strong> <%= adoption.getDateAdoption() %></p>
                                       <p class="card-text mb-1"><strong>Contacto: </strong> <%= adoption.getDateAdoption() %></p>

                                   </div>
                                    <div>
                                        <button type="button" class="btn btn-dark">Editar</button>
                                        <a href="edit-adoption.jsp?adoptionID=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-secondary">Editar</a>
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


