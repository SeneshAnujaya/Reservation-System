package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.ReservationDAO;
import com.oceanview.reservationsystem.dao.BillingDAO;
import com.oceanview.reservationsystem.dao.RoomDAO;
import com.oceanview.reservationsystem.model.Reservation;
import com.oceanview.reservationsystem.model.Billing;

import com.oceanview.reservationsystem.model.Room;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.temporal.ChronoUnit;
import java.time.LocalDate;
import java.sql.Date;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private ReservationDAO reservationDAO = new ReservationDAO();
    private BillingDAO billingDAO = new BillingDAO();
    private RoomDAO roomDAO = new RoomDAO();

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int reservationId = Integer.parseInt(request.getParameter("id"));

            Reservation r = reservationDAO.selectReservation(reservationId);

            if (!r.getStatus().equals("CONFIRMED")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Cannot checkout unconfirmed reservation.");
                return;
            }

            // Calculate nights
            LocalDate checkIn = r.getCheckIn().toLocalDate();
            LocalDate checkOut = r.getCheckOut().toLocalDate();
            long nights = ChronoUnit.DAYS.between(checkIn, checkOut);

            // Calculate total (for now use room rate from roomTypeId, you can later query rate)
           // double roomRate = 100.00; // placeholder, replace with actual rate from room table
           // double totalAmount = nights * roomRate;

            Room room = roomDAO.selectRoomById(r.getRoomTypeId()); // fetch room
            double roomRate = room != null ? room.getRoomRate() : 0; // default if null
            double totalAmount = nights * roomRate;

            // Create Billing record
            Billing bill = new Billing();
            bill.setReservationId(r.getId());
            bill.setGuestName(r.getGuestName());
            bill.setRoomType(r.getRoomType());
            bill.setCheckIn(r.getCheckIn());
            bill.setCheckOut(r.getCheckOut());
            bill.setTotalAmount(totalAmount);
            bill.setStatus("UNPAID");

            int billingId = billingDAO.insertBilling(bill);

            // Update reservation status to FINISHED
            r.setStatus("FINISHED");
            reservationDAO.updateReservation(r);

            // Redirect to invoice view
            response.sendRedirect(request.getContextPath() + "/invoice?id=" + billingId);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}