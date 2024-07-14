/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.PreOrderDAO;
import Model.Account;
import Model.PreOrder;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Legion
 */
@WebServlet(name = "MyOrderController", urlPatterns = {"/my-order"})
public class MyOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Account account = (Account) request.getSession().getAttribute("account");

        PreOrderDAO dao = new PreOrderDAO();
        List<PreOrder> list = dao.getAllPreOrders(Integer.parseInt(account.getUserInfoId()));
        request.setAttribute("list", list);
        request.getRequestDispatcher("my-order.jsp").forward(request, response);
    }

}
