
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="com.oceanview.reservationsystem.model.Reservation" %>--%>

<%--<%@ include file="../layout/header.jsp" %>--%>

<%--<div class="page-header">--%>
<%--    <div>--%>
<%--        <h2>Reservations</h2>--%>
<%--        <p class="subtitle">Manage all guest reservations</p>--%>
<%--    </div>--%>

<%--    <a href="${pageContext.request.contextPath}/add-reservation" class="btn btn-primary">--%>
<%--        + Add Reservation--%>
<%--    </a>--%>
<%--</div>--%>

<%--<div class="card">--%>
<%--    <table class="table-modern">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Guest</th>--%>
<%--            <th>Email</th>--%>
<%--            <th>Room</th>--%>
<%--            <th>Status</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>

<%--        <tbody>--%>
<%--        <%--%>
<%--            List<Reservation> list = (List<Reservation>) request.getAttribute("reservationList");--%>
<%--            if (list != null) {--%>
<%--                for (Reservation r : list) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td>#<%= r.getId() %></td>--%>
<%--            <td><%= r.getGuestName() %></td>--%>
<%--            <td><%= r.getEmail() %></td>--%>
<%--            <td><%= r.getRoomType() %></td>--%>
<%--            <td>--%>
<%--                <span class="badge success"><%= r.getStatus() %></span>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <a href="${pageContext.request.contextPath}/edit-reservation?id=<%= r.getId() %>"--%>
<%--                   class="btn-sm edit">Edit</a>--%>

<%--                <!-- Delete button with data-id -->--%>
<%--                <a href="#" class="btn-sm delete" data-id="<%= r.getId() %>" onclick="showDeleteModal(this)">--%>
<%--                    Delete--%>
<%--                </a>--%>

<%--&lt;%&ndash;                <a href="${pageContext.request.contextPath}/billing?id=<%= r.getId() %>"&ndash;%&gt;--%>
<%--&lt;%&ndash;                   class="btn-sm bill">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    Checkout&ndash;%&gt;--%>
<%--&lt;%&ndash;                </a>&ndash;%&gt;--%>
<%--                <a href="${pageContext.request.contextPath}/checkout?id=<%= r.getId() %>"--%>
<%--                   class="btn-sm bill">--%>
<%--                    Checkout--%>
<%--                </a>--%>


<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--                }--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--</div>--%>

<%--<!-- Delete Confirmation Modal -->--%>
<%--<div id="deleteModal" class="modal">--%>
<%--    <div class="modal-content">--%>
<%--        <span class="close" onclick="closeModal()">&times;</span>--%>
<%--        <p>Are you sure you want to delete this reservation?</p>--%>
<%--        <button id="confirmDelete" class="btn btn-danger">Yes, Delete</button>--%>
<%--        <button class="btn btn-secondary" onclick="closeModal()">Cancel</button>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    let currentDeleteId = 0;--%>

<%--    // Show modal and get ID from clicked element--%>
<%--    function showDeleteModal(element) {--%>
<%--        currentDeleteId = element.getAttribute("data-id"); // get ID from data attribute--%>
<%--        document.getElementById("deleteModal").style.display = "flex";--%>
<%--        document.getElementById("deleteModal").classList.add("show");--%>
<%--    }--%>

<%--    function closeModal() {--%>
<%--        document.getElementById("deleteModal").style.display = "none";--%>
<%--        document.getElementById("deleteModal").classList.remove("show");--%>
<%--    }--%>

<%--    // Confirm delete button--%>
<%--    document.getElementById("confirmDelete").addEventListener("click", function() {--%>
<%--        if(currentDeleteId) {--%>
<%--            const contextPath = '<%= request.getContextPath() %>';--%>
<%--            window.location.href = contextPath + "/delete-reservation?id=" + currentDeleteId;--%>
<%--        }--%>
<%--    });--%>

<%--    // Optional: Close modal when clicking outside--%>
<%--    window.onclick = function(event) {--%>
<%--        const modal = document.getElementById("deleteModal");--%>
<%--        if (event.target === modal) {--%>
<%--            modal.style.display = "none";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>

<%--<%@ include file="../layout/footer.jsp" %>--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Reservation" %>

<%@ include file="../layout/header.jsp" %>

<div class="dashboard reservations-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2>Reservations</h2>
            <p class="subtitle">Manage all guest reservations</p>
        </div>

        <div class="dashboard-actions">
            <div class="dash-search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Search reservations..." />
            </div>

            <a href="${pageContext.request.contextPath}/add-reservation"
               class="dash-btn dash-btn-primary">
                <i class="fa-solid fa-plus"></i>
                <span>Add Reservation</span>
            </a>
        </div>
    </div>

    <div class="dash-card res-card">
        <div class="dash-card-head">
            <div>
                <h3>All Reservations</h3>
                <p class="dash-muted">Latest bookings and current guests</p>
            </div>
        </div>

        <div class="dash-table-wrap">
            <table class="dash-table table-modern">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Guest</th>
                    <th>Email</th>
                    <th>Room</th>
                    <th>Status</th>
                    <th class="dash-ta-right">Actions</th>
                </tr>
                </thead>

                <tbody>
                <%
                    List<Reservation> list = (List<Reservation>) request.getAttribute("reservationList");
                    if (list != null) {
                        for (Reservation r : list) {
                %>
                <tr>
                    <td>#<%= r.getId() %></td>
                    <td><%= r.getGuestName() %></td>
                    <td><%= r.getEmail() %></td>
                    <td><%= r.getRoomType() %></td>
                    <td>
                        <span class="badge success"><%= r.getStatus() %></span>
                    </td>
                    <td class="dash-ta-right res-actions">
                        <a href="${pageContext.request.contextPath}/edit-reservation?id=<%= r.getId() %>"
                           class="btn-sm pill edit">
                            <i class="fa-solid fa-pen-to-square"></i>
                            Edit
                        </a>

                        <a href="#" class="btn-sm pill delete"
                           data-id="<%= r.getId() %>"
                           onclick="showDeleteModal(this)">
                            <i class="fa-solid fa-trash-can"></i>
                            Delete
                        </a>

                        <a href="${pageContext.request.contextPath}/checkout?id=<%= r.getId() %>"
                           class="btn-sm pill bill">
                            <i class="fa-solid fa-right-to-bracket"></i>
                            Checkout
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
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal res-modal">
    <div class="modal-content res-modal-content">
        <button class="res-modal-close" type="button" onclick="closeModal()">
            <i class="fa-solid fa-xmark"></i>
        </button>
        <h3>Delete reservation?</h3>
        <p>Are you sure you want to delete this reservation?</p>
        <div class="res-modal-actions">
            <button id="confirmDelete" class="dash-btn dash-btn-primary danger">
                Yes, Delete
            </button>
            <button class="dash-btn dash-btn-outline" type="button" onclick="closeModal()">
                Cancel
            </button>
        </div>
    </div>
</div>

<script>
    let currentDeleteId = 0;

    function showDeleteModal(element) {
        currentDeleteId = element.getAttribute("data-id");
        document.getElementById("deleteModal").style.display = "flex";
        document.getElementById("deleteModal").classList.add("show");
    }

    function closeModal() {
        document.getElementById("deleteModal").style.display = "none";
        document.getElementById("deleteModal").classList.remove("show");
    }

    document.getElementById("confirmDelete").addEventListener("click", function() {
        if (currentDeleteId) {
            const contextPath = '<%= request.getContextPath() %>';
            window.location.href = contextPath + "/delete-reservation?id=" + currentDeleteId;
        }
    });

    window.onclick = function(event) {
        const modal = document.getElementById("deleteModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>

<%@ include file="../layout/footer.jsp" %>