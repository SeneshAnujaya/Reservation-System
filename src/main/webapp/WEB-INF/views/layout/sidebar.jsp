<aside class="sidebar">
    <div class="logo">
    <img src="${pageContext.request.contextPath}/assets/images/oceanlogo.png" alt="logo" style="width: 150px"/>
    </div>

    <nav>
        <a href="${pageContext.request.contextPath}/dashboard"
           class="${pageContext.request.requestURI.contains('dashboard') ? 'active' : ''}">
            <i class="fa-solid fa-gauge-high"></i>
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/reservations"
           class="${pageContext.request.requestURI.contains('reservations') ? 'active' : ''}">
            <i class="fa-solid fa-calendar-check"></i>
            <span>Reservations</span>
        </a>

        <a href="${pageContext.request.contextPath}/rooms"
           class="${pageContext.request.requestURI.contains('rooms') ? 'active' : ''}">
            <i class="fa-solid fa-bed"></i>
            <span>Rooms</span>
        </a>

        <a href="${pageContext.request.contextPath}/billings"
           class="${pageContext.request.requestURI.contains('billings') ? 'active' : ''}">
            <i class="fa-solid fa-file-invoice-dollar"></i>
            <span>Billings</span>
        </a>

        <a href="${pageContext.request.contextPath}/help"
           class="${pageContext.request.requestURI.contains('help') ? 'active' : ''}">
            <i class="fa-solid fa-circle-question"></i>
            <span>Help</span>
        </a>
    </nav>

    <a href="logout" class="sidebar-logout">
        <i class="fa-solid fa-right-from-bracket"></i>
        <span>Logout</span>
    </a>
</aside>