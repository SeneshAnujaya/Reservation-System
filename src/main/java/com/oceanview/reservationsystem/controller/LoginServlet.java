package com.oceanview.reservationsystem.controller;

//import com.oceanview.service.UserService;
import com.oceanview.reservationsystem.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserService userService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/pages/login.jsp");

        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValid = userService.validateUser(username, password);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            request.setAttribute("error", "Invalid username or password");
            doGet(request, response);
        }
    }
}