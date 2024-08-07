/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.AccountDAO;
import Model.Account;
import Model.Users;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class registerControllers extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet userControllers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet userControllers at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String answer = request.getParameter("answer");
        String question = request.getParameter("question");
        //
        AccountDAO d = new AccountDAO();
        Account existingAccount = d.getAccountByUsername(username);
        if (existingAccount != null) {
            request.setAttribute("errorMessage", "Username already exists");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (username.isBlank() || password.isBlank() || email.isBlank()) {
            request.setAttribute("errorMessage", "Cant be blank");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Kiểm tra username không chứa khoảng trắng, ký tự đặc biệt, và không có số
        if (!username.matches("^[a-zA-Z]*$")) {
            request.setAttribute("error", "Username không được chứa khoảng trắng, ký tự đặc biệt và số.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Kiểm tra password không chứa khoảng trắng và ký tự đặc biệt
        if (password.contains(" ") || !password.matches("^[a-zA-Z0-9]*$")) {
            request.setAttribute("error", "Mật khẩu không được chứa khoảng trắng hoặc ký tự đặc biệt.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Account newAcc = new Account();
        Users newUsers = new Users();
        newAcc.setUserName(username);
        newAcc.setPassword(password);
        newAcc.setAccountType("user");
        newAcc.setFotgotPassword(question + answer);

        newUsers.setName(name);
        newUsers.setPhone(phone);
        newUsers.setAddress(address);
        newUsers.setEmail(email);
        newUsers.setDob(dob);
        boolean add = d.addUserAndAccount(newUsers, newAcc);
        if (add) {
            // Registration successful
            response.sendRedirect("login");
        } else {
            // Registration failed
            request.setAttribute("errorMessage", "Registration failed. Please try again later.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
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
