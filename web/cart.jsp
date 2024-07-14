<%-- 
    Document   : Login
    Created on : 14 thg 5, 2024, 22:04:45
    Author     : DELL
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- DataTables CSS -->
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Branché Restaurant</title>


        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap4" />

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <link href="css/tiny-slider.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">

        <script>
            // Function to set min attribute to today's date
            function setMinDate() {
                // Get today's date in yyyy-mm-dd format
                let today = new Date().toISOString().split('T')[0];

                // Set min attribute of bookDate input field
                document.getElementById('bookDate').min = today;
            }

            // Call setMinDate function when the page loads
            window.onload = setMinDate;
        </script>
    </head>


    <body>
        <%@include file="header.jsp" %>
        <!-- END nav -->

        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center mb-4">
                        <h1 class="mb-2 bread">Booking</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Booking<i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>
        <form id="cartForm" action="cart" method="post">
            <input type="hidden" id="dishID" name="dishID" value="">
            <input type="hidden" id="action" name="action" value="">
            <input type="hidden" id="num" name="num" value="">
        </form>

        <div class="untree_co-section before-footer-section">
            <div class="container">

                <c:if test="${param.success ne null}">
                    <div class="alert alert-success" role="alert">
                        Success!
                    </div>
                </c:if>
                <c:if test="${param.fail ne null}">
                    <div class="alert alert-danger" role="alert">
                        Failed!
                    </div>
                </c:if>

                <div class="row mb-5">
                    <form class="col-md-12" action="cart" method="post">
                        <div class="site-blocks-table">
                            <table class="table table-borderless" id="dishTable">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${dishes}">
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="images/${item.image}" alt="Image" class="img-fluid" style="width: 100px; height: auto;">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black">${item.name}</h2>
                                            </td>
                                            <td id="price_${item.dishID}">€${item.price}</td>
                                            <td>
                                                <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                    <div class="input-group-prepend">
                                                        <button class="btn btn-outline-black decrease" type="button" onclick="updateCart(${item.dishID}, -1)">&minus;</button>
                                                    </div>
                                                    <input type="hidden" value="${item.dishID}" name="dishId">
                                                    <input type="number" class="form-control text-center quantity-amount" name="quantity" id="quantity_${item.dishID}" value="0" placeholder="" aria-label="Quantity" aria-describedby="button-addon1" readonly>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-outline-black increase" type="button" onclick="updateCart(${item.dishID}, 1)">&plus;</button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="total_${item.dishID}">0</td>
                                        </tr>
                                    </c:forEach>



                                </tbody>
                            </table>
                        </div>

                        <div class="row mt-5">
                            <div  class="col-7">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" value="${sessionScope.user.name}" required>
                                </div>
                                <div class="form-group">
                                    <label for="bookDate">Book Date</label>
                                    <input type="date" class="form-control" id="bookDate" name="bookDate" required>
                                </div>
                                <div class="form-group">
                                    <label for="bookTime">Book Time</label>
                                    <input type="time" class="form-control" id="bookTime" name="bookTime" required>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" value="${sessionScope.user.phone}" required>
                                </div>
                                <div class="form-group">
                                    <label for="numberOfPeople">Number of People</label>
                                    <input type="number" class="form-control" id="numberOfPeople" name="numberOfPeople" placeholder="Enter number of people"  required min="1" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" value="${sessionScope.user.email}">
                                </div>
                                <div class="form-group text-center">
                                    <button class="btn btn-primary btn-block w-25">Book</button>
                                </div>
                            </div>

                            <!--                            <div class="col-md-6">
                                                            <div class="row mb-5">
                                                                <div class="col-md-6 mb-3 mb-md-0">
                                                                    <a class="btn btn-primary btn-block" href="http://localhost:9999/ISP392-3/dishs">Continue Menu</a>
                                                                </div>
                                                            </div>
                                                        </div>-->
                        </div>

                    </form>
                </div>
            </div>
        </div>


        <%@include file="close.jsp" %>


    </body>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <script>
                                                            $(document).ready(function () {
                                                                var table = $('#dishTable').DataTable({
                                                                    "paging": true,
                                                                    "pageLength": 5,
                                                                    "lengthChange": false,
                                                                    "searching": true,
                                                                    "ordering": false,
                                                                    "info": false,
                                                                    "columnDefs": [
                                                                        {
                                                                            "targets": 1, // Change this to the column index you want to search
                                                                            "searchable": true
                                                                        },
                                                                        {
                                                                            "targets": '_all',
                                                                            "searchable": false
                                                                        }
                                                                    ]
                                                                });

                                                                // Only search the second column (index 1) when using the search input
                                                                $('#dishTable_filter input').on('keyup', function () {
                                                                    table
                                                                            .columns(1) // Change this to the column index you want to search
                                                                            .search(this.value)
                                                                            .draw();
                                                                });
                                                            });
    </script>

</html>
<script>
    function updateCart(dishID, num) {
        let element = document.getElementById("quantity_" + dishID);
        let value = parseInt(element.value) + num; // Parse the value to an integer before adding
        element.value = Math.max(value, 0); // Ensure the value is non-negative

        value = element.value;

        let price = document.getElementById("price_" + dishID).textContent.replace('€', '');
        price = parseFloat(price);

        document.getElementById("total_" + dishID).textContent = (price * value).toFixed(2);

    }

</script>

