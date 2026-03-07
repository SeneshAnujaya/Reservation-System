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

    public int[] getWeeklyReservations() {

        int[] weekly = new int[7];

        String sql = "SELECT DAYOFWEEK(check_in) as day, COUNT(*) as total " +
                "FROM reservations " +
                "WHERE YEARWEEK(check_in, 1) = YEARWEEK(CURDATE(), 1) " +
                "GROUP BY DAYOFWEEK(check_in)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int day = rs.getInt("day");
                int total = rs.getInt("total");

                int index = day - 1; // convert MySQL day to array index
                weekly[index] = total;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return weekly;
    }

}