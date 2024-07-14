<%-- 
    Document   : reservation
    Created on : 18 thg 5, 2024, 23:13:47
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Branché Restaurant</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/ionicons.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center mb-4">
                        <h1 class="mb-2 bread">Book a Table</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container-fluid px-0">
                <div class="row d-flex no-gutters">
                    <div class="col-md-12 ftco-animate makereservation p-4 p-md-5 pt-5">
                        <div class="py-md-5">
                            <div class="heading-section ftco-animate mb-5">
                                <span class="subheading">My Order List</span>
                            </div>
                            <table class="table table-bordered">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Phone</th>
                                        <th>Number of People</th>
                                        <th>Book Date</th>
                                        <th>Time</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${requestScope.list}" var="preOrder">
                                        <tr>
                                            <td>${preOrder.preOrderID}</td>
                                            <td>${preOrder.name}</td>
                                            <td>${preOrder.phone}</td>
                                            <td>${preOrder.numberOfPeople}</td>
                                            <td>${preOrder.bookDate}</td>
                                            <td>${preOrder.time}</td>
                                            <td>
                                                <span class="badge badge-info">
                                                    ${preOrder.status}
                                                </span>
                                            </td>
                                            <td>
                                                <c:if test="${preOrder.status eq 'Wait for deposit'}">
                                                    <a class="btn btn-secondary" href="payment?preOrderID=${preOrder.preOrderID}">Deposit</a>
                                                </c:if>
                                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#detailsModal${preOrder.preOrderID}">
                                                    Details
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex align-items-stretch pb-5 pb-md-0">
                        <div id="map"></div>
                    </div>
                </div>
            </div>
        </section>

        <c:forEach items="${requestScope.list}" var="preOrder">
            <!-- Modal -->
            <div class="modal fade" id="detailsModal${preOrder.preOrderID}" tabindex="-1" role="dialog" aria-labelledby="detailsModalLabel${preOrder.preOrderID}" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="detailsModalLabel${preOrder.preOrderID}">Reservation Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p><strong>ID:</strong> ${preOrder.preOrderID}</p>
                            <p><strong>Name:</strong> ${preOrder.name}</p>
                            <p><strong>Phone:</strong> ${preOrder.phone}</p>
                            <p><strong>Number of People:</strong> ${preOrder.numberOfPeople}</p>
                            <p><strong>Book Date:</strong> ${preOrder.bookDate}</p>
                            <p><strong>Time:</strong> ${preOrder.time}</p>
                            <p><strong>Status:</strong> ${preOrder.status}</p>
                        </div>

                        <!-- Table to display preorder details -->
                        <c:if test="${preOrder.detail.size() > 0}">
                            <h5 class="mt-4">Dish Order Details</h5>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th>Dish Name</th>
                                        <th>Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${preOrder.detail}" var="detail">
                                        <tr>
                                            <td><img src="images/${detail.dish.image}" alt="Image" class="img-fluid" style="width: 100px; height: auto;"></td>
                                            <td>${detail.dish.name}</td>
                                            <td>${detail.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <%@include file="close.jsp" %>
    </body>
</html>
