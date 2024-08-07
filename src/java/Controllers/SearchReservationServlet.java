package Controllers;

import DAL.PreOrderDAO;
import Model.PreOrder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchReservationServlet", urlPatterns = {"/SearchReservationServlet"})
public class SearchReservationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchPhone = request.getParameter("searchPhone");

        PreOrderDAO dao = new PreOrderDAO();
        List<PreOrder> reservations = dao.searchReservationsByPhone(searchPhone);

        request.setAttribute("reservations", reservations);
        request.getRequestDispatcher("searchResults.jsp").forward(request, response);
    }

}
