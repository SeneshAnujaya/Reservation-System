package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.ReservationDAO;
import com.oceanview.reservationsystem.model.Reservation;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/add-reservation")
public class AddReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/WEB-INF/views/pages/add-reservation.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Reservation r = new Reservation();

            r.setGuestName(request.getParameter("guestName"));
            r.setEmail(request.getParameter("email"));
            r.setPhone(request.getParameter("phone"));
            r.setRoomType(request.getParameter("roomType"));
            r.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
            r.setCheckOut(Date.valueOf(request.getParameter("checkOut")));

            String status = request.getParameter("status");
            if (status == null || status.isEmpty()) {
                status = "CONFIRMED";
            }
            r.setStatus(status);
//            r.setStatus("CONFIRMED");

            reservationDAO.insertReservation(r);

            response.sendRedirect(request.getContextPath() + "/reservations");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}