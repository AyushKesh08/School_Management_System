package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import models.Student;
import models.User;

@WebServlet("/update_student.do")
public class UpdateStudentServlet extends HttpServlet{

    @Override
    public void init() throws ServletException{
        System.out.println("UPDATE SERVLET LOADED");
    }

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        if(user != null){
            if(user.getUserType().equals("T"))
                doPost(request,response);
            else
                response.sendRedirect("unauthorized_access.jsp");
        }
    }
    
    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String nextPage = "signin.do";

        if(user != null){
            if(user.getUserType().equals("T")){
                Integer studentId = Integer.parseInt(request.getParameter("student_id"));
                String studentName = request.getParameter("name");
                String fatherName = request.getParameter("fname");
                String motherName = request.getParameter("mname");
                String studentEmail = request.getParameter("email");
                String studentAge = request.getParameter("age");
                String studentPhone = request.getParameter("phone");

                Student student = new Student(studentName,fatherName,motherName,studentEmail,studentAge,studentPhone,studentId);
                student.updateStudent();
                
                nextPage = "show_students.do";
            }else{
                nextPage = "unauthorized_access.jsp";
            }
        }        
        response.sendRedirect(nextPage);
    }
}