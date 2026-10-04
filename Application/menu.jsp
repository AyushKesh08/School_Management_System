<% if(userType.equals("T")) {%>
    
    <nav class="navbar navbar-expand-lg bg-body-tertiary  navbar bg-dark border-bottom border-body" data-bs-theme="dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="my_profile.do"><img src="images/account.svg"></a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="add_students.do">Add Student</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="show_students.do">Manage Students</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Mark Attendence</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Upload Marks</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logout.do"><img src="images/logout.png">Logout</a>
                </li>

                <!-- <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a> -->
            <!-- <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                </li>
            </ul> -->
        </div>
    </div>
</nav>
    
<% }else{ %>
        
        <nav class="navbar navbar-expand-lg bg-body-tertiary  navbar bg-dark border-bottom border-body" data-bs-theme="dark">
            <div class="container-fluid">
            <a class="navbar-brand" href="#">Student Profile</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                

                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Results</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Today's Classes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">My Attendence</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Weekly Timetable</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="logout.do"><img src="images/logout.png">Logout</a>
                </li>
        </div>
    </div>
</nav>

<% } %>

<!-- card  open-->

<div class="container mt-4">

    <div class="row g-4">

        <div class="col-md-3">
            <div class="card text-bg-warning h-100 cardX">
                <div class="card-header text-center">Notice</div>

                <div class="card-body">
                    <h5 class="card-title">Summer Vacations</h5>

                    <p class="card-text">
                        Summer Vacation Starting From 1 April.
                        School Is Planning A Summer Trip.
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-success h-100 cardX">
                <div class="card-header text-center">Upcoming Events</div>

                <div class="card-body">
                    <h5 class="card-title">For Classes 6th To 12th</h5>

                    <p class="card-text">
                        - Annual Function <br>
                        - Coding Competition <br>
                        - Workshop
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-danger h-100 cardX">
                <div class="card-header text-center">Supplementary Exams</div>

                <div class="card-body">
                    <h5 class="card-title">For Class 12th</h5>

                    <p class="card-text">
                        Mathematics Supplementary Exams <br>
                        Social Science Supplementary Exams <br>
                        English Supplementary Exams
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-warning h-100 cardX">
                <div class="card-header text-center">Students Scholarship</div>

                <div class="card-body">
                    <h5 class="card-title">Scholarship Forms</h5>

                    <p class="card-text">
                        Students Submit The Scholarship Fees Before Deadline
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-info h-100 cardX">
                <div class="card-header text-center">Admissions</div>

                <div class="card-body">
                    <h5 class="card-title">New Admissions Open Session 2026 - 27</h5>

                    <p class="card-text">
                        Limited Seats Available <br>
                        - Smart Classes <br>
                        - Experienced Teachers <br>
                        - Sports Activities
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-primary h-100 cardX">
                <div class="card-header text-center">School Hostel Admissions Open</div>

                <div class="card-body">
                    <h5 class="card-title">Join Our School Hostel</h5>

                    <p class="card-text">
                        Safe & Comfortable Hostel Facility <br>
                        Separate Hostel for Boys & Girls <br>
                        Healthy Food | 24*7 Security <br>
                        Study Environment
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-secondary h-100 cardX">
                <div class="card-header text-center">School Educational Trip Announcement</div>

                <div class="card-body">
                    <h5 class="card-title">Dear Students,</h5>

                    <p class="card-text">
                        Our school is organizing an exciting educational trip for students.
                        Get ready for fun, learning, and unforgettable memories!
                    </p>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card text-bg-info h-100 cardX">
                <div class="card-header text-center">Alumni Meet 2026</div>

                <div class="card-body">
                    <h5 class="card-title">Welcome to Alumni Function</h5>

                    <p class="card-text">
                        Reconnect | Relive | Celebrate <br>
                        Join Us for a Memorable Reunion <br>
                        Meet Old Friends & Teachers Again <br>
                        An Evening of Memories, Inspiration & Togetherness
                    </p>
                </div>
            </div>
        </div>

    </div>

</div>

<!-- card close -->


<script>
        const card = document.querySelectorAll('.cardX');
        
        card.forEach((card)=>{
            card.addEventListener('mouseover' , (ev)=>{
                ev.currentTarget.style.transform = 'scale(1.1)'
            })
    
            card.addEventListener('mouseout' , (ev)=>{
                ev.currentTarget.style.transform = 'scale(1)'
            })
        })

    </script>
