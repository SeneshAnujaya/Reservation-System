<aside class="sidebar">
    <div class="logo">🏨 OceanView</div>

    <nav>
        <a href="${pageContext.request.contextPath}/dashboard" class="active">Dashboard</a>
        <a href="#">Guests</a>
<%--        <a href="#">Reservations</a>--%>
        <a href="${pageContext.request.contextPath}/reservations"
           class="${pageContext.request.requestURI.contains('reservations') ? 'active' : ''}">
            Reservations
        </a>
        <a href="${pageContext.request.contextPath}/rooms"
           class="${pageContext.request.requestURI.contains('rooms') ? 'active' : ''}">
            Rooms
        </a>
<%--        <a href="#">Rooms</a>--%>

        <a href="${pageContext.request.contextPath}/billings"
           class="${pageContext.request.requestURI.contains('billings') ? 'active' : ''}">
            Billings
        </a>
<%--        <a href="#">Billing</a>--%>
        <a href="#">Settings</a>
    </nav>
</aside>