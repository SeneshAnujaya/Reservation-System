package com.oceanview.reservationsystem.dao;

import com.oceanview.reservationsystem.model.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/hotel_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_ROOM =
            "INSERT INTO Rooms (room_type, room_rate) VALUES (?, ?)";

    private static final String SELECT_ALL_ROOMS =
            "SELECT * FROM Rooms";

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }

    // Insert Room
    public void insertRoom(Room room) {

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(INSERT_ROOM)) {

            ps.setString(1, room.getRoomType());
            ps.setDouble(2, room.getRoomRate());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get All Rooms
    public List<Room> selectAllRooms() {

        List<Room> rooms = new ArrayList<>();

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_ROOMS)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("room_id");
                String type = rs.getString("room_type");
                double rate = rs.getDouble("room_rate");

                rooms.add(new Room(id, type, rate));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }
}