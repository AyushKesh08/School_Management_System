<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">

    <style>
        #box{
            border:2px solid greenyellow;
            width: 600px;
            text-align: center;
            margin: auto;
            margin-top: 300px;
            border-radius: 15px;
            box-shadow: 5px 5px 12px rgb(29, 30, 29);
            font-weight: bold;
            color: rgb(5, 79, 5);
            background-color: aliceblue;
        }

        #logbtn{
            margin-left: 700px;
            margin-top: 50px;
        }

        body{
            background-color: rgb(167, 224, 68);
        }
    </style>
</head>
<body>
    <div id="box">
        <h1 id="x"> &nbsp; Account Created Successfully</h1>
    </div>

    <a id="logbtn" href="signin.do" class="btn btn-outline-dark">Login</a>

    <script>
        const x = document.querySelector('#x')
        let str = x.innerText

        setInterval(() => {
            let n = str[0]
            str = str.substring(1) + n
            x.innerText = str
        }, 200);

    </script>
</body>
</html>