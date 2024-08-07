<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Branché Restaurant - Review Reservation</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <!-- Modal to review reservation -->
        <div class="modal" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="reviewModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="reviewModalLabel">Review Your Reservation</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Name:</strong> <%= request.getParameter("name") %></p>
                        <p><strong>Phone:</strong> <%= request.getParameter("phone") %></p>
                        <p><strong>Date:</strong> <%= request.getParameter("book_date") %></p>
                        <p><strong>Time:</strong> <%= request.getParameter("book_time") %></p>
                        <p><strong>Number of People:</strong> <%= request.getParameter("number_of_people") %></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" onclick="window.history.back();">Go Back</button>
                        <button type="button" class="btn btn-primary" onclick="confirmReservation();">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function(){
            $('#reviewModal').modal('show');
        });

        function confirmReservation() {
            // You can submit a confirmation request to the server here if needed
            alert('Reservation confirmed!');
            window.location.href = 'Home.jsp';
        }
    </script>
</body>
</html>
