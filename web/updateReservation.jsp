<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Update Reservation - Branché Restaurant</title>
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
                    <h1 class="mb-2 bread">Update Reservation</h1>
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
                            <span class="subheading">Update your reservation</span>
                        </div>
                        <form action="UpdateResController?action=update" method="POST">
                            <input type="hidden" name="preOrderID" value="${preOrder.preOrderID}">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" id="name" name="name" class="form-control" placeholder="Your Name" value="${preOrder.name}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="tel" id="phone" name="phone" class="form-control" placeholder="Phone" value="${preOrder.phone}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                            <label for="book_date">Date</label>
                                            <input type="date" id="book_date" name="book_date" class="form-control" placeholder="Date" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="number_of_people">Number of People</label>
                                        <input type="number" id="number_of_people" name="numberOfPeople" class="form-control" value="${preOrder.numberOfPeople}" min="1" max="20" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="book_time">Time</label>
                                        <select id="book_time" name="time" class="form-control" required>
                                            <option value="">Select Time</option>
                                            <option value="18:00" ${preOrder.time == '18:00' ? 'selected' : ''}>6:00 PM</option>                                                  
                                            <option value="18:30" ${preOrder.time == '18:30' ? 'selected' : ''}>6:30 PM</option>
                                            <option value="19:00" ${preOrder.time == '19:00' ? 'selected' : ''}>7:00 PM</option>
                                            <option value="19:30" ${preOrder.time == '19:30' ? 'selected' : ''}>7:30 PM</option>
                                            <option value="20:00" ${preOrder.time == '20:00' ? 'selected' : ''}>8:00 PM</option>
                                            <option value="20:30" ${preOrder.time == '20:30' ? 'selected' : ''}>8:30 PM</option>
                                            <option value="21:00" ${preOrder.time == '21:00' ? 'selected' : ''}>9:00 PM</option>
                                            <option value="21:30" ${preOrder.time == '21:30' ? 'selected' : ''}>9:30 PM</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <div class="form-group">
                                        <input type="submit" value="Update Reservation" class="btn btn-primary py-3 px-5">
                                    </div>
                                </div>
                            </div>
                        </form>
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
