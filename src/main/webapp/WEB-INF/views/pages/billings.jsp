<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.reservationsystem.model.Billing" %>

<div class="page-header">
    <h2>All Invoices</h2>
    <p class="subtitle">View all completed bills</p>
</div>

<div class="card">
    <table class="table-modern">
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
            <th>Actions</th>
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
<%--            <td ><span class="badge success"><%= b.getStatus() %></span></td>--%>
            <td>
                <%
                    String status = b.getStatus(); // e.g., "PAID", "UNPAID"
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
            <td>
                <a href="${pageContext.request.contextPath}/invoice?id=<%= b.getBillingId() %>"
                   class="btn btn-primary btn-sm">  <i class="fa fa-eye" style="margin-right: 5px"></i> View</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<%@ include file="../layout/footer.jsp" %>