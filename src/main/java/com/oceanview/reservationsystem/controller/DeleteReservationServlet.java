package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.ReservationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-reservation")
public class DeleteReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            boolean deleted = reservationDAO.deleteReservation(id);

            if(deleted) {
                System.out.println("Reservation deleted successfully: ID = " + id);
            } else {
                System.out.println("Reservation not found: ID = " + id);
            }

            response.sendRedirect(request.getContextPath() + "/reservations");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/reservations");
        }
    }
}