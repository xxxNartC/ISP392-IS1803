package Controllers;

import DAL.DishDao;
import Model.Cart;
import Model.CartDish;
import Model.Item;
import Model.dish;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "AddToCartControllers", urlPatterns = {"/addtocart"})
public class AddToCartControllers extends HttpServlet {

    public static List<CartDish> isCart = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddToCartControllers</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartControllers at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // This doGet method should only handle initial requests, not POST actions
//        String action = request.getParameter("action");
//        String code = request.getParameter("code");
//        String id = request.getParameter("id");
//        if (action.equals("add")) {
//
//            try {
//                int icode = Integer.parseInt(code);
//                DishDao dao = new DishDao();
//                dish dishs = dao.getDishesByID1(icode);
//                if (dishs != null) {
//                    CartDish cd = new CartDish();
//                    cd.setDishs(dishs);
//                    cd.setQuantity(1);
//                    isCart.add(cd);
//                    request.setAttribute("isCart", isCart);
//                }
//                // Redirect to the page where the form is submitted
//                request.getRequestDispatcher("AddToCart.jsp").forward(request, response);
//            } catch (NumberFormatException e) {
//                System.out.println("Invalid code format: " + code);
//                request.getRequestDispatcher("dishs").forward(request, response);
//            }
//
//        } else if (action.equals("dele")) {
//            int iid = Integer.parseInt(id);
//            isCart.remove(iid);
//            request.setAttribute("isCart", isCart);
//            request.getRequestDispatcher("AddToCart.jsp").forward(request, response);
//
//        } else {
//            // Redirect to the default page if action is not recognized
//            request.getRequestDispatcher("dishs").forward(request, response);     
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        String image = request.getParameter("image");
//        String name = request.getParameter("name");
//        String price = request.getParameter("price");
//        String quantity = request.getParameter("quantity");
//        System.out.println(image);
//        System.out.println(price);
//        System.out.println(quantity);
//        System.out.println(name);
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        String tnum = request.getParameter("num");
        String tid = request.getParameter("dishID");
        int num = 1;
        int id = 0;

        try {
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);

            DishDao dishDao = new DishDao();
            dish di = dishDao.getDishesByID1(id);
            double price = di.getPrice();
            Item item = new Item(di, price, num);
            cart.addItem(item);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        session.setAttribute("cart", cart);
        session.setAttribute("size", cart.getItems().size());
        
        response.sendRedirect("dishs?added=true");
//        request.getRequestDispatcher("Cart.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
