<%-- 
    Document   : header
    Created on : 18 thg 5, 2024, 22:10:07
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="py-1 bg-black top">
    <div class="container">
        <div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
            <div class="col-lg-12 d-block">
                <div class="row d-flex">
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                        <span class="text">+ 1235 2355 98</span>
                    </div>
                    <div class="col-md pr-4 d-flex topper align-items-center">
                        <div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                        <span class="text">Branche@email.com</span>
                    </div>
                    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
                        <p class="mb-0 register-link"><span>Open hours:</span> <span>Monday - Sunday</span> <span>8:00AM - 9:00PM</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
        <a class="navbar-brand" href="http://localhost:9999/ISP392-3/home">Branché</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a href="http://localhost:9999/ISP392-3/home" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="http://localhost:9999/ISP392-3/about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="http://localhost:9999/ISP392-3/dishs" class="nav-link">Menu</a></li>
                <li class="nav-item"><a href="http://localhost:9999/ISP392-3/blog" class="nav-link">Stories</a></li>

            </ul>
        </div>
        <ul class="navbar-nav ml-auto">
            <c:if test="${sessionScope.account ne null}">
                <c:if test="${sessionScope.account.accountType eq 'user'}">
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item cta"><a href="reservation.jsp" class="nav-link">Book a table</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a href="logout" class="nav-link">Logout</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a href="http://localhost:9999/ISP392-3/changePasswordControllers" class="nav-link">Change Password</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a href="http://localhost:9999/ISP392-3/profile" class="nav-link">Profile</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a class="nav-link" href="http://localhost:9999/ISP392-3/cart"><img src="images/cart.svg"></a></li>

                        </ul>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account.accountType eq 'manager'}">
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item cta" style="margin-left: 5px"><a href="logout" class="nav-link">Logout</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a href="changePassword.jsp"" class="nav-link">change password</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a href="http://localhost:9999/ISP392-3/DashBoard" class="nav-link">Management</a></li>
                            <li class="nav-item cta" style="margin-left: 5px"><a class="nav-link" href="http://localhost:9999/ISP392-3/cart"><img src="images/cart.svg"></a></li>
                        </ul>
                    </div>
                </c:if>
            </c:if>       
        </ul>
        <ul class="navbar-nav ml-auto">
            <c:if test="${sessionScope.account eq null}">
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item cta" style="margin-left: 5px"><a href="http://localhost:9999/ISP392-3/login" class="nav-link">Login</a></li>
                        <li class="nav-item cta" style="margin-left: 5px"><a href="register" class="nav-link">Register</a></li>
                        <li class="nav-item cta" style="margin-left: 5px"><a class="nav-link" href="http://localhost:9999/ISP392-3/cart"><img src="images/cart.svg"></a></li>
                    </ul>
                </div>
            </c:if>
        </ul>
    </div>
</nav>
