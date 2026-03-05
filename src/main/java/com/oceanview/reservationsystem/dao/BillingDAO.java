package com.oceanview.reservationsystem.dao;

import com.oceanview.reservationsystem.model.Billing;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BillingDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SQL =
            "INSERT INTO billing (reservation_id, guest_name, room_type, check_in, check_out, total_amount, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_BY_ID_SQL =
            "SELECT * FROM billing WHERE billing_id = ?";

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public int insertBilling(Billing b) throws Exception {
        int id = 0;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, b.getReservationId());
            ps.setString(2, b.getGuestName());
            ps.setString(3, b.getRoomType());
            ps.setDate(4, b.getCheckIn());
            ps.setDate(5, b.getCheckOut());
            ps.setDouble(6, b.getTotalAmount());
            ps.setString(7, b.getStatus());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                id = rs.getInt(1);
            }
        }
        return id;
    }

    public Billing selectBilling(int id) throws Exception {
        Billing b = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID_SQL)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                b = new Billing();
                b.setBillingId(rs.getInt("billing_id"));
                b.setReservationId(rs.getInt("reservation_id"));
                b.setGuestName(rs.getString("guest_name"));
                b.setRoomType(rs.getString("room_type"));
                b.setCheckIn(rs.getDate("check_in"));
                b.setCheckOut(rs.getDate("check_out"));
                b.setTotalAmount(rs.getDouble("total_amount"));
                b.setStatus(rs.getString("status"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
            }
        }
        return b;
    }

    // Select all billing records (for Billing page)
    public List<Billing> selectAllBillings() throws Exception {
        List<Billing> list = new ArrayList<>();

        String sql = "SELECT * FROM billing ORDER BY created_at DESC";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Billing b = new Billing();
                b.setBillingId(rs.getInt("billing_id"));
                b.setReservationId(rs.getInt("reservation_id"));
                b.setGuestName(rs.getString("guest_name"));
                b.setRoomType(rs.getString("room_type"));
                b.setCheckIn(rs.getDate("check_in"));
                b.setCheckOut(rs.getDate("check_out"));
                b.setTotalAmount(rs.getDouble("total_amount"));
                b.setStatus(rs.getString("status"));
                b.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(b);
            }
        }
        return list;
    }
}