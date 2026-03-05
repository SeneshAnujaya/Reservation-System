package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.BillingDAO;
import com.oceanview.reservationsystem.model.Billing;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/billings")
public class BillingServlet extends HttpServlet {

    private BillingDAO billingDAO = new BillingDAO();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            List<Billing> billingList = billingDAO.selectAllBillings();
            request.setAttribute("billingList", billingList);
            request.getRequestDispatcher("/WEB-INF/views/pages/billings.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}