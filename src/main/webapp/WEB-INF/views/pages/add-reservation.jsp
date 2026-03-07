<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%
    com.oceanview.reservationsystem.model.Reservation r =
            (com.oceanview.reservationsystem.model.Reservation)
                    request.getAttribute("reservation");

    boolean isEdit = (r != null);
%>

<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Room" %>

<div class="dashboard reservations-form-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2><%= isEdit ? "Edit Reservation" : "Add Reservation" %></h2>
            <p class="subtitle">
                <%= isEdit ? "Update reservation details" : "Create a new guest reservation" %>
            </p>
        </div>
    </div>

    <div class="dash-card form-card">

        <div class="dash-card-head">
            <div>
                <h3>Guest & stay details</h3>
                <p class="dash-muted">Fill in the information below to continue</p>
            </div>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/<%= isEdit ? "edit-reservation" : "add-reservation" %>"
              class="form-grid modern-form">

            <% if (isEdit) { %>
            <input type="hidden" name="id" value="<%= r.getId() %>">
            <% } %>

            <div class="form-group">
                <label>Guest Name</label>
                <input type="text" name="guestName"
                       value="<%= isEdit ? r.getGuestName() : "" %>" required>
            </div>

            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email"
                       value="<%= isEdit ? r.getEmail() : "" %>">
            </div>

            <div class="form-group">
                <label>Phone</label>
                <input type="text" name="phone"
                       value="<%= isEdit ? r.getPhone() : "" %>">
            </div>

            <div class="form-group">
                <label>Room Type</label>
                <select name="roomId" required>
                    <%
                        List<Room> rooms =
                                (List<Room>) request.getAttribute("roomList");

                        if (rooms != null) {
                            for (Room room : rooms) {
                    %>
                    <option value="<%= room.getRoomId() %>"
                            <%= isEdit && r.getRoomTypeId() == room.getRoomId() ? "selected" : "" %>>
                        <%= room.getRoomType() %>
                    </option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label>Status</label>
                <select name="status">
                    <option value="CONFIRMED"
                            <%= isEdit && "CONFIRMED".equals(r.getStatus()) ? "selected" : "" %>>
                        CONFIRMED
                    </option>

                    <option value="PENDING"
                            <%= isEdit && "PENDING".equals(r.getStatus()) ? "selected" : "" %>>
                        PENDING
                    </option>

                    <option value="CANCELLED"
                            <%= isEdit && "CANCELLED".equals(r.getStatus()) ? "selected" : "" %>>
                        CANCELLED
                    </option>
                </select>
            </div>

            <div class="form-group">
                <label>Check In</label>
                <input type="date" name="checkIn" required
                       value="<%= (isEdit && r.getCheckIn() != null)
                            ? r.getCheckIn().toString()
                            : "" %>">
            </div>

            <div class="form-group">
                <label>Check Out</label>
                <input type="date" name="checkOut" required
                       value="<%= (isEdit && r.getCheckOut() != null)
                            ? r.getCheckOut().toString()
                            : "" %>">
            </div>

            <div class="form-actions">
                <a href="${pageContext.request.contextPath}/reservations"
                   class="btn btn-danger form-btn-cancel">
                    <i class="fa-solid fa-xmark"></i>
                    Cancel
                </a>

                <button type="submit" class="btn btn-primary form-btn-save">
                    <i class="fa-solid fa-floppy-disk"></i>
                    Save Reservation
                </button>
            </div>

        </form>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>