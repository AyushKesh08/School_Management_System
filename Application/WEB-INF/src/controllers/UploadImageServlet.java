package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;

import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.ArrayList;

import models.User;
import models.Student;
import models.StudentPic;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

@WebServlet("/upload_image.do")
public class UploadImageServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null){
            if(user.getUserType().equals("T")){
                String picPath = request.getParameter("student_pic_path");
                System.out.println(picPath);

                response.setContentType(getServletContext().getMimeType(picPath));

                InputStream is = getServletContext().getResourceAsStream("/WEB-INF/uploads/"+picPath);

                OutputStream os = response.getOutputStream();

                byte[] arr = new byte[4096];
                int count;
                while((count = is.read(arr)) != -1)
                    os.write(arr, 0, count);
                
                os.flush();
                is.close();
                os.close();

                return;
            }else{
                response.sendRedirect("unauthorized_access.jsp");
            }
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

         String nextPage = "signin.jsp";

        if(user != null){
            if(user.getUserType().equals("T")){
                if(ServletFileUpload.isMultipartContent(request)){
                    ServletContext context = getServletContext();
                    try{
                    List<FileItem> uploads = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                        int studentId = 0;
                        Student student = null;

                        String uploadPath = context.getRealPath("/WEB-INF/uploads/");
                        ArrayList<StudentPic> pics = new ArrayList<>();

                        for(FileItem upload : uploads) {
                            if(upload.isFormField()) {
                                studentId = Integer.parseInt(upload.getString());
                                student = new Student(studentId);
                            }
                        }

                        for(FileItem upload : uploads) {
                            if(!upload.isFormField()) {

                                String fileName = upload.getName();

                                String studentPath = user.getEmail() + "/students/" + studentId + "/" + fileName;

                                pics.add(new StudentPic(student, studentPath));

                                File file = new File(uploadPath, studentPath);

                                file.getParentFile().mkdirs();

                                upload.write(file);
                            }
                        }

                        StudentPic.savePics(pics);
                        
                        nextPage = "show_students.do";
                    }catch(FileUploadException e){
                        e.printStackTrace();
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }else{
                nextPage = "unauthorized_access.jsp";
            }

        }
        request.getRequestDispatcher(nextPage).forward(request, response);
    }
}