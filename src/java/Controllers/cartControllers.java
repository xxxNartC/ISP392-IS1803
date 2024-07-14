/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.DishDao;
import DAL.PreOrderDAO;
import Model.Account;
import java.sql.Time;
import Model.PreOrder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author DELL
 */
@WebServlet(name = "cartControllers", urlPatterns = {"/cart"})
public class cartControllers extends HttpServlet {

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
            out.println("<title>Servlet cartControllers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cartControllers at " + request.getContextPath() + "</h1>");
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

        request.setAttribute("dishes", new DishDao().getAllDishs());

        request.getRequestDispatcher("cart.jsp").forward(request, response);
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

        try {

            Account user = (Account) request.getSession().getAttribute("account");

            // Retrieve form parameters
            String name = request.getParameter("name");
            String bookDateStr = request.getParameter("bookDate");
            String bookTimeStr = request.getParameter("bookTime");
            String phone = request.getParameter("phone");
            String numberOfPeopleStr = request.getParameter("numberOfPeople");
            String email = request.getParameter("email");

            String[] dishIds = request.getParameterValues("dishId");
            String[] quantities = request.getParameterValues("quantity");

            // Date and Time formatters
            SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");

            // Parse date and time
            Date bookDate = null;
            Time bookTime = null;

            bookDate = dateFormatter.parse(bookDateStr);
            Date parsedTime = timeFormatter.parse(bookTimeStr);
            bookTime = new Time(parsedTime.getTime());

            int numberOfPeople = Integer.parseInt(numberOfPeopleStr);

            // Create PreOrder object
            PreOrder preOrder = new PreOrder();
            preOrder.setName(name);
            preOrder.setPhone(phone);
            preOrder.setBookDate(bookDate);
            preOrder.setNumberOfPeople(numberOfPeople);
            preOrder.setTime(bookTime);
            preOrder.setStatus("Processing");
            preOrder.setUserId(Integer.parseInt(user.getAccountID()));

            String dishOrder = "";
            for (int i = 0; i < dishIds.length; i++) {
                dishOrder += i==0 ? "" : ";";
                dishOrder += dishIds[i] + ":" + quantities[i];
            }
            preOrder.setDishOrder(dishOrder);

            new PreOrderDAO().createPreOrder(preOrder);
            
            response.sendRedirect("cart?success");

        } catch (Exception e) {

            System.out.println(e);
            response.sendRedirect("cart?fail");

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
