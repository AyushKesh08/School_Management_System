package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.File;
import models.User;

@WebServlet("/signup.do")
public class SignupServlet extends HttpServlet{

    String uploadPath;

    public void init() throws ServletException{
        uploadPath = getServletContext().getRealPath("/WEB-INF/uploads");
        System.out.println("#######" + uploadPath);
    }

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        request.getRequestDispatcher("signup.jsp").forward(request,response);
    }

    String nextPage = "signup.jsp";

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String userType = request.getParameter("usertype");

        User user = new User(name,email,phone,password,userType);
        if(user.saveUser()){
            nextPage = "save_account.jsp"; 
            File file = new File(uploadPath , user.getEmail() + File.separator + (user.getUserType().equals("T")?"teacherFolder":"studentFolder"));
            file.mkdirs();
            System.out.println(file + "==================");
        }

        request.getRequestDispatcher(nextPage).forward(request,response);
    }
}