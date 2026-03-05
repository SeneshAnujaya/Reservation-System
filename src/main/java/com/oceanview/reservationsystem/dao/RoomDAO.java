//package com.oceanview.reservationsystem.dao;
//
//import com.oceanview.reservationsystem.model.Room;
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class RoomDAO {
//
//    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
//    private String jdbcUsername = "root";
//    private String jdbcPassword = "";
//
//    private static final String INSERT_ROOM =
//            "INSERT INTO Rooms (room_type, room_rate) VALUES (?, ?)";
//
//    private static final String SELECT_ALL_ROOMS =
//            "SELECT * FROM Rooms";
//
//    protected Connection getConnection() {
//        Connection connection = null;
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return connection;
//    }
//
//    // Insert Room
//    public void insertRoom(Room room) {
//
//        try (Connection connection = getConnection();
//             PreparedStatement ps = connection.prepareStatement(INSERT_ROOM)) {
//
//            ps.setString(1, room.getRoomType());
//            ps.setDouble(2, room.getRoomRate());
//
//            ps.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    // Get All Rooms
//    public List<Room> selectAllRooms() {
//
//        List<Room> rooms = new ArrayList<>();
//
//        try (Connection connection = getConnection();
//             PreparedStatement ps = connection.prepareStatement(SELECT_ALL_ROOMS)) {
//
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//
//                int id = rs.getInt("room_id");
//                String type = rs.getString("room_type");
//                double rate = rs.getDouble("room_rate");
//
//                rooms.add(new Room(id, type, rate));
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return rooms;
//    }
//
//    public Room selectRoomById(int roomId) {
//        return null;
//    }
//
//    public void updateRoom(Room room) {
//    }
//
//    public void deleteRoom(int roomId) {
//    }
//}

package com.oceanview.reservationsystem.dao;

import com.oceanview.reservationsystem.model.Room;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/oceanview";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_ROOM =
            "INSERT INTO Rooms (room_type, room_rate) VALUES (?, ?)";

    private static final String SELECT_ALL_ROOMS =
            "SELECT * FROM Rooms";

    private static final String SELECT_ROOM_BY_ID =
            "SELECT * FROM Rooms WHERE room_id = ?";

    private static final String UPDATE_ROOM =
            "UPDATE Rooms SET room_type = ?, room_rate = ? WHERE room_id = ?";

    private static final String DELETE_ROOM =
            "DELETE FROM Rooms WHERE room_id = ?";

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

    // Get Room by ID
    public Room selectRoomById(int roomId) {
        Room room = null;

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(SELECT_ROOM_BY_ID)) {

            ps.setInt(1, roomId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String type = rs.getString("room_type");
                double rate = rs.getDouble("room_rate");

                room = new Room(roomId, type, rate);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return room;
    }

    // Update Room
    public void updateRoom(Room room) {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(UPDATE_ROOM)) {

            ps.setString(1, room.getRoomType());
            ps.setDouble(2, room.getRoomRate());
            ps.setInt(3, room.getRoomId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Delete Room
    public void deleteRoom(int roomId) {
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(DELETE_ROOM)) {

            ps.setInt(1, roomId);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}