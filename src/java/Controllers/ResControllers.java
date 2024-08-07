package Controllers;

import DAL.PreOrderDAO;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ResControllers extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("viewRes.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("currentDate", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String bookDate = request.getParameter("book_date");
        String bookTime = request.getParameter("book_time");
        String numberOfPeopleStr = request.getParameter("number_of_people");

        // Basic validation
        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();
        int numberOfPeople = 0;

        if (name == null || name.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() || 
            bookDate == null || bookDate.trim().isEmpty() ||
            bookTime == null || bookTime.trim().isEmpty() || 
            numberOfPeopleStr == null || numberOfPeopleStr.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("All fields are required.\\n");
        } else {
            try {
                numberOfPeople = Integer.parseInt(numberOfPeopleStr);
                if (numberOfPeople <= 0) {
                    isValid = false;
                    errorMessage.append("Number of people must be greater than zero.\\n");
                }
            } catch (NumberFormatException e) {
                isValid = false;
                errorMessage.append("Number of people must be a valid integer.\\n");
            }
        }

        if (isValid) {
            // Convert bookDate and bookTime to Date object
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

            // Perform the reservation
            PreOrderDAO preOrderDAO = new PreOrderDAO();
            try {
                preOrderDAO.addPreOrder(name, phone, bookDateOnly, bookTimeOnly, numberOfPeople);
                // Set attributes in request
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("bookDate", bookDate);
                request.setAttribute("bookTime", bookTime);
                request.setAttribute("numberOfPeople", numberOfPeople);
                
                // Forward to the review page
                request.getRequestDispatcher("viewRes.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                errorMessage.append("Failed to process reservation.\\n");
                generateErrorPopup(response, errorMessage.toString());
            }
        } else {
            generateErrorPopup(response, errorMessage.toString());
        }
    }

    private void generateErrorPopup(HttpServletResponse response, String message) throws IOException {
        String popupHtml = "<script>"
                + "alert('Reservation failed!\\n" + message + "');"
                + "window.history.back();"
                + "</script>";
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println(popupHtml);
    }

    @Override
    public String getServletInfo() {
        return "Reservation Controller";
    }
}
