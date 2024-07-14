/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Table;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TableDAO extends DBConnect {
    
    public List<Table> getAll() throws SQLException {
        List<Table> list = new ArrayList<>();
        String query = "SELECT * FROM restauranttable";
        try (PreparedStatement statement = cnn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                
                Table table = new Table();
                table.setTableID(resultSet.getInt("TableID"));
                table.setTableNumber(resultSet.getInt("TableNumber"));
                table.setSeats(resultSet.getInt("Seats"));
                table.setStatus(resultSet.getString("Status"));
                
                list.add(table);
            }
        }
        return list;
    }
    
}
