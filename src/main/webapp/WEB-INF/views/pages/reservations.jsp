<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="com.oceanview.reservationsystem.model.Reservation" %>--%>

<%--<%@ include file="../layout/header.jsp" %>--%>

<%--<h2>Reservations</h2>--%>

<%--<a href="addReservation.jsp">Add New Reservation</a>--%>

<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Guest</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Room</th>--%>
<%--        <th>Status</th>--%>
<%--    </tr>--%>

<%--    <%--%>
<%--        List<Reservation> list = (List<Reservation>) request.getAttribute("reservationList");--%>
<%--        for (Reservation r : list) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--        <td><%= r.getId() %></td>--%>
<%--        <td><%= r.getGuestName() %></td>--%>
<%--        <td><%= r.getEmail() %></td>--%>
<%--        <td><%= r.getRoomType() %></td>--%>
<%--        <td><%= r.getStatus() %></td>--%>
<%--    </tr>--%>
<%--    <% } %>--%>
<%--</table>--%>

<%--<%@ include file="../layout/footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Reservation" %>

<%@ include file="../layout/header.jsp" %>

<div class="page-header">
    <div>
        <h2>Reservations</h2>
        <p class="subtitle">Manage all guest reservations</p>
    </div>

    <a href="${pageContext.request.contextPath}/add-reservation"
       class="btn btn-primary">
        + Add Reservation
    </a>
</div>

<div class="card">

    <table class="table-modern">
        <thead>
        <tr>
            <th>ID</th>
            <th>Guest</th>
            <th>Email</th>
            <th>Room</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
        </thead>

        <tbody>
        <%
            List<Reservation> list =
                    (List<Reservation>) request.getAttribute("reservationList");

            if (list != null) {
                for (Reservation r : list) {
        %>
        <tr>
            <td>#<%= r.getId() %></td>
            <td><%= r.getGuestName() %></td>
            <td><%= r.getEmail() %></td>
            <td><%= r.getRoomType() %></td>
            <td>
                <span class="badge success">
                    <%= r.getStatus() %>
                </span>
            </td>
            <td>
                <a href="#" class="btn-sm edit">Edit</a>
                <a href="#" class="btn-sm delete">Delete</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

</div>

<%@ include file="../layout/footer.jsp" %>