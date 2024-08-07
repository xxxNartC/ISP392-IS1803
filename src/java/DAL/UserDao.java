/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Users;
import Model.dish;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maingocdat
 */
public class UserDao extends DBConnect {

    public List<Users> getAllUsers() throws SQLException {
        List<Users> users = new ArrayList<>();
        String query = "SELECT * FROM user";
        try (PreparedStatement statement = cnn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                users.add(new Users(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6)
                ));
            }
        }
        return users;
    }
    public void deleteUser(int userId) throws SQLException {
        String query = "DELETE user, account FROM user LEFT JOIN account ON user.UserID = account.UserInfoID WHERE user.UserID = ?";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }

    public boolean isUserExists(int id) {
        String query = "SELECT COUNT(*) FROM user WHERE UserID = ?";
        try {
            PreparedStatement statement = cnn.prepareStatement(query);

            statement.setInt(1, id);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions if any
        }
        return false;
    }

   public Users getUserById(int userId) {
        Users user = null;
        String query = "SELECT * FROM user WHERE UserID = ?";
        try (
             PreparedStatement ps = cnn.prepareStatement(query)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = new Users();
                    user.setUserId(rs.getInt("UserID"));
                    user.setName(rs.getString("Name"));
                    user.setPhone(rs.getString("Phone"));
                    user.setAddress(rs.getString("Address"));
                    user.setEmail(rs.getString("Email"));
                    user.setDob(rs.getString("Birthdate"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }


    public static void main(String[] args) throws SQLException {
        UserDao d = new UserDao();
        int userIdToDelete = 12; // Thay số này bằng ID của món ăn bạn muốn kiểm tra
        // Kiểm tra xem món ăn có tồn tại hay không
        d.deleteUser(userIdToDelete);
        // Hiển thị kết quả
        System.out.println("Dish with ID " + userIdToDelete + " has been successfully deleted.");
    }
}
