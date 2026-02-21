package com.oceanview.reservationsystem.dao;

import com.oceanview.reservationsystem.model.Reservation;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SQL =
            "INSERT INTO reservations (guest_name, email, phone, room_type, check_in, check_out, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_ALL_SQL =
            "SELECT * FROM reservations";

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public void insertReservation(Reservation reservation) throws Exception {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_SQL)) {

            ps.setString(1, reservation.getGuestName());
            ps.setString(2, reservation.getEmail());
            ps.setString(3, reservation.getPhone());
            ps.setString(4, reservation.getRoomType());
            ps.setDate(5, reservation.getCheckIn());
            ps.setDate(6, reservation.getCheckOut());
            ps.setString(7, reservation.getStatus());

            ps.executeUpdate();
        }
    }

    public List<Reservation> selectAllReservations() throws Exception {
        List<Reservation> list = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_SQL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setGuestName(rs.getString("guest_name"));
                r.setEmail(rs.getString("email"));
                r.setPhone(rs.getString("phone"));
                r.setRoomType(rs.getString("room_type"));
                r.setCheckIn(rs.getDate("check_in"));
                r.setCheckOut(rs.getDate("check_out"));
                r.setStatus(rs.getString("status"));

                list.add(r);
            }
        }
        return list;
    }
}