/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.Blog;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Date;

/**
 *
 * @author ACER
 */
public class BlogDAO extends DBConnect {

    public List<Blog> getAllBlog() throws SQLException {
        List<Blog> chefs = new ArrayList<>();
        String query = "SELECT blogid, title, description, image, date FROM isp392.Blog;";

        try (PreparedStatement statement = cnn.prepareStatement(query); ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                chefs.add(new Blog(
                        resultSet.getInt("blogid"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getString("image"),
                        resultSet.getDate("date")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return chefs;
    }

    public void deleteBlog(int id) throws SQLException {
        String query = "DELETE from isp392.Blog where blogid = ?;";

        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public Blog getBlogByID(int id) throws SQLException {
        String query = "SELECT blogid, title, description, image, date FROM isp392.Blog WHERE blogid = ?;";

        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new Blog(
                        resultSet.getInt("blogid"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getString("image"),
                        resultSet.getDate("date")
                );
            }  
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return null;
    }
    
    public void update(Blog blog) throws SQLException {
        String query = "UPDATE isp392.Blog SET title = ?, description = ?, image = ? WHERE blogid = ?";

        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setString(1, blog.getTitle());
            statement.setString(2, blog.getDescription());
            statement.setString(3, blog.getImage());
            statement.setInt(4, blog.getBlogid());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    
    public void addBlog(Blog blog) throws SQLException {
        String query = "INSERT INTO isp392.Blog(title, description, image, date) VALUES (?,?,?,?)";
        try (PreparedStatement statement = cnn.prepareStatement(query)) {
            statement.setString(1, blog.getTitle());
            statement.setString(2, blog.getDescription());
            statement.setString(3, blog.getImage());
            statement.setDate(4, java.sql.Date.valueOf(LocalDate.now()));
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
    
    public static void main(String[] args) throws SQLException {
        BlogDAO aO = new BlogDAO();
        aO.addBlog(new Blog("123", "123", "123"));
    }
    
}
