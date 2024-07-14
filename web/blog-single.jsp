<%@page import="DAL.BlogDAO"%>
<%@page import="Model.Blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Branché - Free Bootstrap 4 Template by Colorlib</title>
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
                        <h1 class="mb-2 bread">Blog</h1>
                        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single<i class="ion-ios-arrow-forward"></i></span></p>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 ftco-animate">
                        <% 
                            int blogId = Integer.parseInt(request.getParameter("id"));
                            BlogDAO blogDAO = new BlogDAO();
                            Blog blog = blogDAO.getBlogByID(blogId);
                            if (blog != null) {
                        %>
                        <h2 class="mb-3"><%= blog.getTitle() %></h2>
                        <p><%= blog.getDescription() %></p>
                        <img src="images/<%= blog.getImage() %>" alt="alt"/>

                        <div class="tag-widget post-tag-container mb-5 mt-5">
                            <div class="tagcloud">
                                <a href="#" class="tag-cloud-link">Food</a>
                                <a href="#" class="tag-cloud-link">Wine</a>
                                <a href="#" class="tag-cloud-link">Drink</a>
                                <a href="#" class="tag-cloud-link">Dish</a>
                            </div>
                        </div>
                        <% } else { %>
                        <p>Blog not found.</p>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="pt-5 mt-5">
                <h3 class="mb-5 h4 font-weight-bold p-4 bg-light">07 Feedbacks</h3>
                <ul class="comment-list">
                    <li class="comment">
                        <div class="vcard bio">
                            <img src="images/person_1.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                            <h3>John Doe</h3>
                            <p>123</p>
                            <p><a href="#" class="reply">Reply</a></p>
                        </div>
                    </li>

                    <li class="comment">
                        <div class="vcard bio">
                            <img src="images/person_1.jpg" alt="Image placeholder">
                        </div>
                        <div class="comment-body">
                            <h3>John Doe</h3>
                            <p>123</p>
                            <p><a href="#" class="reply">Reply</a></p>
                        </div>

                        <ul class="children">
                            <li class="comment">
                                <div class="vcard bio">
                                    <img src="images/person_1.jpg" alt="Image placeholder">
                                </div>
                                <div class="comment-body">
                                    <h3>John Doe</h3>
                                    <div class="meta mb-2">Sept. 07, 2019 at 2:21pm</div>
                                    <p>123</p>
                                    <p><a href="#" class="reply">Reply</a></p>
                                </div>



                                    </li>
                                </ul>
                            </li>
                        </ul>
                    

                
                <!-- END comment-list -->

                <div class="comment-form-wrap pt-5">
                    <h3 class="mb-5 h4 font-weight-bold p-4 bg-light">Leave a comment</h3>
                    <form action="#" class="p-4 p-md-5 bg-light">
                        <div class="form-group">
                            <label for="name">Name *</label>
                            <input type="text" class="form-control" id="name">
                        </div>
                        <div class="form-group">
                            <label for="email">Email *</label>
                            <input type="email" class="form-control" id="email">
                        </div>
                        <div class="form-group">
                            <label for="website">Website</label>
                            <input type="url" class="form-control" id="website">
                        </div>

                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                        </div>

                    </form>
                </div>
            </div>
        </section>

        <%@include file="close.jsp" %>

    </body>
</html>
