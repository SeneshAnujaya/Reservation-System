package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.RoomDAO;
import com.oceanview.reservationsystem.model.Room;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/edit-room")
public class EditRoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    @Override
    public void init() {
        roomDAO = new RoomDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("id"));
        Room room = roomDAO.selectRoomById(roomId);

        request.setAttribute("room", room);
        request.setAttribute("isEdit", true);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/pages/add-room.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int roomId = Integer.parseInt(request.getParameter("roomId"));
            String roomType = request.getParameter("roomType");
            double roomRate = Double.parseDouble(request.getParameter("roomRate"));

            Room room = new Room();
            room.setRoomId(roomId);
            room.setRoomType(roomType);
            room.setRoomRate(roomRate);

            roomDAO.updateRoom(room);

            response.sendRedirect(request.getContextPath() + "/rooms");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid room rate. Please enter a valid number.");
            request.getRequestDispatcher("/WEB-INF/views/pages/rooms-form.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error updating room: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/pages/rooms-form.jsp").forward(request, response);
        }
    }
}