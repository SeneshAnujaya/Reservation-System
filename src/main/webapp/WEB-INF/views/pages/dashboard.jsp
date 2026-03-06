<%--<%@ include file="../layout/header.jsp" %>--%>

<%--<h2>Dashboard Overview</h2>--%>

<%--<div class="card-grid">--%>

<%--    <div class="card">--%>
<%--        <h3>Today's Check-ins</h3>--%>
<%--        <p class="number">23</p>--%>
<%--    </div>--%>

<%--    <div class="card">--%>
<%--        <h3>Today's Check-outs</h3>--%>
<%--        <p class="number">18</p>--%>
<%--    </div>--%>

<%--    <div class="card">--%>
<%--        <h3>Available Rooms</h3>--%>
<%--        <p class="number">25</p>--%>
<%--    </div>--%>

<%--    <div class="card">--%>
<%--        <h3>Reserved Rooms</h3>--%>
<%--        <p class="number">12</p>--%>
<%--    </div>--%>

<%--</div>--%>

<%--<%@ include file="../layout/footer.jsp" %>--%>

<%@ include file="../layout/header.jsp" %>

<div class="page-header">
    <h2>Dashboard</h2>
    <p class="subtitle">Hotel overview and statistics</p>
</div>

<div class="card-grid">

    <div class="card stat-card">
        <div class="stat-icon blue">
            <i class="fa-solid fa-door-open"></i>
        </div>
        <div>
            <h3>Today's Check-ins</h3>
            <p class="number">${todayCheckins}</p>
        </div>
    </div>

    <div class="card stat-card">
        <div class="stat-icon orange">
            <i class="fa-solid fa-door-closed"></i>
        </div>
        <div>
            <h3>Today's Check-outs</h3>
            <p class="number">${todayCheckouts}</p>
        </div>
    </div>

    <div class="card stat-card">
        <div class="stat-icon green">
            <i class="fa-solid fa-bed"></i>
        </div>
        <div>
            <h3>Total Rooms</h3>
            <p class="number">${totalRooms}</p>
        </div>
    </div>

    <div class="card stat-card">
        <div class="stat-icon purple">
            <i class="fa-solid fa-calendar-check"></i>
        </div>
        <div>
            <h3>Total Reservations</h3>
            <p class="number">${totalReservations}</p>
        </div>
    </div>

</div>

<%@ include file="../layout/footer.jsp" %>