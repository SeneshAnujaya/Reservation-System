//package com.oceanview.reservationsystem.controller;
//
//import com.oceanview.reservationsystem.dao.RoomDAO;
//import com.oceanview.reservationsystem.model.Room;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import java.io.IOException;
//
//@WebServlet("/add-room")
//public class AddRoomServlet extends HttpServlet {
//
//    private RoomDAO roomDAO;
//
//    @Override
//    public void init() throws ServletException {
//        // Initialize DAO
//        roomDAO = new RoomDAO();
//    }
//
//    /**
//     * Show the Add Room form
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Set an empty room object so JSP knows this is "Add" mode
//        request.setAttribute("room", null);
//        request.setAttribute("isEdit", false); // optional flag for JSP
//
//        // Forward to rooms.jsp (your form page)
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/pages/rooms.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    /**
//     * Handle form submission to add a new room
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        try {
//            // Get parameters from form
//            String roomType = request.getParameter("roomType");
//            String roomRateStr = request.getParameter("roomRate");
//
//            // Simple validation
//            if (roomType == null || roomType.trim().isEmpty() || roomRateStr == null || roomRateStr.trim().isEmpty()) {
//                request.setAttribute("errorMessage", "Room Type and Room Rate are required.");
//                request.getRequestDispatcher("/WEB-INF/views/pages/rooms.jsp").forward(request, response);
//                return;
//            }
//
//            double roomRate = Double.parseDouble(roomRateStr);
//
//            // Create Room object
//            Room room = new Room();
//            room.setRoomType(roomType.trim());
//            room.setRoomRate(roomRate);
//
//            // Insert room into database
//            roomDAO.insertRoom(room);
//
//            // Redirect back to rooms list page
//            response.sendRedirect(request.getContextPath() + "/rooms");
//
//        } catch (NumberFormatException e) {
//            // Handle invalid number input
//            request.setAttribute("errorMessage", "Invalid room rate. Please enter a valid number.");
//            request.getRequestDispatcher("/WEB-INF/views/pages/rooms.jsp").forward(request, response);
//        } catch (Exception e) {
//            // Handle other unexpected errors
//            request.setAttribute("errorMessage", "Error adding room: " + e.getMessage());
//            request.getRequestDispatcher("/WEB-INF/views/pages/rooms.jsp").forward(request, response);
//        }
//    }
//}

package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.RoomDAO;
import com.oceanview.reservationsystem.model.Room;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/add-room")
public class AddRoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    @Override
    public void init() {
        roomDAO = new RoomDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show Add Room form
        request.setAttribute("room", null);
        request.setAttribute("isEdit", false);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/pages/add-room.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String roomType = request.getParameter("roomType");
            double roomRate = Double.parseDouble(request.getParameter("roomRate"));

            Room room = new Room();
            room.setRoomType(roomType);
            room.setRoomRate(roomRate);

            roomDAO.insertRoom(room);

            response.sendRedirect(request.getContextPath() + "/rooms");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid room rate. Please enter a valid number.");
            request.getRequestDispatcher("/WEB-INF/views/pages/rooms-form.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error adding room: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/pages/rooms-form.jsp").forward(request, response);
        }
    }
}