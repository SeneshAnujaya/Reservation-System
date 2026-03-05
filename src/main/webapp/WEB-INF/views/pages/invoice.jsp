<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%@ include file="../layout/header.jsp" %>--%>
<%--<%--%>
<%--    com.oceanview.reservationsystem.model.Billing bill =--%>
<%--            (com.oceanview.reservationsystem.model.Billing) request.getAttribute("bill");--%>
<%--%>--%>

<%--<div class="card invoice-card">--%>
<%--    <h1>Ocean View Resort</h1>--%>
<%--    <h3>Invoice #<%= bill.getBillingId() %></h3>--%>
<%--    <p>Guest: <%= bill.getGuestName() %></p>--%>
<%--    <p>Room: <%= bill.getRoomType() %></p>--%>
<%--    <p>Check In: <%= bill.getCheckIn() %></p>--%>
<%--    <p>Check Out: <%= bill.getCheckOut() %></p>--%>

<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Description</th>--%>
<%--            <th>Quantity / Nights</th>--%>
<%--            <th>Rate</th>--%>
<%--            <th>Total</th>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>Room Charge</td>--%>
<%--            <td>--%>
<%--                <%--%>
<%--                    long nights = java.time.temporal.ChronoUnit.DAYS.between(--%>
<%--                            bill.getCheckIn().toLocalDate(),--%>
<%--                            bill.getCheckOut().toLocalDate()--%>
<%--                    );--%>
<%--                    out.print(nights);--%>
<%--                %>--%>
<%--            </td>--%>
<%--            <td>100.00</td>--%>
<%--            <td><%= bill.getTotalAmount() %></td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <p><strong>Total Amount: </strong> <%= bill.getTotalAmount() %></p>--%>

<%--    <button onclick="window.print()" class="btn btn-primary">Print Invoice</button>--%>
<%--</div>--%>

<%--<%@ include file="../layout/footer.jsp" %>--%>

<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<%--%>
<%--    com.oceanview.reservationsystem.model.Billing bill =--%>
<%--            (com.oceanview.reservationsystem.model.Billing) request.getAttribute("bill");--%>
<%--%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Invoice #<%= bill.getBillingId() %></title>--%>
<%--    <style>--%>
<%--        body { font-family: Arial, sans-serif; margin: 20px; }--%>
<%--        .invoice { max-width: 800px; margin: auto; border: 1px solid #ccc; padding: 20px; }--%>
<%--        h1, h2, h3 { text-align: center; margin-bottom: 5px; }--%>
<%--        table { width: 100%; border-collapse: collapse; margin-top: 20px; }--%>
<%--        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }--%>
<%--        th { background-color: #f5f5f5; }--%>
<%--        .total { text-align: right; margin-top: 20px; font-size: 18px; }--%>
<%--        @media print {--%>
<%--            body * { visibility: hidden; }--%>
<%--            .invoice, .invoice * { visibility: visible; }--%>
<%--            .invoice { position: absolute; top: 0; left: 0; width: 100%; }--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="invoice">--%>
<%--    <h1>Ocean View Resort</h1>--%>
<%--    <h2>Invoice #<%= bill.getBillingId() %></h2>--%>
<%--    <p><strong>Guest:</strong> <%= bill.getGuestName() %></p>--%>
<%--    <p><strong>Room:</strong> <%= bill.getRoomType() %></p>--%>
<%--    <p><strong>Check In:</strong> <%= bill.getCheckIn() %></p>--%>
<%--    <p><strong>Check Out:</strong> <%= bill.getCheckOut() %></p>--%>

<%--    <table>--%>
<%--        <tr>--%>
<%--            <th>Description</th>--%>
<%--            <th>Quantity / Nights</th>--%>
<%--            <th>Rate</th>--%>
<%--            <th>Total</th>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            long nights = java.time.temporal.ChronoUnit.DAYS.between(--%>
<%--                    bill.getCheckIn().toLocalDate(),--%>
<%--                    bill.getCheckOut().toLocalDate()--%>
<%--            );--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td>Room Charge</td>--%>
<%--            <td><%= nights %></td>--%>
<%--            <td><%= String.format("%.2f", bill.getTotalAmount() / nights) %></td>--%>
<%--            <td><%= String.format("%.2f", bill.getTotalAmount()) %></td>--%>
<%--        </tr>--%>
<%--    </table>--%>

<%--    <div class="total"><strong>Total Amount: </strong> <%= String.format("%.2f", bill.getTotalAmount()) %></div>--%>

<%--    <div style="text-align: center; margin-top: 20px;">--%>
<%--        <button onclick="window.print()" class="btn">Print Invoice</button>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%
    com.oceanview.reservationsystem.model.Billing bill =
            (com.oceanview.reservationsystem.model.Billing) request.getAttribute("bill");

    long nights = java.time.temporal.ChronoUnit.DAYS.between(
            bill.getCheckIn().toLocalDate(),
            bill.getCheckOut().toLocalDate()
    );
%>

<div class="page-header">
    <div>
        <h2>Invoice #<%= bill.getBillingId() %></h2>
        <p class="subtitle">Ocean View Resort - Guest Invoice</p>
    </div>
</div>

<div class="card invoice-card">

    <!-- Invoice Header -->
    <div class="invoice-header">
        <h1>Ocean View Resort</h1>
        <p>Professional Hotel Invoice</p>
        <div class="guest-info">
            <p><strong>Guest:</strong> <%= bill.getGuestName() %></p>
            <p><strong>Room:</strong> <%= bill.getRoomType() %></p>
            <p><strong>Check In:</strong> <%= bill.getCheckIn() %></p>
            <p><strong>Check Out:</strong> <%= bill.getCheckOut() %></p>
        </div>
    </div>

    <!-- Invoice Table -->
    <table class="invoice-table">
        <thead>
        <tr>
            <th>Description</th>
            <th>Quantity / Nights</th>
            <th>Rate</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Room Charge</td>
            <td><%= nights %></td>
            <td><%= String.format("%.2f", bill.getTotalAmount() / nights) %></td>
            <td><%= String.format("%.2f", bill.getTotalAmount()) %></td>
        </tr>
        </tbody>
    </table>

    <div class="invoice-total">
        <strong>Total Amount:</strong> <%= String.format("%.2f", bill.getTotalAmount()) %>
    </div>

    <div class="invoice-actions">
        <button onclick="window.print()" class="btn btn-primary">Print Invoice</button>
    </div>

</div>

<style>
    /* Modern Invoice Card */
    .invoice-card {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        padding: 30px;
        max-width: 900px;
        margin: 20px auto;
    }

    .invoice-header h1 {
        font-size: 28px;
        margin-bottom: 5px;
        color: #007bff;
    }

    .invoice-header p {
        font-size: 14px;
        color: #555;
        margin-bottom: 15px;
    }

    .guest-info p {
        margin: 3px 0;
        font-size: 14px;
    }

    .invoice-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .invoice-table th, .invoice-table td {
        border: 1px solid #ddd;
        padding: 12px 15px;
        text-align: left;
    }

    .invoice-table th {
        background: #f5f5f5;
    }

    .invoice-total {
        text-align: right;
        font-size: 18px;
        margin-top: 20px;
    }

    .invoice-actions {
        text-align: center;
        margin-top: 30px;
    }

    /* Print styling */
    @media print {
        body * { visibility: hidden; } /* hide everything */
        .invoice-card, .invoice-card * { visibility: visible; }
        .invoice-card { position: absolute; top: 0; left: 0; width: 100%; }
        .invoice-actions { display: none; } /* hide print button */
    }
</style>

<%@ include file="../layout/footer.jsp" %>