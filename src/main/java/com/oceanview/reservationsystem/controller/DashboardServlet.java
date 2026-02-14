package com.oceanview.reservationsystem.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getSession().setAttribute("user", "Admin");

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/pages/dashboard.jsp");

        dispatcher.forward(request, response);
    }
}