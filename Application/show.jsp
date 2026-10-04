<%@page import="java.util.ArrayList , models.Student , models.StudentPic" %>

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

        .userImg{
            width: 100%;
            height: 300px;
            object-fit: cover;
            display: block;
        }

        .updelDv{
            border: 1px solid black;
            display: inline-block;
            padding: 5px;
            border-radius: 10px;
            box-shadow: 2px 2px 6px grey;
            /* color: rgb(94, 195, 195);  */
        }

        #main-div{
            margin-left: 235px;
        }

        .form-control{
            border: 1.5px solid #6c757d;
            background-color: white;
        }

        .form-label{
            font-weight: 600;
            color: #212529;
        }

        .form-control:focus{
            border-color: #0d6efd;
            box-shadow: 0 0 3px rgba(13,110,253,.25);
        }

    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">

</head>
<body>
    <h1 id="x">Students Data</h1>

    <!-- ################################# NAV BAR START ###################################### -->
    
    <nav class="navbar navbar-expand-lg bg-body-tertiary  navbar bg-dark border-bottom border-body" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="images/account.svg"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dashboard.do">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="add_students.do">Add Student</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logout.do"><img src="images/logout.png">Logout</a>
                </li>
            </div>
        </div>
    </nav>
    
    <!-- ################################# NAV BAR END ###################################### -->
    
   <%@include file="show_students.jsp" %>
   
</body>
</html>