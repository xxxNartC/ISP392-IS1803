<%-- 
    Document   : Menu
    Created on : 18 thg 5, 2024, 23:27:13
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- END nav -->
        <div id="notification" style="display: none; position: fixed; top: 10px; right: 10px; background-color: #4caf50; color: white; padding: 15px; border-radius: 5px; z-index: 1000;">
            <div>Add successful dishes! </div>
            <div>Your cart have ${size} dishs</div>
        </div>

        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center mb-4">
                        <h1 class="mb-2 bread">Specialties</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="Home.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Menu <i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>


        <section class="ftco-section">
            <div class="container">
                <form id="addToCartForm" action="addtocart" method="post">
                    <input type="hidden" id="dishID" name="dishID" value="">
                    <input type="hidden" id="action" name="action" value="add">
                    <input type="hidden" id="num" name="num" value="1">

                </form>
                <div class="ftco-search">
                    <div class="row">
                        <div class="col-md-12 nav-link-wrap">

                            <div class="col-md-12 text-center heading-section ftco-animate">
                                <span class="subheading">Plats</span>

                            </div>

                        </div>
                        <div class="col-md-12 tab-wrap">

                            <div class="tab-content" id="v-pills-tabContent">

                                <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                    <div class="row no-gutters d-flex align-items-stretch">
                                        <c:set var="size" value="${requestScope.size}"/>
                                        <c:set var="list" value="${requestScope.plats}"/>
                                        <c:forEach items="${plats}" var="dish">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">

                                                    <div class="menu-img img" style="background-image: url('images/${dish.image}');"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>${dish.getName()}</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">€${dish.getPrice()}</span>
                                                                </div>
                                                            </div>
                                                            <p>${dish.getDescription()}</p>
                                                            <div style="margin-left: 145px">
                                                                <button type="button" class="btn alert-dark" onclick="addToCart(${dish.getDishID()})">Add to cart</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="ftco-search">
                    <div class="row">
                        <div class="col-md-12 nav-link-wrap">

                            <div class="col-md-12 text-center heading-section ftco-animate">
                                <span class="subheading" style="margin-top: 200px">Desserts</span>

                            </div>

                        </div>
                        <div class="col-md-12 tab-wrap" style="margin-top: 200px">

                            <div class="tab-content" id="v-pills-tabContent">

                                <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                    <div class="row no-gutters d-flex align-items-stretch">
                                        <c:set var="list" value="${requestScope.desserts}"/>
                                        <c:forEach items="${desserts}" var="dish">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">

                                                    <div class="menu-img img" style="background-image: url('images/${dish.image}');"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>${dish.getName()}</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">€${dish.getPrice()}</span>
                                                                </div>
                                                            </div>
                                                            <p>${dish.getDescription()}</p>
                                                            <div style="margin-left: 145px">
                                                                <button type="button" class="btn alert-dark" onclick="addToCart(${dish.getDishID()})">Add to cart</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>


                            </div>



                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="ftco-search">
                    <div class="row">
                        <div class="col-md-12 nav-link-wrap">

                            <div class="col-md-12 text-center heading-section ftco-animate">
                                <span class="subheading" style="margin-top: 200px">Cocktails</span>

                            </div>

                        </div>
                        <div class="col-md-12 tab-wrap" style="margin-top: 200px">

                            <div class="tab-content" id="v-pills-tabContent">

                                <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                    <div class="row no-gutters d-flex align-items-stretch">
                                        <c:set var="list" value="${requestScope.cocktails}"/>
                                        <c:forEach items="${cocktails}" var="dish">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">

                                                    <div class="menu-img img" style="background-image: url('images/${dish.image}');"></div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>${dish.getName()}</h3>
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">€${dish.getPrice()}</span>
                                                                </div>
                                                            </div>
                                                            <p>${dish.getDescription()}</p>
                                                            <div style="margin-left: 145px">
                                                                <button type="button" class="btn alert-dark" onclick="addToCart(${dish.getDishID()})">Add to cart</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="ftco-search">
                    <div class="row">
                        <div class="col-md-12 nav-link-wrap">

                            <div class="col-md-12 text-center heading-section ftco-animate">
                                <span class="subheading" style="margin-top: 200px">Wine</span>

                            </div>

                        </div>
                        <div class="col-md-12 tab-wrap" style="margin-top: 200px">

                            <div class="tab-content" id="v-pills-tabContent">

                                <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="day-1-tab">
                                    <div class="row no-gutters d-flex align-items-stretch">
                                        <c:set var="list" value="${requestScope.wine}"/>
                                        <c:forEach items="${wine}" var="dish">
                                            <div class="col-md-12 col-lg-6 d-flex align-self-stretch">
                                                <div class="menus d-sm-flex ftco-animate align-items-stretch">
                                                    <div class="menu-img img" style="background-image: url('images/${dish.image}');">
                                                        <input type="hidden" name="image" value="${dish.getImage()}" >
                                                    </div>
                                                    <div class="text d-flex align-items-center">
                                                        <div>
                                                            <div class="d-flex">
                                                                <div class="one-half">
                                                                    <h3>${dish.getName()}</h3>
                                                                    <input type="hidden" name="name" value="${dish.getName()}" >
                                                                </div>
                                                                <div class="one-forth">
                                                                    <span class="price">€${dish.getPrice()}</span>
                                                                    <input type="hidden" name="price" value="${dish.getPrice()}">
                                                                    <input type="hidden" name="quantity" value="${dish.getQuantity()}">
                                                                </div>
                                                            </div>
                                                            <p>${dish.getDescription()}</p>
                                                            <div style="margin-left: 145px">
                                                                <button type="button" class="btn alert-dark" onclick="addToCart(${dish.getDishID()})">Add to cart</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>


                            </div>



                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="close.jsp" %>


    </body>
</html>
<script>
    function addToCart(dishID) {
        document.getElementById("dishID").value = dishID;
        document.getElementById("addToCartForm").submit();
    }
    function showNotification() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('added')) {
            const notification = document.getElementById('notification');
            notification.style.display = 'block';
            setTimeout(() => {
                notification.style.display = 'none';
            }, 3000);
        }
    }
    window.onload = showNotification;
</script>

