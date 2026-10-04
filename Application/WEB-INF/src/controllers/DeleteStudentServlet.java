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

@WebServlet("/delete_student.do")
public class DeleteStudentServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        
        if(user != null){
            if(user.getUserType().equals("T")){
                Integer studentId = Integer.parseInt(request.getParameter("student_id"));

                Student student = new Student(studentId);
                if(student.deleteStudent()){
                    response.getWriter().print("Delete");
                }
            }else{
                response.sendRedirect("unauthorized_access.jsp");
            }
        }
    }
}