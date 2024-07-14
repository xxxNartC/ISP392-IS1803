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
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8 ftco-animate makereservation p-4 p-md-5 pt-5">
                        <div class="py-md-5">
                            <div class="heading-section ftco-animate mb-5 text-center">
                                <span class="subheading">Pre Order Detail</span>
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

                            <h2 class="mb-4 text-center">Pre Order Detail</h2>
                            <form action="ReservationManager" method="POST">
                                <input type="hidden" name="preOrderID" value="${preOrder.preOrderID}">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="name" style="font-weight: bold">Name</label>
                                        <input type="text" class="form-control" id="name" placeholder="Name" value="${preOrder.name}" name="name" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="phone" style="font-weight: bold">Phone</label>
                                        <input type="text" class="form-control" id="phone" placeholder="Phone" value="${preOrder.phone}" name="phone" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="tableID" style="font-weight: bold">Table</label>
                                        <select class="form-control" id="tableID" placeholder="Table ID" value="${preOrder.tableID}" name="tableID">
                                            <c:forEach var="t" items="${tables}">
                                                <option value="${t.tableID}" ${t.tableID == preOrder.tableID ? 'selected' : ''}>${t.tableNumber} - ${t.seats} seats</option>
                                            </c:forEach>
                                        </select>
                                        <!--<input type="number" class="form-control" id="tableID" placeholder="Table ID" value="${preOrder.tableID}" name="tableID">-->
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="bookDate" style="font-weight: bold">Book Date</label>
                                        <input type="text" class="form-control" id="bookDate" placeholder="Book Date" value="${preOrder.bookDate}" name="book_date" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="numberOfPeople" style="font-weight: bold">Number of People</label>
                                        <input type="number" class="form-control" id="numberOfPeople" placeholder="Number of People" value="${preOrder.numberOfPeople}" name="number_of_people" readonly>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="time" style="font-weight: bold">Time</label>
                                        <input type="time" class="form-control" id="time" placeholder="Time" value="${preOrder.time}" name="time" readonly>
                                    </div>
                                </div>
                                <div class="form-group ${preOrder.status eq 'Processing' ? '' : 'd-none'}">
                                    <label for="status" style="font-weight: bold">Status</label>
                                    <select class="form-control" id="status" name="status" required>
                                        <option value="Wait for deposit">Accepted</option>
                                        <option value="Rejected">Rejected</option>
                                    </select>                        
                                </div>
                                <div class="form-group ${preOrder.status eq 'Processing' ? 'd-none' : ''}">
                                    <label for="status" style="font-weight: bold">Status</label>
                                    <input type="text" class="form-control" value="${preOrder.status}" readonly>
<!--                                    <select class="form-control" id="status" name="status" readonly>
                                        <option value="x">${preOrder.status}</option>
                                    </select>                        -->
                                </div>
                                <button type="submit" class="btn btn-primary btn-block ${preOrder.status eq 'Processing' ? '' : 'd-none'}">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="close.jsp" %>
    </body>
</html>
