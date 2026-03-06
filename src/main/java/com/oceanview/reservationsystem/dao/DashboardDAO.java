package com.oceanview.reservationsystem.dao;

import java.sql.*;

public class DashboardDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public int getTodayCheckins() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM reservations WHERE check_in = CURDATE()";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if(rs.next()) count = rs.getInt(1);

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTodayCheckouts() {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM reservations WHERE check_out = CURDATE()";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if(rs.next()) count = rs.getInt(1);

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalRooms() {
        int count = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM rooms");
             ResultSet rs = ps.executeQuery()) {

            if(rs.next()) count = rs.getInt(1);

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

    public int getTotalReservations() {
        int count = 0;

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) FROM reservations");
             ResultSet rs = ps.executeQuery()) {

            if(rs.next()) count = rs.getInt(1);

        } catch(Exception e){
            e.printStackTrace();
        }

        return count;
    }

}