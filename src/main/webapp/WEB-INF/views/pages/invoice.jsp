
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

<div class="dashboard invoice-page">

    <div class="dashboard-top">
        <div class="dashboard-title">
            <h2>Invoice #<%= bill.getBillingId() %></h2>
            <p class="subtitle">Ocean View Resort – Guest Invoice</p>
        </div>

        <div class="dashboard-actions">
            <button type="button" onclick="window.print()" class="dash-btn dash-btn-primary inv-print-btn">
                <i class="fa-solid fa-print"></i>
                <span>Print Invoice</span>
            </button>
            <a href="${pageContext.request.contextPath}/billings" class="dash-btn dash-btn-outline">
                <i class="fa-solid fa-arrow-left"></i>
                <span>Back to Billings</span>
            </a>
        </div>
    </div>

    <div class="dash-card invoice-card">

        <!-- Modern invoice header with logo -->
        <div class="invoice-header">
            <div class="invoice-brand">
                <img src="${pageContext.request.contextPath}/assets/images/oceanlogo.png" alt="Ocean View Resort" class="invoice-logo" />
                <div class="invoice-brand-text">
<%--                    <h1>Ocean View Resort</h1>--%>
<%--                    <p>Professional Hotel Invoice</p>--%>
                </div>
            </div>
            <div class="invoice-meta">
                <span class="invoice-id">Invoice #<%= bill.getBillingId() %></span>
                <span class="invoice-status paid">PAID</span>
            </div>
        </div>

        <div class="invoice-guest">
            <h3>Bill To</h3>
            <p><strong>Guest:</strong> <%= bill.getGuestName() %></p>
            <p><strong>Room:</strong> <%= bill.getRoomType() %></p>
            <p><strong>Check-in:</strong> <%= bill.getCheckIn() %></p>
            <p><strong>Check-out:</strong> <%= bill.getCheckOut() %></p>
            <p><strong>Nights:</strong> <%= nights %></p>
        </div>

        <div class="invoice-table-wrap">
            <table class="dash-table invoice-table">
                <thead>
                <tr>
                    <th>Description</th>
                    <th>Quantity / Nights</th>
                    <th>Rate (Rs.)</th>
                    <th class="dash-ta-right">Total (Rs.)</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>Room charge</td>
                    <td><%= nights %></td>
                    <td><%= String.format("%.2f", bill.getTotalAmount() / nights) %></td>
                    <td class="dash-ta-right"><%= String.format("%.2f", bill.getTotalAmount()) %></td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="invoice-total-row">
            <span>Total Amount</span>
            <strong>Rs. <%= String.format("%.2f", bill.getTotalAmount()) %></strong>
        </div>

        <div class="invoice-footer">
            <p>Thank you for staying with us.</p>
            <p class="dash-muted">Ocean View Resort – Professional Hotel Invoice</p>
        </div>

    </div>
</div>

<style>
    /* Invoice page – OceanView theme */
    .dashboard.invoice-page { --ov-green:#15803d; --ov-green-dark:#0f3b33; --ov-border:#e5e7eb; --ov-muted:#6b7280; --ov-shadow:0 16px 45px rgba(15,23,42,0.10); }

    .invoice-page .invoice-card { max-width: 820px; margin-top: 12px; padding: 24px 28px; }

    .invoice-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 16px;
        padding-bottom: 20px;
        border-bottom: 1px solid var(--ov-border);
        margin-bottom: 20px;
    }

    .invoice-brand { display: flex; align-items: center; gap: 14px; }
    .invoice-logo { height: 48px; width: auto; max-width: 160px; object-fit: contain; }
    .invoice-brand-text h1 { font-size: 22px; margin: 0 0 4px; color: var(--ov-green-dark); }
    .invoice-brand-text p { font-size: 13px; color: var(--ov-muted); margin: 0; }

    .invoice-meta { text-align: right; }
    .invoice-id { display: block; font-size: 14px; font-weight: 700; color: #111827; margin-bottom: 6px; }
    .invoice-status { display: inline-block; padding: 4px 10px; border-radius: 999px; font-size: 12px; font-weight: 700; }
    .invoice-status.paid { background: #ecfdf5; color: #166534; border: 1px solid #bbf7d0; }

    .invoice-guest { margin-bottom: 20px; }
    .invoice-guest h3 { font-size: 13px; margin: 0 0 8px; color: var(--ov-muted); text-transform: uppercase; letter-spacing: 0.06em; }
    .invoice-guest p { margin: 4px 0; font-size: 14px; color: #111827; }

    .invoice-table-wrap { overflow: auto; border: 1px solid var(--ov-border); border-radius: 12px; margin-bottom: 16px; }
    .invoice-page .invoice-table { min-width: 100%; }
    .invoice-page .invoice-table th { background: #f9fafb; }
    .invoice-page .invoice-table td, .invoice-page .invoice-table th { padding: 12px 14px; }

    .invoice-total-row {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 16px;
        padding: 14px 16px;
        background: rgba(21,128,61,0.08);
        border: 1px solid rgba(21,128,61,0.2);
        border-radius: 12px;
        font-size: 16px;
    }
    .invoice-total-row strong { color: var(--ov-green-dark); font-size: 18px; }

    .invoice-footer { margin-top: 24px; padding-top: 16px; border-top: 1px solid var(--ov-border); text-align: center; }
    .invoice-footer p { margin: 4px 0; font-size: 13px; color: #374151; }
    .invoice-footer .dash-muted { color: var(--ov-muted); font-size: 12px; }

    .inv-print-btn { margin-right: 0; }

    @media print {
        body * { visibility: hidden; }
        .dashboard.invoice-page, .dashboard.invoice-page * { visibility: visible; }
        .dashboard-top, .invoice-actions, .inv-print-btn, .dash-btn { display: none !important; }
        .invoice-page .invoice-card { position: absolute; top: 0; left: 0; width: 100%; max-width: 100%; box-shadow: none; }
    }
</style>

<%@ include file="../layout/footer.jsp" %>