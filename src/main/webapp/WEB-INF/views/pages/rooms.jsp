<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Room" %>

<%@ include file="../layout/header.jsp" %>

<div class="page-header">
    <div>
        <h2>Rooms</h2>
        <p class="subtitle">Manage hotel rooms and rates</p>
    </div>

    <a href="${pageContext.request.contextPath}/add-room"
       class="btn btn-primary">
        + Add Room
    </a>
</div>

<div class="card">

    <table class="table-modern">
        <thead>
        <tr>
            <th>ID</th>
            <th>Room Type</th>
            <th>Room Rate</th>
            <th>Actions</th>
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

            <td>

                <a href="${pageContext.request.contextPath}/edit-room?id=<%= r.getRoomId() %>"
                   class="btn-sm edit">
                    Edit
                </a>

                <a href="#"
                   class="btn-sm delete"
                   data-id="<%= r.getRoomId() %>"
                   onclick="showDeleteModal(this)">
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

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">

        <span class="close" onclick="closeModal()">&times;</span>

        <p>Are you sure you want to delete this room?</p>

        <button id="confirmDelete" class="btn btn-danger">
            Yes, Delete
        </button>

        <button class="btn btn-secondary" onclick="closeModal()">
            Cancel
        </button>

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

        if(currentDeleteId) {

            const contextPath = '<%= request.getContextPath() %>';

            window.location.href =
                contextPath + "/delete-room?id=" + currentDeleteId;

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