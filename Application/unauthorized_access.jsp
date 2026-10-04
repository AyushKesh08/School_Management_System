<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .outDv{
            border: 2px solid rgba(222, 32, 42, 0.841);
            width: 30%;
            height: 200px;
            margin: 200px auto;
            box-shadow: 0px 0px 25px red;
            border-radius: 20px;
            background-color: rgba(231, 60, 60, 0.827);
        }

        .outDv{
            text-align: center;
        }

        .btn{
            margin: 0 5px;
        }

        .outDv img{
            animation: shake 0.5s infinite;
        }

        @keyframes shake{
            0%{
                transform: translateX(0);
            }
            25%{
                transform: translateX(-5px);
            }
            50%{
                transform: translateX(5px);
            }
            75%{
                transform: translateX(-5px);
            }
            100%{
                transform: translateX(0);
            }
        }

    </style>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">

</head>
<body>
    <div class="outDv">
        <img src="images/unauthorized.png" height="200"><br><br>
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;You don't have permission to access this page.</h4><br>
        <a href="dashboard.do" class="btn btn-primary">Home</a>
        <a href="logout.do" class="btn btn-primary">Logout</a>
    </div>
</body>
</html>