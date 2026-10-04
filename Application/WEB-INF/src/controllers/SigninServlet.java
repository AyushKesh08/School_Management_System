package controllers;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import models.User;

@WebServlet("/signin.do")
public class SigninServlet extends HttpServlet{
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        request.getRequestDispatcher("signin.jsp").forward(request,response);
    }

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
        HttpSession session = request.getSession();
        
        String nextPage = "signin.jsp";

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(email,password);
        // System.out.println(user.signinUser());
        if(user.signinUser()){
            nextPage = "dashboard.jsp";
            user.setPassword(null);
            session.setAttribute("user" ,  user);
        }else{
            request.setAttribute("errorMsg" , "!!!Either Email Or Password Is Incorrect..");
        }

        request.getRequestDispatcher(nextPage).forward(request,response);
    }
}