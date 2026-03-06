<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<div class="page-header">
    <div>
        <h2>Help & User Guide</h2>
        <p class="subtitle">Guidelines for new staff to use the reservation system</p>
    </div>
</div>

<div class="help-grid">

    <!-- Reservation Guide -->
    <div class="help-card">
        <h3>📅 Creating a Reservation</h3>

        <ol>
            <li>Open the <b>Reservations</b> page.</li>
            <li>Click <b>+ Add Reservation</b>.</li>
            <li>Enter guest name, email and phone number.</li>
            <li>Select the room type.</li>
            <li>Choose check-in and check-out dates.</li>
            <li>Set reservation status (CONFIRMED / PENDING).</li>
            <li>Click <b>Save Reservation</b>.</li>
        </ol>
    </div>


    <!-- Edit Reservation -->
    <div class="help-card">
        <h3>✏ Editing or Canceling Reservation</h3>

        <ol>
            <li>Go to the <b>Reservations</b> page.</li>
            <li>Find the reservation in the table.</li>
            <li>Click the <b>Edit</b> button.</li>
            <li>Update the guest or booking details.</li>
            <li>Click <b>Save Reservation</b>.</li>
            <li>To cancel a booking change status to <b>CANCELLED</b>.</li>
        </ol>
    </div>


    <!-- Rooms -->
    <div class="help-card">
        <h3>🏨 Managing Rooms</h3>

        <ol>
            <li>Navigate to the <b>Rooms</b> section.</li>
            <li>Click <b>Add Room</b>.</li>
            <li>Enter the room type.</li>
            <li>Enter the room price per night.</li>
            <li>Click <b>Save Room</b>.</li>
        </ol>
    </div>


    <!-- Checkin -->
    <div class="help-card">
        <h3>🧳 Guest Check-in Process</h3>

        <ol>
            <li>Go to the <b>Reservations</b> page.</li>
            <li>Locate the reservation.</li>
            <li>Ensure reservation status is <b>CONFIRMED</b>.</li>
            <li>Verify check-in date.</li>
            <li>Assign the room to the guest.</li>
        </ol>
    </div>


    <!-- Billing -->
    <div class="help-card">
        <h3>💳 Checkout & Billing</h3>

        <ol>
            <li>Open the <b>Reservations</b> page.</li>
            <li>Click the <b>Checkout</b> button.</li>
            <li>The system calculates total nights.</li>
            <li>Room rate is taken from the <b>Rooms</b> table.</li>
            <li>Total cost is calculated automatically.</li>
            <li>Invoice will be generated and can be printed.</li>
        </ol>
    </div>


    <!-- Dashboard -->
    <div class="help-card">
        <h3>📊 Dashboard Overview</h3>

        <ul>
            <li>Today's check-ins</li>
            <li>Today's check-outs</li>
            <li>Total available rooms</li>
            <li>Total reservations</li>
        </ul>

        <p>The dashboard gives a quick overview of hotel activity.</p>
    </div>

</div>

<%@ include file="../layout/footer.jsp" %>