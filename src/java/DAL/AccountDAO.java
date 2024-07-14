/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Account;
import Model.Users;
import com.mysql.cj.xdevapi.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DELL
 */
public class AccountDAO extends DBConnect {

    public AccountDAO() {
        super();
    }

    public Account getAccountByUsername(String username, String password) {
        Account a = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            Connection conn = this.getConnection();
            if (conn == null) {
                throw new SQLException("Database connection is null");
            }

            String strSql = "SELECT * FROM isp392.account WHERE Username = ? AND Password = ?";
            stm = conn.prepareStatement(strSql);
            stm.setString(1, username);
            stm.setString(2, password);
            rs = stm.executeQuery();

            if (rs.next()) {
                String ID = rs.getString(1);
                String acc = rs.getString(2);
                String pass = rs.getString(3);
                String type = rs.getString(4);
                String userInfoId = rs.getString(5);
                String forgot = "demo";
                a = new Account(ID, acc, pass, type, userInfoId,forgot);
                System.out.println("success");
                return a;
            }
        } catch (SQLException e) {
            System.out.println("getUsers: " + e.getMessage());
        }

        return null;
    }

    public Account getAccountByUsername(String username) {
        Account a = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            Connection conn = this.getConnection();
            if (conn == null) {
                throw new SQLException("Database connection is null");
            }

            String strSql = "SELECT * FROM isp392.account WHERE Username = ?";
            stm = conn.prepareStatement(strSql);
            stm.setString(1, username);
            rs = stm.executeQuery();

            if (rs.next()) {
                String ID = rs.getString(1);
                String acc = rs.getString(2);
                String pass = rs.getString(3);
                String type = rs.getString(4);
                String userInfoId = rs.getString(5);
                String forgot = rs.getString(6);
                a = new Account(ID, acc, pass, type, userInfoId,forgot);
                System.out.println("success");
                return a;
            }
        } catch (SQLException e) {
            System.out.println("getUsers: " + e.getMessage());
        }

        return null;
    }

    public boolean updateUser(Account user) {
        String query = "UPDATE isp392.account SET Username = ?, Password = ?, AccountType = ?, UserInfoID = ? WHERE AccountID = ?";
        try (Connection conn = this.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getAccountType());

            // Assuming UserInfoID is an integer
            ps.setInt(4, Integer.parseInt(user.getUserInfoId()));

            ps.setString(5, user.getAccountID());
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        } catch (NumberFormatException ex) {
            System.out.println("Invalid UserInfoID format: " + user.getUserInfoId());
            return false;
        }
    }

    public boolean addUserAndAccount(Users user, Account account) {
        String queryUser = "INSERT INTO isp392.user(Name, Phone, Address, Email, Birthdate) VALUES (?, ?, ?, ?, ?)";
        String queryAccount = "INSERT INTO isp392.account (Username, Password, AccountType, UserInfoID,forgot) VALUES (?, ?, ?, ?,?)";

        Connection conn = null;
        PreparedStatement psUser = null;
        PreparedStatement psAccount = null;

        try {
            conn = this.getConnection();

            // Disable auto-commit mode
            conn.setAutoCommit(false);

            // Insert into user table
            psUser = conn.prepareStatement(queryUser, PreparedStatement.RETURN_GENERATED_KEYS);
            psUser.setString(1, user.getName());
            psUser.setString(2, user.getPhone());
            psUser.setString(3, user.getAddress());
            psUser.setString(4, user.getEmail());
            psUser.setDate(5, java.sql.Date.valueOf(user.getDob()));
            int rowsAffectedUser = psUser.executeUpdate();

            // Get the generated user ID
            ResultSet generatedKeys = psUser.getGeneratedKeys();
            int userId = 0;
            if (generatedKeys.next()) {
                userId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Creating user failed, no ID obtained.");
            }

            // Insert into account table
            psAccount = conn.prepareStatement(queryAccount);
            psAccount.setString(1, account.getUserName());
            psAccount.setString(2, account.getPassword());
            psAccount.setString(3, account.getAccountType());
            psAccount.setInt(4, userId);
            psAccount.setString(5, account.getFotgotPassword());
            int rowsAffectedAccount = psAccount.executeUpdate();

            // Commit transaction
            conn.commit();

            return rowsAffectedUser > 0 && rowsAffectedAccount > 0;
        } catch (SQLException ex) {
            if (conn != null) {
                try {
                    // Rollback transaction in case of an error
                    conn.rollback();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ex.printStackTrace();
            return false;
        } finally {
            // Close resources
            try {
                if (psUser != null) {
                    psUser.close();
                }
                if (psAccount != null) {
                    psAccount.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        // Create user and account objects
        Users user = new Users(14, "aaaa", "aa@g.com", "aaa", "12323", "2000-03-03");
        Account account = new Account("13", "ádasd", "123123", "ádsd", "12","aaa");

        // Create instance of the class containing addUserAndAccount method
        AccountDAO dao = new AccountDAO();

        // Test addUserAndAccount method
        boolean result = dao.addUserAndAccount(user, account);
        if (result) {
            System.out.println("User and account added successfully!");
        } else {
            System.out.println("Failed to add user and account.");
        }
    }
}
