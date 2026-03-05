package com.oceanview.reservationsystem.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Billing {

    private int billingId;
    private int reservationId;
    private String guestName;
    private String roomType;
    private Date checkIn;
    private Date checkOut;
    private double totalAmount;
    private String status;
    private Timestamp createdAt;

    // Getters and Setters
    public int getBillingId() { return billingId; }
    public void setBillingId(int billingId) { this.billingId = billingId; }

    public int getReservationId() { return reservationId; }
    public void setReservationId(int reservationId) { this.reservationId = reservationId; }

    public String getGuestName() { return guestName; }
    public void setGuestName(String guestName) { this.guestName = guestName; }

    public String getRoomType() { return roomType; }
    public void setRoomType(String roomType) { this.roomType = roomType; }

    public Date getCheckIn() { return checkIn; }
    public void setCheckIn(Date checkIn) { this.checkIn = checkIn; }

    public Date getCheckOut() { return checkOut; }
    public void setCheckOut(Date checkOut) { this.checkOut = checkOut; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}