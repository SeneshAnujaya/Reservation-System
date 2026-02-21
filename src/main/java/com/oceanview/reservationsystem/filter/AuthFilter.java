package com.oceanview.reservationsystem.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        boolean isLoginRequest = uri.contains("login");
        boolean isResource = uri.contains("css") || uri.contains("js") || uri.contains("images");

        if (loggedIn || isLoginRequest || isResource) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/login");
        }
    }
}