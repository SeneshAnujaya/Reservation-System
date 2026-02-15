package com.oceanview.reservationsystem.service;

import com.oceanview.dao.UserDAO;

public class UserService {

    private UserDAO userDAO = new UserDAO();

    public boolean validateUser(String username, String password) {
        return userDAO.checkUser(username, password);
    }
}