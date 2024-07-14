/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ControllerDashbroad;

import DAL.DishDao;
import Model.Account;
import Model.dish;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maingocdat
 */
public class Dishmanager extends HttpServlet {

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
            out.println("<title>Servlet Dishmanager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Dishmanager at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");
        String page_raw = (String) request.getParameter("page");
        String search = (String) request.getParameter("search");
        int page = 1;
        try{
            page = Integer.parseInt(page_raw);
        }catch(Exception e){
            
        }

        if (user == null) {
            response.sendRedirect("login");
        } else {
            if (user.getAccountType().matches("user")) {
                PrintWriter out = response.getWriter();
                out.print("Access Denied");
            } else {
                DishDao dao = new DishDao();
                List<dish> list = null;
                List<dish> listByPage = new ArrayList<>();;
                

                try {
                    if(search == null || search.isBlank()){
                    list = dao.getAllDishs();
                    }else{
                   
                    list = dao.getAllDishsBySearch(search);
                    }
                    
                    if (list.isEmpty()) {
                        request.setAttribute("message", "No matching results found.");
                    }else{
                        int totalPage = 0;
                    if (list.size() % 5 != 0) {
                        totalPage = list.size() / 5 + 1;
                    } else {
                        totalPage = list.size() / 5;
                    }
                    //
                    for(int i = page*5 - 5; i < page*5 && i < list.size(); i++){
                        listByPage.add(list.get(i));
                    }
                    request.setAttribute("list", listByPage);
                    request.setAttribute("totalPage", totalPage);
                    request.setAttribute("search", search);
                     System.out.println(list.get(0));
                    }

                } catch (Exception e) {
                    Logger.getLogger(Dishmanager.class.getName()).log(Level.SEVERE, null, e);
                }
                    

                    request.getRequestDispatcher("Dishmanager.jsp").forward(request, response);
                }
            }
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
        processRequest(request, response);
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
