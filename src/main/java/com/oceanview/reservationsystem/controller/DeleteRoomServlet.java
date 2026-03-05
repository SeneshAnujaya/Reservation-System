package com.oceanview.reservationsystem.controller;

import com.oceanview.reservationsystem.dao.RoomDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/delete-room")
public class DeleteRoomServlet extends HttpServlet {

    private RoomDAO roomDAO;

    @Override
    public void init() {
        roomDAO = new RoomDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int roomId = Integer.parseInt(request.getParameter("id"));
        roomDAO.deleteRoom(roomId);

        response.sendRedirect(request.getContextPath() + "/rooms");
    }
}