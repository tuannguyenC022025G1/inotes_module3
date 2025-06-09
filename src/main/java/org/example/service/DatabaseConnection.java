package org.example.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/iNotes?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "123456789";

    public static Connection getConnection() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
    try {


            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.err.println("Kết nối đến cơ sở dữ liệu thất bại. Vui lòng kiểm tra thông tin kết nối!");
            e.printStackTrace(); // In chi tiết lỗi ra console
            return null; // Trả về null để phòng ngừa lỗi NullPointerException
        }
    }
}