//package com.oceanview.reservationsystem.dao;
//
//import com.oceanview.reservationsystem.model.Reservation;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class ReservationDAO {
//
//    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "";
//
//    private static final String INSERT_SQL =
//            "INSERT INTO reservations (guest_name, email, phone, room_type, check_in, check_out, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
//
//    private static final String SELECT_ALL_SQL =
//            "SELECT * FROM reservations";
//
//    protected Connection getConnection() throws Exception {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//    }
//
//    public void insertReservation(Reservation reservation) throws Exception {
//        try (Connection connection = getConnection();
//             PreparedStatement ps = connection.prepareStatement(INSERT_SQL)) {
//
//            ps.setString(1, reservation.getGuestName());
//            ps.setString(2, reservation.getEmail());
//            ps.setString(3, reservation.getPhone());
//            ps.setString(4, reservation.getRoomType());
//            ps.setDate(5, reservation.getCheckIn());
//            ps.setDate(6, reservation.getCheckOut());
//            ps.setString(7, reservation.getStatus());
//
//            ps.executeUpdate();
//        }
//    }
//
//    public List<Reservation> selectAllReservations() throws Exception {
//        List<Reservation> list = new ArrayList<>();
//
//        try (Connection connection = getConnection();
//             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_SQL);
//             ResultSet rs = ps.executeQuery()) {
//
//            while (rs.next()) {
//                Reservation r = new Reservation();
//                r.setId(rs.getInt("id"));
//                r.setGuestName(rs.getString("guest_name"));
//                r.setEmail(rs.getString("email"));
//                r.setPhone(rs.getString("phone"));
//                r.setRoomType(rs.getString("room_type"));
//                r.setCheckIn(rs.getDate("check_in"));
//                r.setCheckOut(rs.getDate("check_out"));
//                r.setStatus(rs.getString("status"));
//
//                list.add(r);
//            }
//        }
//        return list;
//    }
//
//    public Reservation selectReservation(int id) {
//        return null;
//    }
//
//    public void updateReservation(Reservation r) {
//    }
//}

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

    private static final String SELECT_BY_ID_SQL =
            "SELECT * FROM reservations WHERE id = ?";

    private static final String UPDATE_SQL =
            "UPDATE reservations SET guest_name=?, email=?, phone=?, room_type=?, check_in=?, check_out=?, status=? WHERE id=?";

    private static final String DELETE_SQL =
            "DELETE FROM reservations WHERE id=?";


    // ------------------------------------------------
    // DATABASE CONNECTION
    // ------------------------------------------------
    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }


    // ------------------------------------------------
    // INSERT
    // ------------------------------------------------
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


    // ------------------------------------------------
    // SELECT ALL
    // ------------------------------------------------
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


    // ------------------------------------------------
    // SELECT BY ID (FOR EDIT)
    // ------------------------------------------------
    public Reservation selectReservation(int id) {

        Reservation reservation = null;

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_BY_ID_SQL)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                reservation = new Reservation();
                reservation.setId(rs.getInt("id"));
                reservation.setGuestName(rs.getString("guest_name"));
                reservation.setEmail(rs.getString("email"));
                reservation.setPhone(rs.getString("phone"));
                reservation.setRoomType(rs.getString("room_type"));
                reservation.setCheckIn(rs.getDate("check_in"));
                reservation.setCheckOut(rs.getDate("check_out"));
                reservation.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservation;
    }


    // ------------------------------------------------
    // UPDATE
    // ------------------------------------------------
    public boolean updateReservation(Reservation r) {

        boolean rowUpdated = false;

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_SQL)) {

            ps.setString(1, r.getGuestName());
            ps.setString(2, r.getEmail());
            ps.setString(3, r.getPhone());
            ps.setString(4, r.getRoomType());
            ps.setDate(5, r.getCheckIn());
            ps.setDate(6, r.getCheckOut());
            ps.setString(7, r.getStatus());
            ps.setInt(8, r.getId());

            rowUpdated = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }


    // ------------------------------------------------
    // DELETE (For Next Step)
    // ------------------------------------------------
    public boolean deleteReservation(int id) {

        boolean rowDeleted = false;

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_SQL)) {

            ps.setInt(1, id);
            rowDeleted = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
}