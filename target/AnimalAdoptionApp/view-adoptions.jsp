<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.domain.Adoption" %>
<%@ page import="com.svalero.webappcrud.dao.AdoptionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>

<script>
    $(document).ready(function(){
        $("#search-input").focus()
    });
</script>


<main>
    <%
        if (!role.equals("admin")) {
            response.sendRedirect("/webapp");
        }
    %>

    <section class="py-5 text-center container">
        <h1>Adopciones</h1>

        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <form id="search-form" method="GET" action="">
                    <div class="">
                        <input type="text" name="search" class="form-control" id="search-input" placeholder="Buscar">
                        <button class="btn btn-dark my-2" type="submit" id="search-button">Buscar</button>
                    </div>
                </form>
            </div>
        </div>

        <table id="example" class="table table-striped table-hover" style="width:100%">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Fecha</th>
                    <th>Miembro gatuno</th>
                    <th>Candidato</th>
                    <th>Estado</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    String search = "";
                    if (request.getParameter("search") != null) {
                        search = request.getParameter("search");
                    }

                    Database.connect();
                    List<Adoption> adoptions = null;

                    if (search.isEmpty()) {
                        adoptions = Database.jdbi.withExtension(AdoptionDao.class, AdoptionDao::getAllAdoptions);
                    } else {
                        final String searchTerm = search;
                        adoptions = Database.jdbi.withExtension(AdoptionDao.class, dao->dao.findAdoptions(searchTerm));
                    }
                    for (Adoption adoption : adoptions) {
                %>
                <tr>
                    <td> <%= adoption.getAdoptionID() %> </td>
                    <td> <%= adoption.getDateAdoption()%> </td>
                    <td> <%= adoption.getCatID().getName() %> </td>
                    <td> <%= adoption.getUserID().getUsername() %> </td>
                    <td> <%= adoption.getStatusAdoptionID().getName() %> </td>
                    <td><a href="view-adoption.jsp?adoptionID=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                        <a href="edit-adoption.jsp?adoptionID=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-secondary">Editar</a>
                        <a href="remove-adoption?adoptionID=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-danger">X</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <a href="edit-adoption.jsp" class="btn btn-dark my-2">Añadir nueva adopción</a>


    </section>


</main>


<%@include file="includes/footer.jsp"%>


