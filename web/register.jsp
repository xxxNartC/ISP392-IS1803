<%-- 
    Document   : register
    Created on : 15 thg 5, 2024, 13:19:49
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <title>Branché Restaurant</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #999;
                background: #f3f3f3;
                font-family: 'Roboto', sans-serif;
            }
            .form-control {
                border-color: #eee;
                min-height: 41px;
                box-shadow: none !important;
            }
            .form-control:focus {
                border-color: #5cd3b4;
            }
            .form-control, .btn {
                border-radius: 3px;
            }
            .signup-form {
                width: 500px;
                margin: 0 auto;
                padding: 30px 0;
            }
            .signup-form h2 {
                color: #333;
                margin: 0 0 30px 0;
                display: inline-block;
                padding: 0 30px 10px 0;
                border-bottom: 3px solid #5cd3b4;
            }
            .signup-form form {
                color: #999;
                border-radius: 3px;
                margin-bottom: 15px;
                background: #fff;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .signup-form .form-group row {
                margin-bottom: 20px;
            }
            .signup-form label {
                font-weight: normal;
                font-size: 14px;
                line-height: 2;
            }
            .signup-form input[type="checkbox"] {
                position: relative;
                top: 1px;
            }
            .signup-form .btn {
                font-size: 16px;
                font-weight: bold;
                background: #5cd3b4;
                border: none;
                margin-top: 20px;
                min-width: 140px;
            }
            .signup-form .btn:hover, .signup-form .btn:focus {
                background: #007bff;
                outline: none !important;
            }
            .signup-form a {
                color: #007bff;
                text-decoration: underline;
            }
            .signup-form a:hover {
                text-decoration: none;
            }
            .signup-form form a {
                color: #007bff;
                text-decoration: none;
            }
            .signup-form form a:hover {
                text-decoration: underline;
            }
        </style>
        <title>Feliciano - Free Bootstrap 4 Template by Colorlib</title>
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
        <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_3.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay"></div>
            <div class="container">
                <div class="row no-gutters slider-text align-items-end justify-content-center">
                    <div class="col-md-9 ftco-animate text-center mb-4">
                        <h1 class="mb-2 bread">Register</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Register<i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>

        <div class="signup-form">
            <form action="register" method="post">
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMessage}
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-8 offset-4">
                        <h2>Sign Up</h2>
                    </div>	
                </div>			

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example1">User Name</label>
                    <input type="text" name="username" id="form3Example1" class="form-control" />
                  
                </div>
                <div class="form-outline mb-4">
                     <label class="form-label" for="form3Example2">Name</label>
                    <input type="text" name="name"id="form3Example2" class="form-control" />
                   
                </div>
                <!-- Email input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3">Email</label>
                    <input type="email" name="email" id="form3Example3" class="form-control" />
                   
                </div>
                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3">Phone number</label>
                    <input type="text" name="phone" id="form3Example3" class="form-control" />
                   
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example4">Password</label>
                    <input type="password" name="password" id="form3Example4" class="form-control" />
                    
                </div>
                <div class="mb-3">
                    <select name="question" class="form-select">
                        <option value="Where are you from?">Where are you from?</option>
                        <option value="What is your favorite song?">What is your favorite song?</option>
                        <option value="Do you have dog?">Do you have dog?</option>
                    </select>
                    
                    <label for="question" class="form-label">Password question </label>
                    <input type="text" class="form-control mt-3" name="answer" required>
                  
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example4">Birth Date</label>
                    <input type="date" name="dob"id="form3Example4" class="form-control" />
                    
                </div>
                <div class="form-outline mb-4">
                     <label class="form-label" for="form3Example4">Address</label>
                    <input type="text" name="address"id="form3Example4" class="form-control" />
                   
                </div>

                <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>

            </form>
            <div class="text-center">Already have an account? <a href="http://localhost:9999/ISP392-3/login" style="color: #ba8b00">Login here</a></div>
        </div>
        <%@include file="close.jsp" %>


    </body>
</html>


</html>