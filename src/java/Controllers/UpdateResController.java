package Controllers;

import DAL.PreOrderDAO;
import Model.PreOrder;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpdateResController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("updateReservation.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "edit":
                    handleEdit(request, response);
                    break;
                case "delete":
                    handleDelete(request, response);
                    break;
                default:
                    processRequest(request, response);
                    break;
            }
        } else {
            processRequest(request, response);
        }
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String preOrderIDStr = request.getParameter("preOrderID");
        if (preOrderIDStr != null && !preOrderIDStr.isEmpty()) {
            try {
                int preOrderID = Integer.parseInt(preOrderIDStr);

                PreOrderDAO preOrderDAO = new PreOrderDAO();
                PreOrder preOrder = preOrderDAO.getPreOrderById(preOrderID);

                request.setAttribute("preOrder", preOrder);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        processRequest(request, response);
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String preOrderIDStr = request.getParameter("preOrderID");
        if (preOrderIDStr != null && !preOrderIDStr.isEmpty()) {
            try {
                int preOrderID = Integer.parseInt(preOrderIDStr);

                PreOrderDAO preOrderDAO = new PreOrderDAO();
                preOrderDAO.deletePreOrder(preOrderID);

                response.sendRedirect("searchRes.jsp");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("update".equals(action)) {
            handleUpdate(request, response);
        } else {
            processRequest(request, response);
        }
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String preOrderIDStr = request.getParameter("preOrderID");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String bookDate = request.getParameter("book_date");
        String bookTime = request.getParameter("time");
        String numberOfPeopleStr = request.getParameter("numberOfPeople");

        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();
        int numberOfPeople = 0;
        int preOrderID = 0;

        if (preOrderIDStr == null || preOrderIDStr.trim().isEmpty()
                || name == null || name.trim().isEmpty()
                || phone == null || phone.trim().isEmpty()
                || bookDate == null || bookDate.trim().isEmpty()
                || bookTime == null || bookTime.trim().isEmpty()
                || numberOfPeopleStr == null || numberOfPeopleStr.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("All fields are required.\\n");
        } else {
            try {
                preOrderID = Integer.parseInt(preOrderIDStr);
                numberOfPeople = Integer.parseInt(numberOfPeopleStr);
                if (numberOfPeople <= 0) {
                    isValid = false;
                    errorMessage.append("Number of people must be greater than zero.\\n");
                }
            } catch (NumberFormatException e) {
                isValid = false;
                errorMessage.append("Invalid input format.\\n");
            }
        }

        if (isValid) {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            Date bookDateOnly;
            Date bookTimeOnly;
            try {
                bookDateOnly = dateFormat.parse(bookDate);
                bookTimeOnly = timeFormat.parse(bookTime);
            } catch (ParseException e) {
                isValid = false;
                errorMessage.append("Invalid date or time format.\\n");
                generateErrorPopup(response, errorMessage.toString());
                return;
            }

            PreOrder preOrder = new PreOrder();
            preOrder.setPreOrderID(preOrderID);
            preOrder.setName(name);
            preOrder.setPhone(phone);
            preOrder.setBookDate(new java.sql.Date(bookDateOnly.getTime()));
            preOrder.setTime(bookTimeOnly);
            preOrder.setNumberOfPeople(numberOfPeople);

            PreOrderDAO preOrderDAO = new PreOrderDAO();
            try {
                preOrderDAO.updatePreOrder(preOrder);
                
                // Format date and time to human-readable strings
                SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat displayTimeFormat = new SimpleDateFormat("hh:mm a");
                String formattedDate = displayDateFormat.format(preOrder.getBookDate());
                String formattedTime = displayTimeFormat.format(preOrder.getTime());
                
                request.setAttribute("preOrder", preOrder);
                request.setAttribute("formattedDate", formattedDate);
                request.setAttribute("formattedTime", formattedTime);
                request.setAttribute("updateSuccess", true);
                request.getRequestDispatcher("viewRes2.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage.append("Failed to update reservation.\\n");
                generateErrorPopup(response, errorMessage.toString());
            }
        } else {
            generateErrorPopup(response, errorMessage.toString());
        }
    }

    private void generateErrorPopup(HttpServletResponse response, String message) throws IOException {
        String popupHtml = "<script>"
                + "alert('Update failed!\\n" + message + "');"
                + "window.history.back();"
                + "</script>";
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(popupHtml);
    }

    @Override
    public String getServletInfo() {
        return "Update Reservation Controller";
    }
}
