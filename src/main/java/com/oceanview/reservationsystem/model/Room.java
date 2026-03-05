package com.oceanview.reservationsystem.model;

public class Room {

    private int roomId;
    private String roomType;
    private double roomRate;

    public Room() {
    }

    public Room(int roomId, String roomType, double roomRate) {
        this.roomId = roomId;
        this.roomType = roomType;
        this.roomRate = roomRate;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public double getRoomRate() {
        return roomRate;
    }

    public void setRoomRate(double roomRate) {
        this.roomRate = roomRate;
    }
}