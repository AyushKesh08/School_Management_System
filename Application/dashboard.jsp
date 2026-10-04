<%@page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        #x{
            margin: 20px;
            text-align: center;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
</head>
<body>

    <% User user = (User)session.getAttribute("user"); 
    String userType = user.getUserType();
    %>
    
    <h1 id="x">Welcome To <%= userType.equals("T") ? "Teachers" : "Students" %> Dashboard Page</h1>

    <!-- ##################### MENU STARTING ##################### -->

    <%@include file="menu.jsp" %>

    <!-- ##################### MENU ENDING ##################### -->
</body>
</html>