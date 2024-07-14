/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Chef;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class ChefDAO extends DBConnect {

    public List<Chef> getAllChef() throws SQLException {
        List<Chef> chefs = new ArrayList<>();
        String query = "SELECT chefId, Name, Role, Image FROM isp392.chef;";

        try (PreparedStatement statement = cnn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                chefs.add(new Chef(
                        resultSet.getInt("chefId"),
                        resultSet.getString("Name"),
                        resultSet.getString("Role"),
                        resultSet.getString("Image")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return chefs;
    }

    public Chef getAccountByUsername(int id) {
        Chef c = null;
        PreparedStatement stm = null;
        ResultSet resultSet = null;

        try {

            String strSql = "SELECT *  from chef where chefId = ? ";
            stm = cnn.prepareStatement(strSql);
            stm.setInt(1, id);

            resultSet = stm.executeQuery();

            if (resultSet.next()) {

                c = new Chef(
                        resultSet.getInt("chefId"),
                        resultSet.getString("Name"),
                        resultSet.getInt("salary"),
                        resultSet.getInt("phone"),
                        resultSet.getString("address"),
                        resultSet.getString("Description"),
                        resultSet.getString("role"),
                        resultSet.getString("image")
                );

                return c;
            }
        } catch (SQLException e) {
            System.out.println("getUsers: " + e.getMessage());
        }

        return null;
    }

    public static void main(String[] args) {

        try {
            ChefDAO dao = new ChefDAO();
            List<Chef> chef = dao.getAllChef();
             System.out.println(dao.getAccountByUsername(1));
        } catch (SQLException ex) {
            Logger.getLogger(ChefDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
