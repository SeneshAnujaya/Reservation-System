<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%
    com.oceanview.reservationsystem.model.Room room =
            (com.oceanview.reservationsystem.model.Room)
                    request.getAttribute("room");

    boolean isEdit = (room != null);
%>

<div class="page-header">
    <div>
        <h2><%= isEdit ? "Edit Room" : "Add Room" %></h2>

        <p class="subtitle">
            <%= isEdit ? "Update room details" : "Create a new room type" %>
        </p>
    </div>
</div>

<div class="card form-card">

    <form method="post"
          action="${pageContext.request.contextPath}/<%= isEdit ? "edit-room" : "add-room" %>"
          class="form-grid">

        <% if (isEdit) { %>
        <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">
        <% } %>

        <div class="form-group">
            <label>Room Type</label>

            <input type="text"
                   name="roomType"
                   required
                   value="<%= isEdit ? room.getRoomType() : "" %>">
        </div>

        <div class="form-group">
            <label>Room Rate (per night)</label>

            <input type="number"
                   name="roomRate"
                   required
                   step="0.01"
                   value="<%= isEdit ? room.getRoomRate() : "" %>">
        </div>

        <div class="form-actions">

            <a href="${pageContext.request.contextPath}/rooms"
               class="btn btn-danger">
                Cancel
            </a>

            <button type="submit" class="btn btn-primary">
                Save Room
            </button>

        </div>

    </form>

</div>

<%@ include file="../layout/footer.jsp" %>