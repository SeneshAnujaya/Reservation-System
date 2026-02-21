package com.oceanview.reservationsystem.service;

//import com.oceanview.dao.UserDAO;
import com.oceanview.reservationsystem.dao.UserDAO;

public class UserService {

    private com.oceanview.reservationsystem.dao.UserDAO userDAO = new UserDAO();

    public boolean validateUser(String username, String password) {
        return userDAO.checkUser(username, password);
    }
}