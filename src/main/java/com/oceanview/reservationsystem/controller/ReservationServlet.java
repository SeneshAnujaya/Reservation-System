package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.ReservationDAO;
import com.oceanview.reservationsystem.model.Reservation;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/reservations")
public class ReservationServlet extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("ReservationServlet called");

        try {
            List<Reservation> list = reservationDAO.selectAllReservations();
            request.setAttribute("reservationList", list);

            request.getRequestDispatcher("/WEB-INF/views/pages/reservations.jsp")
                    .forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}