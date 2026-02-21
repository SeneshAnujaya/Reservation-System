<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="page-header">
    <div>
        <h2>Add Reservation</h2>
        <p class="subtitle">Create a new guest reservation</p>
    </div>
</div>

<div class="card form-card">

    <form method="post"
          action="${pageContext.request.contextPath}/add-reservation"
          class="form-grid">

        <div class="form-group">
            <label>Guest Name</label>
            <input type="text" name="guestName" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email">
        </div>

        <div class="form-group">
            <label>Phone</label>
            <input type="text" name="phone">
        </div>

        <div class="form-group">
            <label>Room Type</label>
            <select name="roomType">
                <option>Single</option>
                <option>Double</option>
                <option>Suite</option>
            </select>
        </div>

        <div class="form-group">
            <label>Check In</label>
            <input type="date" name="checkIn" required>
        </div>

        <div class="form-group">
            <label>Check Out</label>
            <input type="date" name="checkOut" required>
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