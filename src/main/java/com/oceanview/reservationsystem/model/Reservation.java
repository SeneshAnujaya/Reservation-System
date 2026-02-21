package com.oceanview.reservationsystem.model;

import java.sql.Date;

public class Reservation {

    private int id;
    private String guestName;
    private String email;
    private String phone;
    private String roomType;
    private Date checkIn;
    private Date checkOut;
    private String status;

    // Getters

    public int getId() {
        return id;
    }

    public String getGuestName() {
        return guestName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getRoomType() {
        return roomType;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public String getStatus() {
        return status;
    }

    // Setters

    public void setId(int id) {
        this.id = id;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}