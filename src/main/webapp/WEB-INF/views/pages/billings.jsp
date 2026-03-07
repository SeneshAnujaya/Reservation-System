
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Billing" %>

<%@ include file="../layout/header.jsp" %>

<div class="dashboard invoices-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2>All Invoices</h2>
            <p class="subtitle">View all completed bills</p>
        </div>

        <div class="dashboard-actions">
            <div class="dash-search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="Search invoices..." />
            </div>

            <!-- Optional secondary action, purely UI -->
            <button type="button" class="dash-btn dash-btn-outline">
                <i class="fa-solid fa-file-arrow-down"></i>
                <span>Export</span>
            </button>
        </div>
    </div>

    <div class="dash-card res-card">
        <div class="dash-card-head">
            <div>
                <h3>Invoice history</h3>
            </div>
        </div>

        <div class="dash-table-wrap">
            <table class="dash-table table-modern">
                <thead>
                <tr>
                    <th>Invoice #</th>
                    <th>Guest</th>
                    <th>Room</th>
                    <th>Check-In</th>
                    <th>Check-Out</th>
                    <th>Nights</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th class="dash-ta-right">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Billing> bills = (List<Billing>) request.getAttribute("billingList");
                    if(bills != null) {
                        for(Billing b : bills) {
                            long nights = java.time.temporal.ChronoUnit.DAYS.between(
                                    b.getCheckIn().toLocalDate(),
                                    b.getCheckOut().toLocalDate()
                            );
                %>
                <tr>
                    <td>#<%= b.getBillingId() %></td>
                    <td><%= b.getGuestName() %></td>
                    <td><%= b.getRoomType() %></td>
                    <td><%= b.getCheckIn() %></td>
                    <td><%= b.getCheckOut() %></td>
                    <td><%= nights %></td>
                    <td><%= String.format("%.2f", b.getTotalAmount()) %></td>
                    <td>
                        <%
                            String status = b.getStatus();
                            String badgeClass = "badge ";
                            switch(status.toUpperCase()) {
                                case "PAID":
                                    badgeClass += "success";
                                    break;
                                case "UNPAID":
                                    badgeClass += "danger";
                                    break;
                                default:
                                    badgeClass += "warning";
                            }
                        %>
                        <span class="<%= badgeClass %>"><%= status %></span>
                    </td>
                    <td class="dash-ta-right res-actions">
                        <a href="${pageContext.request.contextPath}/invoice?id=<%= b.getBillingId() %>"
                           class="btn-sm pill view">
                            <i class="fa fa-eye"></i>
                            View
                        </a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@ include file="../layout/footer.jsp" %>