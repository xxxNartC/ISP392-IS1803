<%-- 
    Document   : BlogDetail
    Created on : Jun 16, 2024, 7:56:35 PM
    Author     : ACER
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
           .card {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 20px;
            }
           .form-control {
                border-radius: 10px;
                padding: 10px;
            }
           .btn {
                border-radius: 10px;
                padding: 10px 20px;
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <div class="card">
                <form action="UpdateBlog" method="post" enctype="multipart/form-data">
                    <div>
                    <div class="container">
                        <a href="blogmana" class="btn  p-2" style="background: #58abff; color: white; margin-bottom: 45px;margin-top: 30px "  >Back</a>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <img src="./images/${blog.image}" alt="alt" class="img-fluid">
                        </div>  
                        <div class="col-md-8">
                            <input type="hidden" name="id" value="${blog.blogid}">
                            <div class="form-group">
                                <label for="title" style="font-weight: bold">Title:</label>
                                <input type="text" class="form-control" id="title" placeholder="title"  name="title" required="">
                            </div>
                            <div class="form-group">
                                <label for="description" style="font-weight: bold">Description</label>
                                <textarea class="form-control" id="description" name="description" placeholder="description" required=""></textarea>
                            </div>
                            <div class="form-group">
                                <label for="image" style="font-weight: bold">Image</label>
                                <input type="file" class="form-control" id="image" placeholder="image" accept="image/*" name="image" required="" >
                            </div>
                            <h3>Date : </h3> <input type="date" name="date" value="${blog.date}" disabled />
                            <button type="submit" value="update" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0z
