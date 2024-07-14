<%-- 
    Document   : UpdateMovie
    Created on : Mar 2, 2024, 9:36:03 PM
    Author     : maingocdat
--%>


<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <style>
            .nav-link {
                color: white
            }
            .nav-link:hover {
                background-color: #ccc;
                color: #17a2b8
            }
            .form-img {
                max-width: 150px; 
                height: auto; 
                margin-bottom: 20px; 
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <div>
                <%@include file="SideBarAdmin.jsp" %>
            </div>

            <div class="container mt-5">
                <h1 style="margin-bottom: 40px">Update Dish</h1>
                <form action="UpdateDish" method="post">
                    <img src="./images/${dish.image}" alt="alt" class="form-img"/>
                    <input value="${dish.dishID}" name="id" hidden="">
                    <div class="form-row">


                        <div class="form-group col-md-12">
                            <label for="Description" style="font-weight: bold">Description</label>
                            <input type="text" class="form-control" id="description" placeholder="Description" value="${dish.description}" name="Description"required="">
                        </div>
                    </div>

                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="Name" style="font-weight: bold">Name </label>
                            <input type="text" class="form-control" id="Name" placeholder="Name" value="${dish.name}" name="Name"required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="Price" style="font-weight: bold">Price</label>
                            <input type="number" class="form-control" id="price" placeholder="Price" value="${dish.price}" name="Price" required="">
                        </div>
                    </div>
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="DishType" style="font-weight: bold">DishType </label>
                            <select class="form-control" id="dishtype" name="DishType" required="">
                                <option>${dish.dishType}</option>
                                <option value="Plats">Plats</option>
                                <option value="Desserts">Desserts</option>
                                <option value="Cocktails">Cocktails</option>
                                <option value="Wine">Wine</option>
                            </select>                        
                        </div>

                    </div>
                   

                    <button type="submit" class=" d-flex  btn btn-primary updateBtn">Add To System</button>
                </form>
            </div>

        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>

