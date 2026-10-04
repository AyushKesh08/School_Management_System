<!-- ################################### SHOW STUDENTS START ######################################## -->
    <% ArrayList<Student> students = (ArrayList)request.getAttribute("students"); %>

        <div class="row g-3 p-4">

    <% 
        for(Student next : students){ 
    %>

        <div class="col-12 col-sm-6 col-md-4 col-lg-3">

            <div class="card h-100 bg-body-secondary">

                <div class="parentDv" style="position: relative;">
                        <%
                            String studentPicPath = null;
                            ArrayList<StudentPic> studentPics = next.getPics();
                                if(studentPics != null && studentPics.size() > 0)
                                    studentPicPath = studentPics.get(studentPics.size()-1).getPicPath();
                        %>
                    <img src='<%= studentPicPath != null ? "upload_image.do?student_pic_path="+studentPicPath + "&t=" + System.currentTimeMillis() : "images/user.png" %>' class="card-img-top userImg">
                    <a id="<%= next.getStudent_id() %>" class="inImg upload_img btn btn-outline-dark" style="
                                                position: absolute;
                                                top: 50%;
                                                left: 50%;
                                                transform: translate(-50%, -50%);
                                                opacity: 0;
                                                z-index: 10;
                                        ">Upload Image</a>
                <input type="file" id="profile_pic" hidden>
                </div>

                <div class="card-body">

                    <h3 class="card-title mb-2">
                        <%= next.getName() %>
                    </h3>
                    
                    <p class="card-text mb-1">
                        <strong>Father Name:</strong>
                        <%= next.getFname() %>
                    </p>
                    
                    <p class="card-text mb-1">
                        <strong>Mother Name:</strong>
                        <%= next.getMname() %>
                    </p>
                    
                    <p class="card-text mb-1">
                        <strong>Email:</strong>
                        <%= next.getEmail() %>
                    </p>
                    
                    <p class="card-text mb-1">
                        <strong>Age:</strong>
                        <%= next.getAge() %>
                    </p>
                    
                    <p class="card-text">
                        <strong>Phone:</strong>
                        <%= next.getPhone() %>
                    </p>
                    
                    <div id="main-div">
                        <div class="hov updelDv updateStu">
                            <img src="images/update.png" id="<%= next.getStudent_id() %>"
                                data-fname="<%= next.getFname() %>" data-mname="<%= next.getMname() %>"
                                data-email="<%= next.getEmail() %>" data-age="<%= next.getAge() %>"
                                data-phone="<%= next.getPhone() %>" data-name="<%= next.getName() %>"
                                role="button" height="24" data-bs-toggle="modal" data-bs-target="#update_student_modal"                            
                            >
                    </div>
                        
                        &nbsp; 
                        
                        <div id="<%= next.getStudent_id() %>" class="hov del updelDv">
                            <img src="images/delete.png" height="24">
                        </div>
                    </div>

                </div>
            </div>
            
        </div>
        
        <% } %>
        
    </div>
    
    <!-- ############################### UPDATE MODAL START  ############################## -->
    
    <div class="modal fade" id="update_student_modal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title w-100 text-center fw-bold">Update Student</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <form action="update_student.do" method="post">
                        <input type="hidden" name="student_id" id="update_student_id">  
                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Name</label>
                            <input type="text" name="name" id="stuName" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                            <label for="fname" class="form-label fw-semibold">Father's Name</label>
                            <input type="text" name="fname" id="fathName" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                            <label for="mname" class="form-label fw-semibold">Mother's Name</label>
                            <input type="text" name="mname" id="mothName" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email</label>
                            <input type="email" name="email" id="stuEmail" class="form-control">
                        </div>
                        
                        <div class="mb-3">
                            <label for="age" class="form-label fw-semibold">Age</label>
                            <input type="text" name="age" id="stuAge" class="form-control">
                        </div>
                            
                        <div class="mb-3">
                            <label for="phone" class="form-label fw-semibold">Phone</label>
                            <input type="tel" name="phone" id="stuPhone" class="form-control">
                        </div>

                        <button type="submit" class="btn btn-primary w-100 py-2">Update Student</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ############################### UPDATE MODAL END ############################## -->
    
<!-- ##################################################################################################     -->
<!-- ##################################################################################################     -->
<!-- ##################################################################################################
      -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>

        // #################### UPDATE BUTTON START ####################

        const updateStudent =  document.querySelectorAll('.updateStu img')
        const updateModalId = document.querySelector('#update_student_id')

        const stuName = document.querySelector('#stuName')
        const fathName = document.querySelector('#fathName')
        const mothName = document.querySelector('#mothName')
        const stuEmail = document.querySelector('#stuEmail')
        const stuAge = document.querySelector('#stuAge')
        const stuPhone = document.querySelector('#stuPhone')

        updateStudent.forEach((next)=>{
            next.addEventListener('click' , (ev)=>{
                updateModalId.value = ev.currentTarget.id;
                stuName.value = ev.currentTarget.dataset.name;
                fathName.value = ev.currentTarget.dataset.fname;
                mothName.value = ev.currentTarget.dataset.mname;
                stuEmail.value = ev.currentTarget.dataset.email;
                stuAge.value = ev.currentTarget.dataset.age;
                stuPhone.value = ev.currentTarget.dataset.phone;
            })
        })

        // #################### UPDATE BUTTON END ####################


    // ############################## DELETE RECORD START ###############################

    const dele = document.querySelectorAll('.del')
    let delElmId = null 

    dele.forEach((nx)=>{
        nx.addEventListener('click' , async (e)=>{
            delElmId = e.currentTarget.id
            let response = await fetch('delete_student.do?student_id='+delElmId);
            response.text().then((data)=>{
                if(data == 'Delete'){
                    alert('Student Record Deleted Successfully.')
                    location.reload();
                }
            }).catch((error)=>{
                console.log(error);
            });
    
        })
    })

    // ############################## DELETE RECORD END ###############################


    // ###################### Upload Image Start ###########################

    const uploadImage = document.querySelectorAll('.upload_img')
    const profileImage = document.querySelector('#profile_pic')
    let selElm = null;

    uploadImage.forEach((next)=>{
        next.addEventListener('click' , (ev)=>{
            selElm = ev.currentTarget.id
            profileImage.click();
        })
    })

    profileImage.addEventListener('change' , async (ev)=>{
        const file = ev.target.files[0]

        let formData = new FormData();
        formData.append("profileImage" , file)
        formData.append("student_id" , selElm)

        try{
            let response = await fetch('upload_image.do' , {
                method: "POST",
                body : formData
            })

            response.blob().then((data)=>{
                if(data){
                    console.log('donee')
                    location.reload();
                }
            }).catch((error)=>{
                console.log(error)
            })

        }catch(error){
            console.log(error)
        }
    })

    // ###################### Upload Image End ###########################

    const parentDv = document.querySelectorAll('.parentDv')
    const inImg = document.querySelector('.inImg')
    
    parentDv.forEach((nx)=>{
        const overlay = nx.querySelector('.inImg');
        const image = nx.querySelector('.userImg');

        nx.addEventListener('mouseover', ()=>{
            overlay.style.opacity = '1';
            image.style.opacity = '0.5';
            image.style.filter = "brightness(40%)";
        });

         nx.addEventListener('mouseout', ()=>{
            overlay.style.opacity = '0';
            image.style.opacity = '1';
            image.style.filter = "brightness(100%)";
        });
    })

    // ######################## UPDATE DELETE HOVER START #########################

    const hover = document.querySelectorAll('.hov')

    hover.forEach((next)=>{
        next.addEventListener('mouseover' , (ev)=>{
            ev.currentTarget.style.transform = 'scale(1.1)'
            ev.currentTarget.style.backgroundColor = 'rgb(94, 195, 195)'
        })
        
        next.addEventListener('mouseout' , (ev)=>{
            ev.currentTarget.style.transform = 'scale(1)'
            ev.currentTarget.style.backgroundColor = 'white'
        })
    })

    // ######################## UPDATE DELETE HOVER END #########################

</script>
                
    <!-- ################################### SHOW STUDENTS END ######################################## -->
