<%-- 
    Document   : Login
    Created on : 14 thg 5, 2024, 22:04:45
    Author     : DELL
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
    </head>


    <body>
        <%@include file="header.jsp" %>
        <!-- END nav -->

        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center mb-4">
                        <h1 class="mb-2 bread">Cart</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Cart <i class="ion-ios-arrow-forward"></i></span></p>
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
                <div class="row mb-5">
                    <form class="col-md-12" action="" method="post">
                        <div class="site-blocks-table">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                        <th class="product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="cart" value="${sessionScope.cart}"/>
                                    <c:forEach var="item" items="${cart.items}">
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="images/${item.dish.image}" alt="Image" class="img-fluid" style="width: 100px; height: auto;">
                                            </td>
                                            <td class="product-name">
                                                <h2 class="h5 text-black">${item.dish.name}</h2>
                                            </td>
                                            <td>€${item.price}</td>
                                            <td>
                                                <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
                                                    <div class="input-group-prepend">
                                                        <button class="btn btn-outline-black decrease" type="button" onclick="updateCart(${item.dish.dishID}, 'update', -1)">&minus;</button>
                                                    </div>
                                                    <input type="text" class="form-control text-center quantity-amount" value="${item.quantity}" placeholder="" aria-label="Quantity" aria-describedby="button-addon1" readonly>
                                                    <div class="input-group-append">
                                                        <button class="btn btn-outline-black increase" type="button" onclick="updateCart(${item.dish.dishID}, 'update', 1)">&plus;</button>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>€${item.quantity * item.price}</td>
                                            <td><button type="button" class="btn btn-primary btn-sm" onclick="updateCart(${item.dish.dishID}, 'delete', 0)">X</button></td>
                                            <!--                                            <td><a  class="btn btn-primary btn-sm" >X</a></td>-->
                                        </tr>
                                    </c:forEach>



                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row mb-5">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <a class="btn btn-primary btn-block" href="http://localhost:9999/ISP392-3/dishs">Continue Menu</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <span class="text-black">Subtotal</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">€${cart.getTotalPrice()}</strong>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <span class="text-black">Total</span>
                                    </div>
                                    <div class="col-md-6 text-right">
                                        <strong class="text-black">$${cart.getTotalPrice()}</strong>
                                    </div>
                                </div>

                                <c:if test="${sessionScope.account.accountType eq 'user'}">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <button class="btn btn-primary btn-block" onclick="window.location = 'reservation.jsp'">Proceed To Checkout</button>
                                            <!--                                                <a class="btn btn-primary btn-block" href="" >Proceed To Checkout</a>-->
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.account.accountType eq null}">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <button class="btn btn-primary btn-block" onclick="window.location = 'http://localhost:9999/ISP392-3/login'">Proceed To Checkout</button>
                                        </div>
                                    </div>
                                </c:if>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%@include file="close.jsp" %>


    </body>
</html>
<script>
    function updateCart(dishID, action, num) {
        document.getElementById("dishID").value = dishID;
        document.getElementById("action").value = action;
        document.getElementById("num").value = num;
        document.getElementById("cartForm").submit();
    }
</script>

