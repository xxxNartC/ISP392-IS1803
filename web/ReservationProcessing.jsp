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
                                <span class="subheading">Pre Order List</span>
                            </div>
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${param.error}
                                </div>
                            </c:if>
                            <c:if test="${param.success != null}">
                                <div class="alert alert-success" role="alert">
                                    ${param.success}
                                </div>
                            </c:if>
                            <c:if test="${errorMessage != null}">
                                <div class="alert alert-danger" role="alert">
                                    ${errorMessage}
                                </div>
                            </c:if>
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
                                                <a class="btn btn-secondary" href="ReservationManager?action=view&id=${preOrder.preOrderID}">View</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-secondary" href="ReservationManager?action=view&id=${preOrder.preOrderID}">Delete</a>
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

        <%@include file="close.jsp" %>
    </body>
</html>
