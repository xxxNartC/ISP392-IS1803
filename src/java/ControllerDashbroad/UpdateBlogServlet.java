/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ControllerDashbroad;

import DAL.BlogDAO;
import Model.Account;
import Model.Blog;
import com.mysql.cj.jdbc.Blob;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 15)
public class UpdateBlogServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateBlogServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBlogServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + "images";
        BlogDAO blogDAO = new BlogDAO();
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Blog blog = blogDAO.getBlogByID(id);
            blog.setDescription(request.getParameter("description"));
            blog.setTitle(request.getParameter("title"));
            Part image = request.getPart("image");

            if (image != null) {
                File uploadDir = new File(uploadFilePath);
                if (uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String fileName = Paths.get(image.getSubmittedFileName()).getFileName().toString();

                String filePath = uploadFilePath + File.separator + fileName;
                image.write(filePath);
                blog.setImage(fileName);
            }

            blogDAO.update(blog);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateBlogServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("blogmana");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
