package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.util.ArrayList;
import models.User;
import models.Student;
import java.io.IOException;

@WebServlet("/show_students.do")
public class ShowStudentServlet extends HttpServlet{
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
        doPost(request,response);
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        String nextPage = "signin.do";

        if(user != null){
            if(user.getUserType().equals("T")){
                ArrayList<Student> student = Student.showAllStudents(user);
                request.setAttribute("students" , student);
                nextPage = "show.jsp";
            }else{
                nextPage = "unauthorized_access.jsp";
            }
        }

        request.getRequestDispatcher(nextPage).forward(request,response);
    }
}