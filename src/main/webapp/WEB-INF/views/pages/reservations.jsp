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
<%--                <a href="#" class="btn-sm edit">Edit</a>--%>
    <a href="${pageContext.request.contextPath}/edit-reservation?id=<%= r.getId() %>"
       class="btn-sm edit">
        Edit
    </a>
<%--                <a href="#" class="btn-sm delete">Delete</a>--%>
    <a href="${pageContext.request.contextPath}/delete-reservation?id=<%= r.getId() %>"
       class="btn-sm delete"
       onclick="return confirm('Are you sure you want to delete this reservation?');">
        Delete
    </a>
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