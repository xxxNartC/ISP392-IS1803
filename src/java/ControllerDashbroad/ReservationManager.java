package ControllerDashbroad;

import DAL.PreOrderDAO;
import DAL.TableDAO;
import Model.Account;
import Model.PreOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.SQLException;

public class ReservationManager extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ReservationManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReservationManager at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("account");

        if (user == null) {
            response.sendRedirect("login");
        } else {
            if (user.getAccountType().matches("user")) {
                PrintWriter out = response.getWriter();
                out.print("Access Denied");
            } else {
                String id_raw = request.getParameter("id");
                PreOrderDAO dao = new PreOrderDAO();

                try {
                    int id = Integer.parseInt(id_raw);
                    PreOrder preOrder = dao.getPreOrderById(id);
                    request.setAttribute("preOrder", preOrder);
                    request.setAttribute("tables", new TableDAO().getAll());
                    request.getRequestDispatcher("ReservationsManager.jsp").forward(request, response);
                } catch (Exception e) {
                    System.out.println(e);
                    response.sendRedirect("errorPage.jsp");
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String preOrderIDStr = request.getParameter("preOrderID");
        String status = request.getParameter("status");
        int tableID = Integer.parseInt(request.getParameter("tableID"));

        try {
            int preOrderID = Integer.parseInt(preOrderIDStr);

            PreOrderDAO dao = new PreOrderDAO();
            boolean updated = dao.updateStatusPreOrder(preOrderID, status, tableID);

            if (updated) {
                response.sendRedirect("ManagerProcessing?success=Status updated successfully");
            } else {
                response.sendRedirect("ManagerProcessing?error=Failed to update status");
            }
        } catch (NumberFormatException e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            response.sendRedirect("ManagerProcessing?error=Error updating status: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
