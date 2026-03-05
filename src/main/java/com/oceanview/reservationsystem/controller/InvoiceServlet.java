package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.BillingDAO;
import com.oceanview.reservationsystem.model.Billing;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {

    private BillingDAO billingDAO = new BillingDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int billingId = Integer.parseInt(request.getParameter("id"));
            Billing bill = billingDAO.selectBilling(billingId);

            request.setAttribute("bill", bill);

            request.getRequestDispatcher("/WEB-INF/views/pages/invoice.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}