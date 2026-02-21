package com.oceanview.reservationsystem.dao;

import java.sql.*;

public class UserDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/oceanview";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public boolean checkUser(String username, String password) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            boolean exists = rs.next();

            rs.close();
            stmt.close();
            conn.close();

            return exists;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}