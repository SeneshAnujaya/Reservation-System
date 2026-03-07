

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Room" %>

<%@ include file="../layout/header.jsp" %>

<div class="dashboard rooms-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2>Rooms</h2>
            <p class="subtitle">Manage hotel rooms and rates</p>
        </div>

        <div class="dashboard-actions">
            <div class="dash-search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Search rooms..." />
            </div>

            <a href="${pageContext.request.contextPath}/add-room"
               class="dash-btn dash-btn-primary">
                <i class="fa-solid fa-plus"></i>
                <span>Add Room</span>
            </a>
        </div>
    </div>

    <div class="dash-card res-card">
        <div class="dash-card-head">
            <div>
                <h3>All Rooms</h3>
                <p class="dash-muted">Room types and current rates</p>
            </div>
        </div>

        <div class="dash-table-wrap">
            <table class="dash-table table-modern">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Room Type</th>
                    <th>Room Rate</th>
                    <th class="dash-ta-right">Actions</th>
                </tr>
                </thead>

                <tbody>
                <%
                    List<Room> list =
                            (List<Room>) request.getAttribute("roomList");

                    if (list != null) {
                        for (Room r : list) {
                %>
                <tr>
                    <td>#<%= r.getRoomId() %></td>
                    <td><%= r.getRoomType() %></td>
                    <td>Rs. <%= r.getRoomRate() %></td>

                    <td class="dash-ta-right res-actions">
                        <a href="${pageContext.request.contextPath}/edit-room?id=<%= r.getRoomId() %>"
                           class="btn-sm pill edit">
                            <i class="fa-solid fa-pen-to-square"></i>
                            Edit
                        </a>

                        <a href="#"
                           class="btn-sm pill delete"
                           data-id="<%= r.getRoomId() %>"
                           onclick="showDeleteModal(this)">
                            <i class="fa-solid fa-trash-can"></i>
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
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal res-modal">
    <div class="modal-content res-modal-content">
        <button class="res-modal-close" type="button" onclick="closeModal()">
            <i class="fa-solid fa-xmark"></i>
        </button>

        <h3>Delete room?</h3>
        <p>Are you sure you want to delete this room?</p>

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
        const modal = document.getElementById("deleteModal");
        modal.style.display = "flex";
        modal.classList.add("show");
    }

    function closeModal() {
        const modal = document.getElementById("deleteModal");
        modal.style.display = "none";
        modal.classList.remove("show");
    }

    document.getElementById("confirmDelete").addEventListener("click", function() {
        if (currentDeleteId) {
            const contextPath = '<%= request.getContextPath() %>';
            window.location.href =
                contextPath + "/delete-room?id=" + currentDeleteId;
        }
    });

    window.onclick = function(event) {
        const modal = document.getElementById("deleteModal");
        if (event.target === modal) {
            modal.style.display = "none";
            modal.classList.remove("show");
        }
    }
</script>

<%@ include file="../layout/footer.jsp" %>