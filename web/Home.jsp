<%-- 
    Document   : Home
    Created on : 14 thg 5, 2024, 22:00:41
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

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- END nav -->

        <section class="home-slider owl-carousel js-fullheight">
            <div class="slider-item js-fullheight" style="background-image: url(images/bg_1.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-12 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Feliciano</span>
                            <h1 class="mb-4">Best Restaurant</h1>
                        </div>

                    </div>
                </div>
            </div>

            <div class="slider-item js-fullheight" style="background-image: url(images/bg_2.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text js-fullheight justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-12 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Branché</span>
                            <h1 class="mb-4">Nutritious &amp; Tasty</h1>
                        </div>

                    </div>
                </div>
            </div>

            <div class="slider-item js-fullheight" style="background-image: url(images/bg_3.jpg);">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

                        <div class="col-md-12 col-sm-12 text-center ftco-animate">
                            <span class="subheading">Branché</span>
                            <h1 class="mb-4">Delicious Specialties</h1>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-wrap-about">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 d-flex">
                        <div class="img img-1 mr-md-2" style="background-image: url(images/about.jpg);"></div>
                        <div class="img img-2 ml-md-2" style="background-image: url(images/about-1.jpg);"></div>
                    </div>
                    <div class="col-md-5 wrap-about pt-5 pt-md-5 pb-md-3 ftco-animate">
                        <div class="heading-section mb-4 my-5 my-md-0">
                            <span class="subheading">About</span></br>
                            <h2 class="mb-4">Branché Restaurant</h2>
                        </div>
                        <p>Our restaurant offers a unique dining experience with delicious dishes and an elegant atmosphere.</p>
                        <pc class="time">
                            <span>Mon - Fri <strong>8 AM - 11 PM</strong></span>
                            <span><a href="#">+ 1-978-123-4567</a></span>
                            </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-12 text-center heading-section ftco-animate">
                        <span class="subheading">Services</span></br>
                        <h2 class="mb-4">Catering Services</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
                        <div class="media block-6 services d-block">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-cake"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Birthday Party</h3>
                                <p>Our birthday party service offers a memorable experience with exquisite décor, an extensive menu and attractive entertainment activities, guaranteed to satisfy every guest..</p>
                            </div>
                        </div>      
                    </div>
                    <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
                        <div class="media block-6 services d-block">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-meeting"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Business Meetings</h3>
                                <p>Our Business Meetings hosting service offers professional spaces, modern facilities and flexible packages, helping to ensure your meetings run smoothly and efficiently.
                                    .</p>
                            </div>
                        </div>    
                    </div>
                    <div class="col-md-4 d-flex align-self-stretch ftco-animate text-center">
                        <div class="media block-6 services d-block">
                            <div class="icon d-flex justify-content-center align-items-center">
                                <span class="flaticon-tray"></span>
                            </div>
                            <div class="media-body p-2 mt-3">
                                <h3 class="heading">Wedding Party</h3>
                                <p>Our wedding planning services create a romantic and luxurious space, with every detail meticulously cared for to make your big day perfect and unforgettable.</p>
                            </div>
                        </div>      
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-2">
                    <div class="col-md-12 text-center heading-section ftco-animate">
                        <span class="subheading">Chef</span></br>
                        <h2 class="mb-4">Our Master Chef</h2>
                    </div>
                </div>
                <div class="row">
                    <c:set var="list" value="${requestScope.list}"/>
                    <c:forEach items="${list}" var="list">
                        <div class="col-md-6 col-lg-3 ftco-animate">
                            <div class="staff">
                                <a href="chef-detail?id=${list.chefid}" aria-label="${list.name}">
                                    <div class="img" style="background-image: url('images/${list.image}');"></div>
                                </a>
                                <div class="text pt-4">
                                    <h3>${list.name}</h3>
                                    <span class="position mb-2">${list.role}</span>
                                    <div class="faded">
                                        <ul class="ftco-social d-flex">
                                            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
                                            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

        </section>

        <section class="ftco-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Blog</span></br>
                        <h2 class="mb-4">Recent Posts</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4 ftco-animate">
                        <div class="blog-entry">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_1.jpg');">
                            </a>
                            <div class="text pt-3 pb-4 px-4">
                                <div class="meta">
                                    <div><a href="#">Sept. 06, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Taste the delicious foods in Asia</a></h3>
                                <p class="clearfix">
                                    <a href="#" class="float-left read">Read more</a>
                                    <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="blog-entry">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_2.jpg');">
                            </a>
                            <div class="text pt-3 pb-4 px-4">
                                <div class="meta">
                                    <div><a href="#">Sept. 06, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Taste the delicious foods in Asia</a></h3>
                                <p class="clearfix">
                                    <a href="#" class="float-left read">Read more</a>
                                    <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 ftco-animate">
                        <div class="blog-entry">
                            <a href="blog-single.html" class="block-20" style="background-image: url('images/image_3.jpg');">
                            </a>
                            <div class="text pt-3 pb-4 px-4">
                                <div class="meta">
                                    <div><a href="#">Sept. 06, 2019</a></div>
                                    <div><a href="#">Admin</a></div>
                                </div>
                                <h3 class="heading"><a href="#">Taste the delicious foods in Asia</a></h3>
                                <p class="clearfix">
                                    <a href="#" class="float-left read">Read more</a>
                                    <a href="#" class="float-right meta-chat"><span class="icon-chat"></span> 3</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

       <%@include file="close.jsp" %>

    </body>
</html>
