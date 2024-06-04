<%@ page import="com.svalero.webappcrud.dao.Database" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.webappcrud.domain.Adoption" %>
<%@ page import="com.svalero.webappcrud.dao.AdoptionDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="includes/header.jsp"%>


<main>
    <section class="py-5 text-center container">
        <h1>Adopciones</h1>

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
                    Database.connect();
                    List<Adoption> adoptions = Database.jdbi.withExtension(AdoptionDao.class, AdoptionDao::getAllAdoptions);
                    for (Adoption adoption : adoptions) {
                %>
                <tr>
                    <td> <%= adoption.getAdoptionID() %> </td>
                    <td> <%= adoption.getDateAdoption()%> </td>
                    <td> <%= adoption.getCatID().getName() %> </td>
                    <td> <%= adoption.getUserID().getUsername() %> </td>
                    <td> <%= adoption.getStatusAdoptionID().getName() %> </td>
                    <td><a href="view-adoption.jsp?id=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                        <a href="edit-adoption.jsp?id=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-secondary">Editar</a>
                        <a href="remove-adoption?id=<%= adoption.getAdoptionID()%>" type="button" class="btn btn-sm btn-outline-danger">X</a>
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


