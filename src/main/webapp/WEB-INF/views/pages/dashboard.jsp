
<%@ include file="../layout/header.jsp" %>

<div class="dashboard">
    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2>Dashboard</h2>
            <p class="subtitle">Hotel overview and statistics</p>
        </div>

        <div class="dashboard-actions">
<%--            <div class="dash-search">--%>
<%--                <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--                <input type="text" placeholder="Search" />--%>
<%--            </div>--%>

            <a class="dash-btn dash-btn-outline" href="${pageContext.request.contextPath}/reservations">
                <i class="fa-solid fa-calendar-check"></i>
                Reservations
            </a>

<%--            <a class="dash-btn dash-btn-primary" href="${pageContext.request.contextPath}/checkin">--%>
<%--                <i class="fa-solid fa-right-to-bracket"></i>--%>
<%--                New Check-in--%>
<%--            </a>--%>
        </div>
    </div>

    <!-- STATS -->
    <div class="dash-stats">
        <div class="dash-card dash-stat">
            <div class="dash-stat-icon dash-ic-green">
                <i class="fa-solid fa-door-open"></i>
            </div>
            <div class="dash-stat-meta">
                <div class="dash-stat-label">Today's Check-ins</div>
                <div class="dash-stat-value">${todayCheckins}</div>
            </div>
        </div>

        <div class="dash-card dash-stat">
            <div class="dash-stat-icon dash-ic-orange">
                <i class="fa-solid fa-door-closed"></i>
            </div>
            <div class="dash-stat-meta">
                <div class="dash-stat-label">Today's Check-outs</div>
                <div class="dash-stat-value">${todayCheckouts}</div>
            </div>
        </div>

        <div class="dash-card dash-stat">
            <div class="dash-stat-icon dash-ic-blue">
                <i class="fa-solid fa-bed"></i>
            </div>
            <div class="dash-stat-meta">
                <div class="dash-stat-label">Total Rooms</div>
                <div class="dash-stat-value">${totalRooms}</div>
            </div>
        </div>

        <div class="dash-card dash-stat">
            <div class="dash-stat-icon dash-ic-purple">
                <i class="fa-solid fa-calendar-check"></i>
            </div>
            <div class="dash-stat-meta">
                <div class="dash-stat-label">Total Reservations</div>
                <div class="dash-stat-value">${totalReservations}</div>
            </div>
        </div>
    </div>

    <!-- MAIN GRID -->
    <div class="dash-grid">
        <!-- LEFT COLUMN -->
        <div class="dash-col">

            <div class="dash-card">
                <div class="dash-card-head">
                    <div>
                        <h3>Weekly Reservations</h3>
                        <p class="dash-muted">Reservations trend</p>
                    </div>
                </div>

                <canvas id="reservationChart" height="120"></canvas>
            </div>


            <div>

            </div>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="dash-col">


    <div class="dash-card" style="min-height: 300px">
        <div class="dash-card-head">
            <div>
                <h3>Quick Actions</h3>
                <p class="dash-muted">Common shortcuts</p>
            </div>
        </div>

        <div class="dash-actions-grid">
            <a class="dash-quick" href="${pageContext.request.contextPath}/rooms">
                <div class="dash-quick-ic"><i class="fa-solid fa-bed"></i></div>
                <div class="dash-quick-txt">
                    <div class="dash-quick-title">Manage Rooms</div>
                    <div class="dash-quick-sub">Availability & rates</div>
                </div>
                <i class="fa-solid fa-arrow-right"></i>
            </a>

            <a class="dash-quick" href="${pageContext.request.contextPath}/reservations">
                <div class="dash-quick-ic">  <i class="fa-solid fa-calendar-check"></i></div>
                <div class="dash-quick-txt">
                    <div class="dash-quick-title">Reservations</div>
                    <div class="dash-quick-sub">Bookings & history</div>
                </div>
                <i class="fa-solid fa-arrow-right"></i>
            </a>

            <a class="dash-quick" href="${pageContext.request.contextPath}/billings">
                <div class="dash-quick-ic"><i class="fa-solid fa-file-invoice-dollar"></i></div>
                <div class="dash-quick-txt">
                    <div class="dash-quick-title">Billings</div>
                    <div class="dash-quick-sub">Billing History & Invoices</div>
                </div>
                <i class="fa-solid fa-arrow-right"></i>
            </a>

            <a class="dash-quick" href="${pageContext.request.contextPath}/help">
                <div class="dash-quick-ic"><i class="fa-solid fa-circle-question"></i></div>
                <div class="dash-quick-txt">
                    <div class="dash-quick-title">Help Guide</div>
                    <div class="dash-quick-sub">System Introduction & Guidance</div>
                </div>
                <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>
    </div>
        </div>


    </div>
</div>


<script>
    const rtx = document.getElementById('reservationChart').getContext('2d');

    // Read colors from your OceanView theme
    const dashboardRoot = document.querySelector('.dashboard') || document.documentElement;
    const styles = getComputedStyle(dashboardRoot);

    const ovGreen       = styles.getPropertyValue('--ov-green')       || '#15803d';
    const ovGreenDark   = styles.getPropertyValue('--ov-green-dark')  || '#0f3b33';
    const ovText        = styles.getPropertyValue('--ov-text')        || '#111827';
    const ovMuted       = styles.getPropertyValue('--ov-muted')       || '#6b7280';
    const ovBorder      = styles.getPropertyValue('--ov-border')      || '#e5e7eb';

    const barGradient = rtx.createLinearGradient(0, 0, 0, 200);
    barGradient.addColorStop(0, 'rgba(34, 197, 94, 0.95)');  // top - #22c55e
    barGradient.addColorStop(1, 'rgba(21, 128, 61, 0.35)');  // bottom - #15803d

    new Chart(rtx, {
        type: 'bar',
        data: {
            labels: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
            datasets: [{
                label: 'Reservations',
                data: ${weeklyReservations}, // keep your dynamic data
                backgroundColor: barGradient,
                borderColor: '#22c55e',
                borderWidth: 1.5,
                borderRadius: 8,
                borderSkipped: false,
                maxBarThickness: 38
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            layout: {
                padding: {
                    top: 10,
                    right: 10,
                    bottom: 0,
                    left: 0
                }
            },
            plugins: {
                legend: {
                    display: false
                },
                tooltip: {
                    backgroundColor: ovGreenDark.trim(),
                    titleColor: '#e5e7eb',
                    bodyColor: '#f9fafb',
                    padding: 10,
                    cornerRadius: 10,
                    displayColors: false,
                    borderWidth: 0,
                    titleFont: { weight: '600', size: 12 },
                    bodyFont: { size: 12 }
                }
            },
            scales: {
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        color: ovMuted.trim(),
                        font: { size: 11, weight: '500' },
                        padding: 8
                    }
                },
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(148, 163, 184, 0.18)',   // soft slate
                        borderDash: [4, 4]
                    },
                    ticks: {
                        color: ovMuted.trim(),
                        font: { size: 11 },
                        padding: 6
                    }
                }
            }
        }
    });
</script>

<%@ include file="../layout/footer.jsp" %>