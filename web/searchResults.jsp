<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <h1 class="mb-2 bread">History</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Reservation <i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>
        <section class="search-results-section">
            <div class="container">
                <h2>Search Results</h2>
                <c:if test="${not empty reservations}">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Book Date</th>
                                <th>Number of People</th>
                                <th>Time</th>
                                <th>Table</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reservation" items="${reservations}">
                                <tr>
                                    <td>${reservation.name}</td>
                                    <td>${reservation.phone}</td>
                                    <td>${reservation.bookDate}</td>
                                    <td>${reservation.numberOfPeople}</td>
                                    <td>${reservation.time}</td>
                                    <td>${reservation.tableID}</td>
                                    <td>
                                        <a href="UpdateResController?action=edit&preOrderID=${reservation.preOrderID}" class="btn btn-warning">Update</a>
                                        <a href="UpdateResController?action=delete&preOrderID=${reservation.preOrderID}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this reservation?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${empty reservations}">
                    <p>No reservations found for the given name.</p>
                </c:if>
            </div>
        </section>
        <%@include file="close.jsp" %>
    </body>
</html>
