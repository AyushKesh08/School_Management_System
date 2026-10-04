<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .heading{
            margin: 20px;
            text-align: center;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }
    </style>

    <link rel="stylesheet" href="css/index.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
</head>
<body>

    <div class="card-body">
        <h1 class="heading" >School Management System</h1>
    
        <nav class="navbar" style="background-color: #e3f2fd;" data-bs-theme="light">
            <form class="container-fluid justify-content-start">
                <a href="signup.do" class="btn btn-outline-dark me-2">Create Account</a>&nbsp;&nbsp;
                <a href="signin.do" class="btn btn-outline-dark">Login</a>
            </form>
        </nav>

        <div id="banner"> &nbsp; Welcome Students We Make Your Future Bright</div>

        <div id="y">
            <img src="images/st4.png" id="img" ">
        </div>

    </div>

    <%@include file="indexMenu.jsp"  %>
</body>
</html>