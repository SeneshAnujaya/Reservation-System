package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.ReservationDAO;
import com.oceanview.reservationsystem.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/edit-reservation")
public class EditReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Reservation existingReservation =
                reservationDAO.selectReservation(id);

        request.setAttribute("reservation", existingReservation);

        request.getRequestDispatcher("/WEB-INF/views/pages/add-reservation.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Reservation r = new Reservation();

            r.setId(Integer.parseInt(request.getParameter("id")));
            r.setGuestName(request.getParameter("guestName"));
            r.setEmail(request.getParameter("email"));
            r.setPhone(request.getParameter("phone"));
            r.setRoomType(request.getParameter("roomType"));
            r.setCheckIn(Date.valueOf(request.getParameter("checkIn")));
            r.setCheckOut(Date.valueOf(request.getParameter("checkOut")));
            r.setStatus(request.getParameter("status"));

            reservationDAO.updateReservation(r);

            response.sendRedirect(request.getContextPath() + "/reservations");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}