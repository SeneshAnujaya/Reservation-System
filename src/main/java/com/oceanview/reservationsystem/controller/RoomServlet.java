package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.RoomDAO;
import com.oceanview.reservationsystem.model.Room;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/rooms")
public class RoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    public void init() {
        roomDAO = new RoomDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Room> roomList = roomDAO.selectAllRooms();
        request.setAttribute("roomList", roomList);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/views/pages/rooms.jsp");

        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roomType = request.getParameter("roomType");
        double roomRate = Double.parseDouble(request.getParameter("roomRate"));

        Room room = new Room();
        room.setRoomType(roomType);
        room.setRoomRate(roomRate);

        roomDAO.insertRoom(room);

        response.sendRedirect("rooms");
    }
}