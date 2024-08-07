<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Details - Branché Restaurant</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="card">
            <div class="card-header">
                <h2>Reservation Details</h2>
            </div>
            <div class="card-body">
                <c:if test="${updateSuccess}">
                    <div class="alert alert-success" role="alert">
                        Reservation updated successfully!
                    </div>
                </c:if>
                <p><strong>Name:</strong> <c:out value="${preOrder.name}"/></p>
                <p><strong>Phone:</strong> <c:out value="${preOrder.phone}"/></p>
                <p><strong>Date:</strong> <c:out value="${formattedDate}"/></p>
                <p><strong>Time:</strong> <c:out value="${formattedTime}"/></p>
                <p><strong>Number of People:</strong> <c:out value="${preOrder.numberOfPeople}"/></p>
                <a href="searchRes.jsp" class="btn btn-primary">Back to Search</a>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popp
