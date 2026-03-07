
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%
    com.oceanview.reservationsystem.model.Room room =
            (com.oceanview.reservationsystem.model.Room)
                    request.getAttribute("room");

    boolean isEdit = (room != null);
%>

<div class="dashboard rooms-form-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2><%= isEdit ? "Edit Room" : "Add Room" %></h2>
            <p class="subtitle">
                <%= isEdit ? "Update room details" : "Create a new room type" %>
            </p>
        </div>
    </div>

    <div class="dash-card form-card">
        <div class="dash-card-head">
            <div>
                <h3>Room information</h3>
                <p class="dash-muted">Set the room type and nightly rate</p>
            </div>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/<%= isEdit ? "edit-room" : "add-room" %>"
              class="form-grid modern-form">

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
                   class="btn btn-danger form-btn-cancel">
                    <i class="fa-solid fa-xmark"></i>
                    Cancel
                </a>

                <button type="submit" class="btn btn-primary form-btn-save">
                    <i class="fa-solid fa-floppy-disk"></i>
                    Save Room
                </button>
            </div>

        </form>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>