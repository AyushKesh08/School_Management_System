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

@WebServlet("/add_students.do")
public class AddStudentServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String nextPage = "signin.do";

        if(user != null){
            if(user.getUserType().equals("T"))
                nextPage = "students_form.jsp";
            else
                nextPage = "unauthorized_access.jsp";
        }
        
        request.getRequestDispatcher(nextPage).forward(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String nextPage = "signin.jsp";

        if(user != null){
            if(user.getUserType().equals("T")){
                String studentName = request.getParameter("name");
                String fathersName = request.getParameter("fname");
                String mothersName = request.getParameter("mname");
                String age = request.getParameter("age");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");

                Student student = new Student(studentName,fathersName,mothersName,age,email,phone,user);
                if(student.saveStudent()){
                    nextPage = "show_students.do";
                }
            }
        }else{
            nextPage = "unauthorized_access.jsp";
        }

        response.sendRedirect(nextPage);
    
    }
}