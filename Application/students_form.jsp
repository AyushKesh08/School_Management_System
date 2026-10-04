<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css">
</head>
<body>
    <h1 style="text-align: center;">Add Students Page</h1>

    <hr>

    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="col-md-7 col-xl-5 col-10 border border-secondary-subtle shadow-lg rounded-4 py-4 px-5 my-5">
                <h3>Students Admission Form</h3>
                <hr>
                <form action="add_students.do" method="post">
                    <div class="mb-3">
                        <label for="name">Student Name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Enter Student Name">
                    </div>

                    <div class="mb-3">
                        <label for="fname">Father's Name</label>
                        <input type="text" class="form-control" name="fname" id="fname" placeholder="Enter Father's Name">
                    </div>

                    <div class="mb-3">
                        <label for="mname">Mother's Name</label>
                        <input type="text" class="form-control" name="mname" id="mname" placeholder="Enter Mother's Name">
                    </div>

                    <div class="mb-3">
                        <label for="age">Age</label>
                        <input type="text" class="form-control" name="age" id="age" placeholder="Enter Age">
                    </div>

                    <div class="mb-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email">
                    </div>

                    <div class="mb-3">
                        <label for="phone">Phone</label>
                        <input type="tel" class="form-control" name="phone" id="phone" placeholder="Enter Phone">
                    </div>

                    <br>
                    <input type="submit" class="btn btn-primary mb-4 form-control" name="Save">
                </form>

            </div>
        </div>
    </div>
</body>
</html>