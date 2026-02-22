<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%
    com.oceanview.reservationsystem.model.Reservation r =
            (com.oceanview.reservationsystem.model.Reservation)
                    request.getAttribute("reservation");

    boolean isEdit = (r != null);
%>

<div class="page-header">
    <div>
<%--        <h2>Add Reservation</h2>--%>
<%--        <p class="subtitle">Create a new guest reservation</p>--%>
    <h2><%= isEdit ? "Edit Reservation" : "Add Reservation" %></h2>
    <p class="subtitle">
        <%= isEdit ? "Update reservation details" : "Create a new guest reservation" %>
    </p>
    </div>
</div>

<div class="card form-card">



    <form method="post"
          action="${pageContext.request.contextPath}/<%= isEdit ? "edit-reservation" : "add-reservation" %>"
          class="form-grid">

        <% if (isEdit) { %>
        <input type="hidden" name="id" value="<%= r.getId() %>">
        <% } %>

        <div class="form-group">
            <label>Guest Name</label>
<%--            <input type="text" name="guestName" required>--%>
            <input type="text" name="guestName"
                   value="<%= isEdit ? r.getGuestName() : "" %>" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" value="<%= isEdit ? r.getEmail() : "" %>">

        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone" value="<%= isEdit ? r.getPhone() : "" %>">
        </div>

        <div class="form-group">
            <label>Room Type</label>
<%--            <select name="roomType">--%>
<%--                <option <%= isEdit && r.getRoomType().equals("Single") ? "selected" : "" %>>Single</option>--%>
<%--                <option <%= isEdit && r.getRoomType().equals("Double") ? "selected" : "" %>>Double</option>--%>
<%--                <option <%= isEdit && r.getRoomType().equals("Suite") ? "selected" : "" %>>Suite</option>--%>
<%--&lt;%&ndash;                <option>Single</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option>Double</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option>Suite</option>&ndash;%&gt;--%>
<%--            </select>--%>
            <select name="roomType">
                <option value="Single"
                        <%= isEdit && "Single".equals(r.getRoomType()) ? "selected" : "" %>>
                    Single
                </option>

                <option value="Double"
                        <%= isEdit && "Double".equals(r.getRoomType()) ? "selected" : "" %>>
                    Double
                </option>

                <option value="Suite"
                        <%= isEdit && "Suite".equals(r.getRoomType()) ? "selected" : "" %>>
                    Suite
                </option>
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
<%--            <input type="date" name="checkIn" required value="<%= isEdit && r.getCheckIn() != null ? r.getCheckIn().toString() : "" %>">--%>
            <input type="date" name="checkIn" required
                   value="<%= (isEdit && r.getCheckIn() != null)
                ? r.getCheckIn().toString()
                : "" %>">
        </div>

        <div class="form-group">
            <label>Check Out</label>
<%--            <input type="date" name="checkOut" required value="<%= isEdit ? r.getCheckOut() !=null ? r.getCheckOut().toString() : "" %>">--%>
            <input type="date" name="checkOut" required
                   value="<%= (isEdit && r.getCheckOut() != null)
                ? r.getCheckOut().toString()
                : "" %>">
        </div>

        <div class="form-actions">
            <a href="${pageContext.request.contextPath}/reservations"
               class="btn btn-danger">Cancel</a>

            <button type="submit" class="btn btn-primary">
                Save Reservation
            </button>
        </div>

    </form>

</div>

<%@ include file="../layout/footer.jsp" %>