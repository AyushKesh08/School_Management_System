<%@page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signin</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
</head>
<body>
    <h1 style="text-align: center;">Signin Page</h1>

    <hr>

    <% String error = (String)request.getAttribute("errorMsg"); %>
    <% if(error != null){ %>
        <h2 style="color: red; text-align: center;"><%= error %></h2>
    <% } %>

    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-7 col-xl-5 col-10 border border-secondary-subtle shadow-lg rounded-4 py-4 px-5 my-5">
                <h3>User Signin Form</h3>
                <hr>
                <form action="signin.do" method="post">
                    
                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email">
                    </div>

                    <div class="mb-3">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
                    </div>

                    <br>
                    <input type="submit" class="btn btn-primary mb-4 form-control" name="Save">
                    <div class="text-center">
                        <strong>Don't have an account? </strong><a href="signup.do">Signup</a>
                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>